Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id 73BD26FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 07:41:58 +0000 (UTC)
Received: from localhost.localdomain (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])
	by msfrf2616.sfr.fr (SMTP Server) with ESMTP id F079E1C000D21;
	Thu,  9 Jun 2016 09:41:58 +0200 (CEST)
Received: from localhost.localdomain (111-250-192-53.dynamic.hinet.net
	[111.250.192.53])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2616.sfr.fr (SMTP Server) with ESMTPSA;
	Thu,  9 Jun 2016 09:41:57 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 15:41:31 +0800
Message-Id: <1465458091-94186-2-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465458091-94186-1-git-send-email-herve.jourdain@neuf.fr>
References: <1465458091-94186-1-git-send-email-herve.jourdain@neuf.fr>
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [smartpm][PATCH 1/1] smartpm: if RPM transaction fails with an empty list of problems in attempt mode, ignore it!
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
X-List-Received-Date: Thu, 09 Jun 2016 07:42:00 -0000

Since commit be0cabf816a84c59e0e951b92a570121ed843822 on 2016/05/17, smartpm will retry the transaction if ts.run() returns with an empty list of problems, and we're in attempt mode.
But then, since all the packages are already installed, the transaction will fail with "package already installed" error.

In attempt mode, it's fine to not retry nor generate an error when the transaction fails for no reason linked to files/packages conflicts, so this patch fixes this behaviour.

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 .../python/python-smartpm/smart-attempt.patch              | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
index 5aedc88..e118204 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
@@ -26,7 +26,7 @@ diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py
 index 9bbd952..ba6405a 100644
 --- a/smart/backends/rpm/pm.py
 +++ b/smart/backends/rpm/pm.py
-@@ -241,15 +241,48 @@ class RPMPackageManager(PackageManager):
+@@ -241,15 +241,56 @@ class RPMPackageManager(PackageManager):
          cb = RPMCallback(prog, upgradednames)
          cb.grabOutput(True)
          probs = None
@@ -36,7 +36,12 @@ index 9bbd952..ba6405a 100644
          finally:
              del getTS.ts
              cb.grabOutput(False)
-+            if (probs is not None) and sysconf.has("attempt-install", soft=True):
++            # If there are file conflicts, and we're attempting installation,
++            # remove conflicting packages from the transaction and retry
++            # If there are other problems returned by ts.run(), that are not
++            # linked with packages/files conflicts (the returned list is empty),
++            # then don't retry
++            if (probs is not None) and (len(probs) != 0) and sysconf.has("attempt-install", soft=True):
 +                def remove_conflict(pkgNEVR):
 +                    for key in changeset.keys():
 +                        if pkgNEVR == str(key):
@@ -68,7 +73,10 @@ index 9bbd952..ba6405a 100644
 +
              prog.setDone()
 -            if probs is not None:
-+            if (probs is not None) and (not retry):
++            # If there are other problems than packages/files conflicts
++            # returned by ts.run(), the returned list is empty, and if
++            # we're only attempting installation, then don't raise any error
++            if (probs is not None) and ((len(probs) != 0) or not sysconf.has("attempt-install", soft=True)) and (not retry):
                  raise Error, "\n".join([x[0] for x in probs])
              prog.stop()
 +            if retry and len(changeset):
-- 
2.7.4


