Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB6060BC4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:22 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id b35so2398173pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=33p2KlypTpThfdvAYUqigNrd2spF1km8igTUFe2HqvE=;
	b=L0ZJyI/VpsfrXUuHCmfJKir9zoQKV4Iv7ycyceYfPwQ4aNY+p13dsFU5aup8TMNXFf
	WZoPOp0qoUBHrLkAVFkcWc2YZapX9H50MfyzHhRlSJyfNBgscF1zYEu5aXTFr1X31Rhm
	zrNpe5hPI9uP7li8Jr3TdXdAZXUDETW//CKwEX2jK5VY+02i8A0M1fhEnZL4iD6pUC+X
	ptg8cVuCWK17Xo16y76KbKn2UTEv06wZ6td0sJDIKrHG+V9BLglQ+0jTdSUHlrUs+x+G
	LE0LE5dBKyrMoVZvj0AcmK6yhkNI2H+koe0GmH+FsJ5GehnASYswQ0oAI40smZzOtO7y
	B9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=33p2KlypTpThfdvAYUqigNrd2spF1km8igTUFe2HqvE=;
	b=VGw/r7fNvBJHibdNeI4QfLuOTskU6SxqsPYTiBqk1LkL+wb3K3hPpFeWazxAx/UcvH
	hGeNjCjTL4h11ZejrmfEDp9vgkWC3oWYDOAJfCjuethf0appsUxHaQb7AtIUpkzbUrN5
	2nbdkefQE+c+qEVkwZ0cWY3SbcoT2UpOpsOUDmWmorvjo6K+cr+1fLtpuOhHB/7DcKVJ
	OA3xvOdq52LRRjcPMTDfQqgye6JgVD6tsPQK/y52yRPp7ESmejSYR3h2IsM1c2pq05zp
	Z0I86hsvPVwMoEZMqJ6NOcBSyDtUMmmQql8Ix6Qzh/wEkSsQtbitOQO59NPtkXCojjsq
	mqUQ==
X-Gm-Message-State: APjAAAXOUHClO7a5G9Bk/lotPgqCngYOYkN2MK8N8neJoj0ki1iaA4Mz
	KVNk3IrsyhmQcpK6+h0J0RzOmmPphPo=
X-Google-Smtp-Source: APXvYqyVGo3LEcFmtr/2nAVxnbIYS//0DiicH9SC1d4UdEZJhslpgBTN4XY0cpMhC2wUgsqDX8rdRQ==
X-Received: by 2002:a62:1a97:: with SMTP id
	a145mr16317141pfa.244.1581575902663; 
	Wed, 12 Feb 2020 22:38:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:16 -0800
Message-Id: <c1060fee258e0cff3c3380d6b9243cc1e572676c.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] oeqa: Use --disable-maintainer-mode configure option
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:22 -0000
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


