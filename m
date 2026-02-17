Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E2AE909D0
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:55:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15243.1771343745198428701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iXFwQQDN;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43767807cf3so3334404f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771343743; x=1771948543; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmX/w8gPvlSHViuEQ+J7mzyX7HV16pHNB0xfeVZXIK4=;
        b=iXFwQQDNrdskxGHqDBjj6sm/UqB1OJaOKi24mM3XVK5bdGzFybB3hRhY/c3SNFWC6K
         qjapwaAlVvimpvXuuesfs/1Or6bIpN6KDP7WS73wXzXcP0ym3/FWX0jQegQBsp4DqCYJ
         UVobMGgHKNbFmN5hq2ucnJHZZLlGGCB796Pcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771343743; x=1771948543;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmX/w8gPvlSHViuEQ+J7mzyX7HV16pHNB0xfeVZXIK4=;
        b=PeNh2tUtCjbeLintC3Fqpbuf7dhNZPg2HmOrOXmMxka36oVBOSsM/DhfvIUUPEjDNe
         8KxDqFZk9e9vzBmHdFXfKrymmIgpTSxlBn0rkXKAWFbrqUFvKViqbh/tgiEmO8NBuUJB
         2snk6Sk9xOpL50M9h0RmmXBHgejHhQaogCJ9mDcGcB/vYXZEEyns+pMh/tCXDbJ/jb5n
         86uGlrMcrAUQ6cnX6Poeb20SdbFAZaCvHyvwseedDhQTf1lZqQyQ1JndTo/RoWXkt5H5
         /B4RG1HYk0/KSVSW4jNEKbTnoztBPk+WXjvVOvumGiWMaGEN0eifoO8bYA9nirKjrsaY
         lMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUua8rZ29SZmdSWvRzw5FzGdCzUxbB0VuJxr4sGgKdio3mL9S+wyUzdWTuYAW1KTUmAJeQa55hV6LXbbZ9eYQV/gA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwGcJLPO4iPvlcuIMy7n6jMl4Kf/WBL8wnSoTdZ+EON6oQYY84v
	N46j/kM50f+2pSYx8UiGlyYtYnLx4KvAi3Y3BvgzZ/my9+DWKSmjEsF1rP2x6RGAUqc=
X-Gm-Gg: AZuq6aIxaaHiLEFotGnRpNY5k3VRmKlfi4oySONAmtw5/Jg8CsQysA681KmRuDX/fEZ
	1tr/N3A2p95EDeL0qECJ3cwkdkCGT/NsxZ07e16dRRurJogtewuquaabWCjqbp5UbvoPVGbl6n8
	Le+7AQPir46Z0wul7yTZmHms1m1QsnRFrx8LIgbFi8nJb5t+tAUdair9myE6YifF+RiZOuvYczE
	/UCf1qY6YIgGyfTLeBioGmNdeRStAMi+9NLDAEHnu6u3WuMFroDMkkkBZctLVhCSev1aSB7+i3j
	tZ1ADUCOevxVDJO4Z2Z9Dp4+J6JSjis+M2OuNl/Qampg9j+8BlxBTxxQWU1eZZQDaZ/3ysmWLUa
	fptuvvYTEsLbRmdCHhuvDCwQ+ZHotK8lWWkTh7So+Cz8CXUHf1BKlNQKmrg5TjCpeMNCTHOpdDU
	nxOYn0el94e70U3O1wQJeoQPfZYq3ADKmBMN0X32HVcEFTh7dEpG3GdJKY2JYluAQn5v3x1ZCGD
	xbLH2tfXFs=
X-Received: by 2002:a05:6000:40c7:b0:437:6c9c:5d57 with SMTP id ffacd0b85a97d-4379dba7566mr21292338f8f.58.1771343743476;
        Tue, 17 Feb 2026 07:55:43 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad015bsm36485963f8f.38.2026.02.17.07.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 07:55:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 16:55:42 +0100
Message-Id: <DGHCY9K8FH3X.12IIUQXYHAXD7@smile.fr>
Subject: Re: [OE-core] [scarthgap 00/28] Pull request (cover letter only)
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <richard.purdie@linuxfoundation.org>
To: "Paul Barker" <paul@pbarker.dev>, "Javier Viguera"
 <javier.viguera@digi.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1771008295.git.yoann.congal@smile.fr>
 <b18d950d-4a43-4797-8c9d-0a7b350d04fc@digi.com>
 <DGH6UWVR18RO.2LU166X88G2RC@smile.fr>
 <b374f672f29106dd0c0d02c314f81e9d4ad8bf8d.camel@pbarker.dev>
In-Reply-To: <b374f672f29106dd0c0d02c314f81e9d4ad8bf8d.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 15:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231261

On Tue Feb 17, 2026 at 1:59 PM CET, Paul Barker wrote:
> On Tue, 2026-02-17 at 12:09 +0100, Yoann Congal via
> lists.openembedded.org wrote:
>> On Tue Feb 17, 2026 at 11:18 AM CET, Javier Viguera wrote:
>> > Hi Yoann,
>> >=20
>> > On 2/13/26 19:47, Yoann Congal via lists.openembedded.org wrote:
>> > >=20
>> > > Richard Purdie (2):
>> > >    pseudo: Update to 1.9.3 release
>> > >    pseudo: Update to include an openat2 fix
>> > >=20
>> >=20
>> > The backport of the pseudo patches to Scarthgap broke the build on=20
>> > Ubuntu 20, as it still uses glibc 2.31, so the pseudo-native build fai=
ls=20
>> > with:
>> >=20
>> > > In file included from pseudo_ports.h:5,
>> > >                  from pseudo.h:164,
>> > >                  from pseudo_wrappers.c:30:
>> > > ports/linux/pseudo_wrappers.c: In function =E2=80=98syscall=E2=80=99=
:
>> > > ports/linux/portdefs.h:59:21: error: =E2=80=98__NR_openat2=E2=80=99 =
undeclared (first=20
>> > use in this function); did you mean =E2=80=98real_openat2=E2=80=99?
>> > >    59 | #define SYS_openat2 __NR_openat2
>> > >       |                     ^~~~~~~~~~~~
>> >=20
>> > According to poky.conf, ubuntu-20 is still a supported distro to build=
=20
>> > Scarthgap, so I guess this needs to be somehow fixed.
>>=20
>> Thanks for the report, I'm working on a fix.
>> In this case, __NR_openat2 is not present in the kernel headers.
>> (Ubuntu 20.04 is on Linux 5.4, the openat2 syscall was added in 5.6)
>
> Can we just define __NR_openat2 if it is not already defined?
>
> It's defined in include/uapi/asm-generic/unistd.h as:
>     #define __NR_openat2 437

FYI, I've sent a patch to pseudo with this:
[pseudo] [PATCH] ports/linux: define __NR_openat2 if missing
https://lists.yoctoproject.org/g/yocto-patches/message/3248

> Best regards,


--=20
Yoann Congal
Smile ECS


