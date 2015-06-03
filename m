Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB537579E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 16:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t53GieZx030413 for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jun 2015 17:44:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NRm0_iB5O_Iu
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 17:44:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t53GiRDc030410
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jun 2015 17:44:38 +0100
Message-ID: <1433349867.404.250.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Jun 2015 17:44:27 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] scripts/combo-layer: Fix exit codes and tty handling
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
X-List-Received-Date: Wed, 03 Jun 2015 16:44:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If combo-layer is called from a non-interactive context we should exit
with a correct error code rather than try and drop to a shell.

This patch cleans up a few error case exit codes as well as
detecting and handling non-interactive usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 698d3e3..4029d2b 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -502,6 +502,10 @@ def check_patch(patchfile):
         os.rename(patchfile + '.tmp', patchfile)
 
 def drop_to_shell(workdir=None):
+    if not sys.stdin.isatty():
+        print "Not a TTY so can't drop to shell for resolution, exiting."
+        return False
+
     shell = os.environ.get('SHELL', 'bash')
     print('Dropping to shell "%s"\n' \
           'When you are finished, run the following to continue:\n' \
@@ -547,7 +551,7 @@ def get_repos(conf, repo_names):
     for repo in repos:
         if not repo in conf.repos:
             logger.error("Specified component '%s' not found in configuration" % repo)
-            sys.exit(0)
+            sys.exit(1)
 
     if not repos:
         repos = conf.repos
@@ -695,7 +699,7 @@ def action_update(conf, args):
         print('You may now edit the patch and patch list in %s\n' \
               'For example, you can remove unwanted patch entries from patchlist-*, so that they will be not applied later' % patch_dir);
         if not drop_to_shell(patch_dir):
-            sys.exit(0)
+            sys.exit(1)
 
     # Step 6: apply the generated and revised patch
     apply_patchlist(conf, repos)
@@ -761,7 +765,7 @@ def apply_patchlist(conf, repos):
                         if not drop_to_shell():
                             if prevrev != repo['last_revision']:
                                 conf.update(name, "last_revision", prevrev)
-                            sys.exit(0)
+                            sys.exit(1)
                 prevrev = lastrev
                 i += 1
             # Once all patches are applied, we should update



