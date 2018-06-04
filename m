Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id AFA2F75175
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 15:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3CA859C1AB7;
	Mon,  4 Jun 2018 11:38:40 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id VcsveD0d1Kg2; Mon,  4 Jun 2018 11:38:39 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D6F819C345D;
	Mon,  4 Jun 2018 11:38:39 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id E2Yj9EV0j1Ok; Mon,  4 Jun 2018 11:38:39 -0400 (EDT)
Received: from workotop.mtl.sfl (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id AD0629C1AB7;
	Mon,  4 Jun 2018 11:38:39 -0400 (EDT)
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 11:38:27 -0400
Message-Id: <20180604153827.5186-1-damien.riegel@savoirfairelinux.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] populate_sdk_ext.bbclass: fix corebase identification
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
X-List-Received-Date: Mon, 04 Jun 2018 15:38:40 -0000

When generating the extended SDK, there is a copy step where this class
goes through the layers and other stuff that have been copied to
generate the SDK.

The corebase; ie. the folder that contains the core layer 'meta' is
treated in a special way. Unfortunately in our tree, we have:

  layers/meta/meta
           |     `- core layer
           `------- corebase

When populate_sdk_ext checks this layer, it thinks wrongly that it's the
corebase folder, so it treats it differently and doesn't add it to the
layer list. When bitbake tries to run in the generated SDK, it will fail
because it doesn't find information stored in that layer.

This patch makes sure only the corebase folder is identified as so.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 2dd21237e2..917fbfa1b4 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -207,7 +207,7 @@ python copy_buildsystem () {
     sdkbblayers = []
     corebase = os.path.basename(d.getVar('COREBASE'))
     for layer in layers_copied:
-        if corebase == os.path.basename(layer):
+        if corebase == layer:
             conf_bbpath = os.path.join('layers', layer, 'bitbake')
         else:
             sdkbblayers.append(layer)
-- 
2.17.0


