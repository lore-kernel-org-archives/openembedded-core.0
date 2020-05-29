Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1IAb0eGzSf6tzAwHTAve3p/+ab0XP84N0dr9jIX1r7Vtc0E28FFX2YEsKrxxYN8UaZQDShHJgq
 ct7NaYSnII/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:23 -0700
IronPort-SDR: X1l4uze7UGXrMuksgBmRgXXZtjFIesSrWKhbjHQ3pxGDqKvWfwUB8n2jD9TFC76pdJiqAHazvu
 b0A5kRgkIz8g==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866148"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 05/25] ghostscript : fix CVE-2019-10216
Date: Fri, 29 May 2020 13:52:41 +0800
Message-Id: <4620180a073b721dbc91d14ab64285187bec4cb7.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ghostscript/CVE-2019-10216.patch          | 53 +++++++++++++++++++
 .../ghostscript/ghostscript_9.27.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch
new file mode 100644
index 0000000000..9bec7343f5
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
index 32f938f254..bbd17104e1 100644
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
2.25.4

