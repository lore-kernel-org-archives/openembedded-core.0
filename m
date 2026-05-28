Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5D3CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:13:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10661.1779973986994394408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eNqUk2gd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a74032ff8so9550287f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779973985; x=1780578785; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irngn2iLOTEGuolc4LB9/uP6B++UG1Z89ybYqn/eE0Q=;
        b=eNqUk2gdEZaxiaF3Jjuxvk/2rFmtyk1O8NGIdzwFISa3mp9yHoX8OXnkfXNeOqyAJf
         sEuSE7LU1XWendzBQbDQ87UC+E+KWZzQXBt8IN0kih8Wrpzso7H/aBacTPEp16Ret4iw
         pSEcVbU3ITtjA/Iq6IVlpFnRsscl5SuUgvFC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973985; x=1780578785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irngn2iLOTEGuolc4LB9/uP6B++UG1Z89ybYqn/eE0Q=;
        b=b0yHd7ypXWDgNN+T9FxmPdCwQxgauHvFkNOlvd0Tv9E9KZmu4z9bXWyQaNq94rbGeU
         3TOuKXHQoemYxryhr6jtwJbRj244jxtvFCU6tJPrxzza+BwCaCuSOLbup8EQZVpRY1wX
         NusJJSPrFO7lquzf/5O1gqXwEYe8rryrdWqEPJqGdZOxcJb4TACtEmn1+X+ZElVfCxpj
         NAemv97Pfwl2NZsGzo0o/v3DyrE++ZYIcdwjEdlXsyuxicEJHBLjUb6D3Ta6gk7rDomh
         LoEXuH+yUeLuAJIvbfZJH1NKz5Zkzmspu/7hUJ53FugYzvWzoKpl0FQsHDk3A1N/dEHJ
         tThA==
X-Forwarded-Encrypted: i=1; AFNElJ8jtt0UGI1GkHOYACia0KFzRMzKBYPgGdSp25Mk11Ke0Hn6mrTklbRHDwBx74IXBg3FdH9+uLb/DwV2uZ+F0kTnxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxO3ZeD9GrZAkY5ffcMgfAFL2YfYs2QX7R65A9FhBtNwdE4wQhV
	xerUcK9vLZ2QvwDfbbV6Z3Ie3jxb05iDz2EoUDzsvKuouw4JI2Jubn1gm8m6j7Uijl5vXO7OACa
	nj4XF
X-Gm-Gg: Acq92OEUZCkjRfWC/YdMhweS5aWfbGzfWVCeeSu2G0SjEzHDXhClmZFib6vsq80+Ouo
	oCBzlVNQ8mYQl6xCJFO1zaMRUZ4oJef61Q7zjlgbGUBsnzVHEwdFZivCICRCI88qWwvuoT0okYg
	nKlFcsAo3W/ytXaI1G4Ugjd1eTuZ5RtAb8GZyTVIglOPANB6RAQXUL7hEgrZkfWZ3iGg4Qvt/Gp
	upEd3atCk/amyrBk/9s/hjptDLanb2zxqPP8Zx/0NGHxkY3U2KJxSCA45FROOiCR0tGnxYZSbeS
	MQaj3gEBhFukqSlWPfkt+kF4WqeJ3/C/7HB2+6rTVInqjFPltFao0uutyNZqvf5zXXUud6dTXqE
	mr1i42rl6KG8/d6d0XsT3nCxqT/a+xm9LC31AY3pfa2nHxH4RAsqBIEuVO6aS9Xz8rR1ISIf68n
	KeUc9y2jIuDYYvSuQ6G5ipn0DofCWHJkILwgXsPRhC0e40xpfkP6m/nBNtgfNYy68S+oH04Q5SK
	mMp07ZRT+GIlIHx20eygNui
X-Received: by 2002:a5d:5d87:0:b0:45e:ea46:ce11 with SMTP id ffacd0b85a97d-45eea46cf1bmr3268365f8f.14.1779973985232;
        Thu, 28 May 2026 06:13:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd? ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm12909509f8f.11.2026.05.28.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:13:04 -0700 (PDT)
Message-ID: <6e75c9801b521bb5a711f6ac403c7cb549aed492.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/2] strace: upgrade 5.19 -> 7.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2026 14:13:03 +0100
In-Reply-To: <805b80291449f0ce4ce4b278786f80326434d3b2.1779349122.git.liezhi.yang@windriver.com>
References: <cover.1779349122.git.liezhi.yang@windriver.com>
	 <805b80291449f0ce4ce4b278786f80326434d3b2.1779349122.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237706

On Thu, 2026-05-21 at 00:46 -0700, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> * Remove strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch, AUH has
> =C2=A0 copied it to the files directory.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0...gnore-pwritev-pwrite64-tests-on-musl.patch | 16 ++++++++----
> =C2=A0...toconf-macro-to-detect-largefile-sup.patch |=C2=A0 4 +--
> =C2=A0...kport-ax_prog_cc_for_build.m4-macros.patch |=C2=A0 2 +-
> =C2=A0...001-strace-fix-reproducibilty-issues.patch |=C2=A0 2 +-
> =C2=A0...002-tests-Replace-off64_t-with-off_t.patch |=C2=A0 2 +-
> =C2=A0.../strace/strace/Makefile-ptest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 ++---
> =C2=A0.../strace/strace/ptest-spacesave.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../strace/strace/skip-bpf.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +++++++++++++------
> =C2=A0.../strace/strace/skip-load.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../strace/strace/update-gawk-paths.patch=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0.../strace/{strace_6.19.bb =3D> strace_7.0.bb}=C2=A0 |=C2=A0 6 +---=
-
> =C2=A011 files changed, 40 insertions(+), 29 deletions(-)
> =C2=A0rename meta/recipes-devtools/strace/{strace =3D> files}/0001-Ignore=
-pwritev-pwrite64-tests-on-musl.patch (78%)
> =C2=A0rename meta/recipes-devtools/strace/{strace_6.19.bb =3D> strace_7.0=
.bb} (93%)
>=20
> diff --git a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwri=
te64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-p=
writev-pwrite64-tests-on-musl.patch
> similarity index 78%
> rename from meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrit=
e64-tests-on-musl.patch
> rename to meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64=
-tests-on-musl.patch
> index f21f68001f..d19533854c 100644
> --- a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-te=
sts-on-musl.patch

This is still moving one of the patches into files/ which isn't desired!

Cheers,

Richard

