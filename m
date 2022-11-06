Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF621C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:31 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.16500.1667744308760119968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=T+g9rm3f;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id k5so8345309pjo.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ki/YcT1N2g/o/WFaYUSGKOHlPXLAqrHTL88vx7Mlxs=;
        b=T+g9rm3fYIUzacS4Jf7na2RbfYEdwJX/ptTZzWMlUTX8OXjkgBv3ibTjMTLRKBLZ9K
         GdB6JEItscXz0fruspMAxKjTi3zSk8PZZtx4WtZ4wIg3n0P0iFhon2NoS62NKt4HsQsS
         c3SfyKYgSEhX5DpyFoka6mu65ExCDQr7BWN2ic1HGnp6odw4PzlquapcJhAA8z5v0WYg
         xw5Og6w+Fov6vWYlh8lI5oNV1DrDJ3JpPF9nkmmA1By2SUK5s/SgReuQEmckeR1U4P6C
         bgkqruRB1cofKYvu8NXC8FVxreGLMlD+Y85lKD8//y45Boqt4TfXeP5O6Yo9Jkp/bs6h
         ylJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ki/YcT1N2g/o/WFaYUSGKOHlPXLAqrHTL88vx7Mlxs=;
        b=ddw/1pLLdtSmLs3NNPVzK9jamWOHf91NeB7IVMmJa/cM5RHM9O9QYhqYBlBQLHihIJ
         kxt+rjfbsX4xxgfj2TD4+Oixvq8etcunBHEK7bXLjW88DVG3HYYsH15KlGrlMo8D4q14
         IFfo2x3RMC7W3LPvos6AXQZtUENcwZVRZUeBudeBuJ0zW58IaRDwXWQ02HMQ/0a9PDuH
         G9KXWXleEtmx8ckSmEPjOFSFUTRD9PVodZU+d16RlkkuX2LJoAatIAWb9xFnwrcQ5KPz
         lpxlonscNtYz5qiiJf+H9UQrypvMNDsYtAIAhkPjD6pgPtTJ9UNsLYdKn/mCWaP/NRCr
         L+Uw==
X-Gm-Message-State: ACrzQf03E3I4lQhX8NZFOgD1MXDo67nyvV1nswFgZx1FITQhLLDUm4d9
	DNt1l5kbC0NT6YQdEfxMMgxBNoo1lZAW1DOR
X-Google-Smtp-Source: AMsMyM7BCg6wroQtL/EssYwB3WdYzlTPb/G8zGkeSEXQ1jaSUxUHZE0pGxhnWYHuCoKB3wIswvoHvg==
X-Received: by 2002:a17:903:1205:b0:178:ac4e:70b8 with SMTP id l5-20020a170903120500b00178ac4e70b8mr45509052plh.52.1667744307830;
        Sun, 06 Nov 2022 06:18:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 29/34] uboot-sign: Fix using wrong KEY_REQ_ARGS
Date: Sun,  6 Nov 2022 04:17:12 -1000
Message-Id: <f01b15fcffd1a628a17caf1e94753c8cd09ea48f.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172797

From: Sean Anderson <sean.anderson@seco.com>

When generating our SPL-verifying certificate, we use FIT_KEY_REQ_ARGS,
which is intended for the U-Boot-verifying certificate. Instead, use
UBOOT_FIT_KEY_REQ_ARGS.

Fixes: 0e6b0fefa0 ("u-boot: Use a different Key for SPL signing")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a2d939ccb182a1ad29280d236b9f9e1d09527af1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index debbf23ec6..4b5912a01d 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -298,7 +298,7 @@ do_uboot_generate_rsa_keys() {
 				"${UBOOT_FIT_SIGN_NUMBITS}"
 
 			echo "Generating certificate for signing U-Boot fitImage"
-			openssl req ${FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
+			openssl req ${UBOOT_FIT_KEY_REQ_ARGS} "${UBOOT_FIT_KEY_SIGN_PKCS}" \
 				-key "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".key \
 				-out "${SPL_SIGN_KEYDIR}/${SPL_SIGN_KEYNAME}".crt
 		fi
-- 
2.25.1


