Return-Path: <joaohf@gmail.com>
X-Greylist: delayed 1347 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 02:06:55 UTC
Received: from mail-yh0-f47.google.com (unknown [209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id B0CF465F99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 02:06:55 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id z6so2479776yhz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 19:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=q9svzb/Vav7Q3p2NGSr1oi5RIYUkRj0SDyxsD8xr+GU=;
	b=yLBKgDaBq34kIlbHLtWzoSp3c0cE5WcX0VliunRVkiE8gkaXvNdX25DN41JPMVGVO/
	Wsk/W1+hwKK8SSccn1sXsXytp3F4hJBsevhThlc1HzAXvhE5xOAZWYnwOEFBzRW376aB
	Whhm8qJrZB2jNpfjsLBCarnBfXPQ75EEWT8+Y/a8dU3hkrklVTXCavhEjO54Okoa3u43
	LqECynuEXphTbOa9nOgU1LP74akyO8pAo10FYhIs+2Of0LJ3f15B8htoPewl6riAPai1
	DxgdAGuxFCJX5SINXFkwFfwPQe1q7Y3HVQHpnUNNq7WRVyh9wcT/fNqV5L86u2tXuHQ1
	CmbA==
X-Received: by 10.236.130.37 with SMTP id j25mr10610914yhi.106.1400117866082; 
	Wed, 14 May 2014 18:37:46 -0700 (PDT)
Received: from localhost.localdomain ([201.53.199.239])
	by mx.google.com with ESMTPSA id k50sm576778yhc.21.2014.05.14.18.37.44
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 May 2014 18:37:45 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 22:37:27 -0300
Message-Id: <1400117848-4350-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
References: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 1/2] wic: add support to look in all layers and get .wks file
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
X-List-Received-Date: Thu, 15 May 2014 02:06:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

.wks file are looked in 'scripts/lib/image/canned-wks' directory on all
BBLAYERS variable returned by bitbake environment. If found, it will
be used.

The user could create your own .wks and keep it inside its layers. For
now the path must be <layer-dir>/scripts/lib/image/canned-wks.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/image/engine.py | 72 +++++++++++++++++++++++++++------------------
 scripts/wic                 |  6 ++++
 2 files changed, 49 insertions(+), 29 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 311737a..3bda1bf 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -90,6 +90,20 @@ def find_artifacts(image_name):
 
 
 CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
+SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
+
+def build_canned_image_list(dl):
+    layers_path = get_bitbake_var("BBLAYERS")
+    canned_wks_layer_dirs = []
+
+    for layer_path in layers_path.split():
+        path = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
+        canned_wks_layer_dirs.append(path)
+
+    path = os.path.join(dl, CANNED_IMAGE_DIR)
+    canned_wks_layer_dirs.append(path)
+
+    return canned_wks_layer_dirs
 
 def find_canned_image(scripts_path, wks_file):
     """
@@ -97,15 +111,16 @@ def find_canned_image(scripts_path, wks_file):
 
     Return False if not found
     """
-    canned_wks_dir = os.path.join(scripts_path, CANNED_IMAGE_DIR)
-
-    for root, dirs, files in os.walk(canned_wks_dir):
-        for file in files:
-            if file.endswith("~") or file.endswith("#"):
-                continue
-            if file.endswith(".wks") and wks_file + ".wks" == file:
-                fullpath = os.path.join(canned_wks_dir, file)
-                return fullpath
+    layers_canned_wks_dir = build_canned_image_list(scripts_path)
+
+    for canned_wks_dir in layers_canned_wks_dir:
+        for root, dirs, files in os.walk(canned_wks_dir):
+            for file in files:
+                if file.endswith("~") or file.endswith("#"):
+                    continue
+                if file.endswith(".wks") and wks_file + ".wks" == file:
+                    fullpath = os.path.join(canned_wks_dir, file)
+                    return fullpath
     return None
 
 
@@ -113,32 +128,31 @@ def list_canned_images(scripts_path):
     """
     List the .wks files in the canned image dir, minus the extension.
     """
-    canned_wks_dir = os.path.join(scripts_path, CANNED_IMAGE_DIR)
-
-    for root, dirs, files in os.walk(canned_wks_dir):
-        for file in files:
-            if file.endswith("~") or file.endswith("#"):
-                continue
-            if file.endswith(".wks"):
-                fullpath = os.path.join(canned_wks_dir, file)
-                f = open(fullpath, "r")
-                lines = f.readlines()
-                for line in lines:
-                    desc = ""
-                    idx = line.find("short-description:")
-                    if idx != -1:
-                        desc = line[idx + len("short-description:"):].strip()
-                        break
-                basename = os.path.splitext(file)[0]
-                print "  %s\t\t%s" % (basename, desc)
+    layers_canned_wks_dir = build_canned_image_list(scripts_path)
+
+    for canned_wks_dir in layers_canned_wks_dir:
+        for root, dirs, files in os.walk(canned_wks_dir):
+            for file in files:
+                if file.endswith("~") or file.endswith("#"):
+                    continue
+                if file.endswith(".wks"):
+                    fullpath = os.path.join(canned_wks_dir, file)
+                    f = open(fullpath, "r")
+                    lines = f.readlines()
+                    for line in lines:
+                        desc = ""
+                        idx = line.find("short-description:")
+                        if idx != -1:
+                            desc = line[idx + len("short-description:"):].strip()
+                            break
+                    basename = os.path.splitext(file)[0]
+                    print "  %s\t\t%s" % (basename.ljust(30), desc)
 
 
 def list_canned_image_help(scripts_path, fullpath):
     """
     List the help and params in the specified canned image.
     """
-    canned_wks_dir = os.path.join(scripts_path, CANNED_IMAGE_DIR)
-
     f = open(fullpath, "r")
     lines = f.readlines()
     found = False
diff --git a/scripts/wic b/scripts/wic
index 4423340..2d3fd09 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -214,6 +214,12 @@ def wic_list_subcommand(args, usage_str):
 
     (options, args) = parser.parse_args(args)
 
+    bitbake_env_lines = find_bitbake_env_lines(None)
+    if not bitbake_env_lines:
+        print "Couldn't get bitbake environment, exiting."
+        sys.exit(1)
+    set_bitbake_env_lines(bitbake_env_lines)
+
     if not wic_list(args, scripts_path, options.properties_file):
         logging.error("Bad list arguments, exiting\n")
         parser.print_help()
-- 
1.8.3.2


