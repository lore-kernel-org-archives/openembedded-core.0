Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1C56BE0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 11:48:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a18so5359730wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 03:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DNBzH6z8CPAwYAKJF00Ean2aEC1conxgibmzjZiiiLg=;
	b=GHFhSNAXPZwdcHKLRN/mJ3tmZ/uNo+zHgZ1PeDL9pjD/sqWh/Ak/vDPKIT4UbpsgaH
	LcMIHCAJyQmxlZIffb5hxpkm3QMqBwoiy3QKgm819Btr+3OZj1wwl7JNzxQxvX87RmvP
	cmxBFH8ueIj2qh3gstmSxrWdP7NdoDZ/9sjy5BT20rQWquARSatWrBnWk3fVA8yl/VAR
	kU7Vn3SfbodItgmOI/u9SXZSHRfyeTVuLo4QHEev68w79WGo6tA3APrhRPXmOSHBdTQI
	cxXecrcmQZyeRvYZVuFXTOS1pB4h2HiYOsv0bbai/y0isU/ZaleMBCBQ53rZM1A5cD5q
	+uKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DNBzH6z8CPAwYAKJF00Ean2aEC1conxgibmzjZiiiLg=;
	b=HoNl7kaPyVrqhT0Wo1FTdFPFWRC0nsUczWmAyOzKINaIYVRlsqXDxNeJO1IfFk+Ed+
	mH+irLX9iAKAweWOI9mTv8vtoYbiwnPZyeoaPlnY8vxYuZIHOD3QfpOnsCOeqo8EoQAe
	cjYd+3P3l7QsCXyjYwi3RVe4q0dayVJr9NPkURytQ7kRxodkHyoNq/wf4rduYoOokyYr
	QX5nRzkpOpLHZ0TQo6zGx09GUq+sPcFu05GRARe1ecQRA4d/pHL4wvsx5h7ehgt4oauX
	a0apWJC3UdySC1bmABEW0JXSTNxAS/kf3znH3yDKzwQ3yJYN0PHRroXTdJoi2OCEORtx
	FV6g==
X-Gm-Message-State: AA+aEWa6J4i0X7Tgb68558n00vJOQuEJ7lLcyJ+Z7cWqqN4+i/IfMPLj
	sNv828N2wIlByNn6ifUr0Doq7vjt5Zw=
X-Google-Smtp-Source: AFSGD/Ux8daRQTuPpCjPSgt0hlNV0sKKgtuFrv76+0GToT6kuseFqF7GojI7n7RIVqpkx5okfuGnKw==
X-Received: by 2002:a1c:c303:: with SMTP id t3mr7552790wmf.94.1543837680902;
	Mon, 03 Dec 2018 03:48:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm14785842wrm.6.2018.12.03.03.47.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 03:48:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 11:47:58 +0000
Message-Id: <20181203114758.11474-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/oelib/path: don't leak temporary directories
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
X-List-Received-Date: Mon, 03 Dec 2018 11:48:00 -0000

setUp() is used to populate a directory of temporary files, and deleted in
__del__.  However setUp() is called once *per test* so __del__ would only be
able to remove the last directory created.

Fix the code by using the natural counterpart to setUp, tearDown(), to clean up.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/oelib/path.py | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index 75a27c06f77..e0eb8134a90 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -38,13 +38,6 @@ class TestRealPath(TestCase):
         ( "b/test", errno.ENOENT ),
     ]
 
-    def __del__(self):
-        try:
-            #os.system("tree -F %s" % self.tmpdir)
-            shutil.rmtree(self.tmpdir)
-        except:
-            pass
-
     def setUp(self):
         self.tmpdir = tempfile.mkdtemp(prefix = "oe-test_path")
         self.root = os.path.join(self.tmpdir, "R")
@@ -59,6 +52,9 @@ class TestRealPath(TestCase):
         for l in self.LINKS:
             os.symlink(l[1], os.path.join(self.root, l[0]))
 
+    def tearDown(self):
+        shutil.rmtree(self.tmpdir)
+
     def __realpath(self, file, use_physdir, assume_dir = True):
         return oe.path.realpath(os.path.join(self.root, file), self.root,
                                 use_physdir, assume_dir = assume_dir)
-- 
2.11.0


