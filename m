Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F13BC6B095
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 15:50:36 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2013 08:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,752,1367996400"; d="scan'208";a="273784704"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2013 08:50:30 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 18:58:17 +0300
Message-Id: <1374854298-30941-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 1/2] distrodata.bbclass: Include PRSPV variable in upstream version checking
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
X-List-Received-Date: Fri, 26 Jul 2013 15:50:38 -0000

The PRSPV variable is used for the packages that have different
representation for a same upstream and local version (e.g 2.0 vs 20).
In this case, the system is using PRSPV instead of PV when comparing
the local and upstream versions.

The packages that are using this modification are the following:
	* zip
	* unzip
	* docbook-sgml-dtd-3.1-native
	* docbook-sgml-dtd-4.1-native

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/classes/distrodata.bbclass |   23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 204612c..5f182ac 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -563,7 +563,10 @@ python do_checkpkg() {
                chk_uri = src_uri
         pdesc = localdata.getVar('DESCRIPTION', True)
         pgrp = localdata.getVar('SECTION', True)
-        pversion = localdata.getVar('PV', True)
+        if localdata.getVar('PRSPV', True):
+                pversion = localdata.getVar('PRSPV', True)
+        else:
+                pversion = localdata.getVar('PV', True)
         plicense = localdata.getVar('LICENSE', True)
         psection = localdata.getVar('SECTION', True)
         phome = localdata.getVar('HOMEPAGE', True)
@@ -590,9 +593,16 @@ python do_checkpkg() {
 
         (type, host, path, user, pswd, parm) = bb.decodeurl(uri)
         if type in ['http', 'https', 'ftp']:
-                pcurver = d.getVar('PV', True)
+                if d.getVar('PRSPV', True):
+                    pcurver = d.getVar('PRSPV', True)
+                else:
+                    pcurver = d.getVar('PV', True)
         else:
-                pcurver = d.getVar("SRCREV", True)
+                if d.getVar('PRSPV', True):
+                    pcurver = d.getVar('PRSPV', True)
+                else:
+                    pcurver = d.getVar("SRCREV", True)
+
 
         if type in ['http', 'https', 'ftp']:
                 newver = pcurver
@@ -614,7 +624,10 @@ python do_checkpkg() {
                         alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
                         my_uri = d.getVar('REGEX_URI', True)
                         if my_uri:
-                            newver = d.getVar('PV', True)
+                            if d.getVar('PRSPV', True):
+                                    newver = d.getVar('PRSPV', True)
+                            else:
+                                    newver = d.getVar('PV', True)
                         else:
                             newver = check_new_dir(alturi, dirver, d)
                         altpath = path
@@ -736,7 +749,7 @@ python do_checkpkg() {
                                 pupver = latest_pv + tmp3.group('git_prefix') + latest_head
                         else:
                                 if not tmp3:
-                                        bb.plain("#DEBUG# Current version (%s) doesn't match the usual pattern" %pversion)
+                                        bb.plain("#DEBUG# Package %s: current version (%s) doesn't match the usual pattern" %(pname, pversion))
         elif type == 'svn':
                 options = []
                 if user:
-- 
1.7.9.5


