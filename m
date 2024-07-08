Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC577C3DA41
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 21:32:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5602.1720474324369336704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 14:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hrIvYZe9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4266eda81c5so5915455e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 14:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720474323; x=1721079123; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KfcCYbm/7c14Mq/KdXRyOWOb+4QeFTCc/J6UTNGIdiI=;
        b=hrIvYZe9P/zUQoFAew0MFQd9+kSc4PslbinF2pZKXCv2y9a0OldFWKxdy3xgsZIc++
         zJHgBjv0i1H95oPptCdPEVeNikPmJdBT8jotLgIRNEmhC5alA5LPugUwvOl6smz2tT9B
         VeCvfRBSLrA63jr6NFfJCROaNbrKXEPkbPWB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720474323; x=1721079123;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfcCYbm/7c14Mq/KdXRyOWOb+4QeFTCc/J6UTNGIdiI=;
        b=UzdQtRmpfuVKNnFAv3XqXZq7GX3Cxhiy7It9Fl4mO8LsVhhw9100wAOawbrT2iim5J
         azgNzme9SJ/4IEObQ5hG819pgvTPPM4rkuvsYKjfJsTGyrWHdEZtipsC32zvvBNviB7G
         ljipgTObgXgFhrLQB9mz5IHW0kMHXZ9tG8BanQHuFcxlHYNMLGNFsMOtqWNGy1oDnr6J
         WIpZrNICX6AuD5tNoHfydtmIV3qVuoqet/Pk6EUFs0XvcJ2Odu6MItGhxor78dhw0EGq
         M31VPaBXT/01uGfJ5iL9VageOfAoiEu7qJxlNZ+9NOESDco4gE4xqpu0k1y0IdtnLeRn
         Muqw==
X-Forwarded-Encrypted: i=1; AJvYcCWL/vsWpj3rEoksbjLERrXnWoyNdPrpI3P+YGlVRxpHBw9LVlehD3SNd30K8D7b6JVKIMc0aM59UWgd8T0CFsrJQwEErkFN+1mGuuU7lU+P6XeiRPTXvK5r
X-Gm-Message-State: AOJu0YxWT5u2i4fJYL1jeG4PAK1/wiN+ZvXafe4HfZqxV+VI6KngdZss
	eCbVfvTk34IlnXJBYq5PIt0BS2g1RmqGlvUNt9U5A+rDZPsXb8LwBVtIgnGAExo=
X-Google-Smtp-Source: AGHT+IETG17vGYZXLbxkKdUdQKGg5GMFOceYHh4KNp7L3HL0Ui9B2eevh2LoSRNeO91CGtRvzrAIPQ==
X-Received: by 2002:a05:600c:2d48:b0:426:55a3:71b5 with SMTP id 5b1f17b1804b1-426707ce9c0mr5277625e9.9.1720474322704;
        Mon, 08 Jul 2024 14:32:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6c1e:b1f8:4156:8a30? ([2001:8b0:aba:5f3c:6c1e:b1f8:4156:8a30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7df5esm744053f8f.22.2024.07.08.14.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 14:32:02 -0700 (PDT)
Message-ID: <e2b4f7f59893c005511f1ab7f47d2b70cf91d0a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] wic: engine.py: use raw string for escape
 sequence
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>, 
 openembedded-core@lists.openembedded.org, "Hatle, Mark" <mark.hatle@amd.com>
Cc: Steve Sakoman <steve@sakoman.com>
Date: Mon, 08 Jul 2024 22:32:01 +0100
In-Reply-To: <04d0dd97-6e67-4d5c-a82f-e4ec5f0465f6@amd.com>
References: <20240604080621.1885249-1-ejo@pengutronix.de>
	 <04d0dd97-6e67-4d5c-a82f-e4ec5f0465f6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 21:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201639

On Mon, 2024-07-08 at 11:56 -0600, Gundlupet Raju, Sandeep wrote:
> Hi RP,
>=20
> We do see this issue in scarthgap, Can you get this patch backported
> to=20
> scarthgap branch?
>=20
> Thanks,
>=20
> Sandeep
>=20
> On 6/4/2024 2:06 AM, Enrico J=C3=B6rns via lists.openembedded.org wrote:
> > Fixes:
> >=20
> > > poky/scripts/lib/wic/engine.py:362: SyntaxWarning: invalid escape
> > > sequence '\/'
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---


You need to talk to the stable maintainer for scarthgap, Steve Sakoman
(copied on this reply) about that rather than me.

Cheers,

Richard

