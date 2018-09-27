Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 582D771C07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 08:44:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8R8honT016070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 01:44:00 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 27 Sep 2018 01:43:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2018 16:48:53 +0800
Message-ID: <118c399e7f85c668f67969329d2d8d4347ffca16.1538038062.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1538038062.git.Qi.Chen@windriver.com>
References: <cover.1538038062.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] nativesdk.bbclass: set consistent staging dirs regardless of multilib
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
X-List-Received-Date: Thu, 27 Sep 2018 08:44:10 -0000
Content-Type: text/plain

For now, the RECIPE_SYSROOT of nativesdk recipes is ${WORKDIR}/recipe-sysroot
if multilib is disabled and ${WORKDIR}/nativesdk-recipe-sysroot if multilib
is enabled. And it's causing chaos. Problems I've met include:
1) 'File Exists' error when doing extend_recipe_sysroot
2) Rebuilding failure about cmake based nativesdk recipes if toggling multilib

In nativesdk.bbclass, We've set MULTILIBS to be "", and we've changed MLPREFIX
to be 'nativesdk-', I think we should also set consistent RECIPE_SYSROOT to be
${WORKDIR}/recipe-sysroot.

Below is an example showing why previous settings will cause do_prepare_recipe_sysroot
failure.

e.g.
A -> C
B -> C
A's RECIPE_SYSROOT is .../recipe-sysroot and B's RECIPE_SYSROOT is
.../nativesdk-recipe-sysroot.
As extend_recipe_sysroot function uses shared manifest, i.e., the same
manifest of C for both A and B, then there must be one of them having
the wrong manifest. And the wrong manifest results in RECIPE_SYSROOT
not cleaned up before installing new components, thus the following error.

  Exception: FileExistsError: [Errno 17] File exists: xxx -> xxx

This happens when toggling multilib and also between nativesdk recipes and
crosssdk, cross-canadian recipes. The latter situation also explains
why choosing ${WORKDIR}/recipe-sysroot instead of ${WORKDIR}/nativesdk-recipe-sysroot.
If we use 'nativesdk-recipe-sysroot', we still need to modify the extend_recipe_sysroot
function to treat crosssdk and cross-canadian as special cases. Using
'recipe-sysroot' does not have this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/nativesdk.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ab566e9..f25b0c3 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -12,6 +12,11 @@ MACHINEOVERRIDES = ""
 
 MULTILIBS = ""
 
+# we need consistent staging dir whether or not multilib is enabled
+STAGING_DIR_HOST = "${WORKDIR}/recipe-sysroot"
+STAGING_DIR_TARGET = "${WORKDIR}/recipe-sysroot"
+RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
+
 #
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
 #
-- 
1.9.1


