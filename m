Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70316CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:29:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4733.1791318563382299728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oYVzKxTM;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso941498f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791318561; x=1791923361; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+Oki1Ljv+35dd789lsFGrb+VGBgcctBsdbGyU5hwzE=;
        b=oYVzKxTM0HEYwxvBAwKr4HhiOi4N+IQcCyV4nlYN1GduI68NO9sFcZSGsD0PcvU1oI
         74ulBWY1wK9flwDKuBNqIYtYtNArg4qwngkLsogudsje6IF6RYrsx4ZX8bJ6NKCwtpEf
         Ri5yIcpZ1etFJzXKQfK9kXuzRXbz6l6gwho58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318561; x=1791923361;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+Oki1Ljv+35dd789lsFGrb+VGBgcctBsdbGyU5hwzE=;
        b=mFfB768AcgZFI0E4vqjQc69OCasMvlJR9z5L4WdTVjTr2bfHQLhV3zwK1e41UCVQiN
         3/PgtHGGqMrYoYNXGSPszBPvPPBkNd4+QmYVlomJh2iDlJlR+leg8ZumNkIPmK54Gz8E
         BDqr8KxqHtmQRTp8ujs0RbnT/eiFohM98E8MYpV1w9duXwHXeJwnBibSjBnf7VSrrNeM
         yeuGk1jRY34NGooB/JdUmge3x3gN84uSl4OM5mWSBPmnpWXKSmW934GuOoKOUe4QaMj/
         nLxsVvIAYRNvpfesWWT4pJG9L3MiP/+THuFsMzZ50WFaTh2vmIfTQbCbUQhr6vtnrr3M
         S0xQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/m7uJnw51llfzC7m2RqxjzeIqUqV22SW7oLBSUhK7nDB6Pxw3CoDFms7UnArMV3aW68i5L6IZ5bqzYFDSB88vUw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJiGh1s0YXUIpHdbcXQE97P1jCzSrtWGqJ9Yavm6XlcC+GbRoJ8
	MWkWBU6gCUUowPvRQ6Pz3FGrNfvqliYRgXSwUmQlS7k/3vGaD3vm3R2Pr+awVKdg430=
X-Gm-Gg: AYBFou0xKLA0mZKSJK4HoeQY225ZkPw2wM1eTELuvhoAjzOPR7w8RvmUzOHESV3A/EO
	o8CifJSCxWaNx9W1hym6gV6LnwibeqHozXGojkf3MqDXaKOdacd8cYs+m7imHKDKOq/0EeDnMh1
	1Re2yA5i8MLMqv2ACChQGQT5vdcAv8ZrutHcHJpFPsZ3PsHNZ1w+jARsaWGRyGBIPXo/5urOhfg
	L2HhNEjWF37EhQDlRmC0bjOaXCpWXKhe3m8N0P66VQSV128fxVW16lnbsNgQCS65rwlzxEuensq
	EUOk0KFG9f1RVOUbr8Ao7yvE+oNMaLicHh0P210p/Bdzh2OV8OKdmgPB8wDz65upIqZ89lKwKCz
	3i6W9BMnoliM8AyzVYAr/IcdMK5ZiMZRw/vVBXW7jbZQiKZNUgvdT5d6tj0RR4pOcNEwX4mzusI
	+Cp3AnHv5IiMZc3FpOjFn/oTJGNmXqRB59HHP43p+6VJh71iGcgP9OorVCNmPyujOIcbpxulYGp
	ZibtBr2esHdsRuj8jj2ntHxqnDvq8mIYv0Pom0OdZb/zc16zNLMPaCCzrjV/g==
X-Received: by 2002:a05:6000:29c9:b0:48c:660f:5e7d with SMTP id ffacd0b85a97d-48c72779ab1mr564969f8f.16.1791318561415;
        Tue, 06 Oct 2026 13:29:21 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1245bsm1350579f8f.26.2026.10.06.13.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 13:29:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 22:29:20 +0200
Message-Id: <DLY1FLZMYDML.21FPWQ5THBVV6@smile.fr>
Subject: Re: [OE-core][blacksail 00/19] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1791299195.git.yoann.congal@smile.fr>
 <8e2ed66c100c18257c4d8f1d6ce85c7dd28ac12f.camel@linuxfoundation.org>
In-Reply-To: <8e2ed66c100c18257c4d8f1d6ce85c7dd28ac12f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247335

On Tue Oct 6, 2026 at 8:45 PM CEST, Richard Purdie wrote:
> On Tue, 2026-10-06 at 17:45 +0200, Yoann Congal via lists.openembedded.or=
g wrote:
>> Please review this set of changes for blacksail and have comments back b=
y
>> end of day Thursday, October 8.
>>=20
>> Passed a-full on autobuilder:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4887
>> (The review branch slightly changed from this commit: SoBs, patch
>> comments, no code change.
>> * qemuriscv64-ptest failed on:
>> =C2=A0 * 16422 =E2=80=93 AB-INT PTEST RISCV64: python3 ptest failure (py=
thon3-more-itertools)
>> =C2=A0 * 15896 =E2=80=93 AB-INT PTEST RISCV64: e2fsprogs ptest failure
>> =C2=A0 ... both known AB-INT issues that a similar branch passed:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://autobuilder.yoctoproject.org/valk=
yrie/#/builders/56/builds/2553
>> =C2=A0 I don't think a re-spin is needed here.
>>=20
>> The following changes since commit 419c1b0f1ed0e3ce22b1022061f763d007883=
121:
>>=20
>> =C2=A0 build-appliance-image: Update to blacksail head revisions (2026-0=
9-29 20:31:43 +0100)
>>=20
>> are available in the Git repository at:
>>=20
>> =C2=A0 https://git.openembedded.org/openembedded-core-contrib=C2=A0stabl=
e/blacksail-review
>> =C2=A0 https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ds=
table/blacksail-review
>>=20
>> for you to fetch changes up to f59af8082a2f7cdb27a4ba5968b81d740bdeff35:
>>=20
>> =C2=A0 recipes-support/gnutls: disable slow tests for RISCV64 (2026-10-0=
6 17:04:27 +0200)
>>=20
>> ----------------------------------------------------------------
[...]
>>=20
>> Joerg Vehlow (1):
>> =C2=A0 tclibc-baremetal.inc: fix gcc-cross EXTRA_OECONF
>
> Definitely not this. There is a request for a revert.

Ok, I'll send a v2 without this one.

Thanks!

>
> Cheers,
>
> Richard
--=20
Yoann Congal
Smile ECS


