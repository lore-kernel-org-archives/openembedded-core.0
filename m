Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9367713C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 02:54:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2016 18:54:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="36152740"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2016 18:54:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 15:53:55 +1300
Message-Id: <643eab8cf622ec2b3ec857a00d863079d1b3f097.1453776397.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] devtool: build-image: allow specifying packages to add to image
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
X-List-Received-Date: Tue, 26 Jan 2016 02:54:35 -0000

Provide an option to devtool build-image to specify the list of packages
instead of taking the list of packages produced by recipes in the
workspace. Sometimes you don't want all of these packages; other times
you want to add more.

This is the most immediate fix for [YOCTO #8855], though it is a little
crude so I would like to provide better means of customising the image
contents later.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index e53239d..48c3a11 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -71,8 +71,11 @@ def build_image(args, config, basepath, workspace):
             raise DevtoolError('Specified recipe %s is not an image recipe' % image)
 
     try:
-        if workspace:
-            packages = _get_packages(tinfoil, workspace, config)
+        if workspace or args.add_packages:
+            if args.add_packages:
+                packages = args.add_packages.split(',')
+            else:
+                packages = _get_packages(tinfoil, workspace, config)
             if packages:
                 with open(appendfile, 'w') as afile:
                     # include packages from workspace recipes into the image
@@ -108,4 +111,8 @@ def register_commands(subparsers, context):
                                    description='Builds an image, extending it to include '
                                    'packages from recipes in the workspace')
     parser.add_argument('imagename', help='Image recipe to build', nargs='?')
+    parser.add_argument('-p', '--add-packages', help='Instead of adding packages for the '
+                        'entire workspace, specify packages to be added to the image '
+                        '(separate multiple packages by commas)',
+                        metavar='PACKAGES')
     parser.set_defaults(func=build_image)
-- 
2.5.0


