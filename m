Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id C4558606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=yrL4kMV+uK68miRrAOM8l7FwGnzC5ZYIfEUFln2Fpy0=; 
	b=g1SoPZO217YRH+LV1/+pDWkXOg89wPxJlMo0tROZbdyiazi7zVx9eKlvGIVFyh4crv6o3xbxngbKpGmmXPB5CJH2VlsTdYt7M6xjdsY3yZcjlUbh/3Ft8yOvr/7S2x4X1loQ1cfjfc9R+ETgtU/Vq8Xnb1xOq7MO18+0rsip0a1+nLnzZd1rFW72yGUygIZPogvmjm+bSA0NyG+6oKt2KDZVBGAzeHfYrGC1Y3O2a04/uLUgahjPMbNIGjZjF0pkNvgTFcnGe/Y6xLX0k/o1qGxO2JGdvQ9rEtxKAQM4gcHqS7PewPAm7XPL95IMtOTSlOffT6owiXUk2SG22gQ6CA==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dpYBz-0000sw-JA; Wed, 06 Sep 2017 14:08:23 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dpYBz-0003ej-Ge; Wed, 06 Sep 2017 14:08:23 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 14:08:14 +0300
Message-Id: <1504696096-13095-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 1/3] gitsm.py: use download cache for git submodules too
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
X-List-Received-Date: Wed, 06 Sep 2017 11:08:24 -0000

Currently download caches for recipes using gitsm are filled also with
the submodule repositories but when the git submodule tree is reused from
cache, only the base repository is cloned. After a source URL rewrite,
'git submodule update --init --recursive' is called in the tree
which downloads the needed submodules from upstream URL's.
This wastes bandwidth since download cache already had the needed
commits for the submodule repositories.

With this change, also the submodule repositories are copied to the
work space from download cache and the download from upstream can
be avoided. Using plain 'cp -a' since git cloning doesn't work for the
submodule directories.

Note that using BB_NO_NETWORK does not stop the submodule downloads
from 'git submodule update --init --recursive'. Thus tested by
breaking access to remote repository via /etc/hosts line like:

127.0.0.1       localhost github.com

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 bitbake/lib/bb/fetch2/gitsm.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/gitsm.py b/bitbake/lib/bb/fetch2/gitsm.py
index 0aff100..20a9c40 100644
--- a/bitbake/lib/bb/fetch2/gitsm.py
+++ b/bitbake/lib/bb/fetch2/gitsm.py
@@ -131,5 +131,13 @@ class GitSM(Git):
         Git.unpack(self, ud, destdir, d)
 
         if self.uses_submodules(ud, d, ud.destdir):
+            # Copy also submodule trees from download cache instead of
+            # downloading again from the upstream repository.
+            # For some reason git does not clone them.
+            clone_modules = os.path.join(ud.clonedir, "modules")
+            if os.path.exists(clone_modules):
+                dest_modules = os.path.join(ud.destdir, ".git")
+                runfetchcmd("cp -a " + clone_modules + " " + dest_modules, d)
+
             runfetchcmd(ud.basecmd + " checkout " + ud.revisions[ud.names[0]], d, workdir=ud.destdir)
             runfetchcmd(ud.basecmd + " submodule update --init --recursive", d, workdir=ud.destdir)
-- 
1.9.1


