Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B49A073D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 11:43:41 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZPqv7-0001Mq-OZ from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Aug 2015 04:43:41 -0700
Received: from gemini.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 13 Aug 2015 04:43:41 -0700
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])	by
	gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id t7DBhc1W023029;
	Thu, 13 Aug 2015 06:43:40 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 16:43:14 +0500
Message-ID: <1439466194-17853-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libpfm4: Fix GNU_HASH warning.
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
X-List-Received-Date: Thu, 13 Aug 2015 11:43:42 -0000
Content-Type: text/plain

From: Noor <noor_ahsan@mentor.com>

* Add a patch which updated add LDFLAGS variable to SLDFLAGS
  in Makefile.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 ...Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch |   31 ++++++++++++++++++++
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb        |    4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch b/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
new file mode 100644
index 0000000..be58706
--- /dev/null
+++ b/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
@@ -0,0 +1,31 @@
+From 272a8a069a8f5f06a1e5dfa0ef12f5f92984728b Mon Sep 17 00:00:00 2001
+From: Noor <noor_ahsan@mentor.com>
+Date: Wed, 12 Aug 2015 20:54:00 +0500
+Subject: [PATCH] Makefile: Add LDFLAGS variable to SLDFLAGS.
+
+* Add LDFLAGS variable to SLDFLAGS so that extra linker
+  flags can be sent via this variable.
+
+Upstream status Sumbitted [perfmon2-libpfm4-commits@lists.sourceforge.net]
+
+Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
+---
+ lib/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index 1cc8765..4bd92ef 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -187,7 +187,7 @@ CFLAGS += -DCONFIG_PFMLIB_CELL
+ endif
+ 
+ ifeq ($(SYS),Linux)
+-SLDFLAGS=-shared -Wl,-soname -Wl,$(VLIBPFM)
++SLDFLAGS=$(LDFLAGS) -shared -Wl,-soname -Wl,$(VLIBPFM)
+ SLIBPFM=libpfm.so.$(VERSION).$(REVISION).$(AGE)
+ VLIBPFM=libpfm.so.$(VERSION)
+ SOLIBEXT=so
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
index b66fbd1..2dfda90 100644
--- a/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
@@ -12,7 +12,9 @@ SECTION = "devel"
 
 COMPATIBLE_HOST = "powerpc64"
 
-SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/${BPN}/libpfm-${PV}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
+           file://0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch \
+          "
 
 SRC_URI[md5sum] = "5077b9022440e4951d96f2d0e73bd487"
 SRC_URI[sha256sum] = "5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f"
-- 
1.7.9.5


