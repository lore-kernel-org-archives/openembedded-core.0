Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9GmD-0008FI-Hy for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 16:40:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85ERwii027996
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 15:27:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27558-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2012 15:27:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q85ERnMa027990
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 15:27:50 +0100
Message-ID: <1346855269.21985.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Sep 2012 15:27:49 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sanity.bbclass: Move back to running at ConfigParsed time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 14:40:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we don't do this, users can get extremely confused errors since the sanity tests
happen too late (after parsing) and don't see the warnings.

Also cleanup messages about merging configuration file changes to give better
hints at where the updated files may be.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 40d8211..8f42fca 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -333,20 +333,20 @@ def check_sanity(sanity_data):
     conf_version =  sanity_data.getVar('LOCALCONF_VERSION', True)
 
     if current_conf != conf_version:
-        messages = messages + "Your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf conf/local.conf.sample\" is a good way to visualise the changes.\n"
+        messages = messages + "Your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good way to visualise the changes.\n"
 
     # Check bblayers.conf is valid
     current_lconf = sanity_data.getVar('LCONF_VERSION', True)
     lconf_version = sanity_data.getVar('LAYER_CONF_VERSION', True)
     if current_lconf != lconf_version:
-        messages = messages + "Your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
+        messages = messages + "Your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
 
     # If we have a site.conf, check it's valid
     if check_conf_exists("conf/site.conf", sanity_data):
         current_sconf = sanity_data.getVar('SCONF_VERSION', True)
         sconf_version = sanity_data.getVar('SITE_CONF_VERSION', True)
         if current_sconf != sconf_version:
-            messages = messages + "Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf conf/site.conf.sample\" is a good way to visualise the changes.\n"
+            messages = messages + "Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf ${COREBASE}/meta*/conf/site.conf.sample\" is a good way to visualise the changes.\n"
 
     assume_provided = sanity_data.getVar('ASSUME_PROVIDED', True).split()
     # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf
@@ -556,7 +556,7 @@ def check_sanity(sanity_data):
         messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
 
     if messages != "":
-        raise_sanity_error(messages, sanity_data)
+        raise_sanity_error(sanity_data.expand(messages), sanity_data)
 
 # Create a copy of the datastore and finalise it to ensure appends and 
 # overrides are set - the datastore has yet to be finalised at ConfigParsed
@@ -567,7 +567,7 @@ def copy_data(e):
 
 addhandler check_sanity_eventhandler
 python check_sanity_eventhandler() {
-    if bb.event.getName(e) == "BuildStarted" and e.data.getVar("BB_WORKERCONTEXT", True) != "1" and e.data.getVar("DISABLE_SANITY_CHECKS", True) != "1":
+    if bb.event.getName(e) == "ConfigParsed" and e.data.getVar("BB_WORKERCONTEXT", True) != "1" and e.data.getVar("DISABLE_SANITY_CHECKS", True) != "1":
         sanity_data = copy_data(e)
         check_sanity(sanity_data)
     elif bb.event.getName(e) == "SanityCheck":




