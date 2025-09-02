Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32786CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:29:34 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.67350.1756776569565130136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYpNh9Vg;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e96fc00ad79so3566496276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756776568; x=1757381368; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T72d/Ng0o5VenIgGHFXR/TCs1+b7cn258D9Y0xBeCY=;
        b=OYpNh9Vgme5UIc/kGqi8JCWB8bG+q31fHd/wFQs6+tZygvQTLIt/xTxt3pft7G+S18
         JyTLfKspGyv7kK+fFrvV0KHGDC8rnt3W5o9nBOFgZioGgkXXmVPZobiyfpRnFwVlyjy6
         WtA0Q9LJVNsMTvECPHdwsXEOQ0tfVCRLsvCQt20tO43ONOmA2pPfcBfA+0QIbicBGxhD
         Rvm/vD09Mn3VEWdDdSHEXSWmawAr1m9x+DCz1lw3gZZPbnHxc1W31g4Xiri87PGuoX9m
         jqkKDCi8X9D68hyr9A8d7FEzOba9cCWMQy+0Un9JyQ8I2Tu2GFoKaVDNrHIUwvELvGyb
         rLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756776568; x=1757381368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2T72d/Ng0o5VenIgGHFXR/TCs1+b7cn258D9Y0xBeCY=;
        b=U1X8Nn9x6dpJMaIRBEooeXt6TBGYJTCc0jmObpskQ88F6NZOdTCM2dW6e+bOO7nced
         pPhxcstSyLa6cc5grPPTI46JWV/KsQyAbRDuwcMuL6GqW+dS80uZnVgwJpq22yiDNhSn
         5z4FmLNA+1eXAtMTW5Eg/S31a6B5xQ3j5DIJgkB4yMWeEapj8PIbZJgV0SrmaOIiix6l
         jTHotG+NsD1+zJzTvloGv/A6lRAb6ZBbjxlp2N3nLUe/uSMcRzI7E1AZlz3D7HZTufvW
         Z7Ak23IClQyWpJ4H4uzxXqaU/CIo0CW++FBKTHRspnPkIiuwz5VL1je42AcpFnXrCoDb
         LOMw==
X-Gm-Message-State: AOJu0YwrFCGPUip/zpeJX7n7R2aqsayoPS4bAkjr8F1RTtB8dPD4YNOQ
	4t8pS31T5q9O8qahvgVdEHMVpMH7vei6XQ8KGK1CmI2bCWurJN1V2kGOyhkEx45GN6Qr8mlbMUl
	UkcJonSiVA2juhO34/O/B7iUXj8s9bWM=
X-Gm-Gg: ASbGnctSV9jzzxmLmhwahB20l0Z5R/7g0xUTbXSiWXAJxthJyvvCnz8XKHjdWm7lyrl
	Z+OJhZ6kfdoKtzlt5uuQ8ciQyJkidWqRxeRW03HfAitnD69VH7d4OEMrVx+T1us3esszJPkJ3iX
	KAXgdFXf9AywQv2xWf8OxUU9Rxd7YmjBNaauOdElGvfEW7cIcj+az+/2wJ+u03JTWdyaVJ9pg9B
	n8yNwoILSW8cGTW2+I4mDbcqEJWFo/2a/9p9+2MvoiinYl6afOxKHp3mDvWSeC/s4sYbP5WJSoP
	xS1LLv+ypySvLZkWzfu3BA3mtNtZOt5EsC8G7HBlXEqInxCnTY2y0K6pD3CTlz+LUML2
X-Google-Smtp-Source: AGHT+IGt26XKTm6X5CU7MfkU64QULVOm4oQ+7eOfWN8REU4E1NL41HjPmJptuFTewTLT2MGo5yAArsjAuS7lCiD3hNQ=
X-Received: by 2002:a05:690c:25c6:b0:71c:b49:4886 with SMTP id
 00721157ae682-722764dacc3mr114391647b3.29.1756776568367; Mon, 01 Sep 2025
 18:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250827043603.2833795-1-raj.khem@gmail.com> <20250827043603.2833795-2-raj.khem@gmail.com>
 <31D0CA94-1A52-47C6-8361-F14F9357357B@arm.com>
In-Reply-To: <31D0CA94-1A52-47C6-8361-F14F9357357B@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Sep 2025 18:29:02 -0700
X-Gm-Features: Ac12FXxf5z4IhE7yqOz0miEZ-fjzL_OP-_zemp93lh-uxD99Zvw2aJ5XxeatWUk
Message-ID: <CAMKF1srh99w902R9iSKt7CmjNNhCQqCC3KWRnSg=EeZPw2RyFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] clang: Upgrade to 21.1.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222680

On Mon, Sep 1, 2025 at 10:09=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 27 Aug 2025, at 05:36, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > +++ b/meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative=
-paths-for-getArchSpecific.patch
> > @@ -0,0 +1,41 @@
> > +From 6febb74f2d2a320daccc759157e77edcb45ac8ae Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Jul 2025 19:22:07 -0700
> > +Subject: [PATCH] clang: Use sysroot relative paths for getArchSpecific=
LibPaths
> > + and getRuntimePath
> > +
> > +Upstream-Status: Inappropriate [OE-Specific]
>
> Can you explain why?

Clang's default sysroot implementation differs that what we do in OE,
and we do it with gcc as well
where we install c++ runtime headers in target sysroot, clang does not
by default it puts them relative
to its own installation and uses resourcedir to point to it. In order
to solve this we have to raise this
question with respective upstreams or rethink about how we package
compiler runtime.

>
> > +++ b/meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-=
in-the-debug-info-when-bui.patch
> > @@ -0,0 +1,30 @@
> > +From 4782e94c9b3e150f60bca1b279c300cc4f34fa24 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sun, 27 Jul 2025 19:12:13 -0700
> > +Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
> > + building the library (#143004)"
> > +
> > +This reverts commit 4d50b405f1585ce172f87cb5f8daf3c1b4145215.
> > +
> > +Upstream-Status: Inappropriate [ OE-Specific ]
>
> Again, why? Are we reverting this forever?

Please refer to https://github.com/llvm/llvm-project/pull/143004/
I have discussed this on PR and also with developer on IRC, I am
hoping that our position will be considered.

>
> Ross

