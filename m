Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362ADC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 10:59:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.163860.1673866737369465021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 02:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a7uK612u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id g10so19696505wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 02:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wXhDRzAD2evIVHJbX2vBjSYJle/qWQ0IbRiZnddGcHo=;
        b=a7uK612u//NXvY6dnGbvhFClzVcy2EKecDOKazLm70OyO9Z8MsMywly2L2fXTkSUR5
         XCxdF9dWmDYuCyhXb9yOUMoSj0bpMOFytBd5OVTj1VBVpekrsMNcr6ffodcBoGIOOxyA
         BW6z7wnkEjGOYCYTKx68aWTtRjD6n/ovZDFws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXhDRzAD2evIVHJbX2vBjSYJle/qWQ0IbRiZnddGcHo=;
        b=hEqNeveIbIxX6YwnjHw7KPgDiuxMavjjwpPJjjGqLIeYhL+7etsiQfQ8e/7PePKj6L
         C9xUtCQK2mtsmIWVgv73g9R8f1lUFsX++5fTcnxBK3UOEbN09A2RlF3CO2/T/XASzhgX
         B/GFUk1IriF/te3unqHhZwd2k1ythlsMxhVMxyyxWqJ7you+rGLdWkP4Wke2jSLYjd8s
         xAql6L2QK3m6V5T21D/KIdRHuzA4wW4eJokSuLMEgQEeenLkdeE+1tRKS4couxD0+adj
         frBx8ctp9VlXofwYZV3/TOv6g8UgoLYao1PJjlihfq5kG3yr9PXYUBha2++YKzie25dU
         bAuA==
X-Gm-Message-State: AFqh2kqF0nI3CWNW9BcOTcuCYjIXLaNjZzsPVjBrnpGTOcEHdxU6TMSW
	60ezbNny3oGWZdZxgdcn3/YIFg==
X-Google-Smtp-Source: AMrXdXunz2FqpKixFY+UXzx6zNDg1kh+VnFf6UIzJ88QlFgTnbN0sLT0zbEDShALtwtX5S5pOmSMFA==
X-Received: by 2002:a05:600c:1e11:b0:3da:f9fd:f874 with SMTP id ay17-20020a05600c1e1100b003daf9fdf874mr3566602wmb.23.1673866735596;
        Mon, 16 Jan 2023 02:58:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id j18-20020a05600c191200b003d9dee823a3sm36530494wmq.5.2023.01.16.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 02:58:55 -0800 (PST)
Message-ID: <70f5061236a1283cd18a89ce28938cb21df2072c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Pawel Zalewski
	 <pzalewski@thegoodpenguin.co.uk>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 10:58:54 +0000
In-Reply-To: <CANNYZj_aHCPmBH=Kzr6kvzdnPiDMxauC_q72Zv58zbPwWNrcbQ@mail.gmail.com>
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
	 <08ea029850c0dd7d0a2577c1721e0ef516aadbb3.camel@linuxfoundation.org>
	 <CAA6zWZKmRG8rvmjd-Pec0jKN+jkPH9DyOHFxFVycRuysnizLag@mail.gmail.com>
	 <CANNYZj9H__DUKty+N3R=didcPYk9FT7RKSYTQum0H1HPzpbfJA@mail.gmail.com>
	 <CAA6zWZ+Vh_qjeTaJw+c0EzOgmKdsYac2q85ihn0v5A6i=b-Y_Q@mail.gmail.com>
	 <CANNYZj_aHCPmBH=Kzr6kvzdnPiDMxauC_q72Zv58zbPwWNrcbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 10:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175971

On Fri, 2023-01-06 at 14:32 +0100, Alexander Kanavin wrote:
> Now I see what's going on. The fs-uuid class contains two functions:
> get_rootfs_uuid, and replace_rootfs_uuid. The former is not used
> anywhere, but the latter is. Can you introduce get_rootfs_uuid() into
> something in oe-core, perhaps it could enhance existing code somewhere
> (maybe complement replace_rootfs_uuid usage?), or a test could be made
> better?
>=20
> Otherwise, it's still not tested, and will regress without notice.

I still didn't quite understand this explanation since=20
replace_rootfs_uuid() calls get_rootfs_uuid().

The issue is that UUID_PLACEHOLDER isn't used anywhere in core:

UUID_PLACEHOLDER =3D '<<uuid-of-rootfs>>'

which means that get_rootfs_uuid() is never called.

There are some hints about how this should be used here:

https://git.yoctoproject.org/poky/commit/meta/?id=3D6d7bcd4df5722f3ccebbbf7=
3361838cb0a5dc0ee

The fix is therefore probably ok but a test of UUID_PLACEHOLDER is
missing.

Looking at the class code, these two functions should be moved to
lib/oe/ as well, we don't need a bbclass for this.

Cheers,

Richard



