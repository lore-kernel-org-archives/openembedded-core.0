Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB228C3DA41
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 21:37:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5706.1720474665321549245
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 14:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K03O5qOt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so4920215e9.3
        for <Openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720474663; x=1721079463; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4S1++NGZCQSwYMmEMsp4dh6VQgoxsLoLh8SUSyKPH+I=;
        b=K03O5qOtcqg0aTI/4VGOfu05c6MPqVceDp0CDn7q+82XP9viAXE9BinflhiI0xcXqD
         2BXGh/PCPpnXyaudt4ZeG0vvNh8b5Y8+nb/0BPhG9mngXpYHQrhyzdpGI108hJUKwZVg
         9jQ8UlD2ZVVSuUUdhM7vmKKS4+0KaTXaRaThQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720474663; x=1721079463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4S1++NGZCQSwYMmEMsp4dh6VQgoxsLoLh8SUSyKPH+I=;
        b=WP0xNnQyxx+DhlR5OMomKfN8g6C6toAVb7m6J7EqZAz73quvhyWAorTvHDFJfxLfGz
         rPi8WaDroYw15e7LKx8QiArXEeRm2XSCGSVbUqjXb1rGlPlUqg4fcTqPCBdO0ZlIQ3DM
         YiPOJFkrAyvokz4v9iuwTf0vn0p7OywWJY0HgCWMbxQivQfcrTTE+pnBWQ+AAbdJBm5U
         hbD7o6byFkJBKiKLgLCJkzwPdxxD5nwv35n5qS19TdKVT6a/RW4R+LYVyOW/7axL+EHk
         8oTsEMca5Tbj3H3wpBUPvAA+T1sxCWulpmq759+Qoiymb2/vh3lIi7ZqwIBlePDVn/1w
         nSCg==
X-Forwarded-Encrypted: i=1; AJvYcCXZe33rfeI8Z28LYC//GpVYlKdEHUeZVoJkpaVCYSpD+DNd/8Nq3F0s1c11B25MeRiXVEzZDhaUChNOp+clmsA5fibFnarGTyl5/iUVYriTA9BcwaLYoMCN
X-Gm-Message-State: AOJu0Yxbs0sqniEFzy604qsbg8ry0gFDuZ01w7eH8V6JUDA3jRiIaEOF
	ef45a/XUKJf9BRh7rrjkthe5FMKPfO2Yj0E1WfnEaafbeAo55Tg0ed8jQgOCX5J1WuKXMMYy0bk
	F
X-Google-Smtp-Source: AGHT+IEJC9Gn8IT7W/gx0hqNEbmWHWUl0PQ4kDed4sPWjeZUrP9n/AIgE95LhuaYOWynyXxXGUvOBg==
X-Received: by 2002:a05:600c:4998:b0:426:5b21:9801 with SMTP id 5b1f17b1804b1-426708f2197mr4392145e9.27.1720474663519;
        Mon, 08 Jul 2024 14:37:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6c1e:b1f8:4156:8a30? ([2001:8b0:aba:5f3c:6c1e:b1f8:4156:8a30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab748sm728948f8f.111.2024.07.08.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 14:37:43 -0700 (PDT)
Message-ID: <e9961bfdfdbee4085d010b0ad818a9411e1f130a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/utils/postactions: transfer whole
 archive over ssh instead of doing individual copies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexis =?ISO-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>, 
	Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Mon, 08 Jul 2024 22:37:42 +0100
In-Reply-To: <e5e4514e-5db0-4d0b-a20a-11e2d786a543@bootlin.com>
References: <20240705144638.441976-1-alexis.lothore@bootlin.com>
	 <20240705144638.441976-3-alexis.lothore@bootlin.com>
	 <dd50f7eea15a500e7f6334d043b0dfe9c4620675.camel@linuxfoundation.org>
	 <e5e4514e-5db0-4d0b-a20a-11e2d786a543@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 21:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201640

On Mon, 2024-07-08 at 23:10 +0200, Alexis Lothor=C3=A9 wrote:
> Hello Richard,
>=20
> On 7/7/24 10:10, Richard Purdie wrote:
> > On Fri, 2024-07-05 at 16:46 +0200, Alexis Lothor=C3=A9 via lists.openem=
bedded.org wrote:
> > > From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> > > +=C2=A0=C2=A0=C2=A0 try:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D f"tar zcf - {" ".=
join(artifacts_list)}"
> >=20
> > Thanks for the patch. The syntax above causes failures:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/95/builds/59/steps/14/logs=
/stdio
> >=20
> > I've put a fix on master-next which I can squash in but it does make me
> > wonder how it was tested.
>=20
> Sorry about that. This error made me doubt about my testing setup, so I r=
an new
> tests, and I confirm that this line is being executed and returns a corre=
ct tar
> command on my machine, which confused me even more because it indeed look=
s broken.
>=20
> My best guess about those differences is a mismatch on python versions be=
tween
> the autobuilder and my machine. I am running python 3.12, and it appears =
that it
> has brought many improvements to python f-strings, especially "quote reus=
e",
> which makes python not raise an exception anymore when the expression ins=
ide an
> f-string reuses the same kind of quotes as for the parent f-string (see [=
1]). I
> ran a quick test with Python 3.11 instead of 3.12, and I now I see the ex=
ception.

That explains things. I'm very surprised any version of python accepts
that formatting to be honest!

> I guess it would be better for me to keep working with the same python ve=
rsion
> as in the autobuilder. I see mentions of python 3.6 in README-WALKTHROUGH=
S.md
> from the autobuilder2 repository, but I am not sure how up-to-date it is.=
 Could
> you please confirm whether this is the correct version or not?

The docs are out of date and the definitive version is the one checked in b=
itbake:

https://git.openembedded.org/bitbake/tree/lib/bb/__init__.py#n15

"Sorry, python 3.8.0 or later is required for this version of bitbake"

so 3.8+ is our current requirement.

Cheers,

Richard

