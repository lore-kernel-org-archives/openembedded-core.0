Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDC674230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 06:09:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4R69hT6012963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 23:09:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 26 May 2015 23:09:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 May 2015 14:09:40 +0800
Message-ID: <d7837aa39b66e2ffbc21a4dabfd84095e3c095a0.1432706896.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1432706896.git.Qi.Chen@windriver.com>
References: <cover.1432706896.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] copy_buildsystem: make sure bitbake directory is copied
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
X-List-Received-Date: Wed, 27 May 2015 06:09:42 -0000
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


