Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81260C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 13:44:27 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web08.10331.1647524665974571041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=DLrueV42;
 spf=pass (domain: foundries.io, ip: 209.85.208.173,
 mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f173.google.com with SMTP id o6so7298492ljp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zfOKosfY255bi2gn6ioRJoLVT7kpUPf74GvjN3qp2z8=;
        b=DLrueV42MlpeRb8/y9uSjYTCB2rV4uyHYyvmoLNwYlRur1jYjv419U4hVqHqNObbDY
         LEc9Cu/vtfIoM1AvkFvrokVJILs7rMNvetLd+KSgaChEwERjmUPeWRd4bTOQCW7VMZaA
         UFh/rEGEjnH3MOJSHIkOjXoLXuzzWZy9ijXow2UTl2l6xe4sk5v6kIMJ1gIbRXN5KTxS
         C5JzD8jMKUNreK7Ts/cl05v8E5tcSWm7nSSUT7za21Zo5OHe2m52d858YC3gRbi9t+UO
         VcnFp8OkXfieG/F77lvnUGBGvTuqtyZFlUdRqtf+n7IA7Yw5c3mPkL3fu0Uzcn+JiETM
         RD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zfOKosfY255bi2gn6ioRJoLVT7kpUPf74GvjN3qp2z8=;
        b=uiwfauw2qZ4ZIScN1Rcxai2Vc7fWynkPdzuJ0kdj4eNCb9E/f7GiF7n9+isz/5K+2X
         HzxRg7vtU6O7pzeRV5kH1h9OeQ0tYwgjce+SUp3nXJTuMciJVkC3QF8cPS2Ei4DbZlV0
         9nxutNv2UeAVJ1Q3q/GPb6jjaLcAAHAqZjWkrQZUAQMNHGPu8My6B9JXesx9tF4G5kT2
         EkhyX7sv1vgYPK5ZedU8Ysa18rW8f5dAeBsrIrpCLTmihkygbF8e8XIK7kW5rVQ/tSvh
         EnD8wtDz214Fj/qFN3rPTZEq/vvD+36oNW/hICgksc4awC+fTd8dh90iP4LaKGO2cxbW
         iawQ==
X-Gm-Message-State: AOAM531qgTSr0sxUPO5dmh+i+kqv1OExjmUdtg/+oIGAR20G9D94aoq6
	sdOPwwrek1qTqJktByio123OBu1nzGwcVj12/2Mv
X-Google-Smtp-Source: 
 ABdhPJxhq1SiqPMppl9FvqX94j2nz7CZWUt+LCXy409c2W6589+crQauIBviOp9WJ0ixA1K4tgc0KUDt8odjYF2GpGg=
X-Received: by 2002:a2e:9b53:0:b0:247:ef5f:fe8c with SMTP id
 o19-20020a2e9b53000000b00247ef5ffe8cmr2885943ljj.380.1647524664150; Thu, 17
 Mar 2022 06:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220317030519.1423570-1-ricardo@foundries.io>
 <CANNYZj87yUzr__GtYtsneOGdESX6EsfLCSbHnUdAkme4tAHCzw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj87yUzr__GtYtsneOGdESX6EsfLCSbHnUdAkme4tAHCzw@mail.gmail.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Thu, 17 Mar 2022 10:43:47 -0300
Message-ID: 
 <CAAaKDhGq37ye6YNGOqJ+FDCqgR-f=nUuO7jLg6-h6EjUpP4kpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libpam: use /run instead of /var/run in systemd
 tmpfiles
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: daiane.angolini@foundries.io, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 13:44:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163415

On Thu, Mar 17, 2022 at 3:53 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> A link to back up the claim would be helpful. Also, what makes this file =
and setting systemd specific?

This file is installed under tmpfiles.d, which is only used when
systemd is enabled, which is why it is specific to it.

When using /var/run with systemd you will see the following message,
which I can add to the commit message:

systemd-tmpfiles[340]: /etc/tmpfiles.d/pam.conf:1: Line references
path below legacy directory /var/run/, updating /var/run/sepermit =E2=86=92
/run/sepermit; please update the tmpfiles.d/ drop-in file accordingly.

Thanks,
--=20
Ricardo Salveti

