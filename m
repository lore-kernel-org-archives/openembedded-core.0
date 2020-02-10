Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF5D60C77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 03:30:06 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id d5so3566801pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 19:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j3e0gSV3tyLObxdKkIj80SZh/4Jf7MczNmeGWenp/sM=;
	b=FrB1tuDEU/BIqNpbR1+wFeCvOY/fXGO1yno0OPQ59+grGxIUVE6+gFW1yZ/z7gsnRr
	qxWkVJg6ttCzlP+Amn+dhbfQ2ePNPgNAwE2xVJT1HEHgam+fhk/y/cf86rpY36iK+G+9
	2v8RXhHBR3o9DGGtaJrLGjiNIcfRy2VbmElPODYkGNYGG46Qd2xtf5cqdLgDJiW/mYRt
	GNHOoFcVtokE+HZOnfxTvmGdjajCkek1uRWiXz2J77BZ1MHYtl1NjfEcXxOTFJiysI5f
	UasOI1uAEvWBDV2NeRNejrpAagIYqK76xXkguKAG4jJbZCxdoU2XNFmOAEyGgsiD0OFE
	G1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j3e0gSV3tyLObxdKkIj80SZh/4Jf7MczNmeGWenp/sM=;
	b=rzX3Y25LMbiz8nQlVYeRYaTfoLKxeFEW7gzdmdxizkAe0fCRBo3/YhjCbj+/jsTgo3
	AQYgqpG6Rkmriklum5uG2UjDXiaLX0n0+PqAMlK+MG1ajdcid2e3ADJrWa8iFJczqK6g
	Tgk3Kd4FPAHKpnUifijSOMIMayhfJ1sKq30Sa21RRW0a82bbiRxcoNHbKoQq+6mPD9Zb
	GDpkXCKHhYaeYYZmdY8pREEavZ1E04DjLtfSy5I8TkwdT6oJcedl/cYIg21ebforPLUF
	bBOKLvaLVucbmuz1RxbNDGXrePId2Mlci+GKXGqEbW0K7j+m/XlJM9yN0VyYc4BctYSX
	rd1Q==
X-Gm-Message-State: APjAAAX77gpgMZ/dAMPPZDpzwtuxyroulozlTMd0LTcGKe5a3WJ23zC8
	9mczQTrzbe9nSowkJzLyWamZXGQ4wjA=
X-Google-Smtp-Source: APXvYqyUnGsOYW+9ZXVhSVAQT6a/XIyjkkLXxjSIXYfedLL9Uer0JiftBIgil2G1uu6ylXpN0dOKpg==
X-Received: by 2002:a17:902:ba94:: with SMTP id
	k20mr10879893pls.104.1581305406661; 
	Sun, 09 Feb 2020 19:30:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id e9sm9175234pjt.16.2020.02.09.19.30.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 19:30:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:30:07 -0800
Message-Id: <20200210033007.2324804-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v4] oeqa: Use --disable-maintainer-mode configure option
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
X-List-Received-Date: Mon, 10 Feb 2020 03:30:06 -0000
Content-Transfer-Encoding: 8bit

since the versions of autotools might differ on target and build host, plus difference in
timestamps for configure and system can result in reconfigure lets avoid
that by disabling maintainer mode

Avoids
error: newly created file is older than distributed files!

[YOCTO #13779]

Suggested-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Touch configure to match timestamps with system
    Move the touch cmd to configure step itself
v3: Use --disable-maintainer-mode
v4: Remove --disable-maintainer-mode for meta-ide selftest, its not
    needed

 meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 4bd72dd37e..d0f91668b2 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure()
+        self.project.run_configure('--disable-maintainer-mode','')
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index b0beafb38f..902e93f623 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -28,7 +28,7 @@ class BuildCpioTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
+            self._run("cd {build} && {source}/configure --disable-maintainer-mode $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
             self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
 
-- 
2.25.0


