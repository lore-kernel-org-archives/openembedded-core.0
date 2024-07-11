Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6ECC3DA41
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 09:56:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.8187.1720691786376741636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 02:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DzpTx+ad;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-367a23462e6so449134f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720691784; x=1721296584; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+Ef5WAggX7p87Qt97BMGb2WsKDKSwDAMAEeit+fCvQ=;
        b=DzpTx+adPiyltAINGSpPX1izrfi2emPB4J0iDEB3qyoQWfGbQVMMAne0Yq1CNqEjh2
         jeRsfT8dmQnGTTbJ5RP+0X23245Nu9WNhni1+eWIan3EeT9QA8yT5uEwER9iYXHOCLYj
         IsGl3BMNGfq3pMCSvU17iz2pqZj3/8PRQ04as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720691784; x=1721296584;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+Ef5WAggX7p87Qt97BMGb2WsKDKSwDAMAEeit+fCvQ=;
        b=vBicYL4UdDczQYJum+WJ8PFOXE8eFOoidWUaRecGVivt+E8kpfVpjQGqauuXuAm19w
         LEQjHUnVXHZbosH6gM0IiO0Ik8Z5NjY3UBToPeVkUfmThkoyQnUXFeI2rPwKwPIYMTd9
         KnONTO1W3f5cdhSjsBjrnzTxEJnVnEc6WPE3N4iQmi1MX8U7XIWlgAteriKlu+kNlJ7Q
         90izhIh6jKhav0WpZxicUAvT3oMYr+eVMkIhkYVfpyJPgwT++7BWAN+ovw6E5UX6mwk3
         aIYET8J0OVeBECfBuWYQ/ZABkJvi+hkHGuKU/iHRynyue65jmmicsl4Osw78tN99Vd2f
         9yUw==
X-Forwarded-Encrypted: i=1; AJvYcCVmHeQD4bH2OjxUHG1JZ8jNcxL1cl+c12VyvlBnQzDYyPZE3TAb0QkfmySldhaFtj/DVE0ZujnPLdwsy+/4Iz+fbNitq+tUIgyV/QZhzsxBqaQ6EqwdT3AU
X-Gm-Message-State: AOJu0Yx2pLsiXG+quy/k5+F2lDg8d9E7C/LbNrLWUNmvyKNbo4w5c+W+
	Ye2ualEoXEDG19Cj1aT+t87LO7SC2Lh6Td9hUuZre0nOYbte8xKAEo5OdyWuuiY=
X-Google-Smtp-Source: AGHT+IHtBz05+LYAdFK7M/EjIoNB8JxfT/OMzA3nIwIiFZ2UCMtfhNheYStSmDD7hSdZISeRl8pCfA==
X-Received: by 2002:a05:6000:1acf:b0:367:8c65:3c9 with SMTP id ffacd0b85a97d-367cea46b78mr7514600f8f.2.1720691784562;
        Thu, 11 Jul 2024 02:56:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6? ([2001:8b0:aba:5f3c:b76e:27af:5a94:dcb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab6d3sm7210219f8f.112.2024.07.11.02.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:56:24 -0700 (PDT)
Message-ID: <dda6b83eb7cd0e756884200b14f7a91a279e86b0.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v5 2/8] classes-recipe/baremetal-image: Add
 image file manifest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2024 10:56:23 +0100
In-Reply-To: <20240703140059.4096394-3-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
	 <20240703140059.4096394-1-JPEWhacker@gmail.com>
	 <20240703140059.4096394-3-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 09:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201773

On Wed, 2024-07-03 at 07:59 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> Downstream tasks may want to know what image files were written so write
> out a manifest in do_image_complete. The format of the manifest is the
> same as the one in image.bbclass
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> =C2=A0meta/classes-recipe/baremetal-image.bbclass | 32 ++++++++++++++++++=
+--
> =C2=A01 file changed, 29 insertions(+), 3 deletions(-)

I confirmed that with spdx 2.2, this patch causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6896/step=
s/14/logs/stdio

Cheers,

Richard

