Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F846C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:27:40 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.15684.1746016050762118432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 05:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yrt47w+j;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549b116321aso8802601e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746016049; x=1746620849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al4Vp3OBf1HRr1ipOi+Fudsr1Z3kfaBZA/eBPzwpkRo=;
        b=yrt47w+j1p8G7dGZRnpiaOPVW/zt5ppTHuLfxxtEbqpCM1oIMMgbIDSZSR7tT9ew8w
         RDnUwYQWdFPppz4sTiWqb8Aony4KV9QegFMOr7VFmhCGEl3kTDu2h97+Y7ftGal/rBgF
         vPqqTZNH3GLAgSe5cIilz0o03QCUu4t5AgpEHYki3i/eQpNhzdKjHLqhChs9jsuE9HID
         JPFGipfV0L4E0yQ+dEMSeoEITT9GHPoSCF3cc5fQ0IwCqRju3qVf6XAQk1TczYo/ArAB
         NJGMwl8koGItxa2yx582oEpMUa8qUfKk5LkA5pbmUlJfdM7a3j0Xh1hnJHtsqyIClk3r
         Peqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016049; x=1746620849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Al4Vp3OBf1HRr1ipOi+Fudsr1Z3kfaBZA/eBPzwpkRo=;
        b=A88BQblCnMdiIGBfc+xTUw1rsc81p0aWGd0yWOqfE9CQ4LXlnTJuCMecVByiUFkFr3
         asUozoV9o/7HGLG0XyrLv7fxcHOQu6FuRYCkiccb58X4yFdedf7gLoN/HWlAJRgggidd
         Ms3eqN1zRwYtZlUiPKu592txVGco/W5FiMn3H4Bw7b6lW3JuocCNCa3gEBTYrXnNn/RK
         f24QtYA24bEpEV5UACZY5BMrIDC6/RwrT10A4sbJVBdQdIyBOs1eURYK+PQ7MGVQ4Px/
         2vHN5b7DQssl60PsiTHmeVERiiXRoWNszaO1ucTjX5RZFgNvWGA3RYRX6pQLuklaczk5
         TZVQ==
X-Gm-Message-State: AOJu0YwLygCxD9iBzHcaUi/Dq/mTFirFC3oWjwjxYhOz9OXdMfjokRRK
	hLnqzitCWpa8N7i+qNfn+5QPFovndVJSL+jnrWmzbhjkljT0O9vzvSPGSMdt6OvS9O/xsTC7rQO
	y69k=
X-Gm-Gg: ASbGncv4GdNDiPFyLrKRoIhbqwozWr2pLheGiUZbn59zDtiGUdgYc3JcnfQSTq5vBNy
	rsXHYGQiU1QRV6U6WetZCQNcy/aKJ2AZ0YfbujDt2+B6qugyHmHrxxHpFtXCeLFDar+C1UAk4L5
	yjgEzQFIEnxR1hfHyRa72QKmAPFP/+HC3KtOEmNE9NamtQ6C8KY/Q+x52+r3gog8rfyPthEHf6T
	LTG9/QrJXpYrPDpfA3kVNbXZTnO6uDiaB5W8CK5YrAP/we481krQYROsEkAdp1n3Rf6nGpsP0I2
	kwy4CuGd2QGc2OB8LQo/ncz+BUQ5xiWVx9HJ+XXT53vvRA2ucMN75N0SN6vhHDlSK/yVMAtP7/o
	+wxJ5obHQ9zXEAzgBSg==
X-Google-Smtp-Source: AGHT+IFZKqmMEPcaW/w5n212Nd2w/unp0v2kpAheXmBLCc/XFth2xD1rDHeG8eQp5oAPx0bc3SMRcA==
X-Received: by 2002:a05:651c:1588:b0:30b:ce0a:3e63 with SMTP id 38308e7fff4ca-31ea28d4289mr8034511fa.7.1746016048688;
        Wed, 30 Apr 2025 05:27:28 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31e95ee3750sm2314491fa.80.2025.04.30.05.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:27:28 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] oeqa selftest wic.py: add ext4 to IMAGE_FSTYPES in test_exclude_path_with_extra_space
Date: Wed, 30 Apr 2025 15:27:01 +0300
Message-ID: <20250430122701.747803-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430122701.747803-1-mikko.rapeli@linaro.org>
References: <20250430122701.747803-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 12:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215744

All qemu machines have ext4 in IMAGE_FSTYPES which makes
native mkfs.ext4 available at wic image build time.
genericarm64 defaults to only wic in IMAGE_FSTYPES
and this test was failing:

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 148548.400000 = 114268 * 1.300000
| DEBUG: 652644.400000 = max(148548.400000, 8192)[148548.400000] + 504096
| DEBUG: 652645.000000 = int(652644.400000)
| DEBUG: 652645 = aligned(652645)
| DEBUG: returning 652645
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_wic
| INFO: Creating image(s)...
|
| ERROR: A native program mkfs.ext4 required to build the image was not found (see details above).
|
| Please make sure wic-tools have e2fsprogs-native in its DEPENDS, build it with 'bitbake wic-tools' and try again.
|
| WARNING: exit code 1 from a shell command.
NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 1bb6191327..c02760701e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -550,7 +550,7 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
                 wks.flush()
                 config = 'IMAGE_ROOTFS_EXTRA_SPACE = "500000"\n'\
                          'DEPENDS:pn-core-image-minimal += "wic-tools"\n'\
-                         'IMAGE_FSTYPES += "wic"\n'\
+                         'IMAGE_FSTYPES += "wic ext4"\n'\
                          'WKS_FILE = "%s"\n' % wks.name
                 self.append_config(config)
                 bitbake('core-image-minimal')
-- 
2.43.0


