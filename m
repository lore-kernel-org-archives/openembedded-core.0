Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA2117BFF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:02:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI727Zr006134
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:02:07 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:02:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 15:18:11 +0800
Message-ID: <ebe2f17aee1340ec01dc3a58da1bbf8b6de232cd.1545102457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 11/11] oeqa/selftest/cases: Update test_ccache_tool
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
X-List-Received-Date: Tue, 18 Dec 2018 07:02:06 -0000
Content-Type: text/plain

Now we can compile m4-native rather than target m4, this can save a lot of
build time.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index f234bac..181e9a9 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -37,13 +37,13 @@ class ImageOptionsTests(OESelftestTestCase):
         p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
-        self.add_command_to_tearDown('bitbake -c clean m4')
-        bitbake("m4 -c clean")
-        bitbake("m4 -f -c compile")
-        log_compile = os.path.join(get_bb_var("WORKDIR","m4"), "temp/log.do_compile")
+        self.add_command_to_tearDown('bitbake -c clean m4-native')
+        bitbake("m4-native -c clean")
+        bitbake("m4-native -f -c compile")
+        log_compile = os.path.join(get_bb_var("WORKDIR","m4-native"), "temp/log.do_compile")
         with open(log_compile, "r") as f:
             loglines = "".join(f.readlines())
-        self.assertIn("ccache", loglines, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
+        self.assertIn("ccache", loglines, msg="No match for ccache in m4-native log.do_compile. For further details: %s" % log_compile)
 
     @OETestID(1435)
     def test_read_only_image(self):
-- 
2.7.4


