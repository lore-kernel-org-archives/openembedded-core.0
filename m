Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47E8C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 16:01:34 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.26024.1739980888220423202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 08:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1skZUhU;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e65be7d86fso9669426d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739980887; x=1740585687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0IfPYpvP6o7tQ1Xm2cGinUPIxtKhcu+SzwunXUSL28=;
        b=N1skZUhUDKKuqvTtyl8GlUtXyIJha8cGwQHi/wqvPxFdp1cZPbl9MMrXSnP/E8HZtn
         9zaBcqf/CuZSyFQnQmq97LaugXst129GXDUeln4NNDSe88wm+PsVfHVSA0KYkbdRmWw4
         Qp3V8QrDf2Ts960t0ZYZWb4dH1mgGRsEdNNAsp+NRP0NxrS9olCOjaGRwAaivQU9aaTr
         wIcWl+u4ZJpdBAKIUOMZQUJEtdtRooN7dRRIz8Gb96XoiD04T+JCPQxzXTwJ4lqzZrLk
         ZAVg88jFXtsqw9ZoMUDibwlG1PUGzatyt3ZNJf1Zd9P7yoLZyqaTd778WSALTav0VI0p
         cnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980887; x=1740585687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0IfPYpvP6o7tQ1Xm2cGinUPIxtKhcu+SzwunXUSL28=;
        b=KF3GX7so11D1c1kemSjDvAB4eXllBwedTGIbMD+/9taANWw5cuzKlsuum8VvJT66p9
         O8XoiwIKamz+wlwwTGPif3JPYHUnv9fZYVaYLeU4Nt6anBi03IIwYXz3I+p9f1CNq975
         17aEeBAHq+TEWwVjJ37O2Qvy6206vSI/wptHqNSBPM8MoTWgQ+38hEzEgHMe461OKw2B
         u59t2xnHik9JqesBnPLqHXJ/QFX38ubqblPukCDozxYCbRojfrIVuw5RZDt0jotR01qJ
         AQalXAnRP6D0UF0c+L47A8+DAl1RM8fUFBrTmA9XvFzoqDHE+IdIo6Ompp3vTX0VIcGC
         iQQw==
X-Gm-Message-State: AOJu0Yz831qkyyoofIpL9OFTXagBptYZenj/YPU4xuOBh4hZVr+f5iI+
	G8/UFYw1n9DjkcXdE/nsZEabGOj6oYWxGptJSxrsUcN8bHc7++RUWg8m/ulxQM/om9jlBQhV8SL
	xJm5Dmjs1bxOgR4mQgl11Fy3CfC6Bag==
X-Gm-Gg: ASbGncuNHtLbaPPUyjDjxIcKrMXHk2Xvy1e57UpyaFuDa8wnskipFG18FGaWqqh5/rT
	p5C6cXmM2E3po6YVKRA5x6mTpLO6J0RsV9K8bTrLTC0KAe9qvX6kGsOD0anGtZ0PmTYy1pGQ=
X-Google-Smtp-Source: AGHT+IFZkhQ+rzAX+XDoa2Y+meDx9Qf0ZdxlY0dIUKR2f7DcigvqCYbXCOSSia/jies4KvvjNGQMqIrNZVarNR5GizU=
X-Received: by 2002:a05:6214:f02:b0:6e4:31d9:b357 with SMTP id
 6a1803df08f44-6e6970740bbmr69193796d6.1.1739980886516; Wed, 19 Feb 2025
 08:01:26 -0800 (PST)
MIME-Version: 1.0
References: <GV0P278MB0516B168ACC6F3595C48BFE88BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj-CjpPU5=4Gcc2S1-CLwn2MJ8qHn1Pdu5zP_Rza=rjBbg@mail.gmail.com> <GV0P278MB0516B25A5B62DFB34E4F53D78BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB0516B25A5B62DFB34E4F53D78BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2025 17:01:15 +0100
X-Gm-Features: AWEUYZl_zSSEyCJBINQQPXoVYCqBYSLB54Y3kjxe-WukZ-pvlUf2_HQQIYOFrR8
Message-ID: <CANNYZj8CN3kEtxsMkm+DgMYmBgD-o94HYbk1QNWfQyVRmaDFyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconfigdata
To: =?UTF-8?B?U2FuanXDoW4gR2FyY8OtYSwgSm9yZ2U=?= <Jorge.SanjuanGarcia@duagon.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 16:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211718

On Wed, 19 Feb 2025 at 16:47, Sanju=C3=A1n Garc=C3=ADa, Jorge
<Jorge.SanjuanGarcia@duagon.com> wrote:
> The reason I found this is beacause I was trying to do something that req=
uired building python extensions on a host were the compilation flag `-fcan=
on-prefix-map` was invalid as that was introduced with gcc13. However, look=
ing a bit deeper I realized that the sed expression is actually not doing w=
hat it is meant to when removing DEBUG_PREFIX_MAP.
>

Apologies, but I don't fully understand what you say. You show how the
entry in sysconfigdata looks before and after without your patch, but
I am not seeing how it looks before and after *with* the patch.
Without it, it's really hard to understand what the problem is, and
how it is being fixed.

Alex

