Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6C879D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 08:52:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z10so5188264pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 00:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=CE3s4rWsBN+uj3Ksp3IZ2SbwswwpXoLxq8xt8nP8KMc=;
	b=PAPsiv9jmjVjYCxzElvBaubsWCXix8yaYXGCRJxufOwV+QWEL1IT/6Gnz76+1UW8da
	YnNRK9q39IRReuDTMpRgUrSIS2EGu7KoSDm8NPUMS376kqAA3CEE+FLSX8Oy30IrxjiR
	7f0RsXneqdok/oyTGmkZYwIc1Ux7EHErA9x/41xztIYGqjGS2bI1VRkA7GF//t0gfugV
	axfcKYD50OjFTi0+BGbVUA72GUn/8lbXlKx5cN6o0ZWX/2NZn5culCFpshEHy8A9u0CD
	XIRN6GlO9p7K08TKeUyyC5d160JAP/Xm/MetpiVLV4e9GIkJ8N0IvEEeVznOT1tcSoXs
	ax1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=CE3s4rWsBN+uj3Ksp3IZ2SbwswwpXoLxq8xt8nP8KMc=;
	b=PubRrN8QU1/PQDgaNOYvgtTByjTVtIv90Gp2c2O4K3m+Fku9LRiLbN38mPvysCGFAy
	zv3v9wF77zzVZxnhZQ4N3zYLTyjGqcAPchPqhEeQcQo2vZRN6NkvlK/OjQUs+JcRlZFG
	Oi2A2Hx4vtnI/ohkAahbOPxqXv47vUgNfVoP8cVCNnNvFIp/bptfzu60Bq9x0w8Rtdpk
	GNuxwCRAewPMCY77VCw4Q5K/8gu+rL9KOyTEo4UaYQqLHh7k3LCFIsaQ8/bOYJnVDJ5u
	ivk5qY10ykVS9QaZi28qvH/9l0pUpfC9gZwlIMYHGMnT12vka2eQc+mpmSHOsbspm/xT
	FTUA==
X-Gm-Message-State: AGRZ1gLIPfXd8Gv2NS2P4QOCoOi2SZIHxcgpU80kKHQ/3nbU+MJSae/e
	/RssOZllwbWiws/VrV18FIszX974hMU=
X-Google-Smtp-Source: AJdET5fcjc9ra0oNy2jaemiEKKo4fi0O4LUUIjKCoHrZkkfmwzc24JHAmtgIRjRAeWozLoa+3fnoFQ==
X-Received: by 2002:a62:5146:: with SMTP id
	f67-v6mr1036783pfb.238.1541580722225; 
	Wed, 07 Nov 2018 00:52:02 -0800 (PST)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	i14-v6sm26104824pfo.121.2018.11.07.00.52.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 00:52:01 -0800 (PST)
Date: Wed, 07 Nov 2018 08:51:56 +0000
Message-Id: <20181107085156.6424-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] base.bbclass: Display name of licenses which caused SkipRecipe
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
X-List-Received-Date: Wed, 07 Nov 2018 08:52:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Display the name of the restricted licenses which caused the recipe to
be skipped. This makes it easy to determine which license or licenses
are missing and need to be checked and whitelisted.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/base.bbclass    | 15 +++++++++------
 meta/classes/license.bbclass | 19 ++++++++++---------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index df11c8b270..1eae47d170 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -459,12 +459,15 @@ python () {
 
     if bb.data.inherits_class('license', d):
         check_license_format(d)
-        unmatched_license_flag = check_license_flags(d)
-        if unmatched_license_flag:
-            bb.debug(1, "Skipping %s because it has a restricted license not"
-                 " whitelisted in LICENSE_FLAGS_WHITELIST" % pn)
-            raise bb.parse.SkipRecipe("because it has a restricted license not"
-                 " whitelisted in LICENSE_FLAGS_WHITELIST")
+        unmatched_license_flags = check_license_flags(d)
+        if unmatched_license_flags:
+            if len(unmatched_license_flags) == 1:
+                message = "because it has a restricted license '{0}'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST".format(unmatched_license_flags[0])
+            else:
+                message = "because it has restricted licenses {0}. Which are not whitelisted in LICENSE_FLAGS_WHITELIST".format(
+                    ", ".join("'{0}'".format(f) for f in unmatched_license_flags))
+            bb.debug(1, "Skipping %s %s" % (pn, message))
+            raise bb.parse.SkipRecipe(message)
 
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4cf7f074fc..0e5675c500 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -316,8 +316,8 @@ def check_license_flags(d):
     This function checks if a recipe has any LICENSE_FLAGS that
     aren't whitelisted.
 
-    If it does, it returns the first LICENSE_FLAGS item missing from the
-    whitelist, or all of the LICENSE_FLAGS if there is no whitelist.
+    If it does, it returns the all LICENSE_FLAGS missing from the whitelist, or
+    all of the LICENSE_FLAGS if there is no whitelist.
 
     If everything is is properly whitelisted, it returns None.
     """
@@ -354,22 +354,23 @@ def check_license_flags(d):
         return False
 
     def all_license_flags_match(license_flags, whitelist):
-        """ Return first unmatched flag, None if all flags match """
+        """ Return all unmatched flags, None if all flags match """
         pn = d.getVar('PN')
         split_whitelist = whitelist.split()
+        flags = []
         for flag in license_flags.split():
             if not license_flag_matches(flag, split_whitelist, pn):
-                return flag
-        return None
+                flags.append(flag)
+        return flags if flags else None
 
     license_flags = d.getVar('LICENSE_FLAGS')
     if license_flags:
         whitelist = d.getVar('LICENSE_FLAGS_WHITELIST')
         if not whitelist:
-            return license_flags
-        unmatched_flag = all_license_flags_match(license_flags, whitelist)
-        if unmatched_flag:
-            return unmatched_flag
+            return license_flags.split()
+        unmatched_flags = all_license_flags_match(license_flags, whitelist)
+        if unmatched_flags:
+            return unmatched_flags
     return None
 
 def check_license_format(d):
---
2.19.1

