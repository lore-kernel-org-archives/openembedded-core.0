Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3138D6071F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 08:23:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sy9yq3ytpz3hlnY;
	Mon, 17 Oct 2016 10:16:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sy9yq3ZFrzvkRy;
	Mon, 17 Oct 2016 10:16:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id H-W_TirmoqxF; Mon, 17 Oct 2016 10:16:34 +0200 (CEST)
X-Auth-Info: WyDOqjBz2AzYhVrij/LkvzHqIpsjvylE0+BCERhFsX9iVfEjCK+70aua+dP/RkDP
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 17 Oct 2016 10:16:34 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 08:16:27 +0000
Message-Id: <1476692188-1520-1-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] combo-layer: fix crashes on wrong tempfile usage
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
X-List-Received-Date: Mon, 17 Oct 2016 08:23:02 -0000

When calling tempfile.NamedTemporaryFile().write(str()), at least on
Python 3.4.2 this fails with this error:
TypeError: 'str' does not support the buffer interface

Change the file-mode for all such files from binary to text mode.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 scripts/combo-layer | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index b90bfc8..4a210fb 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -329,7 +329,7 @@ def action_init(conf, args):
                         # one. The commit should be in both repos with
                         # the same tree, but better check here.
                         tree = runcmd('git show -s --pretty=format:%%T %s' % rev).strip()
-                        with tempfile.NamedTemporaryFile() as editor:
+                        with tempfile.NamedTemporaryFile(mode='wt') as editor:
                             editor.write('''cat >$1 <<EOF
 tree %s
 author %s
@@ -353,7 +353,7 @@ EOF
                 # Optional: rewrite history to change commit messages or to move files.
                 if 'hook' in repo or dest_dir != ".":
                     filter_branch = ['git', 'filter-branch', '--force']
-                    with tempfile.NamedTemporaryFile() as hookwrapper:
+                    with tempfile.NamedTemporaryFile(mode='wt') as hookwrapper:
                         if 'hook' in repo:
                             # Create a shell script wrapper around the original hook that
                             # can be used by git filter-branch. Hook may or may not have
@@ -1137,7 +1137,7 @@ def update_with_history(conf, components, revisions, repos):
             if hook:
                 # Need to turn the verbatim commit message into something resembling a patch header
                 # for the hook.
-                with tempfile.NamedTemporaryFile(delete=False) as patch:
+                with tempfile.NamedTemporaryFile(mode='wt', delete=False) as patch:
                     patch.write('Subject: [PATCH] ')
                     patch.write(body)
                     patch.write('\n---\n')
-- 
2.1.4


