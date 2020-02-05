Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 734AC60AFB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 05:41:18 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g3so375123pgs.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 21:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s2tQ/W9k0l0wEjw4XkZsiPjYB1zb7TIJMSqzkicPEXg=;
	b=EVEs/A/3mtCwQlC+ENBQHiEi7wVG2SrkJiD0kJmHYtcETnt4xonMi5LNgHNMvq2WJS
	WYy0FtkUth9gREjKxq+oNvq/noQ0wo5baz9tNJPaiyhS/qoRUeYPMHmy5oGwdAbusx4d
	WWzr15AJoPMtgmaUMCOo4J5mAy++YzXGtvn0874socsSwRwoI57vWwBs16i3Bx4J03fb
	IfftW0h8hKEsCWbFl5uxIHQet3RvQOtSFr/gf/ygLDEJI+1Aa2rl0ixvtYwexkwWsMXL
	r9zwCCiSRUOhNg4tUIdRqgKReqTdhucPVYTWx0Oc+VL1bc8O3WrdXc8XIFBLi5WZw4iW
	Hxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s2tQ/W9k0l0wEjw4XkZsiPjYB1zb7TIJMSqzkicPEXg=;
	b=DxQOwtE11OG6Kv+UkIFYhZtscHj7qA7e124z7GyV6JJR1ut+RhBNAZ9kmzZ9K2RGRe
	bxwmzxXr56SIAKFdM0M7k7uFJ1UTOoKfImUEm1xn5iI0N3mXV8w7HpX9Xdtm7EMRHwPr
	GQZlbMIBVmG4a+WScAGSi0l52kkkJVxXopjic3xDWVf13gypaRdcOQbG3CwZBajOuqMg
	EziC8fupLQIvcIUVlPrfYebe16fKQgscg3ZTqNK+I2LqPtD9/Dyldc+aoLOTIRotSvC9
	0bPu5WqEKKrVh2Ptc8hx90VeoOURWUtilu+02vgeR1Wjn81TroBfhccRsCONY4d6tymS
	pu/Q==
X-Gm-Message-State: APjAAAVnPoaNxzsn8QTJRvH3xpje4mRxs5JpaM+B4j4C9T5NG9Cze0M9
	1+aX/UDDAgPb8j/vYMUB3tCHbSVS20Y=
X-Google-Smtp-Source: APXvYqwd76jN0PCigGyIUPGhamh6JXOd09WLcEYoTvUs06XoJp5aOIYV8WleY3QVnZdfQuLf3fXoeA==
X-Received: by 2002:a62:7c49:: with SMTP id x70mr33385686pfc.200.1580881278784;
	Tue, 04 Feb 2020 21:41:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id
	t30sm24951980pgl.75.2020.02.04.21.41.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 21:41:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 21:41:19 -0800
Message-Id: <20200205054120.1461132-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa: Use cpio 2.13 as testcase
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
X-List-Received-Date: Wed, 05 Feb 2020 05:41:18 -0000
Content-Transfer-Encoding: 8bit

cpio 2.12 was released in 2015 and might have used older autotools
which could result in errors like

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13779

Bumping to 2.13 will help in matching the tool versions
A good change on top would be to run

aclocal -I .; autoheader; autoconf; automake --add-missing -c

before running configure step perhaps

[YOCTO #13779]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 4 ++--
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index f4e871e421..4bd72dd37e 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -12,7 +12,7 @@ class BuildCpioTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
-        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.12.tar.gz'
+        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.13.tar.gz'
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 0a5e68d5fd..b0beafb38f 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -17,10 +17,10 @@ class BuildCpioTest(OESDKTestCase):
     """
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "cpio-2.12")
+            dirs["source"] = os.path.join(testdir, "cpio-2.13")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 03901a2f32..809142559a 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -40,7 +40,7 @@ class MetaIDE(OESelftestTestCase):
     def test_meta_ide_can_build_cpio_project(self):
         dl_dir = self.td.get('DL_DIR', None)
         self.project = SDKBuildProject(self.tmpdir_metaideQA + "/cpio/", self.environment_script_path,
-                        "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz",
+                        "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
         self.assertEqual(self.project.run_configure(), 0,
-- 
2.25.0


