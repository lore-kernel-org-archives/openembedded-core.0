Return-Path: <Stefan.Ghinea@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D79F374769
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:28:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xALFS665007030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 07:28:06 -0800 (PST)
Received: from otp-sghinea-d1.wrs.com (128.224.124.155) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 21 Nov 2019 07:28:06 -0800
From: Stefan Ghinea <stefan.ghinea@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2019 17:28:04 +0200
Message-ID: <1574350084-21061-1-git-send-email-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ghostscript: CVE-2019-14869
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
X-List-Received-Date: Thu, 21 Nov 2019 15:28:06 -0000
Content-Type: text/plain

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

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../ghostscript/CVE-2019-14869-0001.patch     | 70 +++++++++++++++++++
 .../ghostscript/ghostscript_9.27.bb           |  2 +
 2 files changed, 72 insertions(+)
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
index 9e1f3e2f49..a7eab5e603 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.27.bb
@@ -28,6 +28,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2019-14811-0001.patch \
                 file://CVE-2019-14817-0001.patch \
                 file://CVE-2019-14817-0002.patch \
+                file://CVE-2019-14869-0001.patch \
+
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.20.1


