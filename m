Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4EC6E672
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 03:01:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2017 20:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,434,1500966000"; d="scan'208";a="1198579286"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2017 20:01:32 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Sep 2017 12:52:37 -0700
Message-Id: <1506282757-32998-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sanity.bbclass: uppercase check for machine and distro
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
X-List-Received-Date: Mon, 25 Sep 2017 03:01:34 -0000

Uppercase in machine and distro will result in unexpected
behavior.

QA check will produce error message if it verified that
machine or distro is uppercase.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/sanity.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 1feb794..82efaef 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -694,6 +694,13 @@ def sanity_check_locale(d):
     except locale.Error:
         raise_sanity_error("You system needs to support the en_US.UTF-8 locale.", d)
 
+def check_name_uppercase(type, name):
+    import re
+    messages = ""
+    if re.search('[A-Z]', name):
+        messages = messages + "%s: '%s' is uppercase. Please correct it to lowercase to avoid unexpected behavior.\n" % (type, name)
+    return messages
+    
 def check_sanity_everybuild(status, d):
     import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
@@ -723,6 +730,7 @@ def check_sanity_everybuild(status, d):
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO')
     if distro and distro != "nodistro":
+        status.addresult(check_name_uppercase('DISTRO', d.getVar('DISTRO')))    
         if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or check_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
             status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO"))
 
@@ -743,6 +751,7 @@ def check_sanity_everybuild(status, d):
     # Check that the MACHINE is valid, if it is set
     machinevalid = True
     if d.getVar('MACHINE'):
+        status.addresult(check_name_uppercase('MACHINE', d.getVar('MACHINE')))
         if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
             status.addresult('MACHINE=%s is invalid. Please set a valid MACHINE in your local.conf, environment or other configuration file.\n' % (d.getVar('MACHINE')))
             machinevalid = False
-- 
2.7.4


