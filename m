Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAGyY-0000t5-E6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:37:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q9LA7a007866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 01:21:10 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 01:21:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 17:24:12 +0800
Message-ID: <a5db423d88f92e3ff5ed58bf35c7561b80aec82e.1361857721.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1361857721.git.liezhi.yang@windriver.com>
References: <cover.1361857721.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/1] lttng-ust: cannot find -llttng-ust-tracepoint
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 09:37:31 -0000
Content-Type: text/plain

liblttng_ust.la should depend on liblttng-ust-tracepoint.la, otherwise
there maybe a parallel build issue when building liblttng_ust.la:

ld: cannot find -llttng-ust-tracepoint

[YOCTO #3934]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../lttng-ust/depends-liblttng-ust-tracepoin.patch | 30 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb       |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch b/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
new file mode 100644
index 0000000..458a8d4
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
@@ -0,0 +1,30 @@
+liblttng_ust.la should depend on liblttng-ust-tracepoint.la
+
+liblttng_ust.la should depend on liblttng-ust-tracepoint.la, otherwise
+there maybe a parallel build issue:
+
+ld: cannot find -llttng-ust-tracepoint
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ liblttng-ust/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/liblttng-ust/Makefile.am b/liblttng-ust/Makefile.am
+--- a/liblttng-ust/Makefile.am
++++ b/liblttng-ust/Makefile.am
+@@ -67,7 +67,8 @@ liblttng_ust_la_LIBADD = \
+ 	-llttng-ust-tracepoint \
+ 	$(top_builddir)/snprintf/libustsnprintf.la \
+ 	$(top_builddir)/liblttng-ust-comm/liblttng-ust-comm.la \
+-	liblttng-ust-runtime.la liblttng-ust-support.la
++	liblttng-ust-runtime.la liblttng-ust-support.la \
++	liblttng-ust-tracepoint.la
+ 
+ if LTTNG_UST_BUILD_WITH_LIBUUID
+ liblttng_ust_la_LIBADD += -luuid
+-- 
+1.7.11.2
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
index 20c8b3d..6c2ca04 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
@@ -22,7 +22,9 @@ PV = "2.1.0"
 PR = "r0"
 PE = "2"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
+SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
+	   file://depends-liblttng-ust-tracepoin.patch \
+	   "
 
 S = "${WORKDIR}/git"
 
-- 
1.7.11.2



