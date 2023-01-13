Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E73C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 08:35:04 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.81501.1673598901720251939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 00:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y4+LoKuP;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id s22so21776104ljp.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 00:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFrD2Qdfaj6If8NbFrYkgx8SmkKOgfbMDzBC8cMfa6k=;
        b=Y4+LoKuPK5ACGK3RprNdAIK6LSTF/xfz9PtQ/2QBguyOm1f3qicaZbmaalrTwf2x2c
         Jv4R48rDEyCEhhIH46IKEybwFwRV72ElZ6hgk1JmFhgBQf3ywhB+6rAZYeLzOCUu4MQu
         Eu2FDE4jx/xyRUp3P9wMNZkSVq6thho1fD+t5k1j5p99XjjmRaEfrNAtHPELzD7Ivg+E
         KjXOU4xbGlmwbGCf5232Ndsqt/km4WiAgrwekkHG8FNsn7aTsBi+T0yvyV6MvONORBue
         yRyZhql4wLrMw55nVU8PW7dx4fck/uMMsnPvtbfL65STi8o1mFEpibD043skNe1IxbMv
         k6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFrD2Qdfaj6If8NbFrYkgx8SmkKOgfbMDzBC8cMfa6k=;
        b=mkQ50gSFqzOFr7QPWuzVMgzDgbCFrJlnN4ifeI0gJ6FKH8NmV7zxtvFRk2RGX3tpe8
         2ou+ghhCJxGDVHlidvxN/HLIFv2kXVrHblzPBBBhzVvyIoQT/PtwoGj93b6f2FkL64t1
         TOhbvzXjjBcDLOYkZxUX//fAPeXZ27Qs3l8R3V2uwBzHGnc4SF4iGJrHO72Vn0iedJQK
         SKV5mqRwOI2N3fFvShS3JSPT0ra5ywliUkp4OoEgnK0MSHPp2HAuk3zYQ5sE4LMFqMFY
         6oi2Dl9A1LVOETua/u5P5x2Nkc5IOPeCjy8quBtwfGxNQ53MOc3Uq2MsEj/63rpmb2wx
         VePA==
X-Gm-Message-State: AFqh2krcNS3dHxVmmivdKFJvdyNEqPaAiU6zgxE4Zd4BsZM/EV1UxAOQ
	LwCl+osNKRYk2tqRenudb90kGz/kCib3y9YF+rY=
X-Google-Smtp-Source: AMrXdXt/xZNaj4p5TE96TFdiWerVTj4Gt4gmG56emPPbGj3lWtafttnHlvjrAOPdskgFmMatFTA8mAfPflW8XFtczNE=
X-Received: by 2002:a05:651c:1426:b0:27f:dea6:3d2a with SMTP id
 u38-20020a05651c142600b0027fdea63d2amr4246405lje.45.1673598899892; Fri, 13
 Jan 2023 00:34:59 -0800 (PST)
MIME-Version: 1.0
References: <20230112213301.11768-1-s.zhmylev@yadro.com> <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
In-Reply-To: <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Jan 2023 09:34:48 +0100
Message-ID: <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 08:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175815

On Fri, 13 Jan 2023 at 09:25, Sergey Zhmylev <s.zhmylev@yadro.com> wrote:
>
> Exactly! Even more: when I build for "genericx86_64", I get mix of
> packages with architecture one of: "x86_64", "genericx86_64",
> "core2_64", and "noarch". Our audit team highlited this as this is not
> compliant with common RPM naming convention.

Can you please link to (or describe with references) the common naming
convention?

Alex

