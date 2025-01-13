Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5052E7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:11:06 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.16237.1736773859125093961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XmcoRTnF;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dccccd429eso34087036d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 05:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736773858; x=1737378658; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gieGP3L5LnT/wnT9nJbImurWbGPLAcCWEUfQ6eCrBCw=;
        b=XmcoRTnF/SuleOiT6N3NmZBh7r3Gos6P2ybifcVyciNUNJ8QBM+CXS3yI/hnQfcP6u
         AWhN24uyAb75fdZbyjm0pd5xOmidD5NFdXn/OI3D/RJ0as6jCma6rsy0y1BlvglUPAMY
         ReNG2sRmTaT1pvlfsTbzFz4lp9y9zTj3PcjR7JfmBd4TqhksIlsG6zvrxGsd3i2Bezks
         9M2Axvh4hikqvjajroQXx5vu3n1qyY8adl5gFA/hbE6unah5urZY/bsWWC90k4ZeonfF
         7VmWNGDVI8iWHGHB7hmZq/PTFiAWDmyUBMB8pIX7l7LToij5Ev/X+1+7nCFdyMDV4Dly
         lpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736773858; x=1737378658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gieGP3L5LnT/wnT9nJbImurWbGPLAcCWEUfQ6eCrBCw=;
        b=I0kJM4QMMS0hKqo8UvL4w14FReB9gWeAb8g4yE6yf6WxXm3mqwrlZBQi5/ObA7wC4Q
         02ejGB/82eHo7mh+exqjGShMW8/c8opKteHLKHnBX4eZbylPL3sXqzAWYkghm1Lta7BF
         ZhRcPGA1EWSB31VfY5t0LnZBWNKsUHuiD2sVZZv16K4wIVPDUNFdj6W9MtLSSBErUpj2
         oLMNEjsLAsLaZ1cNeQSazZ04+1eJ7/O19ZUnTnYYMi1Vc1L8XMetKO0D/8uCGJSVNw91
         6SL9Zkb4n2w23HGr4XAoszrvMHH7GEzxzbRuZMouTFtYL7ev0EhRyWdaoP+wWsrke1Nk
         8G+w==
X-Forwarded-Encrypted: i=1; AJvYcCU7BegPRhxCuLozcs5gRAFCnZoOdueVP0+rqPivGCzSP1FewdxUhk4GxdGO/t989ol1UKh4rpP3l7resVsBS5IuXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/Ykorf3kydnZpmIEVMZQcM+X7eO7658rw8hVFBShaKsb0TdmF
	+Pd7jo0R8mC3WJuKSTdemn9wh+t/he3tQm1iEnUzF37Q5FMP4kpA+RPCvICLN6qqkMZPfU08nVU
	q7VXONAE9mfS+LCBwi8Nod0/X0ZI=
X-Gm-Gg: ASbGncuPZ4ByL/vmw3nxo5CBdH4b4+knejW0hznpgYiPJBiWkJu2QLZwFKD+esiNabK
	iALetkDTuy0QoGXjwucDDX2qENtHISvG4pXo6P0TVVdQYOn+DPmZMhqX6umC8vMIx09C9WCdb
X-Google-Smtp-Source: AGHT+IEqHeG4YLuFVt6zTb83A1J4wOMypmawOLrB27ZfB4W1VjP9yo8BR2M/xh3aJd1JQCVytuTP6MJu3O5e/Zdp7tA=
X-Received: by 2002:a05:6214:dc4:b0:6d3:fa03:23f1 with SMTP id
 6a1803df08f44-6df9b1ef368mr325176856d6.13.1736773858164; Mon, 13 Jan 2025
 05:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
 <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com>
 <08981091-3b9c-4282-b1d5-bd777c69d2e4@leica-geosystems.com>
 <CANNYZj-LbrGbye1PHktf6CRAeS+RcV07H=TbsESG7s6wmRD2=Q@mail.gmail.com> <4d18c6e6-ec7c-4c2a-9a12-98fe1382774d@leica-geosystems.com>
In-Reply-To: <4d18c6e6-ec7c-4c2a-9a12-98fe1382774d@leica-geosystems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2025 14:10:47 +0100
X-Gm-Features: AbW1kvbu-nd9GiS69SJO0BkANcJI2d4qwCiw26oG4eHPPX46ryTvqm6jlBY_-nU
Message-ID: <CANNYZj8r3j3tuaOKcNKZkV5AiLjOmPGbVYMK30hGvfSf8mezaQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file
 shipping from 5.73 to 5.72
To: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 13:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209719

On Mon, 13 Jan 2025 at 14:07, POPESCU Catalin
<catalin.popescu@leica-geosystems.com> wrote:
> I don't really know how to reproduce this error (which I don't see on my
> setup).

Have you run the testsdk task specifically?

Alex

