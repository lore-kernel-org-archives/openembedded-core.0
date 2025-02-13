Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA34C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:00:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.11551.1739455224098149820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RVkCToez;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so6516805e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739455222; x=1740060022; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxilqP5+AT9Y4ITIQbmM8iYS6Q0HanpeTWxufC0N0V0=;
        b=RVkCToezBSxGDl8+8IZGnClvrVO/GuZlSCfJ1QSZzUTAeWt2JaZ17GHAyEGjEQKN0Z
         C/LyYqdxEmc0OoNAXFPIPqo5B89bQaVafkPf/k0Mr5paYwMlnYaZJN/Ccb6ORmQqWfVD
         KvVhGJnpPTyLmByOcup5Eq+gK7mtj2RNNHnWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455222; x=1740060022;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxilqP5+AT9Y4ITIQbmM8iYS6Q0HanpeTWxufC0N0V0=;
        b=Iab3wmxP5Tw+M1qCxbXlwrJh4ei1arbPTTt3AFzKL8Up1oEqJBgmPsOG+GiypNKPqi
         RD3n27DpspvdtlB9cu4Tk6GBE/kdvMFQ2x/rdCXw/glCX4HSlD0Skesrb9vudeMKlns9
         /TilbfjTF18nBr0Ge4dTHTsFaS3v9QE4EcRX1z6EKGRZu02APjtCbdc/t6BZ26E1x9yH
         PBy8ZasS4ENtaCUHPCulHaBLQMEBtgOqEnBtZJqD5V1psH2Gmg54siVbVhr3qZmAniB+
         XghXN3ZkWxWHqokw1GOtev6UnQCXLzlC+RWTAbuZ4VoPLIwWjDQ3IUGGL2FfvnB/SZ27
         l4XA==
X-Forwarded-Encrypted: i=1; AJvYcCWlVKtRDDxOOF9evXibLRH1XVh2VdoksoNko71ygm1TqrfRHubPR+KpY0OzrbVraYMMWoTjlsNCn55DG9KZ7LH67g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlLgsU9O/BmIouHih6TpruIMdnnG4N0AOPCyMlXUZ6jNmZLbSd
	C3mGgGN6zrwpezHRecOgIttvzTB1U9/t61thdGetrUoIhikbCUdjK0OXAzWU7P6WAD6/AmL6091
	C
X-Gm-Gg: ASbGnct7LuFmegTYRF72txBJOAHpcQqUDxmPC+ieGQvgwrBZzHbhT90lWBlVDwmo12J
	4Nf1ysJI52w7xpZYUG7CP+yOBaG9tx1jOz55FaJtGOzvOJw4SqkdbpoReOy5pFE+rUqTCwT6t27
	t/qGd9TKZkEtCq9dCAuIqvmkmKrfqlmWkGH9KIXNFPvEt+Z2I3jQ9pQjRovExNKvocwHuwBiF0P
	TzZeKYVZnuJvISSiJZ7V4vgWMeU5c4N1xdUgGlmWv3PvxHMoXJSZHmImZgbj06xlv62vGBc4oJy
	50QS/IpyUQ7DsYjU2PO1KCNGzi87SLbu04NQRGKlSoQPCwjG696QPXOk5quFLiGw3xsdsaTmtyE
	q4FFt
X-Google-Smtp-Source: AGHT+IFE8qp8OvkHxu7iIybOy2IhJPrKSTv50ikPklnBfKsIFH3wkpU8ODPgIDpxjq/kIuna4CFm6g==
X-Received: by 2002:a05:600c:4fcf:b0:439:45a6:705d with SMTP id 5b1f17b1804b1-43958165e07mr61967625e9.1.1739455220059;
        Thu, 13 Feb 2025 06:00:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e? ([2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617da779sm19203215e9.7.2025.02.13.06.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:00:19 -0800 (PST)
Message-ID: <26e0729faa9f74f71f43a67e9509f69559f71968.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package_ipk: Use preferred for of
 --force-postinstall
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2025 14:00:17 +0000
In-Reply-To: <96237056-391B-4957-BA30-89D86B66FB5C@oss.qualcomm.com>
References: <20250210164649.395225-1-richard.purdie@linuxfoundation.org>
	 <96237056-391B-4957-BA30-89D86B66FB5C@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211334

On Thu, 2025-02-13 at 14:04 +0100, Koen Kooi wrote:
>=20
>=20
> > Op 10 feb 2025, om 17:46 heeft Richard Purdie via lists.openembedded.or=
g <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> het volgend=
e geschreven:
>=20
> [OE-core] [PATCH] package_ipk: Use preferred for of --force-postinstall
>=20
> Nitpick: the subject lacks the 'm' in for(m).

It was noticed during review/merging so the version in the repo was
corrected!

I didn't re-send to the list.

Cheers,

Richard



