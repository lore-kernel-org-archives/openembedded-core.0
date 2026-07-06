Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CD7C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 12:25:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148832.1783340718933613444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 05:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NAJqbDX5;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso28782115e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783340717; x=1783945517; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrOI+Xh4PFXw6nm49XT73pUyp8kP0BnOEFReq3mux+I=;
        b=NAJqbDX51IFBC+UOZaxYp3dUUzrisKG3kLXgBNqmhd5CJG68CMVFzEOtEl8ecjNRW7
         NrUJSZ/0hBSxXxKEGYi5IFZMVR5VWcGE94Ah/sQtmUkM3kCSxA47S0+18cHRMu+RTWT+
         OMFNwbVXm42wwJ0s4+qEqTkrVMBhtzvf6oMGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340717; x=1783945517;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrOI+Xh4PFXw6nm49XT73pUyp8kP0BnOEFReq3mux+I=;
        b=F96Y+Q0roHeyzDhFE0Wv68Z95/5JryQYaVwo/jS+Hkzg2H3lvcaCiTkIFDKeTK4vPr
         oUmmG2HPjNCpMvTLc7eBjzv/WZQ/h5p9UvzIDWWmOwAredfF3mReidnFkhlkLS3r6nBa
         UUEbSqjUIdyxjwsdf2RNwfij3TZh1WeCXfcSPzPzhFfmTQPOKwpdFmBBaRHw4rxDc4Rd
         ETBpVyKb68OqvyJRiUDh+q+gTDcFx6B4uyKP/w69xiSlg2xMkuMgfTC+MRrfzn3Sxc2e
         CpCO+3hG8Ekt6LwblF7mBbhrJL1a32eCPzqTLTWvaj7BEtj7V7sefn0CY+NoTylNr9nZ
         A/1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrckqY56nyoKwL2/k0dhlhJ6Q5gbGM/ZaNvAYvufDJm3XOQExE00dEKPqqMDGbO2G/3RM/xPBmAC7shpf0eHFAVGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTnvKjdfm+WFrYV2gPhG0BULzc3fXqiYglYWKs2LYKWUpckNJL
	MZo+KX3HpSiogeREEjddt/i8cMscR5Qvb6PGGVnCW6a4+8YYjBTsQ9ie4wILm7LdvcA=
X-Gm-Gg: AfdE7cnbOJGH0RlmsRCx7oHdJXnMG5XuRdYshW90VWTU/xDXv27MykeTlJ7k3DHVnMm
	pa8IEYqb/EL8ri4sW+oOk8JkwzgMfW2PQ+3Smn247C+JFnoJzw93mpzLvjIQkdL9+l9M37dyvg0
	QHLjUf6drPACS0ttj8AqcezWPbPIOsz4Nou484kRPHTYJT0uJVUZlN79LqkW7RdcMsMA+bmV2wS
	XipKeX4AfUl8TNZN5xVIHR1ARaXELmgg+rU87BgWsy+HRyEdGsXyApy2hfgzy2gA99b7f2IA+kX
	D01PldolrF1BtH+pepB6KMjphcZ0DTUh0eC0hcyD/PL6CNVRFDRu/mJzB0eMgLPK/2VCSbiauGu
	0LUoRmNbvxadVPzJSBr4l9Ov5C0NUnDtywd/wyZNU3I9qoKzxkFIzWIPSdx5/9kd88TATqXFy1g
	vI9Irnq+p8lLZIaLl4VwOUDBGwsA==
X-Received: by 2002:a05:600c:c3dc:20b0:493:be36:94b3 with SMTP id 5b1f17b1804b1-493df08b968mr1917155e9.13.1783340717136;
        Mon, 06 Jul 2026 05:25:17 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm24572456f8f.9.2026.07.06.05.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:25:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 14:25:16 +0200
Message-Id: <DJRHIV2A1KBW.39DBI21KNQ6X5@smile.fr>
Cc: "Hongxu Jia" <hongxu.jia@windriver.com>
To: <jakubszczudlo40@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] libgcrypt: upgrade 1.10.3 ->
 1.10.4
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260704105523.3264-1-jakubszczudlo40@gmail.com>
In-Reply-To: <20260704105523.3264-1-jakubszczudlo40@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240264

On Sat Jul 4, 2026 at 12:55 PM CEST, Jakub Szczudlo via lists.openembedded.=
org wrote:
> Release notes are here:
> https://dev.gnupg.org/T8233.html
> Version cointains fix for CVE-2026-41989
>
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>

Hello,

I just remembered but this upgrade was attempted before but failed:
https://lore.kernel.org/all/20260514133022.56169-1-gudni.m.g@gmail.com/

I tried your but same issue:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/builds/4071/st=
eps/12/logs/stdio
| | libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dc=
ore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O0 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  -DHAVE_CONFIG_H =
-I. -I../../libgcrypt-1.10.4/random -I.. -I../src -I../../libgcrypt-1.10.4/=
src -O2 -pipe -g -feliminate-unused-debug-types [...] -fvisibility=3Dhidden=
 -fno-delete-null-pointer-checks -Wall -c ../../libgcrypt-1.10.4/random/rnd=
jent.c  -fPIC -DPIC -o .libs/rndjent.o
| | In file included from ../../libgcrypt-1.10.4/random/rndjent.c:99:
| | ../../libgcrypt-1.10.4/random/jitterentropy-base.c:58:3: error: #error =
"The CPU Jitter random number generator must not be compiled with optimizat=
ions. See documentation. Use the compiler switch -O0 for compiling jitteren=
tropy.c."
| |    58 |  #error "The CPU Jitter random number generator must not be com=
piled with optimizations. See documentation. Use the compiler switch -O0 fo=
r compiling jitterentropy.c."
| |       |   ^~~~~
| | make[2]: *** [Makefile:775: rndjent.lo] Error 1
| | make[2]: *** Waiting for unfinished jobs....
| | make[2]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64-a=
lt/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.10.4/build/random'
| | make[1]: *** [Makefile:500: all-recursive] Error 1
| | make[1]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64-a=
lt/build/build/tmp/work/core2-64-poky-linux/libgcrypt/1.10.4/build'
| | make: *** [Makefile:432: all] Error 2
| | ERROR: oe_runmake failed
| | WARNING: exit code 1 from a shell command.
| NOTE: recipe libgcrypt-1.10.4-r0: task do_compile: Failed
| ERROR: Task (/srv/pokybuild/yocto-worker/genericx86-64-alt/build/meta/rec=
ipes-support/libgcrypt/libgcrypt_1.10.4.bb:do_compile) failed with exit cod=
e '1'

Can you look into this please?

Note: you can find the config for this particular build here:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/93/builds/4071/st=
eps/11/logs/stdio

Regards,

--=20
Yoann Congal
Smile ECS


