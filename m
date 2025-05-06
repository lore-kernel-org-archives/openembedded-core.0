Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DC0C3ABC4
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.78806.1746544460141371285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iSGdKkWM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264aefc45dso91386695ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544459; x=1747149259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHSzXOWSI13mk/wsTskFHyqQbELw1Nc2Gk+AMYcOPF4=;
        b=iSGdKkWME900LRFNCIU2lAuS7w2VHTvfj+ywqXFBZLRAoQqHiOSYpjVORLkGnuYKR7
         bOdu4IGiW1nxVkQzPmPNaoHZUsmo/tm2WtAssBJqrj38a/N5rk3o3cjQGOwv79V9AlEb
         t25sheTQAz2dKLf1fHwE8Q6Eag3dE12oNE0YdU7fsQCjprb1Rmv3E6Gjt0CK4EA4F+CK
         NunBdN7oP4LhwkiegZFsCQXqMK4lK6546kmkNAIj0UHuPVUazlfv0Ma430tH95AQiCqp
         t41Gh1JNx/HWibqVwHKhGYOTHMwdNFeqMt7ZUt1w0p/rzyDFZ6T27U+beYzDMaYCtcvd
         NgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544459; x=1747149259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHSzXOWSI13mk/wsTskFHyqQbELw1Nc2Gk+AMYcOPF4=;
        b=HuCeSDzh97b91EgtPsdR4wPWBGtLyGVbR6WWFX1EpIrLNOcwjsxywHLuuuDYW3YVx4
         twxXEcFlks/C5Yy8muOnloDBGOFl8++JrxyLLzck9PxUX5SYyX6X268Wm6ncoVTofnLK
         vtK39uExXMrECTqfAdQuAQ0GQ29xA+DVhGr1jXHPvYnhYMe/2XLvA4xH+ZRcx0AznJl6
         jmWhX7pjpay+11bnoKLEApkvCAGYASVCmomIf4UQJh+gPBTtHvWNQ2YPm8m3drwp1M8c
         V7PJeSAyEjiweGN7izYyTz4kZSAh+/1qhyu8xAdyQKfyRHv/Gm9W1VNuivMttXPL2qwL
         3o2A==
X-Gm-Message-State: AOJu0YybxVoclGj9K2fVEaS2MGEBnjm2BXv+g4EKrDJyTSX3awjHAHN7
	sz2EGD0GsqQp/t9LggxHU8fXWjBXijqP7RJVSbPs5pSGEqrDzKDnyfdOhJ3NePu/i0uSqKcM3E+
	r
X-Gm-Gg: ASbGncue6XhNdnGXtu8LKZYKuBo4OiRkcB8g0UQEW83LSLeQ57JSF+h7CvF2ZloID5j
	NSeI99Wg+wZrIeimsY52dpWBWMj2iHyMtd4E55Ivy/HxksPzSNq2EMPR4DZ918p5kiSK9mJ865O
	DUqC4C2u6aUsGbYSS4b8SURhzU58RJ+T1mdP9WWgPxLAcv/ubkmzSDumg/C79e5amTpjsq3qsK9
	tQdJCylSTOzFRV1qFlk5YTpyLE3F3BimwnOwPBn4fQJ6Qd7LvSVhPofwfhTUXQYkAO/4YukhVNl
	bhHwvMPOPAT6K+WhOghZgSAufuTP9MUl
X-Google-Smtp-Source: AGHT+IH701J6Xzo0Tel+NTWO3/YXBj1csWA84RtoogQ3HrePSvvzwmL8U/iBzpcgyWnbMM/RR1jL9g==
X-Received: by 2002:a17:903:248:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22e1e8ebb98mr157093215ad.4.1746544459464;
        Tue, 06 May 2025 08:14:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/7] bluez5: make media control a PACKAGECONFIG option
Date: Tue,  6 May 2025 08:13:58 -0700
Message-ID: <a51c54793c32cdb433230db4aa6842e41e32c214.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746544207.git.steve@sakoman.com>
References: <cover.1746544207.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216063

From: Jeroen Hofstee <jhofstee@victronenergy.com>

When not building with the default PACKAGECONFIG options, the build can fail
with:

undefined reference to `media_player_controller_create'
undefined reference to `media_player_set_status'

Otherwise. So disable it when not set and enable it by default.

The packageconfig option is the same as in Styhead.
https://github.com/openembedded/openembedded-core/commit/ebbdb7cf5c0a3f0e6773704d4c4cc570358ec611#diff-9d9284f6f27a81c75dffffd6d601b40c8266ae12e678d0a49c46bdb8356a0e91R52

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 39e1bf389c..731bfa0e40 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG ??= "obex-profiles \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     a2dp-profiles \
     avrcp-profiles \
+    mcp-profiles \
     network-profiles \
     hid-profiles \
     hog-profiles \
@@ -35,6 +36,7 @@ PACKAGECONFIG[nfc] = "--enable-nfc,--disable-nfc"
 PACKAGECONFIG[sap-profiles] = "--enable-sap,--disable-sap"
 PACKAGECONFIG[a2dp-profiles] = "--enable-a2dp,--disable-a2dp"
 PACKAGECONFIG[avrcp-profiles] = "--enable-avrcp,--disable-avrcp"
+PACKAGECONFIG[mcp-profiles] = "--enable-mcp,--disable-mcp"
 PACKAGECONFIG[network-profiles] = "--enable-network,--disable-network"
 PACKAGECONFIG[hid-profiles] = "--enable-hid,--disable-hid"
 PACKAGECONFIG[hog-profiles] = "--enable-hog,--disable-hog"
-- 
2.43.0


