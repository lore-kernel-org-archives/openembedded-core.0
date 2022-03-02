Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19602C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 13:22:02 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web11.7014.1646227320627707902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 05:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=VkvFsOvS;
 spf=pass (domain: aj.id.au, ip: 64.147.123.20, mailfrom: andrew@aj.id.au)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id BA1483200953
	for <openembedded-core@lists.openembedded.org>;
 Wed,  2 Mar 2022 08:21:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 02 Mar 2022 08:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; bh=Qg1F/CX0S14/zVkbfuv54y2DJYoZZwNZSvN87sKS5EI=; b=VkvFs
	OvSivBxMTksIQOSC8W7V6hYg+M0Aozm1zRGIp8RtivL9YmSgiNszlLtPeHE10nGw
	/dXgY+V7Hh26gBu6gtLg2qxHQbFAZA1XrKYmkcJ/J1VoLgaS/xwgKmBO4ZrsEaV7
	iw22hP1RKwN6yH+TaArdMY4c/0b1mmwriBl5FjxW21RSt6VXNOTlpVv4/fuaKUH+
	Iwc8iL65Iin/Rpfn2ZskMACQn8TpjaO/mD5GAwCJGq2ZDjbQPIfp/JVYKdB4M5Tv
	VdMFml8wftcqXVpQkSIyJeND/cihPMwut/vfGkrylRbq7Ef1uzOMbFA12mi6WXJJ
	hYSFZ1+1FTHUu/vWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=Qg1F/CX0S14/zVkbfuv54y2DJYoZZ
	wNZSvN87sKS5EI=; b=Qjm0OgBRdCTC87WzUSJo04Apy7Jw3MitiwbNhhM6R+9HW
	0NI6iRyy/RUr93ww/8qznBFI7YcCcf/39GMFXEjjB4BuacGW5tX216RvqIQmT7MD
	N1SR2CSbJl9xgFlAAIWbIgthKVbj5K0z2YP3vUXMdnEG5yC35mlG6LHlkfIQDp/3
	q+Fs+uD/WLTQMvdRAxeSrJswT+nbEgS+WpaXNaS1vwVbjN5Ddts8XI4dWYORoUY+
	avFNViREawj4YEhzikp/Ai+5JvmRkkAox6r1/C3dkQGnorybK00miq9TQSxXsdTd
	vqGd9yt+MO2xn8zGPCSuLZ7H+964y1gpiw+zuI0vQ==
X-ME-Sender: <xms:dW8fYu8s1EUFn9NHb1AQrWSUPE6qkOAYEAhdh8NzIzY_J0G-0OJsTQ>
    <xme:dW8fYuv3_1FqB9M6qHTELHtvqxs7V8Z-Uwb0X4ZW9J_4CjYJ3s2eoblm69MQNpc-f
    zcuvwcJy5f-wrTFwA>
X-ME-Received: 
 <xmr:dW8fYkAJvjBnD-CAbVI8u5NCFsRSRjpoXtOFj-_J969aviWm0cEFfYIrOHo0XuowMbPoX21-q-cGD5vtuSN2tPOUxGz-ZxIJlk9ok7Qp350NPXDzTFvbQNR3gsqPQGBq>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
    dvvddthefftedujeethfeuueelfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:dW8fYmfcHMkIWC0GbhI0kl0hFFurzjjGlzRrg2FsnQzIBih3-FjoCQ>
    <xmx:dW8fYjMmhky-3EU8fwQDCImv2H8hKhDe7ZLP3m3-maBZBEjT9KJObg>
    <xmx:dW8fYgmyWg3H3AHm-n8iXgbSlgVbsM9pJGcjm395t3XN0h1eAJqVGA>
    <xmx:dW8fYiYdtcaKVVtqV1TDaKVhVuTkahxjn8PpnO0TG4RU5atHvwARcw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Wed,
 2 Mar 2022 08:21:55 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ipk: Import re in manifest module
Date: Wed,  2 Mar 2022 23:51:42 +1030
Message-Id: <20220302132143.3619841-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 13:22:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162608

```
File: '/home/andrew/src/openbmc/openbmc/meta/lib/oe/package_manager/ipk/manifest.py', lineno: 67, function: create_full
     0063:
     0064:        output = pm.dummy_install(pkgs_to_install)
     0065:
     0066:        with open(self.full_manifest, 'w+') as manifest:
 *** 0067:            pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
     0068:            for line in set(output.split('\n')):
     0069:                m = pkg_re.match(line)
     0070:                if m:
     0071:                    manifest.write(m.group(1) + '\n')
Exception: NameError: name 're' is not defined
```

Change-Id: I769a2ab5e57c7b60598ea0390b576d707356db9d
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/lib/oe/package_manager/ipk/manifest.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index ee4b57bcb0f5..22669f97c082 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -3,6 +3,7 @@
 #
 
 from oe.manifest import Manifest
+import re
 
 class PkgManifest(Manifest):
     """
-- 
2.32.0


