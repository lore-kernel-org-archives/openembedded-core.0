Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB23C7115A
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 21:17:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17095.1750022228358178710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 14:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SsBsSbsf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so49899955e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 14:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750022227; x=1750627027; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0oEFEmR3O3RbXReGxMu9RcVmOm3WIouXklL9FIDyu0=;
        b=SsBsSbsf0XAp5qrWoxy/W7vVjWFB+yazZuikd4CDOMWbSX/hQpC0oOz8iZoUbRWJDm
         Zjry7Uztq2HYm0I+SvVsGBamyCpYBmeTsUvihHga4xKh/q5c2ruYZQbOQt3zFC6GF9ui
         PA/+/x6Y7SIq4ipns+rbkzPl8sfe1uVtp6Fgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750022227; x=1750627027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0oEFEmR3O3RbXReGxMu9RcVmOm3WIouXklL9FIDyu0=;
        b=McTFIja/msrs21uw+EKdeRIwEyXGqJHxlWTb8PUlO1fwlIxMtsIGOsu2F6haD/vlFO
         VZjFVlIEIIBCNbvK4Nlg4rvJmqAOZbliIxzGusca9pep4CvB6a0bSrkZvBuY7M/a3SVQ
         DPU+L+uDP11L+x0E39x3MJkDCeA0vMDWREqzvleLwo+ftQNlkGtxV0ZQ+hXrqFe9jHsY
         qiHdWwyrOzKurPIOi/HWnj9Yt92Y7bjsOrLGfj4O7ZqNGSO35Sy22fa7/wS37zus1iBM
         ilAfP9FLIQCpamzXkVMwSAmHmd1/CSmoqrmNJhUWm7yHCYtyp0Qn2G6kw1WiXELMPe5i
         BT8w==
X-Forwarded-Encrypted: i=1; AJvYcCXmtLO1jLIRi4jywT9PEJJK3qZf1dKtAfhxWaH5fxyyna7+6rtQNqmq5oicJEpCD61hkJ3hdZR11PoNFID++ZfvbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWgk3NkaA+QWhd/z707X9uz1hLl74NkZbYp8ALFSpWFPLkbI0f
	SzWR2O4v+H9gbqC5xAV5P6ydRArsWrcoOYwj3cAxnuV6HwR5z9BucvIINTzx88NpAQI=
X-Gm-Gg: ASbGncuaRHuxsXTFM9KmnRktRucar2Dl5s3toTUw6vK730VcPFKBOgf64A2JxOg8eje
	/+b8Cet+6SpR/hJ45m+TB8tSCd2QUIjVI9ZryH0NqTxzYK7GhLP8coNMuMtyw8N/qMdASnKAJbY
	NrIPvP2e965SVCZNNAwm51Ux8WVxOmV84b6vNnBN7ZfFEfLG9b+Z9f4yQerlVpoa9X42ekENzSt
	Fe//qQzP1JtFyHZTUJVHoEi0F9UfhJHqSnjjIijFfuDUDOVEM58B0L7q4nlQ5dBZzDZ6Dy3/s+w
	kSjIYMVnLMXWlUsbYvlvCmXwT5zfHFixMOpIuHSoYXg+BgeIviL5r/6DTcC5oWO6G/oBofAWe21
	T1pYY75SDEf32VLgroKViFW2Tm+BAoI1gzLsa2J+gHWNSJUVVJ+Pq93+997M=
X-Google-Smtp-Source: AGHT+IHeJvzs4PE7R7BILldicZ0+p9gWbBeY3Kd16wav1p0Lq750cbQM4gWfQX5bgtdgXlNVNggf4Q==
X-Received: by 2002:a05:600c:5286:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-4533caf5f5cmr72114075e9.17.1750022226549;
        Sun, 15 Jun 2025 14:17:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9f38:e35e:43a:b28f? ([2001:8b0:aba:5f3c:9f38:e35e:43a:b28f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532056486dsm123673305e9.1.2025.06.15.14.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 14:17:05 -0700 (PDT)
Message-ID: <0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
Subject: Re: [PATCH] sstate.bbclass: apply proper umask when fetching from
 SSTATE_MIRROR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Jun 2025 22:17:04 +0100
In-Reply-To: <20250606093905.2715221-1-ravi@prevas.dk>
References: <20250606093905.2715221-1-ravi@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218750

On Fri, 2025-06-06 at 11:39 +0200, Rasmus Villemoes wrote:
> From: Rasmus Villemoes <ravi@prevas.dk>
>=20
> Currently, files and directories created under ${SSTATE_DIR} when
> fetching from an sstate mirror are not created with group write,
> unlike when the sstate artifacts are generated locally. That's
> inconsistent, and problematic when the local sstate dir is shared
> among multiple users.
>=20
> Wrap the fetching in a bb.utils.umask() context manager, and for simplici=
ty
> move the mkdir of SSTATE_DIR inside that.
>=20
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> ---
> =C2=A0meta/classes-global/sstate.bbclass | 22 ++++++++++++----------
> =C2=A01 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
> index 1d7b033b80..2968cc4c2e 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -726,7 +726,6 @@ def pstaging_fetch(sstatefetch, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 localdata =3D bb.data.createCopy(d)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 dldir =3D localdata.expand("${SSTATE_DIR}")
> -=C2=A0=C2=A0=C2=A0 bb.utils.mkdirhier(dldir)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 localdata.delVar('MIRRORS')
> =C2=A0=C2=A0=C2=A0=C2=A0 localdata.setVar('FILESPATH', dldir)
> @@ -746,16 +745,19 @@ def pstaging_fetch(sstatefetch, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_S=
IG"), False):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uris +=3D ['file://{0}.s=
ig;downloadfilename=3D{0}.sig'.format(sstatefetch)]
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 for srcuri in uris:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localdata.delVar('SRC_URI')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localdata.setVar('SRC_URI', s=
rcuri)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch=
er =3D bb.fetch2.Fetch([srcuri], localdata, cache=3DFalse)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch=
er.checkstatus()
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fetch=
er.download()
> +=C2=A0=C2=A0=C2=A0 with bb.utils.umask(0o002):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.mkdirhier(dldir)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except bb.fetch2.BBFetchExcep=
tion:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for srcuri in uris:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local=
data.delVar('SRC_URI')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local=
data.setVar('SRC_URI', srcuri)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fetcher =3D bb.fetch2.Fetch([srcuri], localdata, cache=
=3DFalse)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fetcher.checkstatus()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fetcher.download()
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 excep=
t bb.fetch2.BBFetchException:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pass
> =C2=A0

I appreciate this sounds crazy but this is causing some kind of
regression being reported in our automated testing. Specifically,
running:

oe-selftest -r sstatetests.SStateCreation -j 1

fails for me locally with this applied, as it does here in CI:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1767

Worryingly, if I run:

oeselftest -r sstatetests.SStateCreation.test_sstate_creation_distro_specif=
ic_pass -j 1

i.e. a specific failing test, that fails even without the patch
applied, and it shouldn't so there is something odd going on here even
before the patch.

We're going to have to get to the bottom of this before I can merge the
patch.

Cheers,

Richard





