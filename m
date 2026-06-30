Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1233CC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:16:53 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20795.1782825405729294075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HGhFGU9p;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664c1cf7445so2840780d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782825405; cv=none;
        d=google.com; s=arc-20260327;
        b=UzKDaWYA+sNuPlW4RytPsmGYT+LdOoC0Fh7ewuVJxH4KY08yks2Xw0SmpX0l3fp6/l
         5ZyvcQI+8TSPlo83F20azIFKoWTbOZwVOawW0I4znPyZUQGeFUbnXMJQyUlmM/LRJ3jA
         R49mwkIgteSYgI2u8oAHYQZ31VpMLG/XjHk0HmVjvAokp6LYCE8njsTZPREKTdrmkFub
         lDRzhaV6C/mp9Dwp2TKMS44y7tMcG4paJ4Z5fnaaZfrtde0Ix4Pk0rk+aEtt8ko6ksvR
         NUNLUivtysoMPAT1D8Lq1KFHlq2+EK/ML0rX9U990/CmlxN0RieJOSz0KALZq3YAHGz8
         v3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/zV96UuTAiVmF8QCcA8LKsE5al1/u8jwDNss1YpiwU=;
        fh=1bzQBy263yG0kkWtbodxqgt+fT47BnHwriUuK9cWLI4=;
        b=GAQjLDKaNpMq8DNpxIg6lmXTQUoeypfauNhXSju0nCvmqrAJQX2Q3P54deIAfkphJo
         baUV3mPrtXWpj06M4f+RgKvM9veE92Fq2P5f1k1476yRe59iX9r9Nrea3QUJYpUB9rBD
         3VkGQ1fafIpJq6HtWRa5kq6iUK+Ki0uS/l4iTl4jlQwmP9vMm5JkqECofWUBciPYOm6C
         wMfXx8EJFFTj26+J2k+/GmfRWcCbetxBLkHMIjm9I4IH6i2nPZb2Trk6b4z8qSiAkMOm
         hPc6O44duMb09B9QwrBU34BeXmSQBa7hv7AB2uz0MD/5ma0L1McysX9FZRHS7WgYVDD+
         V+8A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782825405; x=1783430205; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/zV96UuTAiVmF8QCcA8LKsE5al1/u8jwDNss1YpiwU=;
        b=HGhFGU9pnOpwt2DlgDc0Me6GVBS2nH9QUHUZ+ld0b1ENsYSdgD3pmqlrXVfRrrFtUP
         H99HMwfCRZUevVTA4SchhxVd3YauFYJrlBHZdoeCUzyziJEXFs7wP61PsIzy/+6uCJta
         CBOBj12Jz+ukUyc8rnbP4HQx8mokZG0ENl4X5Ktmpc/is9+kpeFprueqz5YWVdCTLuDv
         bWPR4edZ5VH//Q2FQcbEFLIbjaJFPns4IIX4UYVJHAETYQP/w4qdTLLzsx3HnK1jWd+j
         JbqIrBxTlkw5pmqBIEOncZrGHfQyXzRo5l2jVpQuAcpxvI4xtihiZqPufudoBsAL8dSP
         +rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782825405; x=1783430205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/zV96UuTAiVmF8QCcA8LKsE5al1/u8jwDNss1YpiwU=;
        b=C7Y+y4VynkxWQB+L6Xht7eRUELhkeE7Acb27tQEONzV6muFUi2ju/nxEANNIaQT+Al
         rWKdiHxNuvE0LUuX1CcPpLN4cuLdHZSDBmzzpLrPDX/F6BbYmNmyJmY7x3yra1hjwxni
         wvujdj5X0q34HhtxDnJWozouVY9QOeb4jiWGpF1f74CVto5Izd584fRg12PC//EQ4siQ
         +y1RczyGVHgcg822FQYuHJxAwSBcM4Gf02EKOHVPKH97kuk880O8SWXPn/1m/710eyXq
         KwTZ12dSvK0AvaYgJZcrh4KdNpkRHTYP+WJWlTwaG5muttGvhzh/1CehHEOwEF4Sczfw
         PkJw==
X-Gm-Message-State: AOJu0Yxq/L8n+Y75is6Ug3rE9E4hgSk2bAqQiFxu/txwjnJjkzxL2d57
	FiFQ2MUZ3uXFAAWXzugko/8pWNYax5q2evBzuF7z6xthamlpkavhfIqT4RVHd2UmwaFGNhOP2mW
	OLRLz/AO274jKvbuPUqWM0xrctBTivl4=
X-Gm-Gg: AfdE7clQstD97bZ+4I2zDxJcd3um08tQgKihDfmeNzmzkhywYrAdLN/h4yRIn0xL6gl
	7xNd/GPrgvxWRXscbSzGP2qWiyaYq3jK+IXyKP4br3OVYQqIDJJdv/4Y3Cm5XtIhXJ/nwvTlCS6
	UXJUx0uEmuFydAvuQU9NzfK//xg3XdczzYOPqI/PTpb/PThfrOHTaJY4WBd7xq1HjhDvF1GWbIY
	MgrUxcoxVsTknE8w7oZPWISbrYEG5p8IJXOl3Sn04BMFlz6mSfnfoZ3Iv4zyJOg+AXSbbW1TQ==
X-Received: by 2002:a05:690e:43dc:b0:651:c160:1c06 with SMTP id
 956f58d0204a3-66510c4dc4fmr256113d50.58.1782825404533; Tue, 30 Jun 2026
 06:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260630130341.71014-1-roland.kovacs@est.tech> <20260630130341.71014-2-roland.kovacs@est.tech>
In-Reply-To: <20260630130341.71014-2-roland.kovacs@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Jun 2026 15:16:33 +0200
X-Gm-Features: AVVi8CdEcHNtsmTZjDBwv_sj4tHCwkQkWDYU_fl7aLFbMmKFZ7zKtawNHcPmHEQ
Message-ID: <CANNYZj8LEYXW_NF-p=Beko9__kL4u_1=ngAuP1KFO6wUidUG-g@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
To: roland.kovacs@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239894

On Tue, 30 Jun 2026 at 15:03, Roland Kov=C3=A1cs via lists.openembedded.org
<roland.kovacs=3Dest.tech@lists.openembedded.org> wrote:
>  UPSTREAM_CHECK_URI =3D "https://gnupg.org/ftp/gcrypt/gnupg/"
> +SRCREV =3D "343d0cb8910441aa44c56ce8673a78e137040c87"
>  SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \

There's a stray SRCREV here.

Alex

