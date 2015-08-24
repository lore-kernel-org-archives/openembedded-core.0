Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40960766D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:46:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7O7kNW2010434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 00:46:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 00:46:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2015 15:46:51 +0800
Message-ID: <8fcfab3d05d933e87d9eb222429a1dbed93c613f.1440402125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440402124.git.Qi.Chen@windriver.com>
References: <cover.1440402124.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 3/8] populate_sdk_ext: don't remove the native qemu dependencies
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
X-List-Received-Date: Mon, 24 Aug 2015 07:46:23 -0000
Content-Type: text/plain

These dependencies were deliberately removed because it was assumed that
they were provided by nativesdk packages. On the one hand, nativesdk packages
in extensible SDK don't have these packages; on the other hand, even if we
add these nativesdk packages, they are still not useful because we we need
runqemu to run correctly.

So we don't remove these native qemu dependencies.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index da5ec2c..df87edb 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -137,11 +137,6 @@ python copy_buildsystem () {
         # Some classes are not suitable for SDK, remove them from INHERIT
         f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST'))
     
-        # This is a bit of a hack, but we really don't want these dependencies
-        # (we're including them in the SDK as nativesdk- versions instead)
-        f.write('POKYQEMUDEPS_forcevariable = ""\n\n')
-        f.write('EXTRA_IMAGEDEPENDS_remove = "qemu-native qemu-helper-native"\n\n')
-
         # Bypass the default connectivity check if any
         f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
 
-- 
1.9.1


