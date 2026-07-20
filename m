Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E98C4452A
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:29:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10353.1784557738567619941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PxH1rtPp;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956242332dso6209955e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784557737; x=1785162537; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fcUl4nLpNdw1zMF15zvv7NELQI5QQhwNWWy++XUxU7g=;
        b=PxH1rtPpzpfYOK15wDRd029MNwvr411/BB1FxtdI8PIo7P8fETZGjzyS1/x5IBShY8
         shDScYiqdU22i605naBYw8BzV7GgtU4LKn+sQUBwvZ4EEceQPr6gIdfZXZGQNp8MSX+1
         M0b2uLTM/QHRjksJ5G0umsZ5f13/21XZRnMPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557737; x=1785162537;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcUl4nLpNdw1zMF15zvv7NELQI5QQhwNWWy++XUxU7g=;
        b=KgtDgdN3ATz/A1oksRo18TlkOQSsIRYFs4OZbVmRee2cBxjIU1N+TytirGolwV7AoG
         +fsrSZtfJEMv9sRonO1bEFk6VadYn7nKF+cdDyqIrfEmt3rmav1JCDMR8HFfXlOcV6MW
         4opUF0KzroLVjnAi1AHJDUcRNZ6fbIA1Ib/aNz4GN5/f/GRKtmNnx/dJK5/FY/mO3EOA
         FpFpnJ3ZQlzQOO16S5usTIeCoBwrHLMEPwBCYioeMfc7w1SGmZBQfIL09BV5jlKZWXYg
         0GEgz36TLTlj4Qgoq0eoCp5OFqw6B//q9OgkeDhu/h2q7xLdPCMeY7XxmteD7YcJeIfW
         7SVg==
X-Forwarded-Encrypted: i=1; AHgh+RqeMd/r67Wz8W6SR64TzBL7bFRRouGr607CFQE3DtPuajPim2SFs/3JaMr+9ITSW9IOCPT1b6rOobA4ddukgDlFEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzhgeznRHHLlZQb7syvCmZxECkeYepFz/zXGMQ1JP9iv/8xgan
	pq0PW3Tt1crqSGcPxsy+hZiEM0zu5FCyvOXTEfGekRfBc9hA/T7MIbi6CGe5cuKJOJo=
X-Gm-Gg: AfdE7cl++sGOP/djfXRLT1UsMUFqjV8bxVt2QTkGZQm1jhMPFjyDQmolHHLABs1vI3d
	K+em4VgJLyz9mjT7OA24SalDiHdTdc06pO0E+UIJa7CpdP16g2QnXI56yYG3utJB/KdIfRfCxEg
	XdvRTOEgjVC3CIj5dWRRhQ0WWaL0pDeBjR2hKBv+Rix/kHCdWLysTxysPFR7A7eq4Xhk6BGe5Eb
	a8prfcIHhpkjBQmXsePo381D7yrvOZJ5BN7yIcmpcqF8isNO07dYy/hoU5gQttL8VdQRilu5fqI
	aQYx2YyEB2X8CnEcA7MzGKSfhDGRJ0QZJ1EL7vQdfkcCP5n8MjY+6xazgl2G5hAZCbfMQSk+JUF
	YliB10DFAdi8TrNwlFBNRldmuYYdWC2998IxIrdBsoAmwE00BtuEF0qmT2VFwiEK6+5R1k9JyHC
	0o+66YzByPMCj2R18awnhUbbZZKd3+t1UMS3HHORO3eAY/aGQOkA05VJFUW9pVyA==
X-Received: by 2002:a05:600c:3512:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4954a3ef7dbmr152837615e9.9.1784557736528;
        Mon, 20 Jul 2026 07:28:56 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2f210csm312556025e9.15.2026.07.20.07.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:28:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 16:28:55 +0200
Message-Id: <DK3GX62Q8J9P.1E86MT4O85T70@smile.fr>
Subject: Re: [wrynose][PATCH v2] u-boot: re-enable RISC-V compressed (c) ISA
 extension
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: "Gustavo Henrique Nihei" <gustavo.nihei@espressif.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720124620.1194239-1-gustavo.nihei@espressif.com>
In-Reply-To: <20260720124620.1194239-1-gustavo.nihei@espressif.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 14:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241405

On Mon Jul 20, 2026 at 2:46 PM CEST, Gustavo Henrique Nihei wrote:
> SRC_URI_RISCV clears every RISC-V ISA extension via
> u-boot-riscv-isa_clear.cfg, then conditionally re-adds a fragment per
> TUNE_FEATURES bit: a, f, d, b/zbb, zicbom. There is no line for c, even
> though u-boot-riscv-isa_c.cfg (CONFIG_RISCV_ISA_C=3Dy) already ships in
> the recipe. So for any tune with c in TUNE_FEATURES (e.g. the default
> rv64gc/rv32gc tunes), compressed instructions stay disabled after the
> clear fragment runs, and .config ends up with:
>
>   # CONFIG_RISCV_ISA_C is not set
>
> Building without RVC noticeably inflates .text: on qemuriscv64
> (tune-riscv64, rv64gc), the resulting u-boot binary is 1312625 bytes of
> .text without the fix vs 1082853 bytes with CONFIG_RISCV_ISA_C=3Dy
> correctly set, 229772 bytes (17.5%) smaller. On size-constrained
> RISC-V SPL targets this .text growth can make the SPL .bss VMA overlap
> the .text VMA and fail the link.
>
> Add the missing "c" mapping line, mirroring the existing per-extension
> entries (a, f, d, b/zbb, zicbom) already present in SRC_URI_RISCV.
>
> Tested on oe-core master, MACHINE=3Dqemuriscv64, via the
> oe-nodistro-master bitbake-setup config:
>
>   bitbake -c cleansstate u-boot && bitbake u-boot
>   grep CONFIG_RISCV_ISA_C .../u-boot/2026.04/build/.config
>   # before: "# CONFIG_RISCV_ISA_C is not set"
>   # after:  "CONFIG_RISCV_ISA_C=3Dy"
>
> do_package_qa passes both before and after; only the ISA config and
> resulting .text size change.
>
> Fixes: de890297b392 ("u-boot: Dynamic RISC-V ISA configuration")
>
> AI-Generated: Uses Cursor
>
> Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> v2: Fix Fixes: tag, it pointed to the wrong commit (cd9e7304481b,
>     "u-boot: Overhaul UBOOT_CONFIG flow") instead of the commit that
>     actually introduced SRC_URI_RISCV (de890297b392, "u-boot: Dynamic
>     RISC-V ISA configuration").
>
>  meta/recipes-bsp/u-boot/u-boot_2026.01.bb | 1 +
>  1 file changed, 1 insertion(+)

Thanks, since it does not change the patch content, I directly replaced
the v2 into my branch.

Regards,
--=20
Yoann Congal
Smile ECS


