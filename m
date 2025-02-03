Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED9FC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 12:37:49 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.86506.1738586263059100715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 04:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZK6YvRoC;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8e8445219so37616156d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 04:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586262; x=1739191062; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCG4yZ69bkJRqEI1aKoWrYK15qlSqcUo+fRbiRUacy8=;
        b=ZK6YvRoCmvFxTBRpjaylDnZnL7dMZChPZVWHFao9myuEHnb5Sz6sfaMv5b6LY837bJ
         CgS8uvdu0NDpU4aW+8eA+g72jwe/uIF0iEE4vTqs7FRnw0ws3ptKTlvDdCL3VSgk+lGP
         c/lwqPCne21y82xNAGifHYIw8lRi1PDECsLIOoJ7ZW2iLP47tg0unwErvvd62JUaix7N
         lJitnRXRKmgmEe6uWsVfaSJ0qNkPpSuhB/hUhrkjkyyI8nPn3SgL428p0YqKE/zGwgqF
         OUzJ94cUrx/D4f7NGZEBACQ4nbiRnqdWHwspmW7dppZeIw1SHoHp1MB8PKYF720sXg4u
         LjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586262; x=1739191062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCG4yZ69bkJRqEI1aKoWrYK15qlSqcUo+fRbiRUacy8=;
        b=pKqMG3keRgulKHpfE50rrnvWezG1LaG1B/nuAmcBzmz2e+zfmzvWYe4OcF/qxZJrxX
         m/BV28Q/T04EkBhlZfLaYDUhYGRFo3nOucaDAHZeRHH8WehCOFwTp9wkrvOF6vZNrqCe
         LOtqvHs6FE7rt1a5kqdNYpJjTgrhIxgoTl0nUWo8bewkfICRxWT0OXUiZT0besxLFLZM
         Ku545QzXXO5HqKx8sOIMkq+kj1cUgrA5sCLWR7NsC2wULhekuFxevqelVyHGcQQOlHuL
         8LpUDB6LBK8/oXZyJJz4YSnJj2N7RNh5AENhWRQKpT/PS2hD5Dy0PR/8oRx460wYY7mO
         ij7Q==
X-Gm-Message-State: AOJu0YyYOs3l1Tl3F/A402hzQ8DFC6Ga1TnoHFNtyYX6unUZ3NgguK8Z
	/FZaltz2dt/hwy8XU/PcrsbkZ6GoWH9O5LqAaPKf2b4vvIp5iniDMkObQ9+AqewH8b+Mkcv+5ho
	bwv9NLBMELKnM8aVw8BE6WQHOxYk=
X-Gm-Gg: ASbGnctj/NLLYN9DUYoeLTyqHSPc35+5V9mZ6gFaelEzl+9mq/iV1tqaIcr8P3GTt5y
	tnfTiNew2RHO36wfS/xWZ9EMJElEgsJoT0kq/aIjz8um3I5lwueu6EzPSfIjiIpPBLoJSGqnShw
	tkkPQnD0TN73+6KU8PywE1GrFFxaZp0Do=
X-Google-Smtp-Source: AGHT+IGhHcvVGHldGAnyAjWa/nBpgknmx676JLzmTu+CGi8Jbk2Qq+Kre9Q3W1U4NMlN0RGciAyZlzyLcm3KtxGB5sw=
X-Received: by 2002:ad4:5c63:0:b0:6d8:7ed4:3367 with SMTP id
 6a1803df08f44-6e243bfa9cbmr352060756d6.19.1738586262133; Mon, 03 Feb 2025
 04:37:42 -0800 (PST)
MIME-Version: 1.0
References: <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com> <20250203122444.1513238-1-zboszor@gmail.com>
 <20250203122444.1513238-2-zboszor@gmail.com>
In-Reply-To: <20250203122444.1513238-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 13:37:30 +0100
X-Gm-Features: AWEUYZkgSkideeWAFagIn2d5tOuC87yNDh9yGCOWNnzmZ28h0G02GB7ZZV29KAY
Message-ID: <CANNYZj--uwXoWM2r-PLz=--6uzd37jnhaqu12vrXcY+pqutO1w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 12:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210653

On Mon, 3 Feb 2025 at 13:24, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com> wrote:
> +        # Test rpm-sequoia's default built-in policy
> +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> +
> +        # Test rpm-sequoia's default built-in policy
> +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> +
> +        # Test rpm-sequoia's default built-in policy
> +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> +

This should be set just before the signing actually happens, and not
only in the test.

Alex

