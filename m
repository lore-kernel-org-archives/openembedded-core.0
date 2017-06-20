Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id B5CFD780EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:23:43 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id n136so3462408lfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Nbgw42gD/qELVKAIUDOZXGImdt7eSF+nvVbz7cSX0KA=;
	b=YCIGG5QxwtaHPlVDRwQDi7lyUvwKu0l46hT/M32XUdPn/XbtRl6ESgPmaMP420L9Ck
	XnSmRmg7zag9VEX/HfCzPdNNkxvAPd+k2yuEc3Tyiq+UyXExhM0WHorAEZxKYVbE35kl
	XMxGZ2fIYuVZUZY3Moy3aoivUeSeMs85SOnMFmf/bXlY6u3eLF1MJ4VKxvbEMRTaRy20
	SP9lwB17pFfa8t15UbQAvHLYuq4/aKvBk3HPjGw3nbi2MPfmZ+Oq85Ye8BgCru7erzRn
	pfPUKtwZUE6adgRql+xyNhY0qpmicJ+64CEjwA4E3CkqpwI4mWSf9NpYiPRjj+5GUjKC
	i9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nbgw42gD/qELVKAIUDOZXGImdt7eSF+nvVbz7cSX0KA=;
	b=mgsU74ggAaD7Fl5p4UH633+wqgkQwLis/1euvF2fsRc4Ir45l5sCq9vOkz6Y9X44W/
	XicQ9EP4O5atTeQPavDSAwhbh6jW22s39NX1RZZoKAVWovYmUgCzo4vXeMkyp3+PInJx
	4Kre13xrreVLgCae6jkTKHjd2kbdPHvISVXh/a3N9dKcaly31AV9Q4tIauu6ihzPtRWE
	PVMJ8TvvSl43GHmE7HmNGKaz1zv1+VKezDTaEIqa1+9jFCb2DrgjMsj3oysVCpX6r7BT
	lytm/jR5fO33LTlmCsL7+/8j2AEhSFkIBXkN0/ht6l7u/6CNLpDw47Yq8rdAb1GnWhk6
	3jSA==
X-Gm-Message-State: AKS2vOxqj/lH6Jzk8HZIEez6CelPYicHgi3aiszx/GfU3ujy1ejPZ3Rz
	NYpsCk6h//8OxPFfopw=
X-Received: by 10.46.84.92 with SMTP id y28mr8525182ljd.78.1497968624084;
	Tue, 20 Jun 2017 07:23:44 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	j200sm3413857lfe.68.2017.06.20.07.23.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jun 2017 07:23:43 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:23:39 +0200
Message-Id: <20170620142339.9527-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bitbake.conf: Fix typo on variable name
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
X-List-Received-Date: Tue, 20 Jun 2017 14:23:44 -0000

The variable is called ASSUME_PROVIDED, not ASSUME_PROVIDES.

Without this patch sdl-config is not properly linked into
build/tmp/hosttools and bitbake fails to find it.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 80baec8d40d2..aa54e9266ba8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -472,7 +472,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "ip ping ps scp ssh stty"
 
 # Link to sdl-config if using host SDL
-HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-native', 'sdl-config', '', d)}"
+HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDED', 'libsdl-native', 'sdl-config', '', d)}"
 
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
-- 
2.11.0


