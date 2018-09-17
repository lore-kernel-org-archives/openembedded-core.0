Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 757D6793E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 13:42:00 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w8HDg09A008540
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:42:00 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.201])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w8HDg06b014675;
	Mon, 17 Sep 2018 15:42:00 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 69642A42C50;
	Mon, 17 Sep 2018 15:42:00 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2018 15:41:58 +0200
Message-Id: <20180917134158.4614-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] staging: remove hard-coded values from _FIXMEs
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
X-List-Received-Date: Mon, 17 Sep 2018 13:42:00 -0000

Let users to override these values in their layers and could match them
with values in EXTRA_STAGING_FIXMES.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/staging.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 84e13bab59..6db501dac1 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -127,6 +127,8 @@ python do_populate_sysroot_setscene () {
 }
 addtask do_populate_sysroot_setscene
 
+SYSROOT_STAGING_FIXMES ?= "COMPONENTS_DIR HOSTTOOLS_DIR PKGDATA_DIR PSEUDO_LOCALSTATEDIR LOGFIFO"
+
 def staging_copyfile(c, target, dest, postinsts, seendirs):
     import errno
 
@@ -167,7 +169,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     if not fixme:
         return
     cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
-    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
+    for fixmevar in d.getVar("SYSROOT_STAGING_FIXMES").split():
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.debug(2, cmd)
-- 
2.11.0


