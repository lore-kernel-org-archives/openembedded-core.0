Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0887DC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 12:58:12 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.42182.1669899487366591941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 04:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V/4qI2Oj;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id b9so1780687ljr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 04:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQshhcm6oxt6F/ZHtPZnfuf+oIQSvkfgD2nHDFlwkBY=;
        b=V/4qI2OjWIHVfOau1oYh8TJ/APSFpnLlZxkF7OJ29WV/3pulvyldaCRiBqx7Rq3nOt
         8t+G82lgZy6o6jugId+f/kYs5HcPKgsIUFSCSVVJRiSn0tRdVXyZpb5U1vbnxMze7BXH
         AXnm+nA7aw9hnARP2X2+jHUudpxOPXfPR/VTwdkQlTGnAZjAFS5j8eNghqBzoXtkUDFM
         T6vlSLT80JZLyjIhPWZnTlwoUEcYT1e6H+NNYDdmJP6Ef66k0w9SoIX2RQ7ocKlCj1Hz
         IhdDs7lpuPeQehy380/rwfdBj/961osmqId5IS7Zz4Ql434s3ouqQ0YNS0U5zp89Uula
         sgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQshhcm6oxt6F/ZHtPZnfuf+oIQSvkfgD2nHDFlwkBY=;
        b=GEOGAl7WZqEaD7lHGbVzo/VbCdMTg6LWeWzgbnHd3uovjbja+nI0ZV2qaNPUZBMwzX
         8pXdI62jXWQZMcl1uc8Bnr4dRWb3x6YWEgnuCPl79Gyr6J86gWjv1i06YkxU/OpBSL+W
         1tAxILBjl40f90m4ujYSmBVtxxwhCrnMFEluX8RX5peWtoYYppMtflo1B6Cm1Z0LEMC8
         BCXNuIz9FF2P6nonhoxJz4XdpzzyEryYAVfns3n1tVd2yfMdJX2LaLZKWjQ8vMa92uyL
         r/8PPypEyU0zRKea71hZT+NywndHbpB5MYmLqnDkbY5RJg4bpN5rTi6gh6XiPY+joUdn
         6ILg==
X-Gm-Message-State: ANoB5pmyY9QR1QJV/7Lkr3zyqTTkg5B5XOEJhRyZxl+nS1hFI1lgp9LI
	io47jQ5F9n8HJh0VmCXkthv09RprCq7a+qVNL2A=
X-Google-Smtp-Source: AA0mqf4QSQDARP6U4GOradZHwhjDHn32gtu+jbJwbO1wvZKV9i2QKfqmS+u7x9z67jce6FVdOMJMIhbwt/WJdsQZ1xw=
X-Received: by 2002:a2e:7818:0:b0:279:bf32:34dd with SMTP id
 t24-20020a2e7818000000b00279bf3234ddmr3528378ljc.31.1669899485416; Thu, 01
 Dec 2022 04:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20221201075324.353632-1-f_l_k@t-online.de> <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
 <CANNYZj9TwYeQ_UfD-oi8Md+cH-6Tx8s+jvM9EmrMC4LVBK7J8Q@mail.gmail.com> <FC456B28-1AFE-4B92-9C03-37CD64631D0F@arm.com>
In-Reply-To: <FC456B28-1AFE-4B92-9C03-37CD64631D0F@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Dec 2022 13:57:53 +0100
Message-ID: <CANNYZj-9HLjybi0kwNRSueLi_A2+hm7GREu=Ah1M=qojn81MPA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
To: Ross Burton <Ross.Burton@arm.com>
Cc: "f_l_k@t-online.de" <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 12:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174057

On Thu, 1 Dec 2022 at 13:51, Ross Burton <Ross.Burton@arm.com> wrote:
> I might be putting a different emphasis to you on that =E2=80=9Cif we wan=
t webkit in core=E2=80=9D.
>
> If webkit ditches gtk3 support *and* oe-core is still shipping a gtk3 bas=
ed UI then I=E2=80=99ll repeat my suggestion that the autobuilder should ex=
ercise a GTK4 stack properly, and ephy/webkitgtk4 can live in meta-gnome.  =
Ephy is a GNOME project, meta-gnome is where it belongs.

Yes, I'd rather keep webkit/ephy in core. For one thing, we can add it
to core-image-weston, and instantly have a useful graphical UI that
way that also exercises a lot of things across the stack -
terminal+browser.

Alex

