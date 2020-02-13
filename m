Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6C360BF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:21:58 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id d6so2684929pgn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=33p2KlypTpThfdvAYUqigNrd2spF1km8igTUFe2HqvE=;
	b=gmhKJpR6o8CfpNiW2DgQFdYCw4dQu2LPlse1dPKVVt/cGTDPifUGdpLjmcpQB0IVQj
	NibE5dyPs+HlpCHm9Ga+jEXPSSvWnUIjUXpgd8NrX565qDYKOGDGjdTQB+bIawXA1cKv
	cJFQez4ilYtiHI3h7+w7Uus+ni5y9cmax9F+PHurVmQDIp2ZutGkiW8uXP9u9Y5rbvQ9
	c9g0kFDbE7JUMi/4Lj40elzSmiqyDjStrBPo33xnRQM72V2n84wKgrQ8EW3GgBSVoiyz
	dJlqqqFJwxOBU92YUawZSHGb7+neoxHBWHFzcXLD2yZx86PvUA5DH8nxHxWbmChBCR/A
	REZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=33p2KlypTpThfdvAYUqigNrd2spF1km8igTUFe2HqvE=;
	b=kmF0qnmGFkhUWcUVZzHT6v/HVU0isArcTKPuA92n6uhtXCn3gdapBR/L3TqWl5cdrE
	G0HRDUR+8j73X25rxvpEpOxofJa/b6dSn5QnNaSlAWweDj/mbgfxPjYRoU2L3mkUuYop
	YdrRA3siYWqW69qn4/5NfHvqHQ27uWXnj7NvyzP9F/EogsdyVBSfn2384O58yPV42nQb
	zW0u+rCWFPrJsuBlLWqdn0RD/cu/miWLE9g6p3TMcMa9GCbU+b0b5apkNnoPntP4r19O
	yj2GtZbWGgKdDwJOTZobmg/UlgU0TlzLoNve3d8Gite2fL2I4lb3zvK9JkXDDElAG+ez
	KR/g==
X-Gm-Message-State: APjAAAXs371xkDeuvscco2s5JhPvqXCeO6xLpCl3Yr5DR6222kpFy8E8
	qjpMFoy0NAlnip0slIs+Nh6+cwz9j/o=
X-Google-Smtp-Source: APXvYqx5QbAw02vF0KW3VBMB1C+gDzuVerDcTChf67Em5rRVS17ZyQxyXMJy3YcLuwojTgVhnaefEw==
X-Received: by 2002:a63:778c:: with SMTP id
	s134mr16334518pgc.451.1581582119126; 
	Thu, 13 Feb 2020 00:21:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.21.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:21:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:51 -0800
Message-Id: <c1060fee258e0cff3c3380d6b9243cc1e572676c.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] oeqa: Use --disable-maintainer-mode configure option
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
X-List-Received-Date: Thu, 13 Feb 2020 08:21:58 -0000
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


