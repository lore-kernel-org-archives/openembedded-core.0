Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47AB279F06
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 06:09:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA868ULN024081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 22:08:56 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 22:08:55 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Nov 2018 14:08:11 +0800
Message-ID: <1541657297-30997-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/7] python: add tk support
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
X-List-Received-Date: Thu, 08 Nov 2018 06:09:37 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add support to enable tk via PACKGECONFIG.
before the patch:
 # python
 Python 2.7.15 (default, Nov  8 2018, 04:53:50)
 [GCC 8.2.0] on linux2
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import Tkinter
 Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python2.7/lib-tk/Tkinter.py", line 39, in <module>
    import _tkinter # If this fails your Python may not be configured for Tk
 ImportError: No module named _tkinter
 >>>

After the patch, if enable tk in PACKGECONFIG, then
 # python
 Python 2.7.15 (default, Oct 25 2018, 08:12:45)
 [GCC 8.2.0] on linux2
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import Tkinter
 >>>

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/python/python_2.7.15.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index dd969d8..5c4fee0 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -21,7 +21,7 @@ SRC_URI += "\
   file://setuptweaks.patch \
   file://check-if-target-is-64b-not-host.patch \
   file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
-  file://avoid_warning_about_tkinter.patch \
+  ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
   file://avoid_warning_for_sunos_specific_module.patch \
   file://python-2.7.3-remove-bsdb-rpath.patch \
   file://run-ptest \
@@ -45,6 +45,7 @@ EXTRA_OECONF += "ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
 
 PACKAGECONFIG ??= "bdb"
 PACKAGECONFIG[bdb] = ",,db"
+PACKAGECONFIG[tk] = ",,tk"
 
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
@@ -204,6 +205,7 @@ python(){
 
     packages = d.getVar('PACKAGES').split()
     pn = d.getVar('PN')
+    pkgconfig = d.getVar('PACKAGECONFIG')
 
     newpackages=[]
 
@@ -219,6 +221,8 @@ python(){
         d.setVar('FILES_' + pypackage, '')
         for value in python_manifest[key]['files']:
             d.appendVar('FILES_' + pypackage, ' ' + value)
+            if "tkinter" in pypackage and "tk" in pkgconfig:
+                d.appendVar('FILES_' + pypackage, ' ' + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.so")
             if include_pycs == '1':
                 if value.endswith('.py'):
                     d.appendVar('FILES_' + pypackage, ' ' + value + 'c')
@@ -228,6 +232,8 @@ python(){
             if '${PN}' in value:
                 value=value.split('-')[1]
             d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
+            if "tkinter" in pypackage and "tk" in pkgconfig:
+                d.appendVar('RDEPENDS_' + pypackage, ' ' + 'tk')
         d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
 
     # Prepending so to avoid python-misc getting everything
-- 
2.7.4


