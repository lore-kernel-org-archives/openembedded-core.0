Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA46671A71
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 07:08:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0978wGY002743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Jan 2017 23:08:58 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 8 Jan 2017 23:08:57 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jan 2017 15:09:02 +0800
Message-ID: <0925f43d1c572fdcff50db50ba67207d0b0459fc.1483945688.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1483945688.git.Qi.Chen@windriver.com>
References: <cover.1483945688.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] selftest/bbtests.py: do not hardcode 'tmp' for TMPDIR
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
X-List-Received-Date: Mon, 09 Jan 2017 07:08:58 -0000
Content-Type: text/plain

Use the value of TMPDIR instead of hardcoding 'tmp'.

In fact, in OE, we have:
  TCLIBCAPPEND ?= "-${TCLIBC}"
  TMPDIR .= "${TCLIBCAPPEND}"

So the TMPDIR defaults to have ${TCLIBC} in it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 08cc401..cd36dd8 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -235,8 +235,9 @@ INHERIT_remove = \"report-error\"
         self.addCleanup(ftools.remove_from_file, conf ,data)
         result = bitbake('readline', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
-        self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
-        self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))
+        tmp_dir = get_bb_var('TMPDIR')
+        self.assertFalse(os.path.isfile(os.path.join(tmp_dir, 'deploy/licenses/readline/generic_GPLv3')))
+        self.assertTrue(os.path.isfile(os.path.join(tmp_dir, 'deploy/licenses/readline/generic_GPLv2')))
 
     @testcase(1422)
     def test_setscene_only(self):
-- 
1.9.1


