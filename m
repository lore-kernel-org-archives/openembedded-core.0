Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895FACA5FE5
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 21:11:31 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4385.1790975490420260710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 14:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=D8wUhqcu;
 spf=pass (domain: ossystems.com.br, ip: 74.125.229.41, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso37875eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1790975490; x=1791580290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxkHay9jBCtB5Z6oOn14KDPWYq7Wm/mgL1LxD1RgLdA=;
        b=D8wUhqcu7eOoAxa4Oj7XSP5rcnDQA4eCiRVoVicwqGMdxp6r5DI2HS0FmaLW9Awmc2
         OTIOFWGUzLD0Xe2sB+y8iMsUY3FKSDynfwDZbVUs8lmlWOjSX3JDJhCGx1//ehDgnZne
         Zhi1Z/eT4Q8oE0Tu7p5PgbYqrzh7gj8mXkT99aTrVdoBU3H0q9KIzYyoAdFoxvjsHnoU
         mgDuvv/fOQyn5k9UBl0TOl5FUgsCqd+F/pwiFKMD3yWghdQvFTTgYYOq4w+Y66Uuqbaa
         PMVeBaKjHFNv6egzwld067SLqXedrnQVaK4qWCc2rdCQTp77ziPTHU40xIS3epedeAzR
         aq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975490; x=1791580290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxkHay9jBCtB5Z6oOn14KDPWYq7Wm/mgL1LxD1RgLdA=;
        b=yuqqTCP8tx6zGLJv/P3fZtvshk9Z3G/AhswiHrQfk6oUD91e78ZwpCgX6ky0v+3k3B
         +hXT6jt7lJPPbKgDFAHbc6X9tEp3AtfBLeZta96mw6MZQs8Th/BrDdjLspXs1jybGfBY
         ru5hazCGJYKcM4axz9hd7NMqer+LPdxcAfU1WGxvXGvhO7qe9U6ue+gVGYzAymji6lyN
         BZ0+YxnUdm6GvII4gkZO1G+j+ceDGboVoN+g5uSDzzmpBlQ+Jrjn0b4NC56fxn+Rk09L
         N43OWGgUWZHPgnGewQuMDxURWK4f4hTEmqORWkT0P6Cra50zI94R8Pw0aHdKE2tqJYYE
         fLjg==
X-Gm-Message-State: AFq9FYLrLqVMvtFGY2JzheD2y4Y0uTIDhMZl42wL/2xH1dFzXqycHx7q
	NdelQ62TZ0NoyTdXGSyaYF7Dug+YD8GcJM2+9eQNpdL7X3NTCHb3/fyz0faWGNBHF862Kq4qRoz
	3AD7p
X-Gm-Gg: AYBFou30GGdx15DXNkZ1nDd5C+yqZ1LkLWDbaTmLh0P0yoXZWVDBslLVQ4NQuyBU9dp
	jJZ8U64SILjz0jukmo2+gKXCSpZnKGXjId2GLJl4R5uiO5/KoBJ2a3GPtgOFzkhp1EMx2LULXaj
	e8B6BWjjjeCCIkE2XhG59eLqViwYtZyU/42Tgg2zfCatRWAHjJm5PZ8U80aY91rFAeCuqFyWxFS
	G08sx7DdhKGSiEKW43uG3l2er/tm9yarLjyTvFC9DGwIZqk83gughpt5PdpSx9FyaLCbGnvvU/e
	t0nU48rJM8AgKRz3urk/Tk00mu5dZm/cNNHmz0b0Ni1FoCYkyL8mw8D8HTfhLYm50muEGaDb9o/
	L7WagLugnVGZYkgtKxNPWrc30N5ToGvIyw7n4Z6Iw4Qb8Tl/3OqsqqsuZAHHMfMxXoYfwPsTE5m
	WeIUcUrOHExqm8Thk7cA8kXYGmaFUqV0uYe4itvSTRsVlCnKErK8xkx2KFUl+Q2SF2uTTw1zwk3
	abpxcrejmoObzTt9NqkxiHhZpJxkg==
X-Received: by 2002:a05:693c:638c:20b0:342:645a:5cf with SMTP id 5a478bee46e88-34f14f2b9dfmr4239972eec.1.1790975489676;
        Fri, 02 Oct 2026 14:11:29 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510850f86bsm5428890eec.11.2026.10.02.14.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:11:29 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 2/2] arch-powerpc: Hash ABIEXTENSION by its value
Date: Fri,  2 Oct 2026 18:10:37 -0300
Message-ID: <20261002211037.745952-3-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002211037.745952-1-luciano.dittgen@ossystems.com.br>
References: <20261002211037.745952-1-luciano.dittgen@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 21:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247138

The e500 tunes append ${SPEABIEXTENSION}, empty unless "spe" is in
TUNE_FEATURES, so ppce500v2 hashes a different expression for the same
empty ABIEXTENSION and every <tool>-cross-powerpc differs from e500mc.
Found by yocto-check-layer test_machine_signatures (meta-freescale);
verified with bitbake -S on p1020rdb vs p2041rdb.

Signed-off-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 5644c2c1e5..70047d6e37 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -7,6 +7,9 @@ DEFAULTTUNE ?= "powerpc"
 
 TUNE_PKGARCH = "${TUNE_PKGARCH:tune-${DEFAULTTUNE}}"
 ABIEXTENSION ?= ""
+# Ignore how ABIEXTENSION is computed: the e500 tunes append
+# ${SPEABIEXTENSION}, which is empty unless "spe" is in TUNE_FEATURES.
+ABIEXTENSION[vardepvalue] = "${ABIEXTENSION}"
 
 # Endian
 TUNEVALID[bigendian] = "Use PowerPC Big Endian"
-- 
2.54.0


