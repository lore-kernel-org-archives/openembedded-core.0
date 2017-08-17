Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 7672C78353
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 13:16:13 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v7HDGE6r018238
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 15:16:14 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v7HDGEXB014166;
	Thu, 17 Aug 2017 15:16:14 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 2F9B715187D3;
	Thu, 17 Aug 2017 15:16:14 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 15:16:01 +0200
Message-Id: <1502975761-27290-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] copy_buildsystem: include layer tree during build structure creation
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
X-List-Received-Date: Thu, 17 Aug 2017 13:16:14 -0000

When buildsystem with layer structure is going to be copied, only the last
meta-XXX layer is taken.
For example, during ext_sdk bblayers creating:
layers/oe/meta \
layers/oe/meta-oe \
layers/oe/meta-networking \
layers/oe/meta-webserver \
...
It restructured meta-oe, meta-networking,... contents into meta-oe.
Recipes from meta-oe will be on the same level like meta-networking,
meta-webserver, ... .

It should take the whole meta path instead of the last one.
layers/oe/meta \
layers/oe/meta-oe/meta-oe \
layers/oe/meta-oe/meta-networking \
layers/oe/meta-oe/meta-webserver \
...
Now the directory structure is the same like during build creation.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/lib/oe/copy_buildsystem.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index dd506a3..e24488d 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -71,6 +71,11 @@ class BuildSystem(object):
             layerdestpath = destdir
             if corebase == os.path.dirname(layer):
                 layerdestpath += '/' + os.path.basename(corebase)
+            else:
+                layer_relative = os.path.basename(corebase) + '/' + os.path.relpath(layer, corebase)
+                if os.path.dirname(layer_relative) != layernewname:
+                    layerdestpath += '/' + os.path.dirname(layer_relative)
+
             layerdestpath += '/' + layernewname
 
             layer_relative = os.path.relpath(layerdestpath,
-- 
2.1.4


