Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A671C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 08:51:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.29762.1654505511306409064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 01:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A6nIsi/N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id p10so18893044wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=QvLshZ1pLo89gsZs7UTYc2filYmeD0Lr+jB0OEmSrtQ=;
        b=A6nIsi/NPE0g6l9jc3QxZ2nWNf77arCrT7F886RpWwYbYGjR/N8ZdZiRqVmqxYmRLz
         7cjUWukKYPB/kstYhrJnoLGH7K8izp6YK8468+Sw6rT4Kb2gTWtnySA2U7yYspsdlHiA
         fAzMW20nOg9F95mdOmxy3OgqchoqlSGp9mc1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=QvLshZ1pLo89gsZs7UTYc2filYmeD0Lr+jB0OEmSrtQ=;
        b=JdB+fRNpVJYbxaYBAXFOrW7AR83bOxVveDOop6VeXu4WUlIly6/TouvYGq5sjHPFtl
         qsRMl0fGj3G0ZKBRQ7VgP/XAITBkk1QpkBd8vsH0wP5SFWY7zvfeW9l5suD29maDDkp8
         0auL/u4XmdLqz1MoC8r2jF9rQcHQ8FEtWtA93iotsbqmjO6B83CJFgyv023se3gVHzPH
         9j7vK0E60jMJLd3NfvnicIut4n0NtuV7Yy+xG623Qsb5DMxbiKTClHX5oqdQuHfUJcZk
         PRwqYqkwmZAxSHgj8QA5gUXwzYQet8IibpQ02RgJV+AO6u3E+JN+Tf+NLv9ZaSDT/Q+j
         oCSA==
X-Gm-Message-State: AOAM531VlvsC0c99HGr+ODowzLmj2mj2CShIGAUq139WA73+hwtLsNAV
	JC39C6TS/3qfEi4q0gCl7E8ygQ==
X-Google-Smtp-Source: 
 ABdhPJxUWzDD4Ux9OhQaoZMh+0Vj1L5FaLxF4Xe2D5RZf2ERX9A8syR3GOwrqlJnXu6yPQBYjTCXkA==
X-Received: by 2002:a5d:47a5:0:b0:210:2b96:a952 with SMTP id
 5-20020a5d47a5000000b002102b96a952mr20627761wrb.248.1654505509537;
        Mon, 06 Jun 2022 01:51:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22ca:1a07:c46c:a885?
 ([2001:8b0:aba:5f3c:22ca:1a07:c46c:a885])
        by smtp.gmail.com with ESMTPSA id
 b8-20020a056000054800b002137b2a233fsm14120678wrf.36.2022.06.06.01.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 01:51:49 -0700 (PDT)
Message-ID: 
 <a3fa5681be1c935b9137ad5c1a8de1c311d0c346.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>, Patches and discussions
 about the oe-core layer <openembedded-core@lists.openembedded.org>, Randy
 MacLeod <rwmacleod@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
 Vinay Kumar <vinay.m.engg@gmail.com>
Date: Mon, 06 Jun 2022 09:51:48 +0100
In-Reply-To: 
 <CALY4986aY-X5V2-fcOU+3bovF=kB9t7Uvrh8b_rcqH-pQE9J-w@mail.gmail.com>
References: <20220524225603.50d60963@melee>
	 <20220525043258.8949-1-pgowda.cve@gmail.com>
	 <16F24A16BC7F056F.12338@lists.openembedded.org>
	 <20220531150529.705390b9@melee>
	 <CALY4986aY-X5V2-fcOU+3bovF=kB9t7Uvrh8b_rcqH-pQE9J-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 08:51:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166587

On Fri, 2022-06-03 at 18:37 +0530, pgowda cve wrote:
> Hi Luca,
>=20
> Regarding the issue
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14818
>=20
> I ran the Oe-Selftest for Rust as well as completed packages and did
> not come across any issues.
> a@yow-fedora-builder1 build]$ uname -a
> Linux yow-fedora-builder1 5.16.18-200.fc35.x86_64 #1 SMP PREEMPT Mon
> Mar 28 14:10:07 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
>=20
> The log of tests can be seen as follows:-
> The command used to run the test was as mentioned in the Bugzilla.
> oe-selftest -a -t machine -t toolchain-system -j 15
>=20
> test_libatomic: PASSED (113.76s)
> 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> gcc.GccLibGompSelfTestSystemEmulated.test_libgomp: PASSED (637.21s)
> 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> gcc.GccLibItmSelfTestSystemEmulated.test_libitm: PASSED (133.31s)
> 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> gcc.GccLibStdCxxSelfTestSystemEmulated.test_libstdcxx: PASSED
> (2546.63s)
> 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> gcc.GxxCrossSelfTestSystemEmulated.test_cross_gxx: PASSED (744.56s)
> 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> glibc.GlibcSelfTestSystemEmulated.test_glibc: PASSED (1101.43s)
> 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> meta_ide.MetaIDE.test_meta_ide_can_build_cpio_project: PASSED (54.33s)
> 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> meta_ide.MetaIDE.test_meta_ide_can_compile_c_program: PASSED (0.19s)
> 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> meta_ide.MetaIDE.test_meta_ide_had_installed_meta_ide_support: PASSED
> (0.01s)
> 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> runqemu.QemuTest.test_qemu_can_shutdown: PASSED (45.98s)
> 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> rust.RustSelfTestSystemEmulated.test_rust: PASSED (8381.70s)
> 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (3.92s)
> 2022-06-03 08:39:22,336 - oe-selftest - INFO - SUMMARY:
> 2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest () - Ran 16
> tests in 19613.479s
> 2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=3D15, skipped=3D1, failures=3D0, errors=
=3D0)
>=20
> I also ran the Rust Oe-Selftest individually and did not find any issues.
> Can you please share the environment file so that I can reproduce and
> fix the issue?

There isn't any magic environment we can share here I'm afraid. We
don't know why it happens on some autobuilder workers and not on
others, this is something we need to investigate and fix. This is one
of the challenges of these "intermittent" issues.

The errors seem to relate to zlib so it may be worth looking at whether
host headers influence the rust build and those may be causing some
kind of determinism issue. You may have to build the binaries one a
system with the headers, then run them on a system without for example.

Cheers,

Richard




