Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD5FD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 12:06:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6269.1765281976717621017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 04:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Iob/pytY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2d52c24dso2998491f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765281975; x=1765886775; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmoP2OXzMmRUV724OrXzHQNTBhxBCGEmov6ch9lWExA=;
        b=Iob/pytY+sqAhP2v89/ZUQoLiN0dshZq3KHoe32jyDGGcmvCllCWfyu6Ib4OKNfspK
         VoQyqQrEDCXfTqq+9a15ur7lA1nVY80NtAixpniUBBT172Tew9QSpebt4DH9uBXXq6MP
         3dM+GcQ56EL64WG05ya/Z74B//32RnDE2bLSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765281975; x=1765886775;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmoP2OXzMmRUV724OrXzHQNTBhxBCGEmov6ch9lWExA=;
        b=mv/CRIXINwdxO6kjQ7ck0qsisK7oaJ91WH3/ZrEYBqHmqGjL2iQItPTvLKOu8l+/8w
         regXbpW0vGP2A149efF2rhwGr1/IvQ740u+uYA37QsBUeq4qMjrY/a296S+XKGQn+dcN
         C4MmVZfmzk5OP9AOJERAmJTAbZk5jcydjrySbJwc92nUi7JOBD+n7LY+unj27m/WIpHV
         HtDH1N7xUIl9iJVtHw/TSbqtCggXwk9/XQFFhFeV+wZlP1iSoWPC7T6aQtykPjp/CdMI
         jsQGCMnwyN9szccObnq5+yK34sqhD5hZw7GNjAp9fR9FyIcFKhXZg+qYoiEkZ/i3JeiZ
         uyGw==
X-Forwarded-Encrypted: i=1; AJvYcCVR+07/BzEEHOpXM/ufZOCF3esrH8R9K0OyBIbLVChZRqWe3Jv6e5eFbl39MttkVM39qn7nOI8UrDHONMAFkHbznQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyX0iVGZ0HjKfdxIEgEy6cGNYqxy1G5NwEDujEmvee+xkJ1Kr3M
	JVRMe/HfrYEEEd5wZbCXHz+1FQSjZlaQvOvAhG7yPUHdHmdNDqxBNisacchLCbZhdRA=
X-Gm-Gg: AY/fxX6p7OoWkDr7KbV4U4dPEhsJjqhR+uUnKJuYaPK2acwf2fznjaD2dXWHtMAkfTT
	qI8FCq2oO9zfCgfJqDAFebZWXjlNSzbkkotuPfD5f4FUdKBI98IE/V+GCJnpq/e46hVDZwZ589N
	NlHXNDDWmU7RJ13j81GzhZvD4gyz5M2a7hPg8VSUekRVxG5/ZlyDCpDOOHnusBcejTvGcvOPSDr
	5W3vrihxiWADy715gWxaCN1Ruaz9pvM8SvfeIliGEOFGT/8mlfhuGDspo69oo/ERDV7J8QDRx45
	yi508pRfAz7jtMgnid6bP6IGLdTnVhbPL+JAdzvcvvN8NSyM0TZOj5y/lm7o+eqsiB1EH7G3EMM
	b57g0vs5e1k47icRu0RntWpnsNRSR6DNxMtUa96Wkt/4LED371VbyEh91Quf9u/dLuopsgPruy6
	Tf6sI1m0+Zzoa1jfjSWIhkUaZXwLrdmNJercMgJ3ZnveZ7ULqOy+BPpylihimAZfDz/oeznWG0U
	5E=
X-Google-Smtp-Source: AGHT+IHutAhfBq+E2m1f663hgWY+VEbOzuCmXxuoPUHd8t8F6D1RcjErKUv9jHBpQn9WiftXgutjUw==
X-Received: by 2002:a5d:5f91:0:b0:42b:3bfc:d5dd with SMTP id ffacd0b85a97d-42f89f599a8mr12037497f8f.54.1765281974935;
        Tue, 09 Dec 2025 04:06:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:31fe:6f5a:7771:4340? ([2001:8b0:aba:5f3c:31fe:6f5a:7771:4340])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331df0sm32291874f8f.36.2025.12.09.04.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:06:14 -0800 (PST)
Message-ID: <e6e064db5ac30f5e711d45b657dfa89f1ad9e2b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cpio_2.15.bb: delete superfluous ptest
 RDEPENDS on "ptest-runner"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Dec 2025 12:06:13 +0000
In-Reply-To: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca>
References: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 12:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227431

On Wed, 2025-12-03 at 12:55 -0800, Robert P. J. Day wrote:
>=20
> Get rid of leftover cruft where a ptest-enabled recipe has a run-time
> dependency on ptest-runner; this is now handled by ptest.bbclass.
>=20
> This appears to be the only recipe in all of oe-core that had this.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-exten=
ded/cpio/cpio_2.15.bb
> index fa011251e2..8c31209f77 100644
> --- a/meta/recipes-extended/cpio/cpio_2.15.bb
> +++ b/meta/recipes-extended/cpio/cpio_2.15.bb
> @@ -69,7 +69,7 @@ do_install_ptest_base:append() {
> =C2=A0DEPENDS:append:class-target =3D " ${@bb.utils.contains('PTEST_ENABL=
ED', '1', 'ptest-runner', '', d)}"
> =C2=A0PACKAGE_WRITE_DEPS:append:class-target =3D " ${@bb.utils.contains('=
PTEST_ENABLED', '1', 'ptest-runner', '', d)}"
>=20
> -RDEPENDS:${PN}-ptest +=3D "ptest-runner coreutils"
> +RDEPENDS:${PN}-ptest +=3D "coreutils"
>=20
> =C2=A0PACKAGES =3D+ "${PN}-rmt"

The commit message is a little misleading which I'm a bit surprised at
given your love of correctness! :)

ptest.bbclass sets:

RRECOMMENDS:${PN}-ptest +=3D "ptest-runner"

which is similar to but not equivalent to an RDEPENDS.

The reason is this package requires the user from that dependency, it
doesn't work without out. That is an RDEPENDS, not a RRECOMMENDS.

So whilst it isn't too obvious, I'd say the recipe is in fact correct?

Cheers,

Richard

