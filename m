Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081DED41D54
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 13:34:48 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.86951.1731418481892112412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 05:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G1xkwtDR;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so22843871fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 05:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731418480; x=1732023280; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvpkCr/mLDyn8zsBSunAs7VlQFfcPC1gTid62+tYb00=;
        b=G1xkwtDRSBrWDMv/EDyr9saIDuchmnBsxlYk0tzPThPUBxMEPiusmkoofRvCrRMV6y
         yH01sh69lPr3BvIuDv3/2b/4uxpwbJF5nI8Mcj7ewLQH4kyRG0sjNfA009Jv+91+GTzC
         fp/L9Cxq34a1SzhakU3A4qoYU/BYtYUDWufs4eUlBlB1Ah8tEKuS1HCq27BQEaiF5qlI
         q+76U3LDABWd2na1yq8/bFhRc9ot/9y1mYvg1Sm0B/Pqwa8oqFCCQGRBEe77UqZfVq0t
         YpUM/gcgPJSRi0nv9YTsIUU5TGqbP1qOwUDxWPlGs2ko99N37gl0yVoS+M+6+n4YJMrO
         ExBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418480; x=1732023280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvpkCr/mLDyn8zsBSunAs7VlQFfcPC1gTid62+tYb00=;
        b=MvdXt2y4CgY+SuqUdubKIyreVrFLPLrqNMsABSi0AYGV7P/xwWUr1IAqKHRt1Ia+Qp
         iLEUrjd+VOV8Ua+a7/y8l5OqIF//ZAvSlMBamHEm5798pUcPOsrgTqC/UuMGx+zn4KZD
         YU9UprkUyZKmxfVNFbABMxvoN84d6nScuypERsnOhIJGTvApfdk+u3+W0vLkR9HHHnJX
         fyqNlYJNKTih3wBLBFi3Wr1oSNMyKWxU2rZD9hasePQ/bV73tN0PCokPkIWRxdN4wfNb
         3sexeWzPiIKnOF8mv4IN3h3Vnn5w2GYBoLqTvpyoxzTDRR3AEiYvKaqXAAhYzoJW7VYF
         DrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEG8f4bOpZpva+RcmHtOBVuWvderxRxs2cotiwpXyeenJe6uFTbG8B2DfBNo8fZGnRQhXm+Zl8X6TxeSTJbp2+rQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzS8QJx4XNxr5+FpEKE+9rwywS8hVEmZUFCDm0AnTTj2Z7Li6OC
	rTORKhwn0g2mTJQQrPx+gk35UKSKnnvUKuOxedKJygb9H21lCJKXFxz3I9i+s7fDE7WIFuiwjkv
	hzZa07g7LMB7gx9Mim9NsUxWm+oQ=
X-Google-Smtp-Source: AGHT+IF9zqlbifvMEUOYxTkquVnwzlBu3gzYEF80v0PqA9RjwALgR48jEa+LjoxtaT8eYicHZcKoe7wfOMeGbokIxJQ=
X-Received: by 2002:a2e:be85:0:b0:2fb:4603:da13 with SMTP id
 38308e7fff4ca-2ff2028ed3dmr80552271fa.39.1731418479574; Tue, 12 Nov 2024
 05:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
 <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
 <ZyuQwnMFmfIXDIaa@ravine.members.linode.com> <CANNYZj9Rmrpucd1mtj7jCkPa1b-GS+r5ZJtjS6-A82XjxYw0Kg@mail.gmail.com>
 <60716348d2a4c699ec70bfb4358b3e0d9f4b2fc9.camel@pengutronix.de>
In-Reply-To: <60716348d2a4c699ec70bfb4358b3e0d9f4b2fc9.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2024 14:34:28 +0100
Message-ID: <CANNYZj9Ld6xe2F_0J5i0fasbEAf6c1B3Od7qY3+hjq7NrmSrFA@mail.gmail.com>
Subject: Re: [OE-core] bitbake.conf: require lz4 instead of lz4c
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: jsbronder@cold-front.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 13:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207050

On Tue, 12 Nov 2024 at 14:20, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
> Thankfully, Justin already contributed the fix to barebox upstream in the=
 meantime and as far as I
> can see, it was quickly merged and should thus be part of the November re=
lease.

I'd say you could resend the above patch with a barebox backport.

Alex

