Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C460371BB7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 02:31:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 01 Nov 2016 19:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="1079289689"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2016 19:31:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 15:31:05 +1300
Message-Id: <d754a9ea1002d471bb7515f278e7e7dd23c3b045.1478053841.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478053841.git.paul.eggleton@linux.intel.com>
References: <cover.1478053841.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478053841.git.paul.eggleton@linux.intel.com>
References: <cover.1478053841.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/populate_sdk_ext: prevent invalid TEMPLATECONF entering eSDK
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
X-List-Received-Date: Wed, 02 Nov 2016 02:31:57 -0000

If you are using a repository which contains a .templateconf file that
sets TEMPLATECONF to point into a layer it contains, but you aren't
using that layer in your bblayers.conf, the eSDK would produce an error
during the preparation step of the installation. An example would be
using the poky repository but setting DISTRO to your own custom distro
and removing meta-poky from your bblayers.conf. The eSDK doesn't
support creating new build directories, so we don't care about the
templates and can thus force a known good value to prevent this from
happening.

Fixes [YOCTO #10568].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0f0525d..944fe5c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -88,7 +88,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar(
 def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
     import shutil
-    cleanpaths = 'cache conf/sanity_info conf/templateconf.cfg tmp'.split()
+    cleanpaths = 'cache conf/sanity_info tmp'.split()
     for pth in cleanpaths:
         fullpth = os.path.join(sdkbasepath, pth)
         if os.path.isdir(fullpth):
@@ -344,6 +344,10 @@ python copy_buildsystem () {
                     if line.strip() and not line.startswith('#'):
                         f.write(line)
 
+    # Write a templateconf.cfg
+    with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
+        f.write('meta/conf\n')
+
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_EXTRAWHITE) are set in the SDK's configuration
     extralines = []
-- 
2.5.5


