Return-Path: <luca@lucaceresoli.net>
X-Greylist: delayed 2455 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Sep 2017 09:21:48 UTC
Received: from srv-hp10-72.netsons.net (srv-hp10-72.netsons.net [94.141.22.72])
	by mail.openembedded.org (Postfix) with ESMTP id EFA37779C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 09:21:48 +0000 (UTC)
Received: from 45.11.168.109.cust.ip.kpnqwest.it ([109.168.11.45]:58474
	helo=pc-ceresoli.dev.aim)
	by srv-hp10.netsons.net with esmtpa (Exim 4.89)
	(envelope-from <luca@lucaceresoli.net>)
	id 1dxqqq-001sEd-Kg; Fri, 29 Sep 2017 10:40:52 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Sep 2017 10:39:24 +0200
Message-Id: <1506674364-25892-1-git-send-email-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.7.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv-hp10.netsons.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: srv-hp10.netsons.net: authenticated_id:
	luca+lucaceresoli.net/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: srv-hp10.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] externalsrc: fix ExpansionError if the source dir does not exist yet
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
X-List-Received-Date: Fri, 29 Sep 2017 09:21:49 -0000

The externalsrc class code assumes that the source directory
(EXTERNALSRC) exists before bitbake is called. Otherwise do_configure
will fail obviously since externalsrc does not fetch anything.

Commit 3ca6085729d9 ("externalsrc: Handle .git not being a directory")
changed this behaviour. Now on a missing EXTERNALSRC directory we get
a bb.data_smart.ExpansionError during _parsing_, way before
do_configure can be run.

This new behaviour creates two problems:

 * First, there error message is very cryptic (and it's hard to
   provide a better message since no task is ever run):

     ERROR: ExpansionError during parsing /<...>/<...>.bb
     Traceback (most recent call last):
     bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-checksums], expression was ${@srctree_hash_files(d)} which triggered exception FileNotFoundError: [Errno 2] No such file or directory: '<...>'

 * Second, this prevents creating a class based on externalsrc that
   automatically fetches the code in EXTERNALSRC before do_compile
   runs.

Fix both problems by simply calling git with '-C ${EXTERNALSRC}'
instead of calling git inside the non-existing directory. This changes
from a bb.data_smart.ExpansionError to a
subprocess.CalledProcessError, which is in line with what's actually
going on: git is telling us it can't find the git dir.

Also remove a comment that does not apply anymore.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Joshua Watt <jpewhacker@gmail.com>
---
 meta/classes/externalsrc.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 08e6e479010f..65dd13ddc1f7 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -188,10 +188,8 @@ def srctree_hash_files(d, srcdir=None):
     git_dir = None
 
     try:
-        # git rev-parse returns the path relative to the current working
-        # directory
         git_dir = os.path.join(s_dir,
-            subprocess.check_output(['git', 'rev-parse', '--git-dir'], cwd=s_dir).decode("utf-8").rstrip())
+            subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir']).decode("utf-8").rstrip())
     except subprocess.CalledProcessError:
         pass
 
-- 
2.7.4


