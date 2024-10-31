Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD168D767DE
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 15:51:38 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.15863.1730389897965019239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 08:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaQ8pzy2;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50d4780a24eso380560e0c.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730389897; x=1730994697; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q12T8CGH7x7uTivrIDTtsbkt6iVENxj107Pqj7crRIc=;
        b=IaQ8pzy2yRifHv9O4bZTz/o+ZXQnMJW8ghNKZIcNeTyZC3lURZZxuFdcOzUdyg209S
         TtqiwgxMuMEmM261Hbn/ppfWXuNCBZF/41k2cJRj/tA7MpFbhdtlkLsVzrLDmbR46CKz
         VS4ds/PDS0iJxafuzcsQ12XIWXB33ySP2II430Zrfzc+vXSrWPXi7//HxO76q6Yv8SRz
         9ROftCtyLXYJQc4qEb8bGbs9Ag3p3I/QV3uyLa8lMPzhEf1Jvi8kQbltFNgQEfrJ67d4
         XJlsqW8JhmfZ2PIhvLCFiQLrnym81Fp86A8KHr7bWPycXOv1dU1M/r6i2C4dkEdCqSV6
         3k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730389897; x=1730994697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q12T8CGH7x7uTivrIDTtsbkt6iVENxj107Pqj7crRIc=;
        b=g4DKnvF7hiccUM6kpLFcz+ZQg1NQ9IRqSytlORa3Lt+eS4wa+efoBpRK/xOcFoLlNi
         VPYl8Yze5ixadfcnuNHj6O4zy749RaPFtn6jWYkBeR5trwXDVQ+XKGr9VewTSeXEOurP
         cGPoz9tBjMV2XfSmVmOCten11O44UDLhelzJFhO2TqTHBYFU0T7GgyL3A1EWcQ3EzmF6
         3+Oiz7Ck3iGgoppTGvQWfzROWoA7ReYIkapffTyjZkR8xf5DDj44m1Eqmcz7rE+jjRqv
         qINrPIpVUX6wb0IBZDjPaYBZpo7U+xCPxJIrUkuk/58IF8w3eyF40akCTw1pWHOVNXTE
         Kyzw==
X-Gm-Message-State: AOJu0Yxi47eYO6swkE+qfXoOevTsX6RtthofC32btmseq9bTRjLy4hBW
	Xq1RCgeZ7FcdhdylvGCdcTEvUmmbmappe4M6ytpYX7oGF9aSHuP/Jp51ryDUIhh3rhq400czYKd
	JkuDwNCfFaLr3FYwZVzQbCdKdDiI=
X-Google-Smtp-Source: AGHT+IH1mhM/9Lh5ZLDWtpQ/gYjQolvW7tVI0OssIRLvWEHoo015vMkYwsgIFjWAR4XvJNzGaCCsXS6X2zz2u3/Mac8=
X-Received: by 2002:a05:6122:3104:b0:50d:2769:d757 with SMTP id
 71dfb90a1353d-5122756731bmr303725e0c.11.1730389896927; Thu, 31 Oct 2024
 08:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241023173911.1411724-1-danismostlikely@gmail.com> <2E288CC5-EDBF-4AA6-9F48-9DC45C171188@arm.com>
In-Reply-To: <2E288CC5-EDBF-4AA6-9F48-9DC45C171188@arm.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 31 Oct 2024 09:51:25 -0600
Message-ID: <CACS+7ZRG05LFiz6SeTSJJeYucxNaYv=n2eLNo821oMu_iViOkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ppp: make pam optional to avoid host contamination
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 15:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206587

On Thu, 24 Oct 2024 at 05:00, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 23 Oct 2024, at 18:39, Dan McGregor via lists.openembedded.org <danism=
ostlikely=3Dgmail.com@lists.openembedded.org> wrote:
> > This is a somewhat difficult to hit, only my test machines that have
> > the pam dev package installed show it.
>
> That=E2=80=99s exactly the reproducer with host contaimination problems.
>
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[pam] =3D "--with-pam=3Dyes,--with-pam=3Dno,libpam=E2=80=
=9D
>
> We have a =E2=80=98pam=E2=80=99 DISTRO_FEATURE, should we just respect th=
at as the default PACKAGECONFIG using bb.utils.filter?

I'm not opposed, my original version of this patch did do that, but I
also didn't test that pam actually worked, so I figured it was safer
to just disable.

>
> Ross
>

