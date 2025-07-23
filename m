Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA90C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 15:35:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.18337.1753284899641415076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OetyeNNa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso4491044f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753284898; x=1753889698; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t2ou4D9izmSnspXzkOYQ2d+mP1rjdkZS+3n+4VuB108=;
        b=OetyeNNaf+dQRU6qLsCA90ePBM+mmWFmk7aPmUKXXcjuHc7yErO8twEEEDl84wKJMY
         f/LxJBUZ8cH6mKpa45OkATBz7vQ5FUSbYlJF3ysl3eqYo6pC9zhnZzSiWTtpTTK2YH22
         kjzD+dPSetNMYGcw9rdoel6R2FiazdNW+yXnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753284898; x=1753889698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2ou4D9izmSnspXzkOYQ2d+mP1rjdkZS+3n+4VuB108=;
        b=JJ1mN2sqtv12SvUbHXeLMb3kP9zzPX6XvocSbb2JrvBGVGB1ct44wSYBjh3AGpGsqY
         239y1LxIjHf0Zd6Iex+4tPL6/NDM1ZrIOeHKh08JoSS6DobJA/HK/zb9KoesEpyWE16Z
         XBxJhzi5eD/xplnq70w5g8dYQEgbe0nG5l5cvPuPAr9bUyFGIGRvYdY7LS7oOdvHJgN4
         6aBscc0fzoEGkOVG+DAqCa8ORfkXH0+5ZY0hOCxsXSDYzNbyWWMMrkU+m9dId8Zw0e4/
         3xEERbseed7CE2Tw+NM8ATNuRq8qJzPdmCTDR4E3ceCMvlFSPxWyfDY03aSBX2xf4CKO
         4PrA==
X-Forwarded-Encrypted: i=1; AJvYcCXbaWE+T85p9N65OHx12iWgPCgMauhthfAUWlxKIr2WK6llGZd7ho+yiIdRNXQMaZzJ0rmJAixj0kcDy4dXAdBl0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSuqwJeFv7buIKO1AgR/tMALS9wyePrnASI6yMpzoJCFPya0zs
	6cLN4lUs3V5HLhH4432r6VBY/6mWAm8oYLHNbhotOR5MzJb4h/hurH1xWdLlO5EKR80hNVfLTeL
	dHaoJ
X-Gm-Gg: ASbGncv1Jrrr4EWOS5LrJqoH3KV9dROdmzDG1c3VlZ8AFVgikD53C0CVUpIyQp/CYDn
	nXXHX406fcccafQWBbf3yMfH7vuvGbJE/aFFRMjvw/+Aqzk4JiZp77XerAeT5WbNmsT/9OYOmCj
	YQmmgUdhFgaT4BgPWiPEqduDX0etxVsDzYeZ83qAppAAKpbbnB+GG4e4+2U2WJu2XrRGv1DqneD
	D+dxLXP7cQeQGIoEaTHS859OsaiK2j0R8KDd9JtvV29yoV48giAjgK0f2kzI/+WFoiut5/8t6y+
	wVP1jUcwtEp+waBd9j5YNoYUEw9L5tC4E6y87AXkWEFPU3wwTDuS4DHXoA6Shvsp4MTpBIYPMG/
	2oE59KxQt9bo4yFMqnNWH9alCgoLg/ppMmOQH5pgRmgPAnswYkRvPsQcZbEaQjAAXbDQbkmnRSx
	UZZWG+Lf8xUOY=
X-Google-Smtp-Source: AGHT+IEGQykBIr3tErOCADj5UpKEfLGTAv6dnqc8ghesspvC3jckxkNg+Bilt0nZjK4rm9f/rmuKsw==
X-Received: by 2002:a05:6000:2dc5:b0:3a6:c95c:36c5 with SMTP id ffacd0b85a97d-3b768f1f22amr2961472f8f.40.1753284897509;
        Wed, 23 Jul 2025 08:34:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8e54:5d9e:fc41:f168? ([2001:8b0:aba:5f3c:8e54:5d9e:fc41:f168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458691a1aa0sm26459975e9.20.2025.07.23.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:34:56 -0700 (PDT)
Message-ID: <4acc3f53298c69ae7f7fa9b9302a565d9a799af6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: set CVE_STATUS for CVE-2025-5791
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Wed, 23 Jul 2025 16:34:56 +0100
In-Reply-To: <20250723104923.1204089-1-Deepesh.Varatharajan@windriver.com>
References: <20250723104923.1204089-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 15:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220808

On Wed, 2025-07-23 at 03:49 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> As per NVD, this CVE only affects users crate
> https://nvd.nist.gov/vuln/detail/CVE-2025-5791
>=20
> The CVE-2025-5791 affects the users crate, which is not used
> in Poky build. Instead, we rely on the sysinfo crate, which
> provides similar functionality. As confirmed in Red Hat Bugzilla
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2370001#c0
>=20
> The upstream Rust also does not depend on the vulnerable crate
> instead they also dependent on sysinfo crate. Therefore,
> this CVE is not applicable to our poky sources.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust-source.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index ed15d9c763..7e100b73d9 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -20,3 +20,4 @@ UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-s=
rc"
> =C2=A0
> =C2=A0CVE_STATUS[CVE-2024-24576] =3D "not-applicable-platform: Issue only=
 applies on Windows"
> =C2=A0CVE_STATUS[CVE-2024-43402] =3D "not-applicable-platform: Issue only=
 applies on Windows"
> +CVE_STATUS[CVE-2025-5791]=C2=A0 =3D "not-applicable: Issue affects only =
users crate (We are not using users crate instead we use sysinfo crate)"
>=20


This threw a lot of warnings on the autobuilder, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2098

Cheers,

Richard

