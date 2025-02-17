Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F599C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:17:19 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.48816.1739791032879342642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 03:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QNTzVy/v;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a04so43678251fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739791031; x=1740395831; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt+LMXpXljgDH0Mx2YmcgGYemqtzP53SgZpun34ll94=;
        b=QNTzVy/voB2xQiol/XAxl9sVIIlCbc8IJPHLGVvt0+f75nDu9IkOuUtAFl1UmS1cC9
         vWxCQhs6Mg4xFuOztAIufVxVr1MLFyGshnnDgZLUSGtWjcP5iZkgYU2cyHOHHIeyd+Px
         QTWyziPIGB/6RTHDMuzbha2fyRLjwPENw3AJH0ykjfR1Gv5Rt6807mYgi2PqPmkg5ddq
         kPh+tBe9MWNPYGQFwNF1zDVqX/cdYCjOJu/zi+OE2WIOjGJtolZwTs/rsPT4eT8gs6AU
         JpO56zFzSOPOgeP9rQzC+yy1NCGGRv0EwGDmCnawY/iLF8b57iFXd4q/II7xR/oaUqCk
         Wr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739791031; x=1740395831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lt+LMXpXljgDH0Mx2YmcgGYemqtzP53SgZpun34ll94=;
        b=sWJlyu36cj8+4iYEXT17JMnJXFLaMzhNXlLjjFNzlT3g5zU9pyI8MIrW0X8KuTL3lV
         jdL8pvhPoklXniM4E4LKhfvXHJJjWZJAdBZePIbZU7CuXRbhU/fqyCRic7zZdro3KroI
         VJOu0u4Ps9PD35H6jzXm/mgGATrORUSwP22UTxtTYbHepuc+2Xnfl5XZaUlge0GJXzXy
         qtuPrATTT9RH7iuf4Q2t6OAjwnb07d55rTmDGqTK6LMzG/u7oYfOOp4BEI1z7GKZzKDf
         m9MKUXDARO3oizYg4YAo04GC0YH5DZrcInLpVag0PNbXCXS3wb6CXR3KeKBNLQlYYAfH
         jt9A==
X-Gm-Message-State: AOJu0YzoweGVMuIoZC8x4MSxbKBGJwgBvXwXa+s1jdL92AXvXWq18bBx
	7R/c8cVaurnhqqjHkcmfMpxqrK1CcQwQVqxCUgTNwgVUpa9iJ5ZxObTc9DnBJ7sbEyOFCPqXvuv
	EUFXLx7QPk4QG4O5a17MwruIBAd8=
X-Gm-Gg: ASbGncvCz9yDf9Qex7WkJmQwMRGq1rmEV54H2xiIPCZCTGZ6UDMa12i0WGMd1BNVbA4
	59GtnM1hWVPbBBr5xVoyBSATnOmwRkSiBGpIbbu0buxEMT6SiVaPzg1s3Oz6TKQ7iwF+LUF+SP8
	8P6h0=
X-Google-Smtp-Source: AGHT+IHNbfkElW85Oc4YKMmwHtMvFSLo0l+TDLlC96DKqTNY/40o7X9+oSQWjipbXAv45KPvjkvqzw6lF2cljsDmWX4=
X-Received: by 2002:a2e:914c:0:b0:308:f75f:446 with SMTP id
 38308e7fff4ca-30927afe1d1mr24353101fa.31.1739791030410; Mon, 17 Feb 2025
 03:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20250215165545.1929-1-alex.kiernan@gmail.com> <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
In-Reply-To: <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 17 Feb 2025 11:16:59 +0000
X-Gm-Features: AWEUYZkBA5KUJLIcURE6Kgu0BsK4nfMroXzO32mY-JizS-THfY6mjL_nc9xD7ds
Message-ID: <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf provider
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 11:17:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211539

On Mon, Feb 17, 2025 at 10:32=E2=80=AFAM Quentin Schulz
<quentin.schulz@cherry.de> wrote:
>
> Hi Alex,
>
> On 2/15/25 5:55 PM, Alex Kiernan via lists.openembedded.org wrote:
> > avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
> > provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> > which of these will provide service via packagegroup-base-zeroconf.
> >
>
> If I'm not mistaken, this seems to be fitting RPROVIDES usage?
>

I guess I'm guilty of copying what was there (WIRELESS_DAEMON)

> What if we had something like
>
> RPROVIDES:${PN}-resolved +=3D "zeroconf-daemon"
>
> in the systemd recipe
>
> RPROVIDES:${PN}-libnss-mdns +=3D "zeroconf-daemon"
>
> in the mdns recipe and
>

This would be:

RPROVIDES:${PN} +=3D "zeroconf-daemon"

> RPROVIDES:${PN}-daemon +=3D "zeroconf-daemon"
>
> in the avahi-libnss-mdns recipe?
>

And the base avahi recipe here

> and then we simply RDEPENDS on zeroconf-daemon?
>
> Does that work (haven't tested myself)? What do you think?
>

And then selection via a PREFERRED_RPROVIDER:zeroconf-daemon =3D "..."

I guess I think it should work, though my concern is the interaction
between the daemon and the nss plugin, which is how I ended up down
this rabbit hole in the first place!

We seem to have very little usage of RPROVIDES (other than as a
migration mechanism) and PREFERRED_RPROVIDER in general.

--=20
Alex Kiernan

