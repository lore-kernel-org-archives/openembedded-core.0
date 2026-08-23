Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6518FC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 08:07:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10876.1787472422654284764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 01:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dDWWZ9sy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954dff6536so19096745e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 01:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787472421; x=1788077221; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+LMNHHn0dEpUBz5hEy9CftmHkPnLs+S0lloxDBvhaWk=;
        b=dDWWZ9syxVd+2V8vniFCKq+RHXq9iYnOzKFkP0yyd7CM5WQljAzoWPpEeilWVhYvkw
         3HC+NLKK1U2uPcgZRgfTRIy5HXz8C1jF6nDnorc7HRYLboaBpZEXp1mBriFrIe6DPvpt
         mvyZmWsHW1zLTMI3XYLjQgtSOgsbZwLcWntTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787472421; x=1788077221;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LMNHHn0dEpUBz5hEy9CftmHkPnLs+S0lloxDBvhaWk=;
        b=mHOeNd4+PyjlioHwirnNnbzEzP55OZTJDj5iPHkBS3R8ZSGIff7NrOVS03YK2Elkpg
         yUQ7/tnfC3K9/9wPZ4lRuUdpDyqB2MIMBThBtBq8msWV8vGmUrs58E5j/gq/CNIGZawa
         tBvjWgRHbONyg7b4TZTCQuETq4zgg6/p5yXGkClvufUDKKFX2mDfdZLVlFABudU77CCC
         Q7IkpGBTID4XqJYKqvmkiEadywig3067Hd+i+FKOhEc/UUMvSWR24+5OXFCN/6jdgY+I
         iV3AWDVajuXSGZTtMH8mfca5+Goue6YGIX07i3Cp4cF2jz0ZR5NakiH/N7rrJBvDXb8T
         UloA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb9Cu6jI6V6cUcHEJCbvBG+1MGICc05czTMdoXLAkNV2sA8QPOggihw3vn+ELoivff97lICey4oW7fU3cTxjH3YQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mNqJAQ5rykrgbdiCXTxX+nGpBimTI52J/EgmIxeaDHYkVtYrCa
	JSMdZYMhYTYXwnFJ565q5SpxXEpHxnaK7BR9cSUV/2M4rQ5azgeC+q/B5EiaHkh0Amc=
X-Gm-Gg: AR+sD11fOXD5vKzCwHDsclaGUcmhevBPlzuncyG8I7bXyr6SMiilPk+Tr1eG0r/3BYW
	gSjRw6TCzjqzy3f95SK0LeAS6zjrjZ0DCnhBXP8rnrC6F67Q+5oWCPh518pP2+29OGq7KvZC2NM
	tV9m3qO+Qcp77MY9lloR2bv+Gsx7yC+2EG3ia54Zlq+vbI+IX7TKLPz5WGUpasy69d29r859gQ5
	qdDfWiwJG6iIT8Y3osm9N7es1N32EmlttOeiqFbW/p9ffMGlHvIGST/tvjsC6ix1heyFECLbeq4
	1jXsfA+tht9MShI4JTZL1E5doj5A3w0SYW7poqD9BXXaWt2lhRA1gfMYjSLAoP0MwWbJ4XlNP9m
	kd2biwF5aSdY0nSVIomV4DMQiXFIVfw3vyq1D5s5O7d/iN6sLQJwdq4qZ6U3LSJtpThEj1bMlwS
	lYfSkaVx6uDIjKGxduZi4hAGQdrN3GyLzA63YJJ6oj4QPHNWGbvaoTWyF15O1655QJLaoSZrMFK
	OfH4XnSBTSWz2HklogkfTyWSh+c+LsaAMMXAoSKAauZuaz+DeG3rIVndEbsLOMj
X-Received: by 2002:a05:600c:530f:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499b82f3d1dmr227203745e9.1.1787472420786;
        Sun, 23 Aug 2026 01:07:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8601:39db:494d:605c? ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bc18b597sm77561305e9.12.2026.08.23.01.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 01:06:59 -0700 (PDT)
Message-ID: <33ff53c92a7632f161caec2c987eb29f8919ec8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v15 10/12] libarchive: Disable RPM filter
 auto-bidding and update huge_rpm test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, 
	mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com, 
	randy.macleod@windriver.com
Date: Sun, 23 Aug 2026 09:06:57 +0100
In-Reply-To: <20260816231104.3871015-11-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
	 <20260816231104.3871015-11-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 08:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244024

On Sun, 2026-08-16 at 16:11 -0700, Sumanth Gavini via lists.openembedded.or=
g wrote:
> =C2=A0* Add 0005-Disable-RPM-filter-auto-bidding.patch:
> =C2=A0=C2=A0 - RPM is now handled by the format reader. Disable the filte=
r's automatic
> =C2=A0=C2=A0=C2=A0=C2=A0 bidding (return 0) so it never intercepts RPM fi=
les during normal
> =C2=A0=C2=A0=C2=A0=C2=A0 archive opening. The filter remains functional w=
hen explicitly requested
> =C2=A0=C2=A0=C2=A0=C2=A0 via archive_read_append_filter(ARCHIVE_FILTER_RP=
M).
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 This ensures debuginfod and other tools that use
> =C2=A0=C2=A0=C2=A0=C2=A0 archive_read_support_format_all() will use the n=
ew RPM format reader
> =C2=A0=C2=A0=C2=A0=C2=A0 for RPM 6 packages, while maintaining API compat=
ibility.
>=20
> =C2=A0* Update 0004-Convert-RPM-reader-into-a-proper-format.patch:
> =C2=A0=C2=A0 - Include the test_read_format_huge_rpm.c changes from upstr=
eam PR #2846.
> =C2=A0=C2=A0=C2=A0=C2=A0 With the filter no longer auto-bidding, the form=
at reader handles the
> =C2=A0=C2=A0=C2=A0=C2=A0 truncated test RPM: opens successfully (ARCHIVE_=
OK), returns ARCHIVE_EOF
> =C2=A0=C2=A0=C2=A0=C2=A0 on next_header, and identifies the format as ARC=
HIVE_FORMAT_RPM.
>=20
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---
> =C2=A0.../meta/nativesdk-sdk-provides-dummy.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 -
> =C2=A0.../recipes-devtools/pkgconf/pkgconf_3.0.5.bb |=C2=A0 2 +-
> =C2=A0...vert-RPM-reader-into-a-proper-format.patch | 42 ++++++++++-
> =C2=A0...0005-Disable-RPM-filter-auto-bidding.patch | 73 ++++++++++++++++=
+++
> =C2=A0.../libarchive/libarchive_3.8.9.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A05 files changed, 116 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/libarchive/libarchive/0005=
-Disable-RPM-filter-auto-bidding.patch
>=20
> diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/met=
a/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> index 6075770bf0..37dad54409 100644
> --- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
> @@ -11,7 +11,6 @@ DUMMYPROVIDES =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 /bin/sh \
> =C2=A0=C2=A0=C2=A0=C2=A0 /bin/bash \
> =C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/env \
> -=C2=A0=C2=A0=C2=A0 /usr/bin/pkg-config \
> =C2=A0=C2=A0=C2=A0=C2=A0 libGL.so()(64bit) \
> =C2=A0=C2=A0=C2=A0=C2=A0 libGL.so \
> =C2=A0"
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_3.0.5.bb
> index 79ac3208d3..3343857867 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
> +++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://pkgconf.org"
> =C2=A0BUGTRACKER =3D "https://github.com/pkgconf/pkgconf/issues"
> =C2=A0SECTION =3D "devel"
> =C2=A0PROVIDES +=3D "pkgconfig"
> -RPROVIDES:${PN} +=3D "pkgconfig"
> +RPROVIDES:${PN} +=3D "pkgconfig /usr/bin/pkg-config"
> =C2=A0
> =C2=A0# The pkgconf license seems to be functionally equivalent to BSD-2-=
Clause or
> =C2=A0# ISC, but has different wording, so needs its own name.

The pkg-config changes above probably belong in a different patch as
they're unrelated to the libarchive changes?

Cheers,

Richard

