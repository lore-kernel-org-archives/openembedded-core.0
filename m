Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B024774585
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 23:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E5E8518326
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id nucbkAzKA1s9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:01 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6288E18107
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B3811A05D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FCC51A05C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 321051B39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w9KNL3W2000806
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 01:21:03 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w9KNL3fq000805
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2018 01:21:03 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2018 01:20:59 +0200
Message-Id: <20181020232059.750-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] oe-selftest: devtool: Support meta being a symbolic link
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
X-List-Received-Date: Sat, 20 Oct 2018 23:21:02 -0000

oe-selftest's devtool tests have been broken since commit 2457cd57
(oe-selftest: devtool: avoid parallel races by using temporary copy of
core) if meta is a symbolic link.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I have tested this change with OE-Core, Poky and our own setup (where
meta is a symbolic link).

 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3c1189003d..9eb9badf84 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -32,8 +32,9 @@ def setUpModule():
             # This helps us match exactly when we're using this path later
             canonical_layerpath += '/'
         if not edited_layers and canonical_layerpath.endswith('/meta/'):
+            canonical_layerpath = os.path.realpath(canonical_layerpath) + '/'
             edited_layers.append(layerpath)
-            oldmetapath = layerpath
+            oldmetapath = os.path.realpath(layerpath)
             result = runCmd('git rev-parse --show-toplevel', cwd=canonical_layerpath)
             oldreporoot = result.output.rstrip()
             newmetapath = os.path.join(corecopydir, os.path.relpath(oldmetapath, oldreporoot))
-- 
2.12.0


