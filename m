Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 83DD3779B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490049667; x=1521585667;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=UBNeBAtAOMqyC1kF2np/iYl5XtO1R9ZymNEAkRtpkUo=;
	b=GXdfBe1ANqDRdaduYAyinNN+veUOTwKJv/M5Zi/W5evVZUeHjQJ+PTZk
	mXHA+8S4cUydEMQAv8C9lZHQOdG2Ag==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 15:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="1110485023"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2017 15:41:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	patrick.ohly@intel.com
Date: Mon, 20 Mar 2017 16:44:46 -0600
Message-Id: <1490049887-10712-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490049887-10712-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490049887-10712-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] scripts/yocto-compat-layer.py: Add option to disable layer autodiscovery
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
X-List-Received-Date: Mon, 20 Mar 2017 22:41:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sometimes there is a need to only analyze the layer specified by the
command line, the new option -n will disable autodiscovery of layers
and only will try to test specified layers.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/compatlayer/__init__.py | 17 ++++++++++++-----
 scripts/yocto-compat-layer.py       |  4 +++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 15dc95d..b8ce771 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -108,20 +108,27 @@ def _detect_layer(layer_path):
 
     return layer
 
-def detect_layers(layer_directories):
+def detect_layers(layer_directories, no_auto):
     layers = []
 
     for directory in layer_directories:
         if directory[-1] == '/':
             directory = directory[0:-1]
 
-        for root, dirs, files in os.walk(directory):
-            dir_name = os.path.basename(root)
-            conf_dir = os.path.join(root, 'conf')
+        if no_auto:
+            conf_dir = os.path.join(directory, 'conf')
             if os.path.isdir(conf_dir):
-                layer = _detect_layer(root)
+                layer = _detect_layer(directory)
                 if layer:
                     layers.append(layer)
+        else:
+            for root, dirs, files in os.walk(directory):
+                dir_name = os.path.basename(root)
+                conf_dir = os.path.join(root, 'conf')
+                if os.path.isdir(conf_dir):
+                    layer = _detect_layer(root)
+                    if layer:
+                        layers.append(layer)
 
     return layers
 
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index b96f3ca..b4de84a 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -47,6 +47,8 @@ def main():
             help='Layer to test compatibility with Yocto Project')
     parser.add_argument('-o', '--output-log',
             help='File to output log (optional)', action='store')
+    parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
+            action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
             action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors',
@@ -74,7 +76,7 @@ def main():
     builddir = os.environ['BUILDDIR']
     bblayersconf = os.path.join(builddir, 'conf', 'bblayers.conf')
 
-    layers = detect_layers(args.layers)
+    layers = detect_layers(args.layers, args.no_auto)
     if not layers:
         logger.error("Fail to detect layers")
         return 1
-- 
2.1.4


