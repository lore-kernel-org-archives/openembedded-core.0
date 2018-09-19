Return-Path: <peter@berginkonsult.se>
X-Greylist: delayed 963 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Sep 2018 21:22:09 UTC
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
	(mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
	by mail.openembedded.org (Postfix) with ESMTP id DCE80745B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20140924;
	h=message-id:date:subject:cc:to:from:from;
	bh=N0if7Et9vEXcm+oz60nVXM/qD+7kJLl+U2eYCVzfTdA=;
	b=yJ8JYkifX+SB8D1GwsOl+ZKxa9Pt+wARPIR1mSaCc0Rzph96suYoAkAEWx46AfVW5yti3TgTVGjV7
	TMLf1AVFntO6Q11cq/LcKW3AeIA/LtJAjtINU38js9a3lqyJU792OAZHY8OYJc3S7QRaN5TdYVmN7p
	m1l/cyVU9ZiWn/Jo=
X-HalOne-Cookie: ce2557a703a9437941b4ecb78fce8b7f26be53d7
X-HalOne-ID: d0259025-bc4f-11e8-9b9d-d0431ea8a290
Received: from localhost.localdomain (unknown [82.196.108.162])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id d0259025-bc4f-11e8-9b9d-d0431ea8a290;
	Wed, 19 Sep 2018 21:06:05 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 23:05:56 +0200
Message-Id: <1537391156-12937-1-git-send-email-peter@berginkonsult.se>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] rpm: handle virtual memory usage when limit is set
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
X-List-Received-Date: Wed, 19 Sep 2018 21:22:10 -0000

Fix the situation where the task do_package_write_rpm ends up in
"liblzma: memory allocation failed". This happens if the host
environment has set a limit on virtual_memory for the user with
'ulimit -v' for packages with a lot of binary packages, e.g. glibc-locale.

Upstream-Status: Inappropriate [error introduced by oe-core patch on rpm]

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 ...estrict-virtual-memory-usage-if-limit-set.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.bb            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch b/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
new file mode 100644
index 0000000..a4b9a58
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
@@ -0,0 +1,52 @@
+From cff87a68cde44d893b72caa1995ac6b9a1784523 Mon Sep 17 00:00:00 2001
+From: Peter Bergin <peter@berginkonsult.se>
+Date: Wed, 19 Sep 2018 15:12:31 +0200
+Subject: [PATCH] rpm: restrict virtual memory usage if limit set
+
+A solution to avoid OOM situation when the virtual memory is restricted
+for a user (ulimit -v). As the lzopen_internal funtion is run in parallel
+one instance per CPU thread the available virtual memory is limited per
+CPU thread.
+---
+ rpmio/rpmio.c | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index e051c98..49752b3 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -845,6 +845,31 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
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
++			/* keep reducing the number of compression threads untill memory 
++			   usage gets below limit per CPU thread*/
++			while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
++			       virtual_memlimit_per_cpu_thread) {
++				/* number of threads shouldn't be able to hit zero with compression
++				 * settings aailable to set through rpm... */
++				assert(--mt_options.threads != 0);
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
index 46f8837..112b41a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            file://0001-perl-disable-auto-reqs.patch \
+           file://0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch \
            "
 
 PE = "1"
-- 
2.7.4


