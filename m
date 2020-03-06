Return-Path: <andrej.valek@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5756108C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 15:47:57 +0000 (UTC)
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 026FWts3004028
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2020 16:32:55 +0100
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 026FWrS1031825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2020 16:32:53 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.56.79])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 026FWrIl018633;
	Fri, 6 Mar 2020 16:32:53 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 060F6950A88;
	Fri,  6 Mar 2020 16:32:53 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 16:32:34 +0100
Message-Id: <20200306153234.23875-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200306153234.23875-1-andrej.valek@siemens.com>
References: <20200306153234.23875-1-andrej.valek@siemens.com>
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
	further information)
X-purgate-size: 3030
X-purgate-ID: 149902::1583508775-000010EA-F84FCC7A/0/0
Subject: [PATCH 2/2] populate_sdk_ext: add option to append lines into local.conf
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
X-List-Received-Date: Fri, 06 Mar 2020 15:47:58 -0000

Add option to add new lines into local.conf content in ext_sdk case
via SDK_LOCAL_CONF_EXTRALIST variable.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/buildhistory.bbclass     |  4 ++--
 meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index eb7295570d..a347811edc 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -757,8 +757,8 @@ def buildhistory_get_sdkvars(d):
     sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
     if d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
         # Extensible SDK uses some additional variables
-        sdkvars += " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL SDK_EXT_TYPE SDK_RECRDEP_TASKS SDK_INCLUDE_PKGDATA SDK_INCLUDE_TOOLCHAIN"
-    listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST"
+        sdkvars += " SDK_LOCAL_CONF_EXTRALIST SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL SDK_EXT_TYPE SDK_RECRDEP_TASKS SDK_INCLUDE_PKGDATA SDK_INCLUDE_TOOLCHAIN"
+    listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE SDK_LOCAL_CONF_EXTRALIST SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST"
     return outputvars(sdkvars, listvars, d)
 
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9f26cfc131..2eccf52df1 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -25,6 +25,7 @@ SDK_INCLUDE_BUILDTOOLS ?= '1'
 
 SDK_RECRDEP_TASKS ?= ""
 
+SDK_LOCAL_CONF_EXTRALIST ?= ""
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
                              BB_NUMBER_THREADS \
@@ -372,7 +373,16 @@ python copy_buildsystem () {
                     for line in xf:
                         f.write(line)
 
-            # If you define a sdk_extraconf() function then it can contain additional config
+            # Allow additional config through SDK_LOCAL_CONF_EXTRALIST
+            local_conf_extralist = (d.getVar('SDK_LOCAL_CONF_EXTRALIST') or '').split()
+            if local_conf_extralist:
+                for var in local_conf_extralist:
+                    value = d.getVar(var) or ""
+                    if value:
+                        f.write('%s = "%s"\n' % (var, value))
+                f.write('\n')
+
+            # If you define a sdk_extraconf variable then it can contain additional config
             # (Though this is awkward; sdk-extra.conf should probably be used instead)
             extraconf = (d.getVar('sdk_extraconf') or '').strip()
             if extraconf:
-- 
2.11.0


