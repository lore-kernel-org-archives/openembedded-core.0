Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 54E59783F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:53:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBJBr5fZ009651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 19 Dec 2017 11:53:06 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eRGSH-0004IE-Qr; Tue, 19 Dec 2017 11:53:05 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 11:53:04 +0000
Message-Id: <1513684384-16452-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513684384-16452-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1513684384-16452-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/3] oeqa/selftest/buildoptions: Add test for fortran compiler building
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
X-List-Received-Date: Tue, 19 Dec 2017 11:53:07 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index cf221c3..e60e32d 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -164,3 +164,17 @@ class ArchiverTest(OESelftestTestCase):
         src_file_glob = str(pkgs_path[0]) + "/xcursor*.src.rpm"
         tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
         self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
+
+class ToolchainOptions(OESelftestTestCase):
+
+    def test_toolchain_fortran(self):
+        """
+        Test whether we can enable and build fortran and its supporting libraries
+        """
+
+        features = 'FORTRAN_forcevariable = ",fortran"\n'
+        features += 'RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"\n'
+        self.write_config(features)
+
+        bitbake('gcc-runtime libgfortran')
+
-- 
2.7.4


