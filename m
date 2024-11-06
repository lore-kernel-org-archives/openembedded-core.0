Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67BFD59F48
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:54:07 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.49156.1730908444018939325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 07:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YvQmqPXM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7aa086b077so881314466b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730908442; x=1731513242; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeGFz/MCZctHJ8kqOiRzMlhXgUuMANhdATsnlkzIENs=;
        b=YvQmqPXMW5qhqJpFXlqhaSoGkKxYFRE4kCZBD1UAAGhsRWkkVsXSU1w5cQSkqZGNPT
         pNd9Q2V9CSDl2g6qIYLwsONgygTESCnOWm59AJY1xYRGkerE6N6jLjpAfLRnXxJq70iX
         4migfAr/KOwHPu9HrT8UOE1a1TB3GjZBGe0UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908442; x=1731513242;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aeGFz/MCZctHJ8kqOiRzMlhXgUuMANhdATsnlkzIENs=;
        b=ZDJyX6gxrvXKUC4bYG/SxZm/uxHnSUUIMqT5tGBWLXE3MHqgElkI5XkKe++O8vpp2W
         VuSvi+RlEMvL59m0et06TXZsBpOdnGezDNXXO+Jt4WnfGxNNn4+GpPMo24OL+BWQPhp8
         CnxAIU+sm6q3bQPoEBWECSCaIloV/IxQgbeNWp3AKuulP9kXXbupIVLaQJ6fENWxDpWi
         E35Gn1O/rWbWn1MXagJNlISVjcmvsVHNAl1VtAON7DBuP7rpeSZeZmQf8/Uu7znkTtDG
         jrmV1rSIWdO+Pj25yeukqJzJfA3UYHFF/UilSrtJ13S32KntkYqCyYBPY7uU+JbX+3qZ
         FxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0zBQzsYtoL0I0PeJ7i6G1o+eXbhShQmGFoHXxQRNPimNGv3rEAU9H0MLrytJEH7BoDnnyUGZG7MveNJukZXRJRw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzagWbAL9W39Mwgew55SHgKwrr/hmDuDXkGbe8uBfz5GHn6NM5d
	6EeSo+Z9DhMMzuCveci1w7fR2E65UHZmT8OCxFM461X7uDbmkMZWGtfrurBJ0ZE=
X-Google-Smtp-Source: AGHT+IFRu4zIguHp4Nde1IG++5SuPhmB5/JYDT//LZw8nRQ7ad5yWuGG+yNphC/Crv/tst5OcDLH5w==
X-Received: by 2002:a17:907:d851:b0:a9e:b08e:3de1 with SMTP id a640c23a62f3a-a9eb08e4023mr666895766b.36.1730908442360;
        Wed, 06 Nov 2024 07:54:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f26:5175:55ad:9264? ([2001:8b0:aba:5f3c:5f26:5175:55ad:9264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181448asm292376266b.202.2024.11.06.07.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:54:02 -0800 (PST)
Message-ID: <21058861e2cf73d61abd16d6f29d5c7cbb22ffe3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/19] clang.inc: Global settings for clang
 toolchain
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 06 Nov 2024 15:54:01 +0000
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 15:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206791

On Tue, 2024-11-05 at 10:45 -0800, Khem Raj via lists.openembedded.org
wrote:
> It is added to default distro include file
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/conf/distro/include/clang.inc | 147
> +++++++++++++++++++++++++++++
> =C2=A01 file changed, 147 insertions(+)
> =C2=A0create mode 100644 meta/conf/distro/include/clang.inc

Thanks for putting this together. Looking at the series, it seems as if
it is a copy and paste of meta-clang into OE-Core which isn't really
what I think is needed. I think in core, we can strengthen the
toolchain abstraction and make some of this a lot cleaner, this would
be the time to do it. I think the patchset is a good first step but I
wanted to be clear that I think changes are going to be needed. I'd
need to do a bit more experimentation to give more specific feedback on
that.

Cheers,

Richard

