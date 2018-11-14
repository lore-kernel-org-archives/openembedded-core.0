Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3006C40F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:38:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAE9cIwo016380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Nov 2018 01:38:18 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 01:38:18 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2018 17:38:16 +0800
Message-ID: <1542188296-116872-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541657297-30997-2-git-send-email-mingli.yu@windriver.com>
References: <1541657297-30997-2-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3] python: add tk support
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
X-List-Received-Date: Wed, 14 Nov 2018 09:38:19 -0000
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
 meta/recipes-devtools/python/python/python2-manifest.json | 3 ++-
 meta/recipes-devtools/python/python_2.7.15.bb             | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 260fa6f..a9f3924 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -966,6 +966,7 @@
             "core"
         ], 
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.so",
             "${libdir}/python2.7/lib-tk"
         ]
     }, 
@@ -1043,4 +1044,4 @@
             "${libdir}/python2.7/lib-dynload/zlib.so"
         ]
     }
-}
\ No newline at end of file
+}
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index dd969d8..6a60aa7 100644
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
@@ -172,7 +173,7 @@ RDEPENDS_${PN}-modules += "${PN}-misc"
 
 # ptest
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip"
-
+RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk', '', d)}"
 # catch manpage
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
-- 
2.7.4


