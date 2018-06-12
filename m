Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 4E08278DA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 05:56:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 22:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,213,1526367600"; d="scan'208";a="49166375"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.105])
	by orsmga006.jf.intel.com with ESMTP; 11 Jun 2018 22:56:55 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 13:56:47 +0800
Message-Id: <20180612055647.31826-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180612055647.31826-1-anuj.mittal@intel.com>
References: <20180612055647.31826-1-anuj.mittal@intel.com>
Subject: [PATCH v3 2/2] bitbake-layers/create: add LAYERSERIES_COMPAT
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
X-List-Received-Date: Tue, 12 Jun 2018 05:56:55 -0000

Derive the value for template layer.conf from core layer and add
dependendency on it too.

Fixes [YOCTO #12767]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
v3:
Fix typo

 meta/lib/bblayers/create.py            | 5 ++++-
 meta/lib/bblayers/templates/layer.conf | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index c1923166fd..e06949c92b 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -43,8 +43,11 @@ class CreatePlugin(LayerPlugin):
         license_dst = os.path.join(layerdir, copying)
         shutil.copy(license_src, license_dst)
 
+        # Get the compat value for core layer.
+        compat = self.tinfoil.config_data.getVar('LAYERSERIES_COMPAT_core') or ""
+
         # Create the layer.conf from templates/layer.conf
-        layerconf_template = read_template('layer.conf') % (args.layerdir, args.layerdir, args.layerdir, args.priority)
+        layerconf_template = read_template('layer.conf') % (args.layerdir, args.layerdir, args.layerdir, args.priority, args.layerdir, args.layerdir, compat)
         layerconf = os.path.join(conf, 'layer.conf')
         with open(layerconf, 'w') as fd:
             fd.write(layerconf_template)
diff --git a/meta/lib/bblayers/templates/layer.conf b/meta/lib/bblayers/templates/layer.conf
index 3c0300226c..49f95cafc8 100644
--- a/meta/lib/bblayers/templates/layer.conf
+++ b/meta/lib/bblayers/templates/layer.conf
@@ -8,3 +8,6 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "%s"
 BBFILE_PATTERN_%s = "^${LAYERDIR}/"
 BBFILE_PRIORITY_%s = "%s"
+
+LAYERDEPENDS_%s = "core"
+LAYERSERIES_COMPAT_%s = "%s"
-- 
2.17.1


