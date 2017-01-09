Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBBBA71A40
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:08:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0978xUp017167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Jan 2017 23:09:00 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 8 Jan 2017 23:08:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jan 2017 15:09:03 +0800
Message-ID: <98f949d52acc91f155bbc79bbea80a964b2300f0.1483945688.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1483945688.git.Qi.Chen@windriver.com>
References: <cover.1483945688.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] selftest/buildoptions.py: do not hardcode 'tmp' for TMPDIR
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
X-List-Received-Date: Mon, 09 Jan 2017 07:09:00 -0000
Content-Type: text/plain

Use the value of TMPDIR instead of hardcoding 'tmp'.

In fact, in OE, we have:
  TCLIBCAPPEND ?= "-${TCLIBC}"
  TMPDIR .= "${TCLIBCAPPEND}"

So the TMPDIR defaults to have ${TCLIBC} in it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 25d14f7..c736dba 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -197,7 +197,8 @@ class ArchiverTest(oeSelfTest):
         self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
         res = bitbake("xcursor-transparent-theme", ignore_status=True)
         self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparenttheme.\nbitbake output %s" % res.output)
-        pkgs_path = g.glob(str(self.builddir) + "/tmp/deploy/sources/allarch*/xcurs*")
+        tmp_dir = get_bb_var('TMPDIR')
+        pkgs_path = g.glob(str(tmp_dir) + "/deploy/sources/allarch*/xcurs*")
         src_file_glob = str(pkgs_path[0]) + "/xcursor*.src.rpm"
         tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
-        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under tmp/deploy/sources/allarch*/xcursor*")
+        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/deploy/sources/allarch*/xcursor*" % tmp_dir)
-- 
1.9.1


