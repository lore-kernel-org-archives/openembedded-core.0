Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3529.1615519150832471124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 19:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=T1OtuBmc;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615519151;
  x=1647055151;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MJwoabNU5kXe8l6MiM589WVxXJKsGuaHdz+N6gpIYBE=;
  b=T1OtuBmcBFfk8AIY15C1JyGBshijyyM/A6XVMQdrGM203j1vDyYQkKxl
   UHLnWaWivqstIH1NcfUd+g5FxQegtGB477aNHt/YNH9LYcJL5LF7Wnh/R
   aAq+WCXfpn7ycC/jgXovuVwXGwG6GYIm1O7akJD3W5vhWV9GxAkAgkWLO
   KkN9g1SIVuhh+BjgCAOKPEaxMeOeVqfNz9xBrrOfTnGyRh+zxzDqAYIsl
   nE/FcvSp7hlwCA8dsV2K/Dvhr83j4x1xU+28B0D1dttTMfwDJuK2RjrTG
   jWp1/1im7i+n6UzLrU3yJOJ51ucxbCBpMl31ii9aCGTiqyf42sy0kzU2Z
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] license.bbclass: Improve parsing time when INCOMPATIBLE_LICENSES is big
Date: Fri, 12 Mar 2021 04:18:52 +0100
Message-ID: <20210312031853.7328-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The commit 08cbf1748 (licenses: Update INCOMPATIBLE_LICENSE for
'or-later' handling) increased the parsing time considerably if there
are many licenses in INCOMPATIBLE_LICENSE. Reorganize the code to get
almost all the time back.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/license.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index bcea0b3cb5..f7978e266b 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -282,16 +282,15 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     """
     import fnmatch
 
-    # Assume if we're passed "GPLv3" or "*GPLv3" it means -or-later as well
-    for lic in wildcard_licenses[:]:
-        if not lic.endswith(("-or-later", "-only", "*")):
-            wildcard_licenses.append(lic + "+")
-
     licenses = wildcard_licenses[:]
     spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
     for wld_lic in wildcard_licenses:
         spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
         licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
+        # Assume if we're passed "GPLv3" or "*GPLv3" it means -or-later as well
+        if not wld_lic.endswith(("-or-later", "-only", "*", "+")):
+            spdxflags = fnmatch.filter(spdxmapkeys, wld_lic + "+")
+            licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in spdxflags]
 
     spdx_lics = d.getVar('AVAILABLE_LICENSES').split()
     for wld_lic in wildcard_licenses:
