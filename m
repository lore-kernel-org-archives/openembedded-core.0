Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 191AB60AFB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 05:41:18 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id ep11so478869pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 21:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vF3mln2TxW1RqAIkDlcfe9OsRvk525eYdCDUYQ1Rb7w=;
	b=ZB2jzTkzDKS94ZSAedWImoX7Y4T7opYTsLvD64045kksxv/ECRLagiEWR4BKvAp9m8
	XmOkK5EpCWxqqwZHmce3RkxnQwLJCRRqlDQxBf/N8bDhMYOdBrpJ0ZNAnHGkNNfXzfKa
	uMaImXJ/ChBya/5nh2LeYukzaGvOaA6zgOi33gUaaK6eQ0FSRP7A1ges0Stlv3f+OQok
	QV6TVsYGJOKxChBw8gADU1HejIXrsUR3Nl5Liw6G8y/gMdDZ13bbLufuTCwvfhBXkbcN
	Fj+7Mpkf0QPi+vCCgFgA1+yZ9rSMO+kISr/8Bahm8VlnyLCzFA036+Nq4xnvo/wYZefO
	BUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vF3mln2TxW1RqAIkDlcfe9OsRvk525eYdCDUYQ1Rb7w=;
	b=KKUmFDMalozfOeFnsZ1J1VJts2C/uJSDsu/Ujp6SBb08OYLVfIz4fK0TOn1VLW1GHg
	ITYBhqFUI9D6b9PRamAvGl6nKs0XBTfGIZwJvRUYC1H1HEjIyj1kvyzKAAG5LUD5TFCh
	gGP1U8VG0dNht7IX+t/EKF93ykFkdUGvk5nFSjrs/3W+QgBsUq96fwc9EI7cgl1SAWwI
	oRYG4h/e7q9xhyvSj8wW6FpaBuBIiXwkED5zoSLBOJQaCIrDonkEan0qBilJmQVmdZpj
	/4xSa5zIwVq4Cx+0L5siOlaDpW1ufV1v3H4uy4abz1ZmQu13Un3kyzYQLwga+LKbQeyx
	84Zw==
X-Gm-Message-State: APjAAAVICyAeT9gPbN4XWXCpYt0E5lMvVWExOPFV70Xy1DS0eBEXCM2k
	h16Cc5FAxiddptJokLz+8ZIa36xg8ZQ=
X-Google-Smtp-Source: APXvYqwWRxuxU1gr+FfZL3iKlxUDTk8j2YlGvWhtl1BePvTo2Fv3/Pi/AlBUuz57lDsv7sOB8i72ew==
X-Received: by 2002:a17:902:34d:: with SMTP id
	71mr31905578pld.316.1580881279498; 
	Tue, 04 Feb 2020 21:41:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id
	t30sm24951980pgl.75.2020.02.04.21.41.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 21:41:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 21:41:20 -0800
Message-Id: <20200205054120.1461132-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200205054120.1461132-1-raj.khem@gmail.com>
References: <20200205054120.1461132-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa: autoreconf cpio before building
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
X-List-Received-Date: Wed, 05 Feb 2020 05:41:19 -0000
Content-Transfer-Encoding: 8bit

since the versions of autotools might differ in OE especially
so recreate config.h.in, aclocal.m4, configure, and Makefile.in

[YOCTO #13779]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 1 +
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 4bd72dd37e..9cc261c314 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure()
+        self.project.run_configure('','autoreconf --force;')
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index b0beafb38f..ec10149d34 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
+            self._run("cd {source} && autoreconf --force")
             self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 809142559a..46398c7e2d 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
                         "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
-        self.assertEqual(self.project.run_configure(), 0,
+        self.assertEqual(self.project.run_configure('','autoreconf --force;'), 0,
                         msg="Running configure failed")
         self.assertEqual(self.project.run_make(), 0,
                         msg="Running make failed")
-- 
2.25.0


