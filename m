Return-Path: <i.romanov@inango-systems.com>
X-Greylist: delayed 382 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Sep 2017 18:12:23 UTC
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB97775DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 18:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id 6EB0845D587
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 20:06:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6F8dEfkct03t; Thu, 28 Sep 2017 20:06:00 +0200 (CEST)
Received: from iromanov-2.inango-sw (93-78-132.netrun.cytanet.com.cy
	[93.109.78.132])
	by main-1.inango.com (Postfix) with ESMTPSA id 18CE0445A82;
	Thu, 28 Sep 2017 20:06:00 +0200 (CEST)
From: Igor Romanov <i.romanov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Sep 2017 21:08:31 +0300
Message-Id: <20170928180831.16168-1-i.romanov@inango-systems.com>
X-Mailer: git-send-email 2.14.2
Cc: Igor Romanov <i.romanov@inango-systems.com>
Subject: [PATCH] image.bbclass: Fix 'vardepsexclude' mechanism for image_cmd_${FSTYPE}
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
X-List-Received-Date: Thu, 28 Sep 2017 18:12:23 -0000

Current mechanism doesn't allow to use any non-determenistic variable, except 'DATE' and 'DATETIME', inside IMAGE_CMD_${FSTYPE} prototype.

Passing 'vardepsexclude' values from IMAGE_CMD_${FSTYPE}, so users will be able to avoid taskhash mismatch problems.

Signed-off-by: Igor Romanov <i.romanov@inango-systems.com>
---
 meta/classes/image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0d14250c0d..20240ba9f0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -440,6 +440,9 @@ python () {
         localdata.delVar('DATETIME')
         localdata.delVar('DATE')
         localdata.delVar('TMPDIR')
+        vardepsexclude = (d.getVarFlag('IMAGE_CMD_' + realt, 'vardepsexclude', True) or '').split()
+        for dep in vardepsexclude:
+            localdata.delVar(dep)
 
         image_cmd = localdata.getVar("IMAGE_CMD")
         vardeps.add('IMAGE_CMD_' + realt)
@@ -503,7 +506,7 @@ python () {
         d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
-        d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE')
+        d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE ' + ' '.join(vardepsexclude))
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
-- 
2.14.2


