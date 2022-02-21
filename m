Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4171EC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:06:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.10916.1645452418479804232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VhIdho1i;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id p14so33490143ejf.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vQCf3mnbgNPDYwfp9FBEFQrKIfu2/qKtc6Fyd5tKf5Y=;
        b=VhIdho1iu8g9PtsF+4HOXIEA4iUwGU87LD3EhsulGcltYvUvo92OqNNW2CDLFlenlU
         UeNrj12UrkgJEzm/oyWcpS5HlqvrEFroJp4CirfYq4h+qSgRaLKtqQ708zvj8ni+U7ll
         BzaI+gVxPdduJgXTqCXe1wet3O6LjMH8chVy8K3j+cpeKNZgmGWaGGkDmOtT6id8j2yH
         0izc4ZI9NdH4Q+w4xipEYFTvo81DwjfQAvI0rABITZhha/eIOxmNFKIOCsVAF9d1xwzV
         1ATuVMDrGUenYWawnHEqQSGha5v9g5bV56XOT/e99jzZkj8y3qybA6wdvY8m6ECMnLbZ
         y0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vQCf3mnbgNPDYwfp9FBEFQrKIfu2/qKtc6Fyd5tKf5Y=;
        b=nky6tYAA8ySJic3bLtSO1gUouxgLf/kOzQBmpZLdAPyVOJXNGPuHvjbNI/f9NKf4LQ
         rMRDogeJAV2xzvDQr8miTR95ib9DcS3GJOFnnKncnpx2iRW9emSmvznlwZqMiI2AXzn9
         gsXDdzJJd+1DILN/bwH6CTtNZuYzarX9zIDp/3tT7C1D42c20rgJLWMU1mZtTyAHygqA
         8T+l5h0pavWW5dhxyJ0+5P8aOaVo9bqO4IxGNmydfFaCC6QE08txGELwU4L40h8kf8PN
         RVWEjoFSw7TEy0K+Ob8owxBPIVtN//IGkQhyOO+b5+zNwZ3PKxlMQNzOWjVLR3Vuuehn
         uyhw==
X-Gm-Message-State: AOAM533w0alR/brwxGylUsojkIBc3/Bk6/bw9JY6YK765FOR+3E14qCE
	PI0Ol8x5rTOfNMfEtfZmqp0XdpYzNxXJtd9OK16m3Q==
X-Google-Smtp-Source: 
 ABdhPJw4dp20ucxMVZ9DvRyql4mpxkxOOnSrGmNpHFT9VoImruEJLz4sZ/pQmhD3su8b/xNLjSuXnb1a77l9mOo6rDo=
X-Received: by 2002:a17:906:dd3:b0:698:3e07:dcee with SMTP id
 p19-20020a1709060dd300b006983e07dceemr15982862eji.487.1645452416792; Mon, 21
 Feb 2022 06:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20220216035900.851949-1-tim.orling@konsulko.com>
 <CAOSpxdYvC6Lk_d7MT81ZM72e4NUrPyg7W3HhF53_niN38bA77Q@mail.gmail.com>
 <CANx9H-B8pxFuD6Dsv+Zhw=iBzeVvOd+BCZijY96xjHtBCFwijA@mail.gmail.com>
 <CAOSpxda1U9+x_EDqcWd=Xv4Q4yUk9CnnPVNyXukZuuXqdFhw7Q@mail.gmail.com>
 <YhM5fyUSSrhW8E2D@korppu>
In-Reply-To: <YhM5fyUSSrhW8E2D@korppu>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 21 Feb 2022 04:06:45 -1000
Message-ID: 
 <CAOSpxdZAb-3EjdhAAaJNN8X6ArcWq3xRw5YxSTBqw8add1i0jQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] openssl: upgrade to 1.1.1m for
 CVE-2021-4160
To: Mikko.Rapeli@bmw.de
Cc: ticotimo@gmail.com, tim.orling@konsulko.com,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:06:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162027

On Sun, Feb 20, 2022 at 9:04 PM <Mikko.Rapeli@bmw.de> wrote:
>
> FWIW, there is also the pure patch to fix CVE-2021-4160 in openssl 1.1.1l for dunfell:
>
> https://lists.openembedded.org/g/openembedded-core/message/161652
>
> Patch versus letter version update, which one is preferred?

Yes, I'm aware of the CVE only patch.  In this case I'd prefer the
letter version update since it also contains bug fixes.  But if we
can't fix the ptest regression in the next couple of days I'll fall
back to the CVE only patch.

Steve
>
> -Mikko

