Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFF476E70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G24HxS007097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:04:17 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:04:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:04:14 -0700
Message-ID: <1f6867775e5c8aad42ffbcbad7be3b0b3ffa2cc6.1442311946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442311946.git.liezhi.yang@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] meta-environment.bb: fix environment-setup* when populate mlprefix SDK
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
X-List-Received-Date: Wed, 16 Sep 2015 02:04:18 -0000
Content-Type: text/plain

Fixed when extract mutilib SDK like
poky-glibc-x86_64-lib32-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh:

Each time you wish to use the SDK in a new shell session, you need to
source the environment setup script e.g.
 $ ./path/to/environment-setup-core2-64-pokymllib32-linux

There was no environment-setup-core2-64-pokymllib32-linux, but
environment-setup-x86-pokymllib32-linux, this was because image recipe
didn't upgrade TUNE_PKGARCH from core2-64 to x86, but meta-environment
did, let meta-environment not upgrade TUNE_PKGARCH will fix the
problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/meta-environment.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 49d45f6..c671c13 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -42,6 +42,10 @@ python do_generate_content() {
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", item + "-")
         bb.data.update_data(localdata)
+        # Don't upgrade TUNE_PKGARCH since image doesn't upgrade it,
+        # otherwise the siteconfig, env_script and version would
+        # mismatch image's REAL_MULTIMACH_TARGET_SYS.
+        localdata.setVar('TUNE_PKGARCH', d.getVar('TUNE_PKGARCH', True))
         bb.build.exec_func("create_sdk_files", localdata)
 }
 addtask generate_content before do_install after do_compile
-- 
1.7.9.5


