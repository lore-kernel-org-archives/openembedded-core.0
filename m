Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975D8C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:10 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.2604.1639594637476767107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 10:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qY5bpAC1;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id 30so42721115uag.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 10:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sa84s7Vrzm0OkqufGVzu3mPGvU49ig0NDm5RnxKNvvM=;
        b=qY5bpAC1So3vE/UkZHqylfGwRO4yy5/Ww06hMCOVLCUfILgka/C/GCtjlcbucWBrCA
         HoMXs3R8blxGK4ZMd+CU4t9YJb+8miM2A0Z8gbSRPfPWB6Gg/mw5X6dBySaQkkbpYA3A
         NC3zqDsFjjpMblAFwmXInesLZ+PHJ5cSSWg25NelrJgWf03ew5Hf2NaG+xyqB6McLt83
         DDY2tsXMqla8RrusX90AGCp4nwrbCvd/JS51SuTmiJhcqtyytlTPEiT3GedI1FbZDnUa
         v7zzjpq1LFUna0GcUAsMEEjOvbSzAJfWnlAbs10BR3eq4WtgxRKIqNDkJuObORZiJ8xC
         qb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sa84s7Vrzm0OkqufGVzu3mPGvU49ig0NDm5RnxKNvvM=;
        b=lp+6TC3+SFwj7kN2/9EJCRcjVKEt8k627SuhxKBoqHhVam4RUjkKpWVi42xkn/KoEJ
         YaFnF9S1MrVYarCguNIh7Y5oG6QVv/wUNVltj3Gozvf9H24Cdod9JJSZMVdAGf2827UQ
         EtWa3MMeT68A9ZTvB7tuyorjHp9yu94V+tby+vySggAU3niZ+GAlzZpYUU0mRZug0yYU
         8V9m4XEqgyw7k2ro6IYHqca+14RiHWwZyUDDuoyaEdgIgxEhJ2YQQbsbal6W+s2mxqyn
         8VIfPKa4VVeKb4Qibr+4RJk8LwDgR2ZsF3gVvLsnMlxftFXGFZOmKd2DCefO0ZsT4WBP
         baZw==
X-Gm-Message-State: AOAM532HP+NlyGlkXSnyyRMxdU70ETVFa8CaDH5Cgklx4TYGw+A9G7LA
	AWV+nso+ZRxMOLXsXMxbQO2DfjOIRsgVenAJIzo=
X-Google-Smtp-Source: 
 ABdhPJw6j/vDUB2wWu84IglQQ/+csYcBX4/5GgiCYaafLuFtm2gP1j28lnHwcjEIP7b33DAfKE/qSRVqQL2D2RL9uus=
X-Received: by 2002:ab0:1e04:: with SMTP id m4mr10905813uak.100.1639594636647;
 Wed, 15 Dec 2021 10:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
 <CAGgRHJpbpit-O5dRs_ytafLgk8cOb4qReACeGDaB2sk=jB+qWQ@mail.gmail.com>
 <CANNYZj_eCMyQYHhx7uhZ34NTGekeWAwcGSPCvE1P-tO5wLhp8g@mail.gmail.com>
 <12b73e8c-d4b7-d8cc-0c1f-425c045a95bf@gmail.com>
 <CANNYZj84Y8azO2aGLUu8q8_AqcSX=iaP8MUfJGuGS-wB6+7fyQ@mail.gmail.com>
 <caed28f7-e3cc-c64c-4095-b94221d58bd1@gmail.com>
In-Reply-To: <caed28f7-e3cc-c64c-4095-b94221d58bd1@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Dec 2021 19:57:05 +0100
Message-ID: 
 <CANNYZj_30uDN+xC7yNWn3o48G_iwFtsg0-cqgy=PJt_qt8hsOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
To: Khem Raj <raj.khem@gmail.com>
Cc: Matt Madison <matt@madison.systems>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000e4a0a605d333df47"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159738

--000000000000e4a0a605d333df47
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Dec 2021 at 18:56, Khem Raj <raj.khem@gmail.com> wrote:

Picking from set that yocto project supports
>
>
> https://docs.yoctoproject.org/ref-manual/system-requirements.html?highlight=system%20requirement#supported-linux-distributions
>
> ( centos8 uses 4.18, centos7 uses 3.10, and debian8 uses 3.16 )
>

debian 8 has been retired from the AB, so it's just centos 7 - I wonder why
we still need to support it as a host for master; are there actual YP
members explicitly asking for it?

Alex

--000000000000e4a0a605d333df47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 15 Dec 2021 at 18:56, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:</div><br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Picking from set that yocto project supports<br>
<br>
<a href=3D"https://docs.yoctoproject.org/ref-manual/system-requirements.htm=
l?highlight=3Dsystem%20requirement#supported-linux-distributions" rel=3D"no=
referrer" target=3D"_blank">https://docs.yoctoproject.org/ref-manual/system=
-requirements.html?highlight=3Dsystem%20requirement#supported-linux-distrib=
utions</a><br>
<br>
( centos8 uses 4.18, centos7 uses 3.10, and debian8 uses 3.16 )<br></blockq=
uote><div><br></div>debian 8 has been retired from the AB, so it&#39;s just=
 centos 7 - I wonder why we still need to support it as a host for master; =
are there actual YP members explicitly asking for it?</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000e4a0a605d333df47--

