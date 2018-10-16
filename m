Return-Path: <peter@berginkonsult.se>
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
	(mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
	by mail.openembedded.org (Postfix) with ESMTP id 55B1279B42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 20:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20140924;
	h=message-id:date:subject:cc:to:from:from;
	bh=0JSO4K8EYlLfRQ0ccmSJiTqk6VEbhCc8D3g0fqVNTxw=;
	b=rB16ixf6uhu/F0gn3+MJQfhJrklHyAnSmFsuSV6NbBF9ua0NssFr9M8BPzeD/PMiFhfL67vlYFb1g
	cENsChR/pjvqXvVnGODw5AToKees+BoB3W1YqUVr0hKJIl1M6hXrGBGocSQWYQHf1l/xcSEjkpEj3z
	70sT0J34frItzIXI=
X-HalOne-Cookie: 9c35d76367dd92457da90413c1ad7b7689f510ff
X-HalOne-ID: 839150a4-d182-11e8-9b9d-d0431ea8a290
Received: from localhost.localdomain (unknown [82.196.108.162])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 839150a4-d182-11e8-9b9d-d0431ea8a290;
	Tue, 16 Oct 2018 20:31:56 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2018 22:30:32 +0200
Message-Id: <1539721832-24882-1-git-send-email-peter@berginkonsult.se>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] rpm: handle virtual memory usage when limit is set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2018 20:31:56 -0000

Fix the situation where the task do_package_write_rpm ends up in
"liblzma: memory allocation failed". This happens if the host
environment has set a limit on virtual_memory for the user with
'ulimit -v' for packages with a lot of binary packages, e.g. glibc-locale.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
v1->v2:
- moved upstream-status to correct place

v2->v3:
- reworked the case when it is not possible to lower number of threads
  to avoid endless loop
- changed upstream-status according to suggestion
- other minor updates after review comments

 ...-restrict-virtual-memory-usage-if-limit-s.patch | 65 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.bb            |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
new file mode 100644
index 0000000..6454785
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
@@ -0,0 +1,65 @@
+From 0066b862bb3a09f39295abd5d972a53ac8dc1555 Mon Sep 17 00:00:00 2001
+From: Peter Bergin <peter@berginkonsult.se>
+Date: Wed, 19 Sep 2018 15:12:31 +0200
+Subject: [PATCH] rpm/rpmio.c: restrict virtual memory usage if limit set
+
+A solution to avoid OOM situation when the virtual memory is restricted
+for a user (ulimit -v). As the lzopen_internal function is run in parallel
+one instance per CPU thread the available virtual memory is limited per
+CPU thread.
+
+Upstream-Status: Pending [merge of multithreading patches to upstream]
+
+Signed-off-by: Peter Bergin <peter@berginkonsult.se>
+---
+ rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index e051c98..b3c56b6 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
+ 		}
+ #endif
+ 
++		struct rlimit virtual_memory;
++		getrlimit(RLIMIT_AS, &virtual_memory);
++		if (virtual_memory.rlim_cur != RLIM_INFINITY) {
++			const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
++			const uint64_t virtual_memlimit_per_cpu_thread =
++				virtual_memlimit / lzma_cputhreads();
++			uint64_t memory_usage_virt;
++			rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to %lu and "
++			       "per CPU thread %lu\n", virtual_memlimit, virtual_memlimit_per_cpu_thread);
++			/* keep reducing the number of compression threads until memory
++			   usage falls below the limit per CPU thread*/
++			while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
++			       virtual_memlimit_per_cpu_thread) {
++				/* If number of threads goes down to zero lzma_stream_encoder will
++				 * will return UINT64_MAX. We must check here to avoid an infinite loop.
++				 * If we get into situation that one thread requires more virtual memory
++				 * than available we set one thread, print error message and try anyway. */
++				if (--mt_options.threads == 0) {
++					mt_options.threads = 1;
++					rpmlog(RPMLOG_WARNING,
++					       "XZ: Could not adjust number of threads to get below "
++					       "virtual memory limit %lu. usage %lu\n",
++					       virtual_memlimit_per_cpu_thread, memory_usage_virt);
++					break;
++				}
++			}
++			if (threads != (int)mt_options.threads)
++				rpmlog(RPMLOG_NOTICE,
++				       "XZ: Adjusted the number of threads from %d to %d to not "
++				       "exceed the memory usage limit of %lu bytes\n",
++				       threads, mt_options.threads, virtual_memlimit);
++
++		}
++
+ 		ret = lzma_stream_encoder_mt(&lzfile->strm, &mt_options);
+ 	    }
+ #endif
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
index 46f8837..200fe4d 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
+           file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            "
 
 PE = "1"
-- 
2.7.4


