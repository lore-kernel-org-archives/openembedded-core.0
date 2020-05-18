Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.37949.1589790028568988613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 01:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 8SeySjugET48WwnoNrHoY1YxcXneO5YaZ7GesmMyloW4+Q9CHvJKuEG+zUKJqyrzri9dN+Tstm
 qdW0jxKNOqAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 01:20:27 -0700
IronPort-SDR: nZaiC6Re6ZKI3T+vuFh86750Uyu5u+lwWzAOFMCbMRGkukV4bHs8Atu93eGwd0fcajLjvWdITK
 Wq7FezlrbIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; 
   d="scan'208";a="373316761"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga001.fm.intel.com with ESMTP; 18 May 2020 01:20:26 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [Patch][zeus 2/2] ghostscript : fix CVE-2019-10216
Date: Mon, 18 May 2020 16:20:24 +0800
Message-Id: <1589790024-75655-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589790024-75655-1-git-send-email-chee.yang.lee@intel.com>
References: <1589790024-75655-1-git-send-email-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../ghostscript/ghostscript/CVE-2019-10216.patch   | 53 ++++++++++++++++++++++
 .../ghostscript/ghostscript_9.27.bb                |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch
new file mode 100644
index 0000000..9bec734
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch
@@ -0,0 +1,53 @@
+From 5b85ddd19a8420a1bd2d5529325be35d78e94234 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 2 Aug 2019 15:18:26 +0100
+Subject: [PATCH] Bug 701394: protect use of .forceput with executeonly
+
+Upstream-Status: Backport [http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5b85ddd19] 
+CVE: CVE-2019-10216
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+---
+ Resource/Init/gs_type1.ps | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/Resource/Init/gs_type1.ps b/Resource/Init/gs_type1.ps
+index 6c7735bc0..a039ccee3 100644
+--- a/Resource/Init/gs_type1.ps
++++ b/Resource/Init/gs_type1.ps
+@@ -118,25 +118,25 @@
+                          ( to be the same as glyph: ) print 1 index //== exec } if
+                    3 index exch 3 index .forceput
+                                                                  % scratch(string) RAGL(dict) AGL(dict) CharStrings(dict) cstring gname
+-                 }
++                 }executeonly
+                  {pop} ifelse
+-               } forall
++               } executeonly forall
+                pop pop
+-             }
++             } executeonly
+              {
+                pop pop pop
+              } ifelse
+-           }
++           } executeonly
+            {
+                                                                % scratch(string) RAGL(dict) AGL(dict) CharStrings(dict) cstring gname
+              pop pop
+            } ifelse
+-         } forall
++         } executeonly forall
+          3 1 roll pop pop
+-     } if
++     } executeonly if
+      pop
+      dup /.AGLprocessed~GS //true .forceput
+-   } if
++   } executeonly if
+ 
+    %% We need to excute the C .buildfont1 in a stopped context so that, if there
+    %% are errors we can put the stack back sanely and exit. Otherwise callers won't
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
index 32f938f..bbd1710 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
@@ -29,6 +29,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2019-14817-0001.patch \
                 file://CVE-2019-14817-0002.patch \
                 file://CVE-2019-14869-0001.patch \
+                file://CVE-2019-10216.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.7.4

