Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32DDC65CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:20:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3RAK3Dm024089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 03:20:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.192) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 03:20:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 18:19:59 +0800
Message-ID: <e2ac9f6da0f11dabd5dddae213ad144f3b82a665.1430129946.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430129946.git.Qi.Chen@windriver.com>
References: <cover.1430129946.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_base: also record the host part into manifest
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
X-List-Received-Date: Mon, 27 Apr 2015 10:20:02 -0000
Content-Type: text/plain

For now, we can create manifest for the target part for SDK.
I think it's nice to have a place for users to look into to examine contents
of the host part of SDK.

This also affects uninative-tarball and buildtools-tarball as they
inherit populate_sdk.bbclass. After this change, we could have a manifest file
created in the deploy directory containing a list of packages used to
construct them.

[YOCTO #7604]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 54b9af5..781b279 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -56,17 +56,28 @@ SDK_RELOCATE_AFTER_INSTALL ?= "1"
 
 SDK_TITLE ?= "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} SDK"
 
-SDK_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.manifest"
+SDK_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
+SDK_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
-    sdkmanifestdir = os.path.dirname(d.getVar("SDK_MANIFEST", True))
+    sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST", True))
     if not os.path.exists(sdkmanifestdir):
         bb.utils.mkdirhier(sdkmanifestdir)
-    with open(d.getVar('SDK_MANIFEST', True), 'w') as output:
+    with open(d.getVar('SDK_TARGET_MANIFEST', True), 'w') as output:
         output.write(sdk_list_installed_packages(d, True, 'ver'))
 }
 
+python write_host_sdk_manifest () {
+    from oe.sdk import sdk_list_installed_packages
+    sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST", True))
+    if not os.path.exists(sdkmanifestdir):
+        bb.utils.mkdirhier(sdkmanifestdir)
+    with open(d.getVar('SDK_HOST_MANIFEST', True), 'w') as output:
+        output.write(sdk_list_installed_packages(d, False, 'ver'))
+}
+
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
 
 fakeroot python do_populate_sdk() {
     from oe.sdk import populate_sdk
-- 
1.9.1


