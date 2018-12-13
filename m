Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 593DE746BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:17 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id e5so1671949plb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hosjN0YKlKRRF9ubLk+ggaxWNhBm16aEBPM7vRSArcA=;
	b=gkz7PTcnOhMflJxggxSvBUG4lOtD2QLMHpifh7br2rYPFuQ42VBRJnHOXe1o7HwdvJ
	7zarDiHOzHh9V5ZpoXBkqOyLycliVLha4JpQHow+6sbyHqLrzKS6gpkxbFbK9bqraKKI
	UEz17lwGLBt3lD2PZbwrTp68uZYg5lF0BNQQHVVbz1plHUxH5ud2ujIHzoaH5bKt5dBD
	pXi5lCy8WBuyjjwSXldA927nMDUJHAEbFZSUPV2e7qZA2i4iSI2eYdnJQt8F3J4LIJCs
	43IwEsQ4IqKC2F15VOf9KgHepFQdPj1F+YFreck/SP1pu7qHayi5w7dEtqvNrz2BKbqg
	F4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hosjN0YKlKRRF9ubLk+ggaxWNhBm16aEBPM7vRSArcA=;
	b=DN6IFwRKrlv20qgNDRJdysEUydL5HnvefuCAe0TQJGHQUTR4jV02rKjGCRyHO76Rbm
	jU3Mn5RfjHS/pItm2rJYtPLOBEnWxzSIyr4s/i+/SmWitDMHiop7+HNWfOc8lSchK7md
	NxHC8JgwjHduvUlNlpY4/D1MlKDUscpDOuNDPAg9KKZdZCzOZGcSaUS39YJ4Z/Xsgsoy
	rt+XYxFmvdTSQC0zN98xQmreUIEAo8g44nj7k+DBvasUhusmf9dXdX7HfGaUNu8AfUrW
	zHW/oYVpBksEswBendmzRTBuzXlmCgNeL8G4dm0Sdtp8WqdGuFx1HvmiCQrAbEK9+Y8X
	BV1g==
X-Gm-Message-State: AA+aEWaeixlWI4DQQ36jC8sjQIZPZUwnMbjmVw2No9RIv98gUd0mNNhP
	Vxmugm8fujKGgSA/ozPdOYKlIbxb
X-Google-Smtp-Source: AFSGD/UdAa8qzXRqIqNHWW3xAQ8RU69A4Ay729HswJPhWFCLaD2IuD2dsrYqEfE+L/b2UVhXvdebZg==
X-Received: by 2002:a17:902:b943:: with SMTP id h3mr479495pls.12.1544737158428;
	Thu, 13 Dec 2018 13:39:18 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:23 -0800
Message-Id: <31370a26389ff70c879f13ef314627a7d8efc6c4.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 15/45] oeqa/oelib/path: don't leak temporary directories
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:17 -0000

From: Ross Burton <ross.burton@intel.com>

setUp() is used to populate a directory of temporary files, and deleted in
__del__.  However setUp() is called once *per test* so __del__ would only be
able to remove the last directory created.

Fix the code by using the natural counterpart to setUp, tearDown(), to clean up.

(From OE-Core rev: 68b4723e6fb11d171869185bccf28f32f6284c18)

(From OE-Core rev: edd2ecbc86d8b02a0467491451306f67e81d9ead)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oelib/path.py | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index 75a27c0..e0eb813 100644
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
2.7.4


