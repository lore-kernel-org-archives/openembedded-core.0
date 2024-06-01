Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3157C3DA40
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.36160.1717244707793956347
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TtlW3H8V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f44b594deeso21951625ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244707; x=1717849507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFBO0dX5mwd6cB73TWb5c1cizFlJeGx4g6DIgQw8xyo=;
        b=TtlW3H8VbNjuhlA2+vAAcge0HSzH7/unvEgYtnGBytWLAD4onIqoqaZmTDd57soV9o
         9rWCosvVFP+QZ1HD9hL2Fli5zhEDYWMoUvdyuIxQ16ROkuC3nBHtWmuaNfPIqzKyjLUv
         rgxto/lPEGqSa679QngSuM1EmxS/87Onieml2UmbHNNAaimUNZ8MHusUWam8Kkp1X1Do
         7SXd/BpuUDdAsildfA/JFaxfredEV8l0CTR5PmziuzAXQ4xPrztpv64j/B80slcsoUSq
         znjMU+1grmdiGgChTAvmb6Jp1TOvuleAA9JnEJuxPGkkWjSSsuZnTYAtOgEFt9NNB53B
         nlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244707; x=1717849507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFBO0dX5mwd6cB73TWb5c1cizFlJeGx4g6DIgQw8xyo=;
        b=vjy/e3QOShsc+g6rbCWMGLqeGvsLyrEH3FqwsG8fQw2HZrPtlAeQAKdqJIehIkxCXR
         kOku//FhXx4e14dVR2IbchoY+XpFiNXzPO9YXkOnjI7wXYXY2S63T29Ttu3EAkejKvI6
         GNUZDXGrzUNNU4bvNOGbsBRoD9Xp+lzQ3h/RRc9gy+jW9P33dCOYo6HLye3muSwDg+hU
         yPWYQQggpqw5ZgrWcDRRPjcIkEP8XA355H2yQ1p40DUGAGBo3XbmvYLX/0ClYQ98/fYn
         OqOiYFNhfkhXMTbQnO4o6mU+uISjEhdHwBxPtNYdp9yXn1KE7SibaoBtRRljrU1EWA7G
         DGcA==
X-Gm-Message-State: AOJu0YyMtg7RDFnH9raAZnuTYTBWs0ajopNT9AhZYlVMXM3S/0GrRdVo
	4kM76Iats7iGnKtAqtOhxhL0pqZHvsZ3u3fIgphGb1LmKslJLTH1st4TS+xRJoCm9F113OJAIOM
	q
X-Google-Smtp-Source: AGHT+IGx73dgGRH2Sf2eQqJ8lebG2I+lskCB7esttR2tAGkZiVRTO5Sx9tZsZ1Miusessx+BEqmuAA==
X-Received: by 2002:a17:903:228c:b0:1f4:9ce1:6e76 with SMTP id d9443c01a7336-1f6370ced3amr51812845ad.65.1717244706959;
        Sat, 01 Jun 2024 05:25:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/21] xserver-xorg: upgrade 21.1.11 -> 21.1.12
Date: Sat,  1 Jun 2024 05:24:35 -0700
Message-Id: <64174dc0f593baa4f74c0080726de94802b903ef.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200105

From: Archana Polampalli <archana.polampalli@windriver.com>

This release contains security fixes for

* CVE-2024-31080
* CVE-2024-31081
* CVE-2024-31082
* CVE-2024-31083

Changelog:
===========
101caa1b0 (tag: xorg-server-21.1.12) xserver 21.1.12
117315640 render: fix refcounting of glyphs during ProcRenderAddGlyphs
0e34d8ebc Xquartz: ProcAppleDRICreatePixmap needs to use unswapped length to send reply
cea92ca78 Xi: ProcXIPassiveGrabDevice needs to use unswapped length to send reply
8a7cd0e3e Xi: ProcXIGetSelectedEvents needs to use unswapped length to send reply
5ca3a9513 Xext: SProcSyncCreateFence needs to swap drawable id too
5d7272f05 Allow disabling byte-swapped clients
8a46a463f Initialize Mode->name in xf86CVTMode()
f653d9a0a hw/xfree86: fix NULL pointer refrence to mode name
8b75ec34d dix: Fix use after free in input device shutdown

https://lists.x.org/archives/xorg-announce/2024-April/003497.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12dfa6889a1c322d0e20fd9b7638dcb861e032f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.12.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.12.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
index 6506d775ca..570e08d5ae 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1d3dadbd57fb86b16a018e9f5f957aeeadf744f56c0553f55737628d06d326ef"
+SRC_URI[sha256sum] = "1e016e2be1b5ccdd65eac3ea08e54bd13ce8f4f6c3fb32ad6fdac4e71729a90f"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


