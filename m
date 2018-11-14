Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B917B6C176
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:36:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAE9aDro004691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Nov 2018 01:36:14 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 01:36:13 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2018 17:36:11 +0800
Message-ID: <1542188171-116604-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
References: <1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2] python3: add tk support
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
X-List-Received-Date: Wed, 14 Nov 2018 09:36:15 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add support to enable tk via PACKAGECONFIG.
before this patch:
 # python3
 Python 3.5.6 (default, Nov  8 2018, 04:53:45)
 [GCC 8.2.0] on linux
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import tkinter
 Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python3.5/tkinter/__init__.py", line 35, in <module>
    import _tkinter # If this fails your Python may not be configured for Tk
 ImportError: No module named '_tkinter'
 >>>

After this patch, if enable tk in PACKAGECONFIG, then
 # python3
 Python 3.5.6 (default, Nov  8 2018, 03:15:52)
 [GCC 8.2.0] on linux
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import tkinter
 >>>

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/python/python3-native_3.5.6.bb       | 3 ++-
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 meta/recipes-devtools/python/python3_3.5.6.bb              | 5 +++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
index d5953cf..1e98c03 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
@@ -12,7 +12,7 @@ file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://python-3.3-multilib.patch \
 file://03-fix-tkinter-detection.patch \
-file://avoid_warning_about_tkinter.patch \
+${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://sysroot-include-headers.patch \
 file://unixccompiler.patch \
@@ -28,6 +28,7 @@ file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
 file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
 file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
 "
+PACKAGECONFIG[tk] = ",,tk-native"
 
 EXTRANATIVEPATH += "bzip2-native"
 DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native gdbm-native"
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 5329bf7..617256a 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1060,6 +1060,7 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
         "cached": []
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 31f8ead..5c80421 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -21,7 +21,7 @@ ${DISTRO_SRC_URI} \
 
 SRC_URI += "\
             file://03-fix-tkinter-detection.patch \
-            file://avoid_warning_about_tkinter.patch \
+            ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
             file://cgi_py.patch \
             file://host_include_contamination.patch \
             file://python-3.3-multilib.patch \
@@ -82,6 +82,7 @@ PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-userm
 PACKAGECONFIG[readline] = ",,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations"
+PACKAGECONFIG[tk] = ",,tk"
 
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
@@ -246,7 +247,7 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
-
+RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.7.4


