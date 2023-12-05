Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87181C10DCE
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:28:11 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.1319.1701800887963865092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cvk3v96q;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d9a6f756c3so1409150a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701800887; x=1702405687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4AIztWVwfbkfuMmbSGWbr64sY+rlqITivTxVgOVWsE=;
        b=Cvk3v96qpFKpCJiNlAUSBMPL4fCz1MzwD2M4KjGkpj68YG5srYxSvKmJ7xSIHLeqQe
         n8Tskwu1XQatnaA4iWMXCUCRG91oNQ9Jg0SrPgLph12kYwr3Wwtuc+FOG3z4lYjW2c7D
         hMoj9XcTgaaHqXlcqqrQQDioI+shmU8NMMKP3D8nu7MKj/IbDPxcXmD7oEXRrs+wEcrr
         +6etaK24Fl9OH7NxwmPfBsZYycUcsOggneKcRwNuU1fVfpXOWNiNKbQZ5Rx+PQaBVVsa
         tulylmkbuvTzzBdz+5DcVaPVFJ0qac9r4BuTV8tt/34l54cZqp3VMUUxpMuRTNbHmsLa
         xP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701800887; x=1702405687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4AIztWVwfbkfuMmbSGWbr64sY+rlqITivTxVgOVWsE=;
        b=EfRaF61k+9Zo6w/SgYyicgn9T0iyS2IwoSedD/E9zbxIAeW9BqkRyrqYDMM+CEDpSy
         8YFIGzMVRA2xzSmd3+FKmHMHMS0Cw6OiwKhp3zfkNewCERW+U0zgrMGDwG1CRRGuPWr2
         qyUAE2OUo/MluOVl546W8oGFcep+RH2b+mhYTrQ3UCDTpCZl2d+w9hlHm5oQ421Dc+/A
         vDNfoxYc3bHjmjmRJLSzPSW8Ia9Z5+i+YkxoloOBEwDJIJi2BdVAN/6laswoa+WvZiMW
         fRZiC/SpzhofSLLR/+rc+Dn6na6Zf6Il+/xCEP2QOEK154tiKFQzn37qtn+C6iHkMaLn
         S+Tg==
X-Gm-Message-State: AOJu0YxLME08CE+PV0mE2KmdLH7/HhwMC8mQkAbIOWHrA1NTc/wFlH0V
	1nHJZewFrl5aNw8ihTtHJOLjI1HN/tu+li8FvYk=
X-Google-Smtp-Source: AGHT+IGhycoOsC5HN95EHlhkl7oss+HcPX08YyOEJfTxchT1A/C5y3kfevW5zf1gYL96tXH69B1hFkkG8Xrgm9ldVd8=
X-Received: by 2002:a05:6870:1491:b0:1fb:33d:f52d with SMTP id
 k17-20020a056870149100b001fb033df52dmr7546390oab.31.1701800887065; Tue, 05
 Dec 2023 10:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20231205014155.3991250-1-changqing.li@windriver.com> <D76589A2-EA11-423F-8C77-283FB96BD89D@arm.com>
In-Reply-To: <D76589A2-EA11-423F-8C77-283FB96BD89D@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Dec 2023 10:27:41 -0800
Message-ID: <CAMKF1soNHse-DV2t1caHGci6c=KbPgYd4R6Aw2PW2Ev2CGa2Og@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
To: Ross Burton <ross.burton@arm.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 18:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191858

On Tue, Dec 5, 2023 at 3:48=E2=80=AFAM Ross Burton <ross.burton@arm.com> wr=
ote:
>
> On 5 Dec 2023, at 01:41, Changqing Li via lists.openembedded.org <changqi=
ng.li=3Deng.windriver.com@lists.openembedded.org> wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > To fix:
> >
> > Error: Transaction test error:
> >  file /usr/share/man/man3/crypt.3 from install of
> >  libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
> >  man-pages-6.04-r0.x86_64
>
> This feels like the wrong solution.  It feels like one of these packages =
has the =E2=80=9Cbetter=E2=80=9D documentation and that should be the one t=
hat ships the documentation.

right, I think these should be deleted from man-pages recipe, I think
there could be more such conflicts with
man-pages especially from glibc recipe.

>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191816): https://lists.openembedded.org/g/openembedde=
d-core/message/191816
> Mute This Topic: https://lists.openembedded.org/mt/102984309/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

