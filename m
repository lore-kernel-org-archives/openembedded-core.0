Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E80EE7E34E
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:54:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7816.1775206439317144935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ITaVg74C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-482f454be5bso29777945e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775206437; x=1775811237; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtAIOmDlvuBpmZiWoy3T8WW8F5lDu1gHue5DVhtl67o=;
        b=ITaVg74CG1UiSc7d2LyCSU+ldoMfyr5GdC7nC5NU9j1LLZAv7IatscGH9VqGE5T3zQ
         OE4VNj6EQpNuYDWzr4LI8DHq5Blti+PN+EH33hm3CRYNpZ+c3ANqykmMDD0LLS80iNJu
         ARKy7i7rqJFzKFp/Rq2tnY1mGJN0JwZT5uVD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206437; x=1775811237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtAIOmDlvuBpmZiWoy3T8WW8F5lDu1gHue5DVhtl67o=;
        b=K/0f3aKIZkCG7oiFKoGlwpnPCJeTImABodDurZ+ogir4mWfvW4cJZrM5quL8V3340Q
         aroyA28kNqmqTK0PyW4e47DlEAjU38PxfaIrb96DAZmmDYoD8oH5itr4bSN2NbrEfmBK
         96maqo2oG5PEq9UHQ0q4IozsXTxjNEWg8NMJjbw8uATvx4+RtkGjDYkTmWUyj20yhqOp
         +0XCX/X9FSXroMfe7Qg1fjd4Bv5JgGgjIXzpd6/tHwa4S5rOhlLmRjb++tA/LLxEFhWw
         J/TUfVcjHG5+wg/lxWRwlyzckBcNcHcuUiSeiQN6/PNwdfWrLGPYe/b8WrLppYHwktjt
         vWBg==
X-Forwarded-Encrypted: i=1; AJvYcCVlISGRweUpUH9HSZd+yXVJnqpmMjWqwKdXnr9M3iT7/6hzx+8/P+bSqmxZLhCy45QY2+UD1l/vpF/j8551nIaWAQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYE+hmcC9ogJgdd9Vxu/G0TkAc2Mg5FAi5Il8xij9BbJPRuJEy
	8phN4Hqi37y9SyZ0vQBpdfjVFkhEAdLloVyB4o+lfytXdKXMqI2np+Jakfj7wyBe6MeVphdAE2N
	15FWo
X-Gm-Gg: ATEYQzxZBuYeUK/qQinyyKx8mxcrdP0FA7tNqXA9S0koW/VlmFqGdxKRMk1pr3TcYDv
	Fji5vsSFA4ozR+e1LQAmYp4GeEAVKdEkjFWuAhCVMV9O2vpz+Vk1N25lIcR0S0bXsuK+wFnHcd4
	pZXjQZ6nuaYU13r/dH/Ha8n3pXjmMGRF7o7Vl9slL7ayK8Hbco5/Bf9QARrf6iyI5TNpFfpJiQ4
	QTpcjFTjFGO8T+yuo7EjhXpbL8sMrEdMhsnl2UzfM4w9SMMWoSbJ2sLC/Frr2JOjL1V7ecMU57i
	YqhthHdg7RZqhOaeCT9t7eohsy1YoCfueryu9Dt3ZT8kMNixsjIYaSD7I3PlqszXaBRgIsMIFcu
	NDFfnekQPLu5S/c6275Yg/Xfu3bWx2FS2zXZUiI5ttBjWXmMOmJXEi44Ra4dhhtwvnWomoWm3ON
	GjJ+IjMXu7TzN57Zbnt/eDFUyg8aWjrM34x1rYGdfTgHvF70QHjF/YpQP7xgb2kQtBukEfqnu5N
	AkIUCgkpkHgkw==
X-Received: by 2002:a05:600c:1549:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4889949bd38mr33536715e9.9.1775206437071;
        Fri, 03 Apr 2026 01:53:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d1f2:4cb0:580:188d? ([2001:8b0:aba:5f3c:d1f2:4cb0:580:188d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a705ebdsm144737565e9.10.2026.04.03.01.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:53:56 -0700 (PDT)
Message-ID: <5464d1df292f2c566c753df2f3d43daeda7d0be8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] autoconf: Raise line length limit for sed/awk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Fri, 03 Apr 2026 09:53:55 +0100
In-Reply-To: <20260403024300.1195438-1-khem.raj@oss.qualcomm.com>
References: <20260403024300.1195438-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234573

On Thu, 2026-04-02 at 19:43 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> From: Khem Raj <raj.khem@gmail.com>
>=20
> Latest autoconf is splitting long cmd lines in config.status
> it generates using sed/awk to have compatibility with
> platform like HPUX,Solaris,AIX which is understandable given
> autotools try to achieve wider portability, however, this does
> mean that in OE builds we might get these newlines added in
> places dividing commands including buildpaths in them and the
> methods deployed to scrub them from output artifacts will fail
> since the string is now on two lines resulting in build QA to
> pass but the strings do sneak in affecting reproducibility
> one such example is e2tools recipe in meta-filesystems and there
> perhaps are more
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0...-command-limit-to-prevent-line-wrapp.patch | 41 ++++++++++++++++=
+++
> =C2=A0.../autoconf/autoconf_2.72.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 42 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Inc=
rease-awk-sed-command-limit-to-prevent-line-wrapp.patch
>=20
> diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-se=
d-command-limit-to-prevent-line-wrapp.patch b/meta/recipes-devtools/autocon=
f/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch
> new file mode 100644
> index 0000000000..0713af6d7d
> --- /dev/null
> +++ b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-comma=
nd-limit-to-prevent-line-wrapp.patch
> @@ -0,0 +1,41 @@
> +From 139f757a6244d3b1e07f7fddc6d07d9c17f45313 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 25 Nov 2025 21:03:38 -0800
> +Subject: [PATCH] Increase awk/sed command limit to prevent line wrapping
> +
> +Autoconf 2.70+ wraps long variable assignments in config.status
> +using backslash-newline continuations. This breaks when LDFLAGS
> +or other variables contain special characters.
> +
> +Increase _AC_SED_CMD_LIMIT from 99 and _AC_AWK_LITERAL_LIMIT
> +from 148 to 4000 to prevent wrapping.

The commit message explains why this is needed but the patch needs to
as well (buildpaths being linewrapped and then not being correctly
updated as they're over multiple lines).

Cheers,

Richard

