Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12614C982D7
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 17:57:00 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16681.1789840613115715996
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 10:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rrEJZ/rQ;
 spf=pass (domain: konsulko.com, ip: 74.125.227.141, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso1918425a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789840612; x=1790445412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMaE2vIP7WA+kgTCbIcx9ikcU+heqEX6mGPKSmgXYZM=;
        b=rrEJZ/rQb3ddYF2fwksZoxPxEkci6SHv2Dqu4mQayzOssEKqkVnOpUJJVP44XKehbu
         LhVn904Y8k1rLy2eD2vmNoEkrHC/7DwvvWaph9roA1T8KZDlMWMs6PfRfVphXwXkGzQZ
         aF0fcDj76s2Gd5Y7Qq7gayoIZcMay12fq7NVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789840612; x=1790445412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMaE2vIP7WA+kgTCbIcx9ikcU+heqEX6mGPKSmgXYZM=;
        b=BVvWJFZMs1yM5JM9mKeJdXQEZhpPImhAKOT9Kr+8S65fxp++FmYiVqgOj5GnGQ/FOF
         Y6FW7V69scruhPdRS6vKmjw3Zc/GdvTEhL54d7iC7NGeWcF7+dTob2y9ghWNMg6ID1bn
         AWXvD4jTv0etMP4sA+DJ7FwQO5rFWfk59etGjV9O7aAz/XiawwXvWNusql6FvmCsrE6m
         mEujjcRqREYSrwa/TlyqDms6FerCHs3meDMcf4LIqIhDdiaSibbALjhhGEkTItWgTFy1
         9behCIwbpZi9cYRGkTX72X6VYTZOnzxvWcGIEY4zCGXJs1afb3ObIyaTjBdy40gq2vJn
         +Xeg==
X-Gm-Message-State: AFuF++mPI56XLReRP4A9+JhpdClW4D3IXLhgMXTlTu7nzFMu22yAcIme
	NNeoPEAGkTice3uhTlh3OeMapEOgm1ccWj/jIxMCva45ObLLXqzNBIlSA4LL+IooMPZRA7urJVM
	Kl5zn
X-Gm-Gg: AYBFou3x2rSQ8EKw3WmjDCm+Eneyl9uUF2D8BRIYzER+Nujs5CzlrnJc2eXNlGKJkjg
	3bunyrZiGCUDNaSpInbSwdGS7qbNQvO7xIvmVXmX15uMnxyNRA4pkIUy8CoB1BHZgqvkDefLFyi
	YGjnbGS34wB9Bps1PGokI1iG8uicRTrNnKGW3sMRB91GNw9A/OMUy4dU6Mx6sFvErMTh/8TTjDK
	htFmIxAZqZdqbzqgZaTRuxIK+ZsYxim0lpf/SwOxTOb4jp00rzTSqKSuE5uw93OiBMKBdqd8nyy
	s8V3srHHuZQ6oT3fExKFXvyy1fqsiqN2Ukvmvg1mmxk7IlzbggtFDszVfVo1Ro+4uDkFS+0F0Al
	EG7K9KLdEdINJUFGEhGT7xuktKzyXsnrlNMBf2/tudRXHU6oo1HYMQB+RjMIv5llDCdM26Xusr6
	nT6KXhxt37zLZYoC2TutaQifnuGyIQEm9dJ06rLJa+IvIg59jLKHk5Z3kWkjDTrHjXa0k4OmDfj
	MxtYzTVme0pv16No5jfJch5K/g=
X-Received: by 2002:a17:90b:2f0c:b0:39d:eda9:febf with SMTP id 98e67ed59e1d1-39e54ea5e7dmr12006351a91.18.1789840612453;
        Sat, 19 Sep 2026 10:56:52 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02625615dsm1304094a91.2.2026.09.19.10.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:56:51 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [wrynose][PATCH] at-spi2-core: RDEPENDS on gsettings-desktop-schemas
Date: Sat, 19 Sep 2026 10:56:36 -0700
Message-ID: <20260919175635.3228210-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 17:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246242

From: Tim Orling <tim.orling@konsulko.com>

at-spi-bus-launcher aborts when no compiled GSettings schema is present.

This has been a fatal error since [1]:
"26f75dc0 bus: Abort if we cannot get the default GSettingsSchemaSource"

[1] https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/26f75dc00eb16ccec89561aefe15f4036d45b4ec

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/atk/at-spi2-core_2.60.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
index 8e3314222c..a32cce56cb 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
@@ -23,6 +23,8 @@ DEPENDS = " \
 PROVIDES += "atk at-spi2-atk"
 RPROVIDES:${PN} += "atk at-spi2-atk"
 
+RDEPENDS:${PN}:append:class-target = " gsettings-desktop-schemas"
+
 inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gobject-introspection python3targetconfig
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
-- 
2.47.3


