Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD43F46C56
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 16:19:29 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58856.1775492362635380808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 09:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jKDDQG+p;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1273349c56bso4961423c88.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 09:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775492362; x=1776097162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ic4gzHlsgb1Mpl2rZ+G07nC8Qi54AVB4CCDsY0dAVkE=;
        b=jKDDQG+pcHbujXyF+fuYKmM76pBZDKZMBLedRhh5AaoLxiXMpjUxdPejsufCisKF8+
         So89hFuZ1Scxwsm0If9JkWALwyPqmtKL65wkpLrhDc/KywXxFCNNAhYWhkwhywLCvqG/
         03JtknBJG4Vpw8hvs3OgpoE7MMUl99Cazhdyh+Q9S/7lRYv8G4JAsU7kcvGmnzbk+qbP
         fo/KaB5r5vG9KZrXVOynsNon35Q7m2hNTmXpklToBPNTsWF0fBZO6KN/4JIw+p78Pmwz
         /bcl2tA2h5XU/KSA/vNggEz6/bczcHcwMvnLt0g7HLlsCujptZmpGb4WTkA7kITE/cUy
         6ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775492362; x=1776097162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ic4gzHlsgb1Mpl2rZ+G07nC8Qi54AVB4CCDsY0dAVkE=;
        b=jO8yA7oCw6gG17S8uYuGo6ZWkBRO2CaX4RNJ7K/3g/QGuD/fnQL6jkNgeA7MTUb9j/
         /l2Yf0gOtc00bJaBD6rJVwdDy9HUeO4ndWomOZwODmQEBDIRT4xdaY+6j9R2psbdAeSH
         Ko80a83R5Tz4aegq+MWwTtVLz3hhVdo97eNEur0zvG9ulr8XB5v+QJ2dy9IGTBa8oOsN
         pEalNLd1FeFYuJ6Xn8O7gn+En3sPKpOwVhame/IY0U313L8c7fUHeWnal3/cdf7jk1eu
         HCv30nGrbxkyYqZs6DtYw228Z/zTsf8PGm76wDw3r2O5jU5y/DHqw1JzAyAT75dHUY97
         juxQ==
X-Gm-Message-State: AOJu0YyA3MoT7D2d7Vtq24GZurVat0yyOwtHFAN9kHLUjaPlwGh4u3od
	dun0h/k0qa9fbK35N434t7DEJHOBw7lSFFkA3tEp9p/YfggaFZugSDck8fgv8g==
X-Gm-Gg: AeBDies+mU7Faus3skk9SbU1n3be3UpSWo2ubOKeFJcCqgcygPZX2dt4Ha5Ff589B0v
	GuLDGxS3sZeMVVRwPIEaJdhrJeR7WfkXvADJhgzyTOSDCMpLHERgPBkidMZL50CJs/g64j4k7X1
	DrhZ8Jccc7u/OgpMckVvA3l5zmDEF/D7qhcNcUqJ7QzEIXMCG6jYlpCpX9V8GsAWkJJLEBQnc60
	+LypDUt9PHvkOVOwn1v9HpRL3JVJSE2i0wlxs3b2oN/598lYxXjJBXo/sdvUE7HKr0swbfRjH6L
	FsvNy6PJ1yr0maV4vVhPJt18cWzhai0M/vnKo2eWbwxrDg2ylUTSkKa7eEsajhnWe02Ec5jjzj2
	lLvlKMsGAS4zXu/ydooaiSTwggdIoiQlb0m8p8HvXvz3wWb1SOSYdXpna4t4wAHXIKlV/H5NMat
	OXeu0v2tA4djvpwnPoIG2KVgk6PHxVQjxpDJaeAWGKot7q9g7DyVDmbmePUXQD+pgIufgPbxTKn
	mv6fX/zGSpqIZdePhJX0HkbpCNF/b6VDtiNOTk8kP9nVlH0NgsNESE4yTp/
X-Received: by 2002:a05:7022:212:b0:128:cea1:7e3b with SMTP id a92af1059eb24-12bfb7452b1mr5130714c88.23.1775492361387;
        Mon, 06 Apr 2026 09:19:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c0ce7dfe8sm3941267c88.3.2026.04.06.09.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:19:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] docbook-xsl-stylesheets: Use str:replace from exslt.org to implement string.subst
Date: Mon,  6 Apr 2026 09:19:08 -0700
Message-ID: <20260406161908.2556295-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234685

Developement for docbook stylesheets has moved to github
there are newer releases available too which include this fix, however
for now nearing 6.0 release this is least intrusive way to move forward

This is needed for building latest samba versions

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ae5ae3d4816687467712580d5f05957b3b88.patch | 136 ++++++++++++++++++
 ...esheets-no-bashism-in-docbook-xsl-up.patch |   5 -
 .../docbook-xsl-stylesheets_1.79.1.bb         |   1 +
 3 files changed, 137 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/1c41ae5ae3d4816687467712580d5f05957b3b88.patch

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/1c41ae5ae3d4816687467712580d5f05957b3b88.patch b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/1c41ae5ae3d4816687467712580d5f05957b3b88.patch
new file mode 100644
index 0000000000..4e65c87c90
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/1c41ae5ae3d4816687467712580d5f05957b3b88.patch
@@ -0,0 +1,136 @@
+From 1c41ae5ae3d4816687467712580d5f05957b3b88 Mon Sep 17 00:00:00 2001
+From: Nicolas Iooss <nicolas.iooss_git@polytechnique.org>
+Date: Thu, 6 Jul 2017 21:32:14 +0200
+Subject: [PATCH] Use str:replace from exslt.org to implement string.subst
+
+string.subst implementation causes recursion issues when building
+systemd documentation. This issue has been reported in
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=765567 and
+https://bugs.archlinux.org/task/54694 .
+
+A possible fix consists in using str:replace from exslt.org when this
+function is available. This has been implemented in a patch for the
+Debian package
+(https://anonscm.debian.org/cgit/collab-maint/docbook-xsl.git/tree/debian/patches/765567_non-recursive_string_subst.patch)
+which has also been used by Arch Linux
+(https://git.archlinux.org/svntogit/packages.git/tree/trunk/765567_non-recursive_string_subst.patch?h=packages/docbook-xsl&id=c6bf4ebc446487043437ed13e4fbe83f648f5c58).
+
+Translate this patch to xsl/lib/lib.xweb in order to fix the recursion
+issues.
+
+For reference, here is the beginning of the error messages reported by
+xslt when building systemd:
+
+      XSLT     man/systemd.directives.html
+    Note: namesp. add : added namespace before processing              systemd.directives
+    runtime error: file file:/usr/share/xml/docbook/xsl-stylesheets-1.79.2/lib/lib.xsl line 56 element variable
+    xsltApplySequenceConstructor: A potential infinite template recursion was detected.
+    You can adjust xsltMaxDepth (--maxdepth) in order to raise the maximum number of nested template calls and variables/params (currently set to 3000).
+    Templates:
+    #0 name string.subst
+    #1 name string.subst
+    #2 name string.subst
+    #3 name string.subst
+    #4 name string.subst
+    #5 name string.subst
+    #6 name string.subst
+    #7 name string.subst
+    #8 name string.subst
+    #9 name string.subst
+    #10 name string.subst
+    #11 name string.subst
+    #12 name string.subst
+    #13 name string.subst
+    #14 name string.subst
+    Variables:
+    #0
+    replacement   Object is a Node Set :
+    Set contains 1 nodes:
+      1    ATTRIBUTE newstring
+          TEXT
+            content= .
+
+    target   Object is a Node Set :
+    Set contains 1 nodes:
+      1    ATTRIBUTE oldstring
+          TEXT
+            content=  .
+
+    string   Object is a string : PP \fB\-\-multiple\fR .RS 4 \fBsystemd-a...
+
+    #1
+    target   Object is a Node Set :
+    Set contains 1 nodes:
+      1    ATTRIBUTE oldstring
+          TEXT
+            content=  .
+
+    string   Object is a string : PP \fB\-\-multiple\fR .RS 4 \fBsystemd-a...
+
+    #2
+    string   Object is a string : PP \fB\-\-multiple\fR .RS 4 \fBsystemd-a...
+
+    #3
+    replacement   Object is a Node Set :
+    Set contains 1 nodes:
+      1    ATTRIBUTE newstring
+          TEXT
+            content= .
+
+    target   Object is a Node Set :
+    Set contains 1 nodes:
+      1    ATTRIBUTE oldstring
+          TEXT
+            content=  .
+
+    string   Object is a string : PP \fB\-\-mode=\fR .RS 4 \fBsystemd-inhi...
+
+    #4
+    target   Object is a Node Set :
+    Set contains 1 nodes:
+      1    ATTRIBUTE oldstring
+          TEXT
+            content=  .
+
+    string   Object is a string : PP \fB\-\-mode=\fR .RS 4 \fBsystemd-inhi...
+
+Upstream-Status: Backport [https://github.com/docbook/xslt10-stylesheets/commit/1c41ae5ae3d4816687467712580d5f05957b3b88]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ xsl/lib/lib.xweb | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+--- a/lib/lib.xsl
++++ b/lib/lib.xsl
+@@ -10,7 +10,11 @@
+      This module implements DTD-independent functions
+ 
+      ******************************************************************** -->
+-<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
++<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
++                xmlns:str="http://exslt.org/strings"
++                exclude-result-prefixes="str"
++                version="1.0">
++
+ 
+ <xsl:template name="dot.count">
+   <!-- Returns the number of "." characters in a string -->
+@@ -56,6 +60,9 @@
+   <xsl:param name="replacement"/>
+ 
+   <xsl:choose>
++    <xsl:when xmlns:str="http://exslt.org/strings" str:foo="" test="function-available('str:replace')">
++      <xsl:value-of select="str:replace($string, string($target), string($replacement))"/>
++    </xsl:when>
+     <xsl:when test="contains($string, $target)">
+       <xsl:variable name="rest">
+         <xsl:call-template name="string.subst">
+@@ -388,7 +395,7 @@
+         </xsl:otherwise>
+       </xsl:choose>
+     </xsl:template>
+-  
++
+ <xsl:template name="count.uri.path.depth">
+   <xsl:param name="filename" select="''"/>
+   <xsl:param name="count" select="0"/>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch
index 0559a5c0d2..a1bcfa6151 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch
@@ -9,8 +9,6 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  tools/bin/docbook-xsl-update | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/tools/bin/docbook-xsl-update b/tools/bin/docbook-xsl-update
-index aba0016..cc73aa2 100755
 --- a/tools/bin/docbook-xsl-update
 +++ b/tools/bin/docbook-xsl-update
 @@ -1,4 +1,4 @@
@@ -19,6 +17,3 @@ index aba0016..cc73aa2 100755
  # vim: number
  
  # docbook-xsl-update - Update environment to latest docbook-xsl snapshot
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 7e4730b5e9..8e9a7c9091 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6beadd98f9c54ab0c387e14211ee4d0e"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
            file://docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch \
+           file://1c41ae5ae3d4816687467712580d5f05957b3b88.patch \
 "
 
 SRC_URI[sha256sum] = "725f452e12b296956e8bfb876ccece71eeecdd14b94f667f3ed9091761a4a968"

