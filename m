Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C60C44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:59 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9343.1783835509454658104
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=jHPdpyn9;
 spf=pass (domain: underview.tech, ip: 74.125.224.53, mailfrom: vince@underview.tech)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6675db463b9so1851265d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835508; x=1784440308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xVxz9GtVTGTsjVvp9X2ONZJt1qKJzxvkBLiP1Pzf0E=;
        b=jHPdpyn9Ao6T5pHpzsoN6vaf7H7qpHcvMnFqooHhtJtZdUxSb/vgIHmuVBe/bRriOE
         xqK7LBv58TxZ/4zcOkRkYh7/+Fsj9NbtH1nmff7yHnaS4nkS9TgsDVfjz5lla2AhPtNw
         49xAz7C2v9rg//hJ4sYC55Tct0TrHAdK3hFY6V90X0vizFPDnC73Hd5AvP9/5snwDYiW
         oyBC5gdaXPcRxwvjb7X3032o0tolYT/GXf2cjVKLQ47azVxc6JC/c2dRk4aA4eW74Oq1
         4ksK91jbwT7zTm+izHNvFGoJHu/9gLIxQ5yAqcjgudK3reDAWosLSUON2NHejg8LtO9L
         +mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835508; x=1784440308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xVxz9GtVTGTsjVvp9X2ONZJt1qKJzxvkBLiP1Pzf0E=;
        b=ABcD4IKEuX5j4b00ZJ7wCuBuGbfgGBiAC6tgRq2vqdnt4Zu6tUODrS1Cmk/azlaXRG
         HxiXd4aSEeTVolA8gq64d5UBl8nnwoSJOiZjTH6TRh1rJr/Em4ZeN6Cc6yeLJKBjA3/G
         owq1snB/N6X9RNmLG67Mtm35W0b3B6shKagOJoqiZorhncYaj5cwuRJpU7HgvghlI9nc
         YlpW0jKBl/EFyu5Dmk9BGCYEiwHDFcLmPxNsYwmlZPnXU3WlsAPVwx9E1FA2pS/1P1Ja
         HMvzmw6Coc8QY6hyx6OIRHWaQ1Q0qo94Pp76xcUq0B8651/8y4RrJkRqO4Z68V6qFWdJ
         4hrg==
X-Gm-Message-State: AOJu0Yy8UOs8CwwYLfC17Kj3KG5tIvA2uU+vb5qHu6NSemzcdLYH2CNG
	SnJk9U9HVUkJMFdZ1Zxs8/F7vt8g1Rxx+45Eq1bpxt/gQAyR5jZiVHVja3Sr+gAk8gTmRuutW8P
	EZFoRbog=
X-Gm-Gg: AfdE7cmpH3EAA914nF1UsDgiaWQ7ephUPqu2cs6SDQEJ7tcr2j42Np6ok0/yO89LAMR
	9IQcZMq3M3CHRvNXCW6B0Xl+8g/LzP6AaJ78EbxrTvUsBpmX6YSJMmUlmWmlXtyVTP6jujUXgXn
	zlY4SUbVREB4HMPfV5E6urg+zuWBRwpJ+B1E6ihSHqOYW4HmyfqrBkI72QV34TfvGdP4ZGzI18m
	UWwPr3EKCEqUEg7CCwee/AS8tFbgKSDY8KsQDWN3vmJmNZi9b5ObErL0Oqnn5ok2CsdX7N2kfO+
	fS5Kl0dFxv7EmD+3bsZPBTGfbVN9uDmekUNw0sCft5jysU6Kl3S3yOwNevRqBUXGIZD0QTh57OV
	aRPn/SuhMH3pNUqnyu8IoJA0qQ7OGm1u3mKxK7XmJZ8PelpZ19eNQZygVRwa6sz5WvW1VD5K2fz
	poQ4C0AqGObJ91lw==
X-Received: by 2002:a05:690e:50c:b0:667:8b91:2436 with SMTP id 956f58d0204a3-667d7c94b2fmr2761203d50.101.1783835508500;
        Sat, 11 Jul 2026 22:51:48 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:48 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 19/26] efivar: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:47 -0400
Message-ID: <20260712054954.4063745-19-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240744

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/efivar/efivar_39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_39.bb b/meta/recipes-bsp/efivar/efivar_39.bb
index e5839f7a99..b15279239d 100644
--- a/meta/recipes-bsp/efivar/efivar_39.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -28,6 +28,6 @@ do_install() {
 
 BBCLASSEXTEND = "native"
 
-RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
+RRECOMMENDS:${PN}:class-target = "${KERNEL_PACKAGE_NAME}-module-efivarfs"
 
 CLEANBROKEN = "1"
-- 
2.43.0


