Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FEDC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 10:03:19 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.30095.1749204198819605673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 03:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UoeHIlj3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1290977f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749204197; x=1749808997; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H9oAr14310tPwQssXMGhfAAbTQEEbiWEaKpMgI6+5Q=;
        b=UoeHIlj3ZlsIAMrCetAVuPg4smvefIpNJ67T3vHpl78yrcNPH82Bz5A0H2Amlb6a2/
         f0mZXhkF7cq5qR84lV1xaXg/6QmgpCB+FIH1zzfOKA79B0jjIpQD/hQUDEqkBkTUU5RE
         xE7v8PZyd6wQv3GPj91uuIB0DWgjJieWHnSjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204197; x=1749808997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1H9oAr14310tPwQssXMGhfAAbTQEEbiWEaKpMgI6+5Q=;
        b=EnpBGUb8yOvgiqDloEk5yjeJ0St7C/jL4CguZExmSHH2wKM7B/w6pOXrNiU0vijqDA
         +1LdHktAJ+rc1siq2xTNlRz8iOIgxfpIzu9IxN39LDCPWL2uvVwQAsZbggsTHf8FAh1Y
         o/gV94EawljpKqhz1pQ5aAyEWRoGL2n0nl5QAZN+nI3xbjjx3EVmWvZNeGry+XBsvdDA
         TSO1WlMMj4FGvG005P56pv/ovGZF1CZwtEbeYwZXtl0p3aobYAA5syv9gvnf5mSB4yPM
         NobB3YbRm0eAKX6Pq334RKqWsSO/C434OeXKrP4M48hbgh6nyPHYNYp2OjkTm6w1Nkq2
         8ZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsuqq+v5YFls6gl0eXB9zDjJONCousfJNevyp+3RDCZUXGNAWePzx1nDy7E9aeT4avWarydVpEFyoFoWitubA2WA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkjHTAKEr2lT9SjmrslSP8tUnEK4uC78/l19v3aBc1J2vZaZKc
	YNvDg/sE8xiYVFRN+/xKSC2iimutRl3q1mcxXZN1G55zP48fkYIf0+jubcFCccD91iQ=
X-Gm-Gg: ASbGncv+3jywEdjgr2eGTCctyk8NFGZO5QeiGW5oQ5JAR5LVJmyRlLEUP3d027T2wba
	mNB/vp9BOHzyC0WlmgUN9n0lJkwRWOZ8owqlwTlnqrm9pUXH/IebE98G069TXyNVpECPx47LRHR
	HtRTjtUfZWjZ4R4kRf+CujfYqBF3rDHZlCMDISBKRnDvQef7qxSIoIXBPGI2hTJT6hWW8FrW1/C
	JzQkBzjZIY0kNtgfURW0WQk/rvA6uPheVoN9cQWju5CC27UjBhdwIR32y+/t/gzy8YYN4uAk8fv
	MEKbJyHJMPUvFqeTlkwQHXMA3m3uC/NvAd/xldGd/dt1wucQxQltnUCGJxQeMhx+DXz2SH6m50e
	Qzrul2IdLNlYcRmQcGD3cXFPflG6ncTzn5m/fLAwQ
X-Google-Smtp-Source: AGHT+IF+mj7PT2jOd13DgxkXX9IzGdJkaiTWirAAkPo6UAWtI3CDgBro06YqD54y2Dyt4xZ3kqEz1g==
X-Received: by 2002:a05:6000:2512:b0:3a5:2d42:aa23 with SMTP id ffacd0b85a97d-3a531ca71ccmr2525675f8f.22.1749204196771;
        Fri, 06 Jun 2025 03:03:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a81:c19b:a61f:3f66? ([2001:8b0:aba:5f3c:4a81:c19b:a61f:3f66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f02asm1369034f8f.83.2025.06.06.03.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:03:16 -0700 (PDT)
Message-ID: <f8d9f38f2dec2c1db8376fecef756627abba1fb4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] automake: 1.17 -> 1.18
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Jun 2025 11:03:15 +0100
In-Reply-To: <186484bc29ea5b9bbefd86532a9a403050f46a50.1749092509.git.liezhi.yang@windriver.com>
References: <cover.1749092509.git.liezhi.yang@windriver.com>
	 <186484bc29ea5b9bbefd86532a9a403050f46a50.1749092509.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218126

On Wed, 2025-06-04 at 20:02 -0700, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> * Rebased 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
> =C2=A0 The previous patch added a ':' before the line to make it not run,=
 but now
> =C2=A0 there are multiple lines, so just remove them.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0...report-error-when-the-path-of-Perl-c.patch | 27 +++++++++++-----=
---
> =C2=A0.../{automake_1.17.bb =3D> automake_1.18.bb}=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A02 files changed, 17 insertions(+), 12 deletions(-)
> =C2=A0rename meta/recipes-devtools/automake/{automake_1.17.bb =3D> automa=
ke_1.18.bb} (92%)
>=20
> diff --git a/meta/recipes-devtools/automake/automake/0001-configure-don-t=
-report-error-when-the-path-of-Perl-c.patch b/meta/recipes-devtools/automak=
e/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
> index 5a38feb16c..fd6d8affaa 100644
> --- a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report=
-error-when-the-path-of-Perl-c.patch
> +++ b/meta/recipes-devtools/automake/automake/0001-configure-don-t-report=
-error-when-the-path-of-Perl-c.patch
> @@ -13,22 +13,27 @@ Upstream-Status: Inappropriate [ oe-specific ]
> =C2=A0
> =C2=A0Signed-off-by: Changqing Li <changqing.li@windriver.com>
> =C2=A0---
> - configure | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + configure |=C2=A0=C2=A0 10 ----------
> + 1 file changed, 10 deletions(-)
> =C2=A0
> =C2=A0diff --git a/configure b/configure
> -index 45bf85a..68d3c7d 100755
> +index 64b61eb..786aefd 100755
> =C2=A0--- a/configure
> =C2=A0+++ b/configure
> -@@ -3514,7 +3514,7 @@ case $PERL in
> +@@ -3776,16 +3776,6 @@ case $PERL in
> =C2=A0=C2=A0=C2=A0=C2=A0 as_fn_error $? "perl not found" "$LINENO" 5
> =C2=A0=C2=A0=C2=A0=C2=A0 ;;
> =C2=A0=C2=A0 *' '* | *'	'*)
> --=C2=A0 as_fn_error $? "The path to your Perl contains spaces or tabs.
> -+=C2=A0 : as_fn_error $? "The path to your Perl contains spaces or tabs.
> - This would cause build failures later or unusable programs.
> - Please use a path without spaces and try again." "$LINENO" 5
> +-=C2=A0 { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: The path =
to your Perl contains spaces or tabs.
> +-This will likely cause build failures later or unusable programs.
> +-Unless you're specifying a full string for a #! line,
> +-as in \"/usr/bin/env perl\",
> +-please use a path without spaces and try again." >&5
> +-printf "%s\n" "$as_me: WARNING: The path to your Perl contains spaces o=
r tabs.
> +-This will likely cause build failures later or unusable programs.
> +-Unless you're specifying a full string for a #! line,
> +-as in \"/usr/bin/env perl\",
> +-please use a path without spaces and try again." >&2;}
> =C2=A0=C2=A0=C2=A0 ;;
> ---=20
> -2.25.1
> -
> + esac
> +=20
> diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/recip=
es-devtools/automake/automake_1.18.bb
> similarity index 92%
> rename from meta/recipes-devtools/automake/automake_1.17.bb
> rename to meta/recipes-devtools/automake/automake_1.18.bb
> index 4cda04e47b..9179268c7a 100644
> --- a/meta/recipes-devtools/automake/automake_1.17.bb
> +++ b/meta/recipes-devtools/automake/automake_1.18.bb
> @@ -25,7 +25,7 @@ SRC_URI +=3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> -SRC_URI[sha256sum] =3D "397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b=
0897f06c89310acd"
> +SRC_URI[sha256sum] =3D "af6043a5d4b3beef0c48161f4a6936259321cd101a34c1ab=
0768328515626c8a"
> =C2=A0
> =C2=A0PERL =3D "${USRBINPATH}/perl"
> =C2=A0PERL:class-native =3D "${USRBINPATH}/env perl"

I think, but am not 100% sure, this resulted in:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1630

That build has documentation in DISTRO_FEATURES.

Cheers,

Richard

