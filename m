Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB65377306
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 07:50:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u137oFgn011848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 23:50:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 2 Feb 2016 23:50:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Feb 2016 15:50:21 +0800
Message-ID: <e8ffa30199c723eb1fcbb4126c2ac5441e9da1bc.1454485614.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454485614.git.Qi.Chen@windriver.com>
References: <cover.1454485614.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] copy_buildsystem: add ability to exclude layers
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
X-List-Received-Date: Wed, 03 Feb 2016 07:50:18 -0000
Content-Type: text/plain

In some cases, we may have some kind of download layers in BBLAYERS, so
that we can set BB_NO_NETWORK to "1". This results in extremely large
extensible SDK. And we actually don't need these download layers in the
SDK.

Add a new variable, SDK_LAYERS_EXCLUDE, to enable users to explicitly
exclude some layers when generating the extensible SDK.

[YOCTO #8878]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index fb51b51..abee5d9 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -18,6 +18,7 @@ class BuildSystem(object):
         self.d = d
         self.context = context
         self.layerdirs = d.getVar('BBLAYERS', True).split()
+        self.layers_exclude = (d.getVar('SDK_LAYERS_EXCLUDE', True) or "").split()
 
     def copy_bitbake_and_layers(self, destdir):
         # Copy in all metadata layers + bitbake (as repositories)
@@ -28,6 +29,11 @@ class BuildSystem(object):
         corebase = self.d.getVar('COREBASE', True)
         layers.append(corebase)
 
+        # Exclude layers
+        for layer_exclude in self.layers_exclude:
+            if layer_exclude in layers:
+                layers.remove(layer_exclude)
+
         corebase_files = self.d.getVar('COREBASE_FILES', True).split()
         corebase_files = [corebase + '/' +x for x in corebase_files]
         # Make sure bitbake goes in
-- 
1.9.1


