Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5FF78855
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 01:52:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jun 2018 18:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,499,1520924400"; d="scan'208";a="236310510"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.63])
	by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2018 18:52:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 09:52:07 +0800
Message-Id: <20180611015207.10465-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611015207.10465-1-anuj.mittal@intel.com>
References: <20180611015207.10465-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] bitbake-blayers/create: add LAYERSERIES_COMPAT
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
X-List-Received-Date: Mon, 11 Jun 2018 01:52:12 -0000

Derive the value for template layer.conf from core layer and add
dependendency on it too.

Fixes [YOCTO #12767]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/bblayers/create.py            | 2 +-
 meta/lib/bblayers/templates/layer.conf | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index c1923166fd..d9699b21f9 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -44,7 +44,7 @@ class CreatePlugin(LayerPlugin):
         shutil.copy(license_src, license_dst)
 
         # Create the layer.conf from templates/layer.conf
-        layerconf_template = read_template('layer.conf') % (args.layerdir, args.layerdir, args.layerdir, args.priority)
+        layerconf_template = read_template('layer.conf') % (args.layerdir, args.layerdir, args.layerdir, args.priority, args.layerdir, args.layerdir)
         layerconf = os.path.join(conf, 'layer.conf')
         with open(layerconf, 'w') as fd:
             fd.write(layerconf_template)
diff --git a/meta/lib/bblayers/templates/layer.conf b/meta/lib/bblayers/templates/layer.conf
index 3c0300226c..61b3ad8db3 100644
--- a/meta/lib/bblayers/templates/layer.conf
+++ b/meta/lib/bblayers/templates/layer.conf
@@ -8,3 +8,6 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "%s"
 BBFILE_PATTERN_%s = "^${LAYERDIR}/"
 BBFILE_PRIORITY_%s = "%s"
+
+LAYERDEPENDS_%s = "core"
+LAYERSERIES_COMPAT_%s = "${LAYERSERIES_COMPAT_core}"
-- 
2.17.1


