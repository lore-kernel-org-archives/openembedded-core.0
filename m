Return-Path: <michael.blaettler@siemens.com>
X-Greylist: delayed 629 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Jan 2018 07:53:19 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 7358E785D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 07:53:19 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w087gpIc009280
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jan 2018 08:42:51 +0100
Received: from dev.vm6.ccp.siemens.com (MD1F3VPC.ad001.siemens.net
	[139.16.77.75])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w087gpw5014904;
	Mon, 8 Jan 2018 08:42:51 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 16A10330A964;
	Mon,  8 Jan 2018 08:42:51 +0100 (CET)
From: =?UTF-8?q?Michael=20Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 08:42:38 +0100
Message-Id: <20180108074239.13009-1-michael.blaettler@siemens.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/2] manifest.py: sort package list
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
X-List-Received-Date: Mon, 08 Jan 2018 07:53:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The entries of the created manifest file are always in a
different order. To ensure a deterministic build output
the entries are ordered alphabetically.

Signed-off-by: Michael Blättler <michael.blaettler@siemens.com>
---
 meta/lib/oe/manifest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 60c49be0e9..674303c866 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -274,8 +274,8 @@ class OpkgManifest(Manifest):
                     if pkg_list is not None:
                         pkgs[self.var_maps[self.manifest_type][var]] = self.d.getVar(var)
 
-            for pkg_type in pkgs:
-                for pkg in pkgs[pkg_type].split():
+            for pkg_type in sorted(pkgs):
+                for pkg in sorted(pkgs[pkg_type].split()):
                     manifest.write("%s,%s\n" % (pkg_type, pkg))
 
     def create_final(self):
-- 
2.11.0


