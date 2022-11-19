Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24703C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.30667.1668892559935268922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jPeYYVR9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id y14-20020a17090a2b4e00b002189a1b84d4so1647709pjc.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Im6TR76ttRMQ+ry3zrTBTsDYns6HGOXIVUVPbU7ucA=;
        b=jPeYYVR9qaeMN+Yo/J5svyW1b1aKpQBw8JzmpdVNIVyQTNBEPooSNZ12zR0omPpz/t
         uHM8FiC1vacZdMtktItzasPVYA7/5vsxxz99dMdHeKs+hlVRYdI8QVJidnENxvXPimJr
         mfu9lNAD/IzB3HFmL2Lm2+IG03Wr4pVAH2444XEyh/1mQ/k1xrVkTdel0uOejwmuR0O3
         wXFwhfApvJw56shwGgFCrpA4AZUujsOApVo/xCSETnpkWDVn/WG/No6xWNOzWfSb4uR0
         rNBKo8sU7bCdyNG6e2rTtu5jz0p/0eWN77sQOeUCpQewbfHPH75CSk29igVbzQoGmuWK
         bY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Im6TR76ttRMQ+ry3zrTBTsDYns6HGOXIVUVPbU7ucA=;
        b=hBROUrP2VmUmmCw8lig7lQOYZ+3Ys3AaMxL7y7kbbvmdMqeWqkWO1dN+IpGKQ4HVPy
         DGR/UmhTq2afZpNT0z1V2x55q/T2TDx36gnxps5ITFT3eEUdW7lUEqd92NBT9Q3cQ/fm
         7UkTkZSScArxbvly4NanSdmZ1LVLnd/SJJ5trtZkb8Lg2mbTxWEvxeRVivrb1ZN55Beu
         Gm+DZYX1iyEkVOEbnC6T2IDooSCHYNNlR7DUZKtp6NMa+vzdcx37CFHxzIRrockDrwjt
         2MRqwQSjSV0Ail54qgZxuZ/LOxswIWq7niqsSg56FEshbmWP1Q3fAAdSyYiSfhneVSGP
         GsdQ==
X-Gm-Message-State: ANoB5pm5SAL5tSm96lM8GeE+d1OJDkDTEq4n+1IyvBlqCEfK7+vQFysY
	MJWFEHM1UKsiHt4EkNVVni24eGQDX+k+GVsbkGY=
X-Google-Smtp-Source: AA0mqf4uPqjjWFKLuQiwJa/FhUDgWTZAqmMIBp6weXgVvyIUsKYkqGHu/ULTto/jZbPOtSSTI0uW4Q==
X-Received: by 2002:a17:90a:f48d:b0:212:c877:e948 with SMTP id bx13-20020a17090af48d00b00212c877e948mr20058002pjb.39.1668892558908;
        Sat, 19 Nov 2022 13:15:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/35] libffi: submit patch upstream
Date: Sat, 19 Nov 2022 11:14:58 -1000
Message-Id: <7d1ff6602e683b03457ad97c763593f466616a2a.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173559

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9555a7dc768c32a009333232e25cef041054b7f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
index 5e529d1ce7..4233799501 100644
--- a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
+++ b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
@@ -11,7 +11,7 @@ https://github.com/libffi/libffi/issues/607. Now that
 clang supports the LDC and SDC instructions, this mitigation
 has been reverted.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/747]
 Signed-off-by: Brett Warren <brett.warren@arm.com>
 ---
  src/arm/sysv.S | 33 ---------------------------------
-- 
2.25.1


