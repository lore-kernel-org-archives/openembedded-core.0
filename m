Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC3171997
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 14:37:43 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r141so116597359wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/cJM1IgXvFeNdBejA54qiuC7MGZ+INP+kqEqgfQqVZE=;
	b=cGikkVGgbjMy1gTgci13CYZIknrqHHW+dYAi+jBF11vFgD4hiecsYi/T4Q+cM28NAP
	hv9lFSzTtoEmB7QgPJA7xNS1LxMQ2mx5d1Bfd6vqJuyTvvC+uQgbRjS4yI9wM0AVEPm9
	oy2PcdLYLuXDmsNu3DUJu3I66QVAVmqIDBuvJBhSAAPqcyA9sFICHzUlVNmZMJa6pYdT
	EKN6Ir67RSasXa2RCaheCssmRDHiG15MI5V0VUrOchnmqCctBl3JRBXuMugTm6sQnfiR
	m6y6XUZAiFAE/aLHJHzFr5rrUsbsKqT/kb0NtLxeR/mkpzatwl2a1A0WXTc4yKzWE5GV
	/eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/cJM1IgXvFeNdBejA54qiuC7MGZ+INP+kqEqgfQqVZE=;
	b=Zk3ycTc5w2V9brLdPSylTJKvjz0pLGg/AqsJuY82zdXNY22wKikt+mA42oPM6SPNt7
	nf7YqOUbJLlUzf7tWoLDTIgUYrxd/MKjJZ76wCHZVVUmMdSl5ix4pz2pm7jfYECIzU58
	LkDMzKqO9lfol8DoGxD2EBl5BfXt408czf5AAb8+SraDqs68Z9W4/OrUata24vQPBKrY
	5A+Hi11oZJI2RmwFMrM2B+2y2yOtQDi7EyofDxQyMjc4XR751fSHtqz2Gqys7FV/N7ZC
	j/ffDH8q7e1bbSn1YYZ0DfxRU92V5iR7T9bzdWZzoYVJcrUaQrykx5mhRlcsl6MA6j7K
	/KGQ==
X-Gm-Message-State: AMke39lb65xiHWtkj4Xv/KaThz6uiZlV0pxwT61PfC6Wmdyd6cD/aAnI6QUCsMnApCBCQ3PN
X-Received: by 10.28.144.135 with SMTP id s129mr8474499wmd.18.1486391862347;
	Mon, 06 Feb 2017 06:37:42 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q1sm13286677wmd.6.2017.02.06.06.37.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Feb 2017 06:37:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 14:37:39 +0000
Message-Id: <1486391859-7793-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/selftest/pkgdata: use m4 instead of bash
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
X-List-Received-Date: Mon, 06 Feb 2017 14:37:44 -0000

The pkgdata test broke due to oe-core cf0fd8b which added alternatives support
to bash, so the binary is now /bin/bash.bash.

Instead of fixing the test case for this new name, use the m4 recipe instead as
it has less build dependencies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/pkgdata.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index adfe346..3512ce3 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -16,7 +16,7 @@ class OePkgdataUtilTests(oeSelfTest):
         # Ensure we have the right data in pkgdata
         logger = logging.getLogger("selftest")
         logger.info('Running bitbake to generate pkgdata')
-        bitbake('glibc busybox zlib bash')
+        bitbake('glibc busybox zlib m4')
 
     @testcase(1203)
     def test_lookup_pkg(self):
@@ -43,7 +43,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.output, 'zlib')
         result = runCmd('oe-pkgdata-util read-value PKG libz1')
         self.assertEqual(result.output, 'libz1')
-        result = runCmd('oe-pkgdata-util read-value PKGSIZE bash')
+        result = runCmd('oe-pkgdata-util read-value PKGSIZE m4')
         pkgsize = int(result.output.strip())
         self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
 
@@ -51,8 +51,8 @@ class OePkgdataUtilTests(oeSelfTest):
     def test_find_path(self):
         result = runCmd('oe-pkgdata-util find-path /lib/libc.so.6')
         self.assertEqual(result.output, 'glibc: /lib/libc.so.6')
-        result = runCmd('oe-pkgdata-util find-path /bin/bash')
-        self.assertEqual(result.output, 'bash: /bin/bash')
+        result = runCmd('oe-pkgdata-util find-path /usr/bin/m4')
+        self.assertEqual(result.output, 'm4: /usr/bin/m4')
         result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
-- 
2.8.1


