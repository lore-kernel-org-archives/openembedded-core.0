Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 53FE76B513
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:03 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389406"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:42 +0800
Message-Id: <b259fa006a63ebb013b405bc5e8cab794d5bd681.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1575465665.git.anuj.mittal@intel.com>
References: <cover.1575465665.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 01/10] ghostscript: CVE-2019-14869
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
X-List-Received-Date: Wed, 04 Dec 2019 13:32:02 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

A flaw was found in all versions of ghostscript 9.x before 9.28,
where the `.charkeys` procedure, where it did not properly secure
its privileged calls, enabling scripts to bypass `-dSAFER` restrictions.
An attacker could abuse this flaw by creating a specially crafted
PostScript file that could escalate privileges within the Ghostscript
and access files outside of restricted areas or execute commands.

References:
https://nvd.nist.gov/vuln/detail/CVE-2019-14869

Upstream patches:
https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=485904

(From OE-Core rev: 0bb88ac63b4e1728373c6425477a32f7a6362b2c)

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ghostscript/CVE-2019-14869-0001.patch     | 70 +++++++++++++++++++
 .../ghostscript/ghostscript_9.27.bb           |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
new file mode 100644
index 0000000000..715ec1c450
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
@@ -0,0 +1,70 @@
+From 485904772c5f0aa1140032746e5a0abfc40f4cef Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 5 Nov 2019 09:45:27 +0000
+Subject: [PATCH] Bug 701841: remove .forceput from /.charkeys
+
+When loading Type 1 or Truetype fonts from disk, we attempt to extend the glyph
+name table to include all identifiable glyph names from the Adobe Glyph List.
+
+In the case of Type 1 fonts, the font itself (almost always) marks the
+CharStrings dictionary as read-only, hence we have to use .forceput for that
+case.
+
+But for Truetype fonts, the CharStrings dictionary is created internally and is
+not read-only until *after* we have fully populated it (including the extended
+glyph names from the AGL), hence there is no need for .forceput, and no need to
+carry the security risk of using it.
+
+Replace with regular put.
+
+CVE: CVE-2019-14869
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ Resource/Init/gs_ttf.ps | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Resource/Init/gs_ttf.ps b/Resource/Init/gs_ttf.ps
+index e34967d..5354ff0 100644
+--- a/Resource/Init/gs_ttf.ps
++++ b/Resource/Init/gs_ttf.ps
+@@ -1301,7 +1301,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
+           TTFDEBUG { (\n1 setting alias: ) print dup ==only
+                 ( to be the same as  ) print 2 index //== exec } if
+ 
+-          7 index 2 index 3 -1 roll exch .forceput
++          7 index 2 index 3 -1 roll exch put
+         } forall
+         pop pop pop
+       }
+@@ -1319,7 +1319,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
+           exch pop
+           TTFDEBUG { (\n2 setting alias: ) print 1 index ==only
+                      ( to use glyph index: ) print dup //== exec } if
+-          5 index 3 1 roll .forceput
++          5 index 3 1 roll put
+           //false
+         }
+         {
+@@ -1336,7 +1336,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
+         {                            %  CharStrings(dict) isunicode(boolean) cmap(dict) RAGL(dict) gname(name) codep(integer) gindex(integer)
+           TTFDEBUG { (\3 nsetting alias: ) print 1 index ==only
+                 ( to be index: ) print dup //== exec } if
+-          exch pop 5 index 3 1 roll .forceput
++          exch pop 5 index 3 1 roll put
+         }
+         {
+           pop pop
+@@ -1366,7 +1366,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
+       } ifelse
+     ]
+   TTFDEBUG { (Encoding: ) print dup === flush } if
+-} .bind executeonly odef		% hides .forceput
++} .bind odef
+ 
+ % ---------------- CIDFontType 2 font loading ---------------- %
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
index 9e1f3e2f49..32f938f254 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
@@ -28,6 +28,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2019-14811-0001.patch \
                 file://CVE-2019-14817-0001.patch \
                 file://CVE-2019-14817-0002.patch \
+                file://CVE-2019-14869-0001.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.21.0


