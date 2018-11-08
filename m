Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C92EB79D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 06:08:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA868wR6020760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 22:08:58 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 22:08:57 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Nov 2018 14:08:12 +0800
Message-ID: <1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] python3: add tk support
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
X-List-Received-Date: Thu, 08 Nov 2018 06:09:00 -0000
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
 meta/recipes-devtools/python/python3_3.5.6.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 31f8ead..93a780d 100644
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
@@ -270,6 +271,7 @@ python(){
 
     packages = d.getVar('PACKAGES').split()
     pn = d.getVar('PN')
+    pkgconfig = d.getVar('PACKAGECONFIG')
 
     newpackages=[]
     for key in python_manifest:
@@ -284,6 +286,8 @@ python(){
         d.setVar('FILES_' + pypackage, '')
         for value in python_manifest[key]['files']:
             d.appendVar('FILES_' + pypackage, ' ' + value)
+            if "tkinter" in pypackage and "tk" in pkgconfig:
+                d.appendVar('FILES_' + pypackage, ' ' + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so")
 
     	# Add cached files
         if include_pycs == '1':
@@ -295,6 +299,8 @@ python(){
             if '${PN}' in value:
                 value=value.split('-')[1]
             d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
+            if "tkinter" in pypackage and "tk" in pkgconfig:
+                d.appendVar('RDEPENDS_' + pypackage, ' ' + 'tk')
         d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
 
     # Prepending so to avoid python-misc getting everything
-- 
2.7.4


