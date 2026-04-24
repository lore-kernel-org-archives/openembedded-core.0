Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15A6FF884E
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31980.1777064216738576750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J+A9gB78;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso113586215e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064215; x=1777669015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/VSUXTnwVv1RDHlKtSJqqkV42KRG/KgX4jMHmprskY=;
        b=J+A9gB78LD1cQ4i2UQazmDrn5n/6Ys3WyZ0h/7S2sGOLSSFcxhwoeh5OzAUljVBsms
         DMqozoIzfUYHxmAfoMqPr+Q5MneWHIU96rwcfhvCCtewmQ8IF4USDY058EPyP/VhWTtJ
         GsTLAOidi/cRNR9R6u3cq77Z3PE10jfanUARg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064215; x=1777669015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n/VSUXTnwVv1RDHlKtSJqqkV42KRG/KgX4jMHmprskY=;
        b=pmzfijncZwRzyylI/hcPTtfYt4O9cCyGKZDa/09ROPpjDkTrT2zWZbBqvTh3uOkWcQ
         Bww0p0iZYNorJHFjRb2Q8MoCo3mDI57VV/p4DPCRXXXczsX+IV7mCMr5ZEg64+HDlScD
         s2hMhioz2/PTRg5FR68lrIrdOGBgvltyxGGPOZoV8ZSIx3ayhX718bVnFCTvYle9bh90
         6q5mc1MUxeb3Xg7RLSxHK+8OH60GXWsG965cpD5ij8h4x0XzEHj/zvgFmmuGAcczzWaZ
         94ey8ZQJ0IP797SIhBr5lXysfD6ndoz+x7dzXEblyuCA4DwN3mmfY4vU3QJSoQ1kawek
         fZ1g==
X-Gm-Message-State: AOJu0YwJS3RcdAgDPK9hHAKDcGaWnlAdoMSCTf5WefCSRuYByBOm5CtZ
	z0uNJGFS8eijzE2rOvFHKGvSCJR527WbUuU02uTn3GFYav3nvfOHXks4a/aJDK+eNDs3WlTxAuI
	DAtdtMwRaAA==
X-Gm-Gg: AeBDiesx8xQUyIgDA+Y01i/p+0onIFrBsi7i0H5vdG0TVtQ9V9jLemXO6hk5g1RT5Vh
	gIjooxui7SLP6a+yB47rV3zPzmRo9kUyyQX2esW24Xxd8DKwwlNkYZhmxE72fl6IIpfMwmrz3Ti
	kiFn5gVcgqbBGjECWjzhWOchCDAoBjzSnJaz4DLeL/B33PZgYazLFLJFPSZhIY30GTnfnyCdhGN
	/oYFYMaejJb79xFKBrbnMIi+hE4TzfM8hJJOZKW7WGKDP21dcwfjJRPTGBlaTsU4Nvm8UIek59S
	QfmReoIrSV8aigZ0QwXgvzo6yMTO1W/Ml6g8P6Bw71KmiDdQ/TbMj4+E82V1NovYUWyIM+bfCOW
	61yqjgNFvtWOIWonoXd2jsRg7LBA3yNE8Dny8GCP8Qf0ky8gnsjW3Ib4jHe2pePnKMsbJOS3MiJ
	zj0h2G3vNB/d8bgKec2UqbsbzOFRsMcakfkfqHdsa2d2QqyTamUNcHzUkJPJ0QJV1Npnbcz3/wW
	0/xnEuoXwdroqas/PGbMicZ6H3seV1P5hHatm96D2fDJq5S
X-Received: by 2002:a05:600c:4fc7:b0:488:dbcb:ca08 with SMTP id 5b1f17b1804b1-488fb787a62mr462368815e9.30.1777064214979;
        Fri, 24 Apr 2026 13:56:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/66] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Fri, 24 Apr 2026 22:55:31 +0200
Message-ID: <5538c6c4dd64e1360428a98e4a45beab826eec3c.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235905

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building nativesdk-libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8340d4be03646f0b4b599f768ddc88f502f93615)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index ee6875aa05d..11ec87c14e8 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -23,6 +23,7 @@ S = "${WORKDIR}/git"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

