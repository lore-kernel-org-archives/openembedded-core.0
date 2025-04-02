Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117A3C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.2286.1743577942585042453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TuhS4NMC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso41887665e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577940; x=1744182740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eYnHl8M2lDcr3Qc4UQe2LOmkanKFK3KRQ6naGKJw3s=;
        b=TuhS4NMCYt3MapQJbYnYthuNqJBVDv1tEPyniDb2I1P5b2GlOxiCPrpvXv6jB57cCf
         vMuxNBWNZ5TwZe5WoJ48YKCHZDEleLYuLQDY1r/IRRq7t5Ackfzpb+i4pKQm1dCzRyL5
         192dfOAGjx4ImR1AJy5msKHuchhT0P3dAUK/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577940; x=1744182740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eYnHl8M2lDcr3Qc4UQe2LOmkanKFK3KRQ6naGKJw3s=;
        b=rbw47/O/i/aL71AkT1Md0OnMxSu+JXv7TE0iOv9w2wI5zk+KTj6eFpNc7rv5xlywdV
         Zm4BSzO4XpZoqic1URYZPZbv4yITnHVkaw2Vl3IAdVyWXaFKOJy6/Sqt2jyKrZo58uQ6
         FficcQVcnOZFqb9TSWRsnqIgFPnAzNCb3tyrDmf93vCrZzVCKEacpzcGf9SgrXjqBGre
         EjRnt4AgmcniyPRl6RC1J0Vr/4dvpKwg8Y86D6Iy7sg1lXeUZdLazMiuviFZ1mCysBfI
         m3EXORdOBg8BNrM+JDft2m4epGvB7ZHO7rDMRFyDHvdrerxTA7jmY4RatD2cPCENYRK6
         UoeA==
X-Gm-Message-State: AOJu0YzpX2sWs3O5yuwutp8orgv6Nwso3FBUST6Win5v/lVKvUzyidxh
	oNgLiB2580lX8MKaT26dJOmd114mNr6DcxhUV8hzUxpySZg01yfp9cfIRW2Ok5eoPS+4Rh6CKJ6
	H
X-Gm-Gg: ASbGncuKln2chff66z1C83hmqdIo1OQeYwnug8sfE6KePQyZhxL473xbe+LOT7XaYIf
	eC01VqbJHCGeohsKKTVfKHwODeyAMFt20jDUbXNYTLfVIXFijYAJJQShA/nijkARkynmXDbVMJK
	T8f0W/q5UiL3829A+kLFofCijlF7jt+1Ou7jfgxFQA0XMfiGmNhBrMydZiSesg1cHr6pRsF0UiZ
	ONzRxYOs/qDJi0B+T9mthec6FDWnP5Xf89+2S+1DHs9Rkh59zTmNtJwm0TaaqGlx/Wz19IpTe6n
	30ekb26pzYcG9LiiYCU1VcgceIyz5X5VKn4ShQh06gHDtCgcUlsmpRuiJfNKg4Ob1Xn2yry5Ww=
	=
X-Google-Smtp-Source: AGHT+IHxa3IZRI08NRTM7lgWSiU//G+KrVnSjKFYyvPRaiQFewu3uN9tMXjywHrzMpBwA4LC1JUjCA==
X-Received: by 2002:a05:600c:4ecf:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-43eb5c70f6dmr9440555e9.21.1743577940469;
        Wed, 02 Apr 2025 00:12:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 47/48] sysklogd: upgrade 2.7.1 -> 2.7.2
Date: Wed,  2 Apr 2025 08:10:16 +0100
Message-ID: <20250402071017.2157620-47-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214220

Add tag to SRC_URI to verify SRCREV.

Rename files directory to be recipe specific.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/sysklogd/{files => sysklogd}/sysklogd   | 0
 .../sysklogd/{sysklogd_2.7.1.bb => sysklogd_2.7.2.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysklogd/{files => sysklogd}/sysklogd (100%)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.7.1.bb => sysklogd_2.7.2.bb} (95%)

diff --git a/meta/recipes-extended/sysklogd/files/sysklogd b/meta/recipes-extended/sysklogd/sysklogd/sysklogd
similarity index 100%
rename from meta/recipes-extended/sysklogd/files/sysklogd
rename to meta/recipes-extended/sysklogd/sysklogd/sysklogd
diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
similarity index 95%
rename from meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
index b7e32542772..ba69a7a8b8e 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.2.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
 
 inherit update-rc.d update-alternatives systemd autotools
 
-SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https;tag=v${PV} \
            file://sysklogd \
            "
 
-SRCREV = "5552a3ea0d025573a5e212d62ee3e04bd376c7c4"
+SRCREV = "5fb314cb9060afa3bd4eed2f0be3200f02f729e9"
 
 S = "${WORKDIR}/git"
 

