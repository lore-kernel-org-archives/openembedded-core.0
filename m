Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7E48560D2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 17:43:38 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 017HhcjO027434
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Feb 2020 11:43:39 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 11:43:37 -0600
Message-Id: <20200207174337.110342-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207174337.110342-1-mark.hatle@kernel.crashing.org>
References: <20200207174337.110342-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 1/1] populate_sdk_base: if the SDKIMAGE_FEATURES changes, refresh the SDK
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
X-List-Received-Date: Fri, 07 Feb 2020 17:43:39 -0000

Since the features are processed by a python fragment, we need to explicitly
list the variables that should affect the resulting hash, and thus sstate
re-use.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index d03465b6fc..3248bb01c3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -21,6 +21,7 @@ def complementary_globs(featurevar, d):
 
 SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs src-pkgs ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-pkgs', '', d)}"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
+SDKIMAGE_INSTALL_COMPLEMENTARY[vardeps] += "SDKIMAGE_FEATURES"
 
 PACKAGE_ARCHS_append_task-populate-sdk = " sdk-provides-dummy-target"
 SDK_PACKAGE_ARCHS += "sdk-provides-dummy-${SDKPKGSUFFIX}"
-- 
2.17.1


