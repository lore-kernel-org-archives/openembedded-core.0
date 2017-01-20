Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB2177235
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI3ADu019284; Fri, 20 Jan 2017 18:03:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IywRu_HvLDr6; Fri, 20 Jan 2017 18:03:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KI34CF019276
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 18:03:05 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUdWi-0000V8-MN; Fri, 20 Jan 2017 18:03:04 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 18:02:57 +0000
Message-Id: <1484935378-1881-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484935378-1881-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484935378-1881-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] selftest/devtool: Update to account for recipe specific sysroot
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
X-List-Received-Date: Fri, 20 Jan 2017 18:03:13 -0000

There is no common sysroot any more so add the libusb dependency using DEPENDS
and check for the output in the sysroot output directory so the tests
work with recipe specific sysroots.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/devtool.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index dc3435f..79a4b1f 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -247,8 +247,6 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1162)
     def test_devtool_add_library(self):
-        # We don't have the ability to pick up this dependency automatically yet...
-        bitbake('libusb1')
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -277,10 +275,13 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('recipetool setvar %s EXTRA_OECMAKE -- \'-DPYTHON_BINDINGS=OFF -DLIBFTDI_CMAKE_CONFIG_DIR=${datadir}/cmake/Modules\'' % recipefile)
         with open(recipefile, 'a') as f:
             f.write('\nFILES_${PN}-dev += "${datadir}/cmake/Modules"\n')
+            # We don't have the ability to pick up this dependency automatically yet...
+            f.write('\nDEPENDS += "libusb1"\n')
+            f.write('\nTESTLIBOUTPUT = "${STAGING_DIR}-components/${TUNE_PKGARCH}/${PN}/${libdir}"\n')
         # Test devtool build
         result = runCmd('devtool build libftdi')
-        staging_libdir = get_bb_var('STAGING_LIBDIR', 'libftdi')
-        self.assertTrue(staging_libdir, 'Could not query STAGING_LIBDIR variable')
+        staging_libdir = get_bb_var('TESTLIBOUTPUT', 'libftdi')
+        self.assertTrue(staging_libdir, 'Could not query TESTLIBOUTPUT variable')
         self.assertTrue(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), "libftdi binary not found in STAGING_LIBDIR. Output of devtool build libftdi %s" % result.output)
         # Test devtool reset
         stampprefix = get_bb_var('STAMP', 'libftdi')
-- 
2.7.4


