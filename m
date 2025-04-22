Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE23C369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:35:26 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.41498.1745332519219484205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SfZSght6;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54addb5a139so5586488e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332517; x=1745937317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVtNEsQsQHnVchnr42hG4Sh6Uqd8oPw0FOn6nK/YPJM=;
        b=SfZSght6pIXEfWh2w9G6y54LUNRt2WINZ7R5MHPFX4VPo7YXPBc9fEiS2beQ3fqvtR
         WQsMq8VjYyQ9uHfmPfGCiw4J9TOv+2Kzv6huOEk5efeY5wAE4VKgPnyg441zxqjvduwR
         ejWQdzlNBWCLXcvGVFMlB3vvKECuTkBtyWByiD3s/o8fUd+exIJ7wSHA3BbUJohzuQuD
         fkFPE8fEwtxceUfgywCwpy8jMgx9V4lXSDW6G9BrqlTolYe1modBs3sk0DUMQgj3VyvI
         2N+xnDXVRcazsnDaXDvEg01Jze13kOQlkgwaIU0Am15f0y8xfy3XTrEG2M5fDmDYd7F9
         GKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332517; x=1745937317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVtNEsQsQHnVchnr42hG4Sh6Uqd8oPw0FOn6nK/YPJM=;
        b=YGnB6Syx2m/Zvv3Z3TmbTu4n8rywR6+rfx+fBgIymgejKwcjd822YvMBWcbs02DFMd
         P1agYSd1grYrf6/OSI+lki2n7IgwEgT6T4NZtclbF2nqzvidfii2X5KVbqoKkC8lFRia
         LLSfyXijDQjfO0mwp3LdNvHkrJpNTL+LlrPLGXKxVe3uozwCAlT3wkdUX+vPgLewWMnl
         cL/sd8hH4rIjDmUtkwvqQgi4ietMGUHoh3KanQKOqnbOeeBo01M915DaOfJ47FNdzkKz
         5UM+YLNmWFkiyt1/C8odwjgB5DVbMmA7OgYl/iZqG7eOLU5CUP+oLBGiOHfntO70dJPq
         4fNA==
X-Gm-Message-State: AOJu0YzV2IqvyhJScqesDto8HViouFsH083txCWBaXY+OzMmgdegzRAM
	BEhnb/63AuPlEOMnehq3Z7VTVtgDAvorkHKh0rUzuAqAyD38rsbWN88gxdJCLVnLLJsc0sTXdTM
	PRJU=
X-Gm-Gg: ASbGncsxoEp66bhYL0fq1/LCIH2snH/GHJOOl0snxWuPS6VXaVEUmGBRk9IFOK3rV1+
	aaES6Q9I9d70RE+jtmtqXAG2c/kpwiLRMQuvaAN54WyEGu7ZTnSBWr+M+dNKQbJ9uvQ5e5OGStS
	4FTHAS1DAu/cucJkaKPrCeORVGCExubI3wft4Gtg/1U7A9ry8odggJeS4y7+6zAGcDg8DEPYat2
	NCES8b8HcfnEPin9gAUHMWoiWMMIHuUS0GY0nhg2dYjXQJUMfY/W51OQ7V9FhfdvjiTmBDU8P7f
	XAn0aS0kXgdbxHnMp/WFpdrIcPbR5p8if+n2kbS5qO57tlsTD+kfKY5t158uWgdGg2E+OTSlwYx
	ZSa4XiRgnm1qhUK3BWQ==
X-Google-Smtp-Source: AGHT+IHviSTSGSIzJlcEe3tnkxCdxTSMAYDgx/UB+xo3VBpI1XRZtZgdpZWN9foV6LOAUvTFCLDjDA==
X-Received: by 2002:a05:6512:6d1:b0:54b:104b:dfcd with SMTP id 2adb3069b0e04-54d6e662163mr3396344e87.53.1745332517220;
        Tue, 22 Apr 2025 07:35:17 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d0837sm1236503e87.118.2025.04.22.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:35:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 1/9] poky-altcfg.conf: enable "efi" in DISTRO_FEATURES
Date: Tue, 22 Apr 2025 17:34:53 +0300
Message-ID: <20250422143501.99565-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422143501.99565-1-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215215

oe-core machines like genericarm64 already enable "efi" in
MACHINE_FEATURES but this does not enable systemd side
"efi" support and thus systemd does not mount ESP
partition for example.

Enabling "efi" in systemd PACKAGECONFIG got negative comments
in review. Also enabling systemd "efi" support via MACHINE_FEATURES
was rejected. Thus enabling this as distro feature for "poky-altcfg".

Many HW targets come with UEFI compatible firmware by default.
For example u-boot enables UEFI support by default on all targets.

This enables seeing UEFI firmware interfaces and data
in userspace since "efivars" is now mounted by systemd
to /sys/firmware/efi/efivars. Things like UEFI bootloader
(grub, systemd-boot etc) selections and secure boot status
can be queried from there.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-poky/conf/distro/poky-altcfg.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/distro/poky-altcfg.conf
index 3d64bdd1fe..e56c4f0a37 100644
--- a/meta-poky/conf/distro/poky-altcfg.conf
+++ b/meta-poky/conf/distro/poky-altcfg.conf
@@ -14,4 +14,7 @@ POKY_INIT_MANAGER:poky-altcfg = "systemd"
 # systemd isn't suitable with musl
 POKY_INIT_MANAGER:poky-altcfg:libc-musl = "sysvinit"
 
+# for systemd etc UEFI support
+DISTRO_FEATURES:append = " efi"
+
 require conf/distro/include/poky-distro-alt-test-config.inc
-- 
2.43.0


