Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0BACAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 21:09:23 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.92.1758661762573005843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 14:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XM2PpTrm;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77d94c6562fso6088018b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758661762; x=1759266562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYkd/85Uk7DfrWJxYQC+C4ACxfbLsVZJ0wjtrM5LJ00=;
        b=XM2PpTrmK5CfBFTbHxE5HiGFTPd6fj/yNPrinNRpWH0RfFk5Cic2t1UpGcoLXdttJ6
         kjEtjzD4xA1DRk/UGyR/QqsfSepUC4326UQtWOeP60sxK+yoXwHB2hcMwd0t4/0MdSr7
         U3kpmHcxS0MAbQqqYbg+umi4UWcuXZlKufDjYmO4muYiX4H1W0uL80/6lqpp5SYTAlcX
         mwmpEs1mvnbjI2OYfe6RTs7YEfA7S6bdqIUg/3kJgHmG4v3If3Ecr2YYe2oTxvqarXwr
         ZILq0vegwpNjwP/NfNrsRgQHTJHmY9X9p10Sq5XQRGDwld73+K2I0wt1PVRS1tO5NH0/
         suyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758661762; x=1759266562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYkd/85Uk7DfrWJxYQC+C4ACxfbLsVZJ0wjtrM5LJ00=;
        b=L8cvn4UoeKPVS5gkNTY+gTxmOsYAOUDfRmm75xHHenXWi9G8ddwdXfPGmdqYF1ZoA/
         uzGxoOpzjH3gKaOCKaKDUKEowStnS9x01zzDtjERrTYmaOk98E55XpXkDZaoMiKFzIpd
         Fhi+k2tuMiAPf2/7mQ1sq4sHBckabJ05rjJdQ8TtAeDSeYEhws47D/TvClFpyyxHht0y
         rHm828v6k9mQZWM4noEChld94Hl7n6cNdUYpA0kpvgaBV91XW/tSH6utU5jgyEUIEaLz
         K4uBxChnfcee04xYoNQH9+ZJbpMl6aIVenMEhdLGzosCwpzEZPjZuWhlYBTODpnWu7ZT
         jbjA==
X-Gm-Message-State: AOJu0YyA2YrR6yyP+iXeMXplCAA4LMeCuzdBHQFXzF9xH3W7PVi0cYvq
	xgVeP4oZRl3zwHy5eRuT9s9nbUd8of0S8wtzkto/XDgSvG8y3RfXvA7jr8xHCUAB
X-Gm-Gg: ASbGncunE8LxWF0HcGp95dkQ4G4u1aoSbcRuVK9Ca3gMNPSguFw2RP/ZqCqexr9BtjA
	ZTrKqrqcD9uQhaF7njV3DUu77M9tdSLdxtgpFPJXrgDtmoL0W7+jwc54GfLcF756oJoAyQOi+/o
	RiJnHz4k4hzLmRYiqcfjRqLKOLQdUnsPqZ55JNateahof7Dj16ryLX3ONy5FCdt43KFU9CplzVD
	cOR6O2fGDfWZn2MTtAHjlWCiT3HHk+bq3mmeZ1I1k/6jRwyMvu9sA3ob5phLF4C45Zc5mkmQKUK
	n5y6pbn3oHAWPv2Eya5vTyc7DVIlh+R6PsY0I6TOEqll64SXnbWiJjNn337WulT/M4cgVW3O5nk
	cGNkLyPJ3SUcid8EfcLwn+adhT3TjmSIha9JuRYTZ9JbHx59PAQ7eNYAa4/le7FiOhpFaDXephu
	XDvgKWhYcAJq5aTNUnnhgD7GiUaS6T32gEoV8QLDWZ
X-Google-Smtp-Source: AGHT+IFBzAxDKSBOx2L8euGPwXeWS4AB/D8thTuX8nEneCghSYD7+Jnj99RO6pb6p9oEiJI/A+ohCw==
X-Received: by 2002:a05:6a20:3d0a:b0:2c9:1323:f800 with SMTP id adf61e73a8af0-2d0008e9840mr4609869637.9.1758661761677;
        Tue, 23 Sep 2025 14:09:21 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7309])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f4594a76bsm5331103b3a.62.2025.09.23.14.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 14:09:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bitbake.conf: Filter in ld-is-lld to nativesdk recipes
Date: Tue, 23 Sep 2025 14:09:19 -0700
Message-ID: <20250923210919.3708631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 21:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223928

when DISTRO_FEATURES have ld-is-lld, the intent is to use
it as default not only for target builds but also for SDKs
which is generated. Therefore this feature should be applied
to nativesdk sub-system when it is specified as distro policy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index eebefc48406..e0f9d59cecd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -916,7 +916,7 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod ld-is-lld opencl opengl wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"

