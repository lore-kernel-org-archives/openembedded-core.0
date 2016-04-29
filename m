Return-Path: <diego.ml@zoho.com>
X-Greylist: delayed 903 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Apr 2016 10:40:45 UTC
Received: from sender153-mail.zoho.com (sender153-mail.zoho.com
	[74.201.84.153])
	by mail.openembedded.org (Postfix) with ESMTP id 300E06067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 10:40:45 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=LxGRfCIkhRbQeLUzG1/pv0wYaIltkLDKtbBl6h/dVFMW5GYeAy7XoufaimNZiL1OEZxuOvOA7+6V
	aiJxIqjHhTijCRN0heJmKXDX8SXWyuXlalMPyIQXpUy0ZpzfoHy4  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1461925530729749.3577307438001;
	Fri, 29 Apr 2016 03:25:30 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2016 12:24:09 +0200
Message-Id: <1461925449-5768-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.9.1
X-ZohoMail: Z_23712318 SPT_1 SLF_E
X-Zoho-Virus-Status: 2
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [PATCH] base-files: add some safety checks in profile
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
X-List-Received-Date: Fri, 29 Apr 2016 10:40:48 -0000

Add some safety checks when sourcing files in /etc/profile.d/, in particular:
- source only *.sh files, not every file. This is the practice in use in both
  Fedora and Debian/Ubuntu (see
  https://help.ubuntu.com/community/EnvironmentVariables#A.2Fetc.2Fprofile.d.2F.2A.sh);
- check the input is actually a file and is readable. This check is especially
  important if profile.d is empty, as "*.sh" will get expanded only if
  profile.d is not empty. Previously if profile.d was present but empty,
  "/etc/profile.d/*" was sourced causing errors on login and breaking stuff, for
  example X startup.

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 meta/recipes-core/base-files/base-files/profile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 53c2680..e98e786 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -20,8 +20,10 @@ if [ "$PS1" ]; then
 fi
 
 if [ -d /etc/profile.d ]; then
-  for i in /etc/profile.d/* ; do
-    . $i
+  for i in /etc/profile.d/*.sh ; do
+    if [ -f $i -a -r $i ]; then
+      . $i
+    fi
   done
   unset i
 fi
-- 
1.9.1



