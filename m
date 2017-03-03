Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B34B17769D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG8Tn003821; Fri, 3 Mar 2017 11:16:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uc8gFiaitsMB; Fri,  3 Mar 2017 11:16:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG6Hn003815
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Mar 2017 11:16:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cjlBu-0005bZ-PJ; Fri, 03 Mar 2017 11:16:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 11:16:03 +0000
Message-Id: <1488539763-21490-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488539763-21490-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488539763-21490-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/4] populate_ext_sdk: Merge auto.conf into local.conf
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
X-List-Received-Date: Fri, 03 Mar 2017 11:16:09 -0000

auto.conf is included before local.conf. Instead of keeping them separate, merge
them into the extsdk local.conf. As it happens we can do this quite neatly, more
neatly than the current code IMO and it makes the configuration easier for the end
user to understand too.

This means auto.conf is then available for the testsdk code to use for testing
purposes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fb38ebc..3bccb14 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -253,6 +253,8 @@ python copy_buildsystem () {
 
     # Create local.conf
     builddir = d.getVar('TOPDIR')
+    if derivative and os.path.exists(builddir + '/conf/auto.conf'):
+        shutil.copyfile(builddir + '/conf/auto.conf', baseoutpath + '/conf/auto.conf')
     if derivative:
         shutil.copyfile(builddir + '/conf/local.conf', baseoutpath + '/conf/local.conf')
     else:
@@ -267,8 +269,12 @@ python copy_buildsystem () {
                     env_whitelist_values[varname] = origvalue
                 return origvalue, op, 0, True
         varlist = ['[^#=+ ]*']
+        oldlines = []
+        if os.path.exists(builddir + '/conf/auto.conf'):
+            with open(builddir + '/conf/auto.conf', 'r') as f:
+                oldlines += f.readlines()
         with open(builddir + '/conf/local.conf', 'r') as f:
-            oldlines = f.readlines()
+            oldlines += f.readlines()
         (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
 
         with open(baseoutpath + '/conf/local.conf', 'w') as f:
@@ -332,22 +338,6 @@ python copy_buildsystem () {
             f.write('require conf/locked-sigs.inc\n')
             f.write('require conf/unlocked-sigs.inc\n')
 
-    if os.path.exists(builddir + '/conf/auto.conf'):
-        if derivative:
-            shutil.copyfile(builddir + '/conf/auto.conf', baseoutpath + '/conf/auto.conf')
-        else:
-            with open(builddir + '/conf/auto.conf', 'r') as f:
-                oldlines = f.readlines()
-            (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
-            with open(baseoutpath + '/conf/auto.conf', 'w') as f:
-                f.write('# WARNING: this configuration has been automatically generated and in\n')
-                f.write('# most cases should not be edited. If you need more flexibility than\n')
-                f.write('# this configuration provides, it is strongly suggested that you set\n')
-                f.write('# up a proper instance of the full build system and use that instead.\n\n')
-                for line in newlines:
-                    if line.strip() and not line.startswith('#'):
-                        f.write(line)
-
     # Write a templateconf.cfg
     with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
         f.write('meta/conf\n')
-- 
2.7.4


