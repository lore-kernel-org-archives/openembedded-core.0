Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6877D60D3A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:25:38 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id n96so1249161pjc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MBFs2rRoP4XyzDDXqdcofgJ3JhQGJtrKn/ebsi7xO6w=;
	b=HFaWpsLuIWpSrmCP+ucIeO2jbzZWHgiCjtBZ4bMv9Cx04Q4MINKLDBD+Nc9kKE0Scn
	pEg1mjL942QWY18c2iTjk5aZWYU6ucKeLnI1j1njDqkvKbH6J9bYDWoj/N3tcsG4w0Uf
	P7FrxcenEs1N7CLLdOzt5SAeO3Omy0dmgoUnzY5VetjFDFSnrRt3wdtyNknvvP9ZLHko
	mzh4HoehyDQ1HHhBPPISBEGom2uB6TbhSl2J/3L2X7aQu4tEgpRuDRq/h5odEMo/jh9U
	2lVRg8ID+tm2oUoAkzHNmMFtxv/8Kc75PR67zO/lfG7Dfhw0B53kGeK4o2xVGy8Gykho
	Intg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MBFs2rRoP4XyzDDXqdcofgJ3JhQGJtrKn/ebsi7xO6w=;
	b=aLWGC3sy1BcZIRJL08RrNJLtkPbTaxaVjeALbo6pik5xJybqZSLiSPXRbA+mjgzhjt
	seqVzmr7dDa+ZcSkBDsK4WWmo+AQkac3oipLtQy64GZRIprIrV2Wb+EVdcCaIeQ/TT+O
	aUq/+2mXBWy6R6eAa8XMSnW2L/Ob5+DxCASBlNG0Jue30x9X0LPTfey70bxAbhBhU4/r
	EHR5aSVgQhqvrQmCZondxGIDLdNNzHFDF8Pt1e91kU0438dZprtOSZTsLoHwOwCMmNrr
	AxINqACpyDs2rMG3dt3ccuSs5vt/DWNFlvIhaL8/h6aAanUfZgbNkK98G/Ey3Co4DyiA
	Spfw==
X-Gm-Message-State: APjAAAVLQi+mOFKtn8m1tPO/HD7d1IUliabsXgITXsfbUHaYrFiSW4qS
	flXiKtE/XGpasvjkmw1KbhoP9va48u4=
X-Google-Smtp-Source: APXvYqzYSby54fy6hbCp0kPgSqmU5+11F7YSCoZeiuGBY46LtMAHNZ63miIePLY6Vyp8tf3r5bJqbw==
X-Received: by 2002:a17:90a:7303:: with SMTP id
	m3mr5431085pjk.62.1581099938893; 
	Fri, 07 Feb 2020 10:25:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	b130sm3453036pga.4.2020.02.07.10.25.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 10:25:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 10:25:42 -0800
Message-Id: <20200207182542.300768-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2] oeqa: Touch cpio configure script before building
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
X-List-Received-Date: Fri, 07 Feb 2020 18:25:38 -0000
Content-Transfer-Encoding: 8bit

since the versions of autotools might differ, and difference in
timestamps for configure and system can result in reconfigure lets avoid
that by touching the configure script to match system time

Avoids
error: newly created file is older than distributed files!

[YOCTO #13779]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Touch configure to match timestamps with system
    Move the touch cmd to configure step itself

 meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 4bd72dd37e..a2cc8148db 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure()
+        self.project.run_configure('','touch ./configure;')
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index b0beafb38f..e412ee189f 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -28,7 +28,7 @@ class BuildCpioTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
+            self._run("cd {build} && touch {source}/configure && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 809142559a..16acd1154d 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
                         "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
-        self.assertEqual(self.project.run_configure(), 0,
+        self.assertEqual(self.project.run_configure('','touch configure;'), 0,
                         msg="Running configure failed")
         self.assertEqual(self.project.run_make(), 0,
                         msg="Running make failed")
-- 
2.25.0


