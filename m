Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4923E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 19:48:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.18380.1735328879839338952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 11:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiaWP7TX;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so8424558e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 11:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735328878; x=1735933678; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMcSXikF5bog0NzeA6MZznF29xc4U2C9r4UM3b46Oss=;
        b=TiaWP7TXm4CctHbJhGz01Yy2tXfd13sUPULhAmVeL0U1qL9t/jIkHEiqyi9SgAp0wi
         Yw6UF5Z4ddDbOWqtopRFubzK7FnnjwUiw6n9Aek8t0MGNITDAJ8wit+Uh+1hNZjyoMzZ
         x+dB60wkjPj8o+jEoTfJ3PeemEWKUZ1tYtniLp/FHhLdAkOZDMc+3ekC8BWNLxUIuKQo
         89INTSUmwM1DA4nVAz2Vw7yEjaJnDa7M9QsqySD+e3RrXeyay18N8+DXrhksB3wVDa5T
         p/Ppq0dINVTHxAHUs5K1/0LJhVM97Qej89ZmOkAqUl/18fYDbn9q/yFTAP2rqcihwxEE
         in5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735328878; x=1735933678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMcSXikF5bog0NzeA6MZznF29xc4U2C9r4UM3b46Oss=;
        b=ap0MC1RH8/EgZIxRCra+JfItL9JiJEEf34xIbj4RpKNsp2z+culpe/wIr0ZbXHWcrq
         q+jZAe2+y3amc/tPeBYgB7sgYAO3/pvomUIjbj36Fx5EV6fGyj+gy/mnNFevpz8XheRI
         S4VbVdk7dFF2J42U7kgJlxKMiG+0zPwxD0jObMWrFsan0FbWlA0UAZf+SDTpzvhHrsRW
         Btu7lJwpLnMZRsuyZpo6iuvNKNDjVQ4TbqpNSTksKlttfASJx0Yg7tKL7Snrm0a1xekn
         yGCjXMXJSEnn5GTiQYQ+emlXZBdIYUBHqS9SwxjaVsVx8n73CRCkmXe5+DxDXQJBXcCd
         ERoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTxUo6xLhbBffx1lSCkOAL4W057I6FxdgfUMjoEfou1fCCmSY2ZdMTUFwEXf5L8dfYU7gyOE0+gOLwKTlHlLMdQg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7L0zeIDnawZRAKy4guIO/i40mml4FFURJRCATlZiRrSl889N6
	KP56oVXuMSLxXsdB8rsv3ArB5MhcbvAZ1oMNLZwxmYn9B7h4RZ/vKx+B+RS74BuDQUy21HniMde
	QCO9XANrdAZPFUBTEbivCP34Cnlc=
X-Gm-Gg: ASbGncsV/AKXFrSrfPvYYt21iIauDx4FEYR9BiUfI6nNGfFrXZOMSSgb9PK48R7PTou
	zQ4zON62TyzUFGr3GyEAFz6zWgjmQSaW7aFSdRqN6masX4EthWD0c
X-Google-Smtp-Source: AGHT+IEyFpl9J/0olxlItn1rMDoaoaCqwoSgxYXlkLfyNT4NmSX/a2P8L1ki/A4GxAbZHzzEnEPw5q6YY2HLKGPvbJ4=
X-Received: by 2002:a05:6512:23a2:b0:542:1b86:7c1f with SMTP id
 2adb3069b0e04-54229522934mr8663070e87.4.1735328877709; Fri, 27 Dec 2024
 11:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
 <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
 <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
 <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org>
 <CAJdd5GYwyLGFs_nreXDNV6F8_GAiTBMhWOe6V_TiO9aw+MCOng@mail.gmail.com>
 <CANNYZj8_OShX4sPqhGpb3HSbN0quMKUcoFtKhLrcGTLtG1d-Qw@mail.gmail.com>
 <CAJdd5GbRf731WsnMZujR3SUCVUhm080f=F_iZsFTuZxt1kQH=A@mail.gmail.com>
 <CAJdd5GZwku_0yGY0qb82tnmHopj_D9xH=_vYMfPnKtcYuJdz3A@mail.gmail.com> <CANNYZj-8UeVrF6qrcwud4MG-+7x_pkxU2k0jnnCL1_svPGtJcg@mail.gmail.com>
In-Reply-To: <CANNYZj-8UeVrF6qrcwud4MG-+7x_pkxU2k0jnnCL1_svPGtJcg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 27 Dec 2024 12:47:45 -0700
Message-ID: <CAJdd5GbAM+NSceXCDWV46K=TP=bNf6CpXMaGZLQKU7zNt2tn_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 19:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209112

On Fri, Dec 27, 2024 at 11:44=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 27 Dec 2024 at 19:12, Joshua Watt <jpewhacker@gmail.com> wrote:
> > Ok, I tried it again, and it didn't work for me (or at least, didn't
> > do what I would have liked). You can set MACHINE and DISTRO in config
> > fragments, *but* it doesn't affect the machine or distro include in
> > bitbake.conf. This means you can't really specify MACHINE or DISTRO in
> > a fragment, or you're likely to get really strange results. You can
> > see this pretty easily in the environment output; the MACHINE variable
> > proper may be set to whatever is in the fragment, but the included
> > machine file is not the one that is specified and thus the actual
> > machine settings will be really weird (same for DISTRO).
>
> I have sent a patch for it, can you please try it? It does solve the
> issue on my side.

Yes, that fixes it. Thanks.

>
> Alex

