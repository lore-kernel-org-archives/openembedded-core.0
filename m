Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id ADAC56FAC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 01:28:14 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id v1so5855469yhn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 18:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=qq3JdnPAxdgISBu3oYpIf7mAMUECY2zHsPrIKI86gmE=;
	b=OX7EFMC4t4UGy+m1wXPpROcALxuUAXxvWx+bjyFVkJYPmQeSglobp8JPwcRbPupSET
	pO+MvEjiMktbjwp17uZG7eRSxk13Xv1GEp+uvZm5Y2DiA6fPme1LlmEoi7t3QLZFQ6Lr
	OklhbV26D0/ifU7I68mSSJAbSuA4FrK/QNxCqIWjcFzoAV4ySKc94+kVUW+2UO5km4Lt
	472GpkTrYpAcId21sW8E3EJVI6rx4ybz8f32XuZ7WDP6P+wzJ3cft9DnyXpEQmBdwQde
	NEDKXAFdyxMY91KVrPpHho5L+YtkVlkcBvFad23HoiGxKQeldlz64VaLU8rW0KGrNSyd
	4nCA==
X-Received: by 10.236.179.69 with SMTP id g45mr67728525yhm.81.1401845295261;
	Tue, 03 Jun 2014 18:28:15 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.23])
	by mx.google.com with ESMTPSA id u5sm1540089yhg.25.2014.06.03.18.28.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jun 2014 18:28:14 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jun 2014 22:28:03 -0300
Message-Id: <1401845283-7941-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401845283-7941-1-git-send-email-joaohf@gmail.com>
References: <1401845283-7941-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 2/2] wic: check if BBLAYERS is valid before use
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
X-List-Received-Date: Wed, 04 Jun 2014 01:28:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If wic is running as raw mode, it's better to check if BBLAYERS
is valid before inspect it.

No functional changes.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/image/engine.py | 7 ++++---
 scripts/lib/mic/plugin.py   | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 3bda1bf..1256236 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -96,9 +96,10 @@ def build_canned_image_list(dl):
     layers_path = get_bitbake_var("BBLAYERS")
     canned_wks_layer_dirs = []
 
-    for layer_path in layers_path.split():
-        path = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
-        canned_wks_layer_dirs.append(path)
+    if layers_path is not None:
+        for layer_path in layers_path.split():
+            path = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
+            canned_wks_layer_dirs.append(path)
 
     path = os.path.join(dl, CANNED_IMAGE_DIR)
     canned_wks_layer_dirs.append(path)
diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index dec0e5b..585fd6d 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -53,9 +53,10 @@ class PluginMgr(object):
             self.layers_path = get_bitbake_var("BBLAYERS")
         layer_dirs = []
 
-        for layer_path in self.layers_path.split():
-            path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR, ptype)
-            layer_dirs.append(path)
+        if self.layers_path is not None:
+            for layer_path in self.layers_path.split():
+                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR, ptype)
+                layer_dirs.append(path)
 
         path = os.path.join(dl, ptype)
         layer_dirs.append(path)
-- 
1.9.1


