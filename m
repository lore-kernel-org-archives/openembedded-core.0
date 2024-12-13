Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD44E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 11:19:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.13168.1734088735627216743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 03:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QLgrE77C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so15383175e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 03:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734088734; x=1734693534; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IHYw7MaXs2X2p7awxYjs8f/VmJHYDc3VgQyN3xGQtQ=;
        b=QLgrE77Ck0WPEAlR6U41zqYbMv40OLiuChAVuXLaxuZf7VVBa0+jbsBdKjrK66qicc
         NIb15+pRRzAOInckAthZefStpkUeagSl1r7434Y8aRxDnOBNc5ZMqH0o4DNUl2FYnAxg
         IsvQ43cziLj+Xhn9AyMVtP8KFRJzYqOtRCF2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088734; x=1734693534;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/IHYw7MaXs2X2p7awxYjs8f/VmJHYDc3VgQyN3xGQtQ=;
        b=dgFh8Nl725kTqLJSOZQPAfcWna/O0IIWuPMT/Q8Yf5By6tYKI1F2CtyGclyCg1lGs4
         MPX3+KrYBBxQfOAx6OTux8A3q9N4icZzhAV0fkztyigq9iQnOdoXWjk7T5CqcTuv8EVn
         yeAhgVy9oBtsBTE9AigLEhwG7NwxOmr7sjQXrOHrdWVSUQkapj5P1UL7XT+LXBjK3P9o
         6WflVPSuWjqPZDQGfrrNefX7YO4Og0H0KrNo+qPZSajq5aCykN0HFPYVSgRy5ntueIuB
         TW2UKPmOX7oN73M7YnLINgpAyajPAValdKKirrcmqXVqV58gogvFfJ3egekHr4UzsRAm
         g1og==
X-Forwarded-Encrypted: i=1; AJvYcCU6BcKTbkqobew0Pyg8Kudzzo/2Z8sgTJwWySyyumpDLNyI/3/rqdaZhc+HVzGBrOOzNz5JHNZWhe9MbDCkNO/mog==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1EFkp7YB93ZHMYrP4p3ZVfkjo3OX8HQEdGCf8ZlWBXa49Fhg5
	ebhU8p1u8ojxkN7pgQ4P8c3F7KUaYROSPJ4ibx45YeYHT810m+wLj8/9iqV3yAk=
X-Gm-Gg: ASbGncshDV20PQCDiCL7IiI3rwM/KDX9cJzdRNmitC6vW8O/0LUrzCFW9Zh6+GgSqL7
	mlm+1aIFt+m+Vn5VqKqPlSYJ9JMUPOVE13ulS7fDfoF1gOp/s1xO0XWiqBAk3LhF/Lf1ivGR7hC
	0MFAUA5ZzH9hVqdVgf3FZXrzws5l3AOg0ZF5aOTw/AVQwVmw5eG9/PQSPkiaJO+G3sFV3cY745W
	WRFiGztkv+ukW1xbvhIyiH8m11+EHVpuwR3cWDTsY7PxshEvNxVvax0cWrISGMBRh8HSvYm4ChS
	qKi3cNLW6bVL2zeNO3h36NGiI8IHgnsVUXkCxDcAocMF6A==
X-Google-Smtp-Source: AGHT+IHclNBemAIgXU6RgbHlK8drCHVE60MjxvppFt7vhz0YEa3CPsTp30sJfLOYnIVwMXLPpOF2wA==
X-Received: by 2002:a05:600c:468a:b0:434:f99e:a5b5 with SMTP id 5b1f17b1804b1-4362aaa919fmr15270745e9.28.1734088733882;
        Fri, 13 Dec 2024 03:18:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:52c5:ae63:6081:6406? ([2001:8b0:aba:5f3c:52c5:ae63:6081:6406])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436255531dasm45572935e9.8.2024.12.13.03.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:18:53 -0800 (PST)
Message-ID: <b44dff5fa418020c37422d849f2a50ee5425e61a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 0/5] systemd split networkd package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2024 11:18:52 +0000
In-Reply-To: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 11:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208679

On Thu, 2024-12-12 at 16:55 +0100, Adrian Freihofer via lists.openembedded.=
org wrote:
> v2 fixes the build warning
>=20
> First of all, this patch series fixes a bug in systemd.bbclass that
> forces service files with an Also=3D relationship to be in the same
> package. This may often be the case, but as long as the RDEPENDS
> between the packages are set correctly, it is no problem to distribute
> the service files over several packages.
>=20
> If service files referenced with Also=3D are no longer automatically adde=
d
> to the list of FILES, build errors caused by unpacked files are
> expected. A bitbake world has shown that there are only two recipes in
> oe-core that use automatic packing: busybox and dropbear. There are 2
> patches that fix this.
>=20
> Also=3D relation are probably most often used for sockets. Consequently
> the systemd.bbclass should also allow to split socket files into
> separate packages. However, that's proably practically not used and
> would cause tons of packaging errors. Therefore the automatic packaging
> feature for sockets is not changed.
>=20
> The latest patch splits systemd-networkd into its own package. This adds
> a little extra complexity, but splitting systemd into packages is a good
> step towards making Yocto more usable in binary form.

The changes to busybox and dropbear suggests there are some
considerations needed here from a migration perspective as people
upgrade past this change? Is there some documentation we should be
adding to the migration guide along with these changes?

Cheers,

Richard



