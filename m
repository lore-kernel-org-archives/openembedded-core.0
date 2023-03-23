Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5416C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 22:34:22 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.87462.1679610853087593524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 15:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C280b0uD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r29so12834wra.13
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679610851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rm8HKfQYhJKDUPfYWgYPhoyNsTGiQIcsnSk3z7gFnWY=;
        b=C280b0uDPGl6kBTGxhl5PomGiywcCt9DXa8ZUo+aFPPTfXFsj/u0+3nN3FRgnjdR5a
         Zif45JOo8y86lpxtN5VCtXNcS4Nw2vs098l8MO8rOsGZH0bf3Fo1yFDORXd/LoVE4F1n
         j7KWDpsfBWLaMV7hCFsa/NI+izSQW3bbZY0vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679610851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rm8HKfQYhJKDUPfYWgYPhoyNsTGiQIcsnSk3z7gFnWY=;
        b=BBzB5uVuqoZrQbwMZCo5m8AXQfVOI+2KF4zUeFTW55aBx/XQskBYZDUdtxcczBZ2ou
         TstlNIqWhNWk7k0vKZ7Xu5nx6vu/RpDnPMACSxiFnzpjy+W6vaIOTzMpGx+XViWbiZnU
         8Mk3w/ic22oAp5Qzg03Txp2V/OIzKNHM+wEVEdVZtwxP0FoVc2ZwSFs3uI//5H1hpY5o
         plplBnTDWiH6boKsYGsWjCBY+o3MgqRFBpaZvQvVxw9bWQ/WblRb0LkTQEkkz0vrSGDt
         7vCLC+I4hpBVT6lfAHZLtTvrdxWcXVj69V11iwxT0tQ3dKQHDgvQjB8VCP8Hcus0+nAk
         V0ng==
X-Gm-Message-State: AAQBX9ddoJmnVzvz+z5IxugbeifMgoX+jkLQtMFtjnLgTm7bm3Xq1YOp
	vC/honR4OqKTHuNmS3AE9ZjrAQ==
X-Google-Smtp-Source: AKy350YBI9iU7M56ubd44to7rDm62yf9j38snXA7Jc6Z1Ir7SShjOTQLwkpTL1m+l3c50ooKqnWDBA==
X-Received: by 2002:a5d:4004:0:b0:2bf:bf05:85ac with SMTP id n4-20020a5d4004000000b002bfbf0585acmr423442wrp.23.1679610851520;
        Thu, 23 Mar 2023 15:34:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b274:32b5:9a06:2db7? ([2001:8b0:aba:5f3c:b274:32b5:9a06:2db7])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4d87000000b002c707785da4sm17004885wru.107.2023.03.23.15.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 15:34:11 -0700 (PDT)
Message-ID: <e4746e47eed8ec1f551ea623178bd1375c8e9a33.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2023 22:34:10 +0000
In-Reply-To: <9VVZRR.NLXPW4ISUM5R2@t-online.de>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	 <dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	 <9FONRR.ZLSABXKTP67E@t-online.de>
	 <a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
	 <B0EORR.JWJ884MGYK8G2@t-online.de>
	 <CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
	 <CHRXRR.A1NILQGNBS7P1@t-online.de>
	 <CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
	 <9VVZRR.NLXPW4ISUM5R2@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 22:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179009

On Thu, 2023-03-23 at 23:30 +0100, Markus Volk wrote:
> Am Mi, 22. M=C3=A4r 2023 um 20:11:34 +0100 schrieb Alexander Kanavin
> <alex.kanavin@gmail.com>:
> > Then run bitbake -c testimage for each of them.
>=20
>=20
> I built all the images but get an error here:
>=20
> bitbake -c testimage core-image-sato-sdk
>=20
> ERROR: Task do_testimage does not exist for target core-image-sato-
> sdk (/home/flk/poky/meta/recipes-sato/images/core-image-sato-
> sdk.bb:do_testimage). Close matches:
> =C2=A0=C2=A0do_image
> ERROR: Command execution failed: 1
>=20
> What am I missing?

IMAGE_CLASSES +=3D "testimage testsdk"

Cheers,

Richard


