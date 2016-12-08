Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB6CB71C0B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:20:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2016 08:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496571"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:19:01 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:55 -0600
Message-Id: <7053b8398f14cffed0ab773700afbfe90bd235c2.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 27/30] classes/testsdk: Migrate to use the new OESDKExtTestContext
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
X-List-Received-Date: Thu, 08 Dec 2016 16:20:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 24529ca..1d6547a 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -100,7 +100,7 @@ def testsdkext_main(d):
 
     from bb.utils import export_proxies
     from oeqa.utils import avoid_paths_in_environ
-    from oeqa.sdk.context import OESDKExtTestContext, OESDKExtTestContextExecutor
+    from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
 
     pn = d.getVar("PN", True)
     logger = logging.getLogger("BitBake")
@@ -119,13 +119,13 @@ def testsdkext_main(d):
         bb.fatal("The toolchain ext %s is not built. Build it before running the" \
                  " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
 
-    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testdata.json")
+    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.testdata.json")
     test_data = json.load(open(tdname, "r"))
 
     target_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
-        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"))
+        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"))
     host_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
-        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
+        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"))
 
     sdk_dir = d.expand("${WORKDIR}/testsdkext/")
     bb.utils.remove(sdk_dir, True)
@@ -134,7 +134,7 @@ def testsdkext_main(d):
         subprocess.check_output("%s -y -d %s" % (tcname, sdk_dir), shell=True)
     except subprocess.CalledProcessError as e:
         msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
-        logfn = os.path.join(sdkdir, 'preparing_build_system.log')
+        logfn = os.path.join(sdk_dir, 'preparing_build_system.log')
         if os.path.exists(logfn):
             msg += '\n\nContents of preparing_build_system.log:\n'
             with open(logfn, 'r') as f:
-- 
2.1.4


