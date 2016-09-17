Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id DF0B06FFFE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 01:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 40AB72E479
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XCS+axsqStK9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 742712E44E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E0401A073
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5318B1A072
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 45E0534C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u8H1I9hN024639
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:18:09 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u8H1I9Ap024638
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2016 03:18:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Sep 2016 03:18:08 +0200
Message-Id: <7b964da0d2093234e17d5290da77b2777782b91d.1474075036.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474075036.git.pkj@axis.com>
References: <cover.1474075036.git.pkj@axis.com>
In-Reply-To: <cover.1474075036.git.pkj@axis.com>
References: <cover.1474075036.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/1] externalsrc.bbclass: Make reparsing work for BBCLASSEXTENDed recipes
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
X-List-Received-Date: Sat, 17 Sep 2016 01:18:12 -0000

To make sure changes to any source files are detected when externalsrc
is used, it sets BB_DONT_CACHE to force the recipe to be reparsed
every time. Previously, this was done conditionally based on whether
EXTERNALSRC was set. This worked fine for building the base recipe.
But if one tried to build, e.g., a native version of it (provided via
BBCLASSEXTEND), the recipe would not be reparsed as expected.

To solve the above problem, BB_DONT_CACHE is now set for the base
recipe if EXTERNALSRC is set for it or any of it derivatives.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/externalsrc.bbclass | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index b7140a3..5c65d2b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -29,6 +29,23 @@ EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
 
 python () {
     externalsrc = d.getVar('EXTERNALSRC', True)
+
+    # If this is the base recipe and EXTERNALSRC is set for it or any of its
+    # derivatives, then enable BB_DONT_CACHE to force the recipe to always be
+    # re-parsed so that the file-checksums function for do_compile is run every
+    # time.
+    bpn = d.getVar('BPN', True)
+    if bpn == d.getVar('PN', True):
+        classextend = (d.getVar('BBCLASSEXTEND', True) or '').split()
+        if (externalsrc or
+                ('native' in classextend and
+                 d.getVar('EXTERNALSRC_pn-%s-native' % bpn, True)) or
+                ('nativesdk' in classextend and
+                 d.getVar('EXTERNALSRC_pn-nativesdk-%s' % bpn, True)) or
+                ('cross' in classextend and
+                 d.getVar('EXTERNALSRC_pn-%s-cross' % bpn, True))):
+            d.setVar('BB_DONT_CACHE', '1')
+
     if externalsrc:
         d.setVar('S', externalsrc)
         externalsrcbuild = d.getVar('EXTERNALSRC_BUILD', True)
@@ -85,9 +102,6 @@ python () {
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
-        # Force the recipe to be always re-parsed so that the file_checksums
-        # function is run every time
-        d.setVar('BB_DONT_CACHE', '1')
         d.setVarFlag('do_compile', 'file-checksums', '${@srctree_hash_files(d)}')
 
         # We don't want the workdir to go away
-- 
2.9.0


