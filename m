Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D25356077D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 16:01:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2013 09:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="372454053"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2013 09:00:59 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 19:08:38 +0300
Message-Id: <1374163718-26829-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] distrodata.bbclass: Include PRSPV variable in upstream version checking
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
X-List-Received-Date: Thu, 18 Jul 2013 16:01:14 -0000

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
 meta/classes/distrodata.bbclass |   39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 204612c..af52dd5 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -71,7 +71,7 @@ python do_distrodata_np() {
         rstatus = localdata.getVar('RECIPE_COLOR', True)
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
-                
+
         pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
         if pcurver == pupver:
                 vermatch="1"
@@ -157,7 +157,7 @@ python do_distrodata() {
         rstatus = localdata.getVar('RECIPE_COLOR', True)
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
-                
+
         pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
         if pcurver == pupver:
                 vermatch="1"
@@ -408,7 +408,7 @@ python do_checkpkg() {
                                 s = "%s[^\d\"]*?(\d+[\.\-_])+\d+/?" % m.group()
                         else:
                                 s = "(\d+[\.\-_])+\d+/?"
-                                
+
                         searchstr = "[hH][rR][eE][fF]=\"%s\">" % s
 
                         reg = re.compile(searchstr)
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
@@ -590,31 +593,41 @@ python do_checkpkg() {
 
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
                 altpath = path
                 dirver = "-"
                 curname = "-"
-        
+
                 """
                 match version number amid the path, such as "5.7" in:
-                        http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz        
+                        http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz
                 N.B. how about sth. like "../5.7/5.8/..."? Not find such example so far :-P
                 """
                 m = re.search(r"[^/]*(\d+\.)+\d+([\-_]r\d+)*/", path)
                 if m:
                         altpath = path.split(m.group())[0]
                         dirver = m.group().strip("/")
-        
+
                         """use new path and remove param. for wget only param is md5sum"""
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
@@ -624,7 +637,7 @@ python do_checkpkg() {
                 """Now try to acquire all remote files in current directory"""
                 if not re.match("Err", newver):
                         curname = altpath.split("/")[-1]
-        
+
                         """get remote name by skipping pacakge name"""
                         m = re.search(r"/.*/", altpath)
                         if not m:
@@ -650,7 +663,7 @@ python do_checkpkg() {
                                 pstatus = "UPDATE"
                         else:
                                 pstatus = "MATCH"
-        
+
                 if re.match("Err", newver):
                         pstatus = newver + ":" + altpath + ":" + dirver + ":" + curname
         elif type == 'git':
@@ -796,7 +809,7 @@ python do_checkpkg() {
                         pmstatus = "MATCH"
                 else:
                         pmstatus = "UPDATE"
-        
+
         psrcuri = psrcuri.split()[0]
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
-- 
1.7.9.5


