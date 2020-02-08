Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE63605DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 02:12:40 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id j7so492298plt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 18:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7KBDJVfiD1XwVZdNIm8gERNFr/KxJzRLnZsY3acpEs4=;
	b=aCxvXjsxq4/4B5VdVZLX2FBrkH8bpwdiipXXu8t5RCJ2B0SmgxklYMAtNe8kVbc9f5
	a5Xh4URNUbRPDDqgvKmn0rNeHGHkKV/OejryyaIPL5Hs3ojy99Iq+GN59XTg92ljYR3V
	ITCFTqVfATXfDUhUMPNXoB07oO7hHToUPGKgB23XgTHPcO+11VXDnQLZr8xNIszuF3Q/
	xL+7cNgRoTYchpT8yUgyGnLOTOQW/dmJAXlzigM9WjcL8QlgFIvhgpVLhtiggwBHfD9L
	ASevzCnbnjBM4oMvIIeQiSSbiCidEbXRztpNqUyPsFu7Khxc5f/4y+klfrC59iztV1aq
	+IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7KBDJVfiD1XwVZdNIm8gERNFr/KxJzRLnZsY3acpEs4=;
	b=OhsFJmo4FZgZG3a0HGpHMHarSn1r99ScJ9q8lhw8mEFx4PzHDjbn6pkjKNjA9dfDBL
	ddo7B/ZUD3bihT0tJws+/WUvgyjqN68u1RiZhMGOY1RiDAbRQpiPCy0ISn0HpPZLqtpV
	HwSuzppPaV++qmXyZmPUY50sObkTnpXw8og6ZNThQ3My4F4qQez4BPY0FGNiOB7D/VGF
	VNq/z5fXWnjD+K5VVyc9zFPf9HHw4kAb+z4cs5RbK3LgI8qtrpRk2mFF1y4iV7zsQHin
	GnNLkvKsAR0Bns0ldH4LZ4RXRan2mD4/i/2h5zAe3SxaR6j/CoMjS6o/FAG5vbXlPmzN
	ojrQ==
X-Gm-Message-State: APjAAAUd3DdPqJEQSiEmvJ3geJJoQxnbHgFJZxNnVhb2UW6E5Q131bPK
	CfZJAKOoUi7hvO0+87ClMt7HuONGSG8=
X-Google-Smtp-Source: APXvYqx7JEvoUaFEwS05hmGFRhH5wupLjs8nZqSx9KbQ9xbfxrFiEJ2ffZ/+imsl7LSJ1enmyFZmdw==
X-Received: by 2002:a17:90a:fe8:: with SMTP id 95mr7183925pjz.98.1581127960954;
	Fri, 07 Feb 2020 18:12:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	p123sm4444131pfg.84.2020.02.07.18.12.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 18:12:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 18:12:36 -0800
Message-Id: <20200208021236.1857972-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v3] oeqa: Use --disable-maintainer-mode configure option
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
X-List-Received-Date: Sat, 08 Feb 2020 02:12:40 -0000
Content-Transfer-Encoding: 8bit

since the versions of autotools might differ, and difference in
timestamps for configure and system can result in reconfigure lets avoid
that by touching the configure script to match system time

Avoids
error: newly created file is older than distributed files!

[YOCTO #13779]

Suggested-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Touch configure to match timestamps with system
    Move the touch cmd to configure step itself
v3: Use --disable-maintainer-mode

 meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 809142559a..87cc2844a8 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
                         "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
-        self.assertEqual(self.project.run_configure(), 0,
+        self.assertEqual(self.project.run_configure('--disable-maintainer-mode',''), 0,
                         msg="Running configure failed")
         self.assertEqual(self.project.run_make(), 0,
                         msg="Running make failed")
-- 
2.25.0


