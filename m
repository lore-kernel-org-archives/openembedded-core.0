Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59AA672789
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:54:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8s2vD028344
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:54:02 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:54:02 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:51:12 +0800
Message-ID: <c08bd4bb50d5ba4509f79fb30c0d150320f6e392.1418885581.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/19] gcc: Disable aarch64 multilib options
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
X-List-Received-Date: Thu, 18 Dec 2014 08:54:02 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

We want to revert to default gcc behavior to support oe-core's ability
to change the libdir.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../gcc/gcc-4.9/0057-aarch64-config.patch          | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 8f212b2..2568e99 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
     file://0055-PR-rtl-optimization-61801.patch \
     file://0056-top-level-reorder_gcc-bug-61144.patch \
+    file://0057-aarch64-config.patch \
     file://0058-gcc-r212171.patch \
     file://0059-gcc-PR-rtl-optimization-63348.patch \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch b/meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch
new file mode 100644
index 0000000..f295596
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0057-aarch64-config.patch
@@ -0,0 +1,32 @@
+Disable the MULTILIB_OSDIRNAMES and other multilib options.
+
+Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on
+systems where the libdir is NOT set to /lib64.  This is allowed by the ABI, as
+long as the dynamic loader is present in /lib.
+
+We simply want to use the default rules in gcc to find and configure the 
+normal libdir.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: gcc-4.9.1/gcc/config/aarch64/t-aarch64-linux
+===================================================================
+--- gcc-4.9.1.orig/gcc/config/aarch64/t-aarch64-linux
++++ gcc-4.9.1/gcc/config/aarch64/t-aarch64-linux
+@@ -21,11 +21,11 @@
+ LIB1ASMSRC   = aarch64/lib1funcs.asm
+ LIB1ASMFUNCS = _aarch64_sync_cache_range
+ 
+-AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
+-MULTILIB_OSDIRNAMES = .=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
+-MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
++#AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
++#MULTILIB_OSDIRNAMES = .=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
++#MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
+ 
+ # Disable the multilib for linux-gnu targets for the time being; focus
+ # on the baremetal targets.
+-MULTILIB_OPTIONS    =
+-MULTILIB_DIRNAMES   =
++#MULTILIB_OPTIONS    =
++#MULTILIB_DIRNAMES   =
-- 
1.9.1


