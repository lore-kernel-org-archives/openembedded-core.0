Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A532734D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:25:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7P6Lm017519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:25:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 10 Jun 2015 00:25:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 15:25:23 +0800
Message-ID: <ad1346cbfd8a0bbd3f3c958b339003169a00791b.1433920984.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433920984.git.Qi.Chen@windriver.com>
References: <cover.1433920984.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] copy_buildsystem: make sure bitbake directory is copied
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
X-List-Received-Date: Wed, 10 Jun 2015 07:25:05 -0000
Content-Type: text/plain

The previous code assumes that bitbake/ directory is under the core layer.
This is the case for Yocto project. But users might clone oe-core and bitbake
separately. So we use bb.__file__ to locate the bitbake directory to make sure
it's copied into the extensible SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index cf7fada..979578c 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -28,11 +28,10 @@ class BuildSystem(object):
         layers.append(corebase)
 
         corebase_files = self.d.getVar('COREBASE_FILES', True).split()
-
-        # bitbake belongs in corebase so make sure it goes there
-        if "bitbake" not in corebase_files:
-            corebase_files.append("bitbake")
         corebase_files = [corebase + '/' +x for x in corebase_files]
+        # Make sure bitbake goes in
+        bitbake_dir = bb.__file__.rsplit('/', 3)[0]
+        corebase_files.append(bitbake_dir)
 
         for layer in layers:
             layerconf = os.path.join(layer, 'conf', 'layer.conf')
-- 
1.9.1


