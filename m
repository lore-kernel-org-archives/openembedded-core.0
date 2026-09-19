Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD19C982D7
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 18:43:50 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17404.1789843426643099899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 11:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pLbtthVl;
 spf=pass (domain: konsulko.com, ip: 74.125.227.141, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so11490545ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789843426; x=1790448226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mr+a7C1rtn2TX6DAkSp/68pkds2NSR+WSRAKXoybvvw=;
        b=pLbtthVlfgVEKUu52XxJXu4hmUWS7V/jmTESkDCRHKnFJSY/uYiz1DnrtDPXTJtAuz
         DoKZJHpQmDw8VNnli6MuaR0GuJgMzJqhUdcv7amas99mIlBoMvp4fOV+baPhrYY29k+i
         nghbTSiLXWLYJxqRBgAbTuZq5iVdBn0ougiyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789843426; x=1790448226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mr+a7C1rtn2TX6DAkSp/68pkds2NSR+WSRAKXoybvvw=;
        b=zFplTSzt1Q3dzjBrkrvfXh0FXn+pjhQVvmN3ka1gs9VM3FepRaaPi61qZXAcUtqBqx
         wgIq1O1UCRJKA3+Vfbumldlb6Ty75a9gvQiwb3khndtZlHxnBfPmkxRXzM8rgTIfKHpO
         dTCZD8YpF40NhNg385ugNNnzoF5OiquOk1L9gqMJAmUdQ6l/vTT1XHoDNBoxlXeGwRg3
         joSYkpW9vA4xUqXj6w3GeTdO2Bwxv52W6KKhW3TATIVX+MamlrXgbgk8FbfSU8E2ePgs
         x/EeMMm6793SdVjIrDmhmwyLxqnNbTWY52MTi61fATL6nacUAxh0HYvC28VkDQGq0cuT
         bm9Q==
X-Gm-Message-State: AFuF++nvGSYWlj2c4m6gK2wrSOcc0FqnTJ7VnoT4gBJAiyJODj06hLtZ
	1CjwzelPTScFivKbId+4avzp4yv6aqsugvABKwdAvsaWzLygmK/84EDXYWJZ25wTeYhVx4iEaIh
	BRRSj
X-Gm-Gg: AYBFou2kzGcqFsY+b3pIZDvzI6VewskM2QnM9ckFKLtY5++qGRRDb61veQ+RELZDPuC
	ok4VJtCEh1eRcT1dxa92bogoqCruZjs0yTcNpBDcAXw5DneLPefnpa4oVascmymHqTR9WT9cBrL
	ZF8kLrb8XuPMsiRrISbz6XhNhOdBWMpTf5KObvkgA7o6wLPn/kUXQ+2ZBZj2M1EV27fKJTMg9re
	vIqcCFQ/GnJW/No2lm3k/B0kGJdBnxIMuIk0sfqIde5PeETm51ckuGnp+xUTBjqEuTK+bA4mI+d
	iW5aO45shC0ImQQsUhZo7gMZZTfOySy53CuOzjjDI1mVRM/vHtUmzMEqzSfYzku9VijlRmf2ydf
	r8AxjkhMXqeBdv+UdUp9drttOCmVcFCRCHJLX/q5VRXwYDQb06WaN5uRVRMVMEPuy1dK1nTShv3
	tx2IOvcnUboCBlWrUcA43q0/4tUnA9k8+BWwSLAYGMndFXXBzyM9/G40j1+gWp5jAqqIeKQOUE8
	FzI2me+CtJtAfEnC4+2MlEwcFk=
X-Received: by 2002:a17:902:ecc4:b0:2dd:ad74:6d20 with SMTP id d9443c01a7336-2ddb1bc62afmr118556425ad.29.1789843425954;
        Sat, 19 Sep 2026 11:43:45 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179d2aesm12069345ad.30.2026.09.19.11.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:43:45 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [scarthgap][PATCH] at-spi2-core: RDEPENDS on gsettings-desktop-schemas
Date: Sat, 19 Sep 2026 11:43:32 -0700
Message-ID: <20260919184331.1040773-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246243

From: Tim Orling <tim.orling@konsulko.com>

at-spi-bus-launcher aborts when no compiled GSettings schema is present.

This has been a fatal error since [1]:
"26f75dc0 bus: Abort if we cannot get the default GSettingsSchemaSource"

[1] https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/26f75dc00eb16ccec89561aefe15f4036d45b4ec

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/atk/at-spi2-core_2.50.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.50.1.bb b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
index 6996ebebcd..e63eb13e72 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
@@ -25,6 +25,8 @@ DEPENDS = " \
 PROVIDES += "atk at-spi2-atk"
 RPROVIDES:${PN} += "atk at-spi2-atk"
 
+RDEPENDS:${PN}:append:class-target = " gsettings-desktop-schemas"
+
 inherit meson gi-docgen gettext systemd pkgconfig upstream-version-is-even gobject-introspection
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
-- 
2.47.3


