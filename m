Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33FCD6C4CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 07:53:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5H7qfnw001573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 00:52:51 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 17 Jun 2019 00:52:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2019 16:04:32 +0800
Message-ID: <3d8fb25b1629c59bfa75dff17b28828112448745.1560758479.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1560758479.git.Qi.Chen@windriver.com>
References: <cover.1560758479.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] buildoptions.py: fix test_arch_work_dir_and_export_source
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
X-List-Received-Date: Mon, 17 Jun 2019 07:53:00 -0000
Content-Type: text/plain

If multilib is enabled, allarch is actually disabled. So take
this into consideration in this test case, using /*/ instead of /allarch*/.

Also, use xcursor-transparent-theme* instead of xcursor* for more
accurate match.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 3ad65b4..51b948c 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -154,12 +154,12 @@ class ArchiverTest(OESelftestTestCase):
         """
         self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
         res = bitbake("xcursor-transparent-theme", ignore_status=True)
-        self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparenttheme.\nbitbake output %s" % res.output)
+        self.assertEqual(res.status, 0, "\nCouldn't build xcursor-transparent-theme.\nbitbake output %s" % res.output)
         deploy_dir_src = get_bb_var('DEPLOY_DIR_SRC')
-        pkgs_path = g.glob(str(deploy_dir_src) + "/allarch*/xcurs*")
-        src_file_glob = str(pkgs_path[0]) + "/xcursor*.src.rpm"
-        tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
-        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
+        pkgs_path = g.glob(str(deploy_dir_src) + "/*/xcursor-transparent-theme*")
+        src_file_glob = str(pkgs_path[0]) + "/xcursor-transparent-theme*.src.rpm"
+        tar_file_glob = str(pkgs_path[0]) + "/xcursor-transparent-theme*.tar.gz"
+        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/*/xcursor-transparent-theme*" % deploy_dir_src)
 
 class ToolchainOptions(OESelftestTestCase):
 
-- 
1.9.1


