Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4687C7E895
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 09:12:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5H9CdAh003795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 02:12:49 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 17 Jun 2019 02:12:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2019 17:24:30 +0800
Message-ID: <28e0391ef22f3e131227d66dae731fa14f48e1a0.1560763400.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1560763400.git.Qi.Chen@windriver.com>
References: <cover.1560763400.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] manifest.py: fix test_SDK_manifest_entries
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
X-List-Received-Date: Mon, 17 Jun 2019 09:12:58 -0000
Content-Type: text/plain

TOOLCHAIN_OUTPUTNAME could be overridden. So use this variable directly
instead of its default value ${SDK_NAME}-toolchain-${SDK_VERSION}.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/manifest.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index c0b25ab..5d13f35 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -86,11 +86,8 @@ class VerifyManifest(OESelftestTestCase):
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
             for k in d_target.keys():
-                bb_vars = get_bb_vars(['SDK_NAME', 'SDK_VERSION'], self.buildtarget)
-                mfilename[k] = "{}-toolchain-{}.{}.manifest".format(
-                        bb_vars['SDK_NAME'],
-                        bb_vars['SDK_VERSION'],
-                        k)
+                toolchain_outputname = get_bb_var('TOOLCHAIN_OUTPUTNAME', self.buildtarget)
+                mfilename[k] = "{}.{}.manifest".format(toolchain_outputname, k)
                 mpath[k] = os.path.join(mdir, mfilename[k])
                 if not os.path.isfile(mpath[k]):
                     self.logger.debug("{}: {} does not exist".format(
-- 
1.9.1


