Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4F0CDB472
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6011.1781960424069828031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l8R7g5td;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4633193af19so2088462f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960422; x=1782565222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLACgR+zmRlrxxyw0Knb3r313XgcN943kkUHlPIW+mc=;
        b=l8R7g5tdZxYVrdaas5VnM5F813Iu92K4o5UNMLzPlsW3r2WkNdKOgRmmXfidxiTQv7
         uhxnheb/KCS9nysKrzPjJ276lPihUZbM2kKn9qLY+Lr5gcgXTv3sc7GYVazk7PSy3PIj
         tJ+i8UwWU+YgpmX6Q/hi8bb+h1aS16Vd/eAL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960422; x=1782565222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YLACgR+zmRlrxxyw0Knb3r313XgcN943kkUHlPIW+mc=;
        b=BttKWEPl7cIYzdtthnD1jM/3qAf2elrNhXtrvDYenCgXfnlcQLjohBPA3R5Wtspq7k
         yupw8auB5mNi8qcy/H0G4almiC5B5gHneWKdDXEkUTBNl4y4IPBCBXTDwztkOuCsJYdx
         B3pHzr0Jm05eTiRVVg+X6W1rhuNQWz/Q/t0/KX2yvfWC4eSRnuSRw7xlIVOsjYRhA6D6
         VCfKQatsvnD2Ay8WShuuz/zL/5//enEMDDaMe/qNmkc1BiEpBs+IdG6oUAl475MtffMj
         A82+qd4OfxCTBwjirhr6R/URUS34zV4hPAd/yVUFscB/zsrB9I3qSi4oQre2LOB4NnIX
         pprw==
X-Gm-Message-State: AOJu0YyC6Nn039RJY8An6kzusoCLwxzVxNSrX8apRfhgIjSOcDbJAJTw
	KchsVQMSv2BbpOtzwu2RKPs2Pm2CQ1R7JWjKkVPYuqss4VYNFI2bE1ZZYswGjlGFS1+i+ZClU1H
	rB1Lh
X-Gm-Gg: AfdE7cl5faY7V33ekKdspOaQ7rBKs1j+4BZm4S5TRIox8VMFEXFeriru4kOEId9hHra
	PYw77Xud6DTQPqlViQvZLeRz+uEqfHEtZRM19ynUW6Y45MhDWK9zWzlEMZ/28Wmvd18A7nni33+
	8pSFnuqnfutApCvmVVDIeb8z7Pc8HUxYETIFYZ0EfYsxIYBpF5L6nLYCWIYTQnF2tsAyRs3WPb3
	aGKnaZwSTBWfgxuT3hkYMyoi7Nau4GLPGNNVjRISeiHsCEhSt3b+y8bY4/OdIoZlk0jlJCaMENf
	d9iPJyKKe+2ws8TqFXUhqAfhJH3CpfekgMU5X6OcR0mIRITtwHZzEcHMW6Tj46S/Q8kl52iHH4H
	+tkwspaHX9NeV4DfJXGimHgqvrnrKuYJMtHwktkQ/FovQol+rbOQc8+YMkmr4WUwyFi+H+sCipU
	wMaJ2hEsYyqNqNOQ1IThYGh6sFtzKqf4T4TPX8eWvQpWGA40KCP8JRC6cpftwraoj8nxj2OGJ1c
	Xm7ybdcGKZCbj28
X-Received: by 2002:a05:6000:4b1d:b0:460:e00:121d with SMTP id ffacd0b85a97d-46660d06093mr4812199f8f.14.1781960422250;
        Sat, 20 Jun 2026 06:00:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/36] rust: export CARGO_BUILD_TARGET
Date: Sat, 20 Jun 2026 14:59:35 +0200
Message-ID: <0c4bf6f7e7e7769aebbec020edaa76db203473d6.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239230

From: Jesse Van Gavere <jesse.vangavere@teledyne.com>

To cross compile a rust project with the SDK one currently has to know
the associated target sys and run cargo build with it, by setting
CARGO_BUILD_TARGET to the rust target sys, running cargo build after
sourcing the SDK will immediately have the correct target.
See https://doc.rust-lang.org/cargo/reference/config.html#buildtarget

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Jesse Van Gavere <jesse.vangavere@teledyne.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit dc1a3a439c57c59578abbc474d10779de4d42c5a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index df8b78d326e..f083bcda823 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -59,6 +59,7 @@ do_install () {
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 

