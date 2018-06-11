Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 797C178802
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 01:52:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jun 2018 18:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,499,1520924400"; d="scan'208";a="236310494"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.63])
	by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2018 18:52:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 09:52:06 +0800
Message-Id: <20180611015207.10465-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] bitbake-blayers/create: add version for example recipe
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
X-List-Received-Date: Mon, 11 Jun 2018 01:52:10 -0000

Add version field in recipe name for example recipe created by
bitbake-layers.

Fixes [YOCTO #12767]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/bblayers/create.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 6a41fe0504..c1923166fd 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -53,7 +53,7 @@ class CreatePlugin(LayerPlugin):
         example_template = read_template('example.bb')
         example = os.path.join(layerdir, 'recipes-' + args.examplerecipe, args.examplerecipe)
         bb.utils.mkdirhier(example)
-        with open(os.path.join(example, args.examplerecipe + '.bb'), 'w') as fd:
+        with open(os.path.join(example, args.examplerecipe + '_%s.bb') % args.version, 'w') as fd:
             fd.write(example_template)
 
         logger.plain('Add your new layer with \'bitbake-layers add-layer %s\'' % args.layerdir)
@@ -63,4 +63,5 @@ class CreatePlugin(LayerPlugin):
         parser_create_layer.add_argument('layerdir', help='Layer directory to create')
         parser_create_layer.add_argument('--priority', '-p', default=6, help='Layer directory to create')
         parser_create_layer.add_argument('--example-recipe-name', '-e', dest='examplerecipe', default='example', help='Filename of the example recipe')
+        parser_create_layer.add_argument('--example-recipe-version', '-v', dest='version', default='0.1', help='Version number for the example recipe')
 
-- 
2.17.1


