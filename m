Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9496E7E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:39 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so1944875eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=oddbiuI3JNPE54JrYDAHtFCtbrlFMMsMZb5EfiGxA6U=;
	b=IrC8o8lwFTkIFFr+GDg72b6yDlzIRr2G4p+3pgFEmTMAdLsJbx7apd5GhKurda/vtT
	UdL1egDzwJp9aqiFDaNMrZ+6SXcYb2otTWg4D2pMuLNwG9UwqzuIjOalFaG20iHCVHNl
	Is4ULnzjOiebVI4wM0aOlpaGvuXpNs72Clp4Q+CifMbrfzo8UHT4wLQzMvJOAQdmpL/j
	/EoP30G2aKv5Y8Qh1Fe/fcXF45LUDyRmtEV15D9NbTCrarixAiHHl9ccr0/MzlVp43eo
	uaHys6LQjQY1GXtlui3/J+8kcM+1YeA45h+aAEuV+IaDCSM8UlnncKRAPvwp7YKnq87H
	jLlQ==
X-Received: by 10.14.102.67 with SMTP id c43mr7997020eeg.23.1390053700693;
	Sat, 18 Jan 2014 06:01:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m48sm35477549eef.6.2014.01.18.06.01.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:54 +0100
Message-Id: <7fa3e8f8d7f3222794eed5b883c3b1ad92974609.1390052402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] icecc: use exact match in blacklists, re-start with empty system_package_blacklist
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:40 -0000

* unify debug messages a bit
* old implementation allowed partial match in blacklist, it's safer
  to explicitly list exact matches
* I was able to build all entries from system_package_blacklist with
  icecc enabled, lets assume that they were already resolved by newer
  versions (we've fixed a lot of parallel issues in recipes which were
  detected even without icecc and this list is very old).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 549bd69..5c9e66c 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -95,36 +95,39 @@ def use_icc(bb,d):
     if icc_is_allarch(bb, d):
         return "no"
 
-    package_tmp = d.expand('${PN}')
+    pn = d.getVar('PN', True)
 
-    system_class_blacklist = [ "none" ]
+    system_class_blacklist = []
     user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL') or "none").split()
     package_class_blacklist = system_class_blacklist + user_class_blacklist
 
     for black in package_class_blacklist:
         if bb.data.inherits_class(black, d):
-            #bb.note(package_tmp, ' class ', black, ' found in blacklist, disable icecc')
+            bb.debug(1, "%s: class %s found in blacklist, disable icecc" % (pn, black))
             return "no"
 
-    #"system" package blacklist contains a list of packages that can not distribute compile tasks
-    #for one reason or the other
-    system_package_blacklist = [ "uclibc", "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
+    # "system" recipe blacklist contains a list of packages that can not distribute compile tasks
+    # for one reason or the other
+    # this is the old list (which doesn't seem to be valid anymore, because I was able to build
+    # all these with icecc enabled)
+    # system_package_blacklist = [ "uclibc", "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
+    # when adding new entry, please document why (how it failed) so that we can re-evaluate it later
+    # e.g. when there is new version
+    system_package_blacklist = []
     user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL') or "").split()
     user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL') or "").split()
     package_blacklist = system_package_blacklist + user_package_blacklist
 
-    for black in package_blacklist:
-        if black in package_tmp:
-            #bb.note(package_tmp, ' found in blacklist, disable icecc')
-            return "no"
+    if pn in package_blacklist:
+        bb.debug(1, "%s: found in blacklist, disable icecc" % pn)
+        return "no"
 
-    for white in user_package_whitelist:
-        if white in package_tmp:
-            bb.debug(1, package_tmp, " ", d.expand('${PV})'), " found in whitelist, enable icecc")
-            return "yes"
+    if pn in user_package_whitelist:
+        bb.debug(1, "%s: found in whitelist, enable icecc" % pn)
+        return "yes"
 
     if d.getVar('PARALLEL_MAKE') == "":
-        bb.debug(1, package_tmp, " ", d.expand('${PV}'), " has empty PARALLEL_MAKE, disable icecc")
+        bb.debug(1, "%s: has empty PARALLEL_MAKE, disable icecc" % pn)
         return "no"
 
     return "yes"
-- 
1.8.5.2


