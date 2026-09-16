Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F502C982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 15:48:40 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18153.1789573710135768643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 08:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s0eHTOjc;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso10079735e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789573708; x=1790178508; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV/LgCWRB8rpArC1l+72WOShoNEgSJ7GpjYP43VyhlQ=;
        b=s0eHTOjcfq+VTfDEtXGZDaMP9MtMEZnKUHZWGEtDEzSET/a8wOytWlJ639VenhJQh7
         4XsFHLp4+t2rd2WCyBnQHQqY1W3lp9kLyvML1MwJGq4EA6FT4LOfpY6uzlJZaU0Afp6F
         C5anVUnpJKFIBMwnuTJ1lh7dFN8jnGntnXacI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573708; x=1790178508;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV/LgCWRB8rpArC1l+72WOShoNEgSJ7GpjYP43VyhlQ=;
        b=C3cKrKmrM6wPghW7lvWTXKI/PHWxIGPH3OnK6GoLvlXmNxhtsYL2am452mIZACrD44
         Gy62I8bkWQCSPbR2h53H8Dvk66XcDMw0IqROLNE328iuyAUEpSS5nISGBcKFBxJSM7p4
         25Cvko8rj1e3FS5qqaIt65vTcYc4z2GCzHn1cQ08eUI3i4ceYXqtlTLXHlskaZyBq7q0
         RER30veqKtzEy58IiHJ6qYFlofvg19/XMXQJFvfQnwpikAF1DGK/LDsFmJwrKcfSyWYy
         rmDWDR67Lx8xYEGs+n7CHrWxXxrvhSPKxi/Ifi9MXd4IQGSFSrCwt6gCxBkztVSSlRrB
         vKSw==
X-Forwarded-Encrypted: i=1; AKwUvBwoya9oxEK9bltJ3BTajDfvU+3WSyUdiqqGrQqvZq0BHFVXb5r4n1IpEGYY4l/P2LMAuetRueKTCaZppg9BU2bYWg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nZ6ghzrx3mXu4pk2f9gfCdsRfLdTBDCjFNXORpXOFVld24qU3m
	QjMSaKsKUSu6lH3Wd1LVTVoN0aVIf7z9m0J+waD+zXGZQ/cLUOiMzP3iJ/FNJ13w230=
X-Gm-Gg: AYBFou1xtnYyNERZAC1mjjcAvr4U83kJaQObdoJnUo1PQouAYb1ELZX4+XqKMDEXvHc
	bstdnk0Ozhn9c6MmMgmaRkYvLvxik8hohyb6Y4edSNzZdYbbZ+P+fXToftAZAYC35ToDPDyoY8R
	56PRiHl4Ofn/qEbSg7oejuO5TZriv+XcCCxoO55+xEDlLBxxb4QAz3KtsEk68EI/iC4sFCIFBp2
	Ou4xGpYO00WNt+1oJAK5WxSQFKMI2TMYiXg5kJC5532IDQ0ocJPb9Nz6uqn4avvv8H1CQYoof9x
	8YggfjM2rEKzNaz1XydrbysbdKNGbqUjAe2Eh0qmhaqWtJKwT9BpV+WKztW92Mfher02vVUVa+A
	O57LysfjdOL0p+cHYBdIVIsjepJmxy0KWbXaV3VOB/bG1pNTdipCyKTvMRLnTFAei47r5LXtGF7
	wTDoieFsLXlmub8WVeteKBR8KyfDW9cM+HcHU5jdL1tj16kBE5WuwTgmZR+5dcmlQmKql+GQkuG
	WWvSa8Fu/n4KTf12so3A9F8I6NW3BDRNvMBg3KJ6yDcvA4V7ey5XhsTIOA=
X-Received: by 2002:a05:600c:8b35:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49eac46257cmr33670475e9.1.1789573708094;
        Wed, 16 Sep 2026 08:48:28 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847fcb7dsm30245395e9.4.2026.09.16.08.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:48:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 17:48:27 +0200
Message-Id: <DLGUXNKUG9QJ.FXE527F3MBUN@smile.fr>
Cc: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 16/20] lttng-tools: inherit
 upstream-stable-release-point
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
 <20260902095920.2840293-17-daniel.turull@ericsson.com>
In-Reply-To: <20260902095920.2840293-17-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245987

On Wed Sep 2, 2026 at 11:59 AM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> lttng-tools maintains a branch per minor series (stable-2.11 through
> stable-2.16) and tags point releases from it, releasing from more than on=
e
> at a time: 2.14.2 and 2.15.1 went out the same day. So upgrades within a
> major.minor are stable point upgrades per the OE-Core stable release
> policy (ref-manual, "Stable Point Release Upgrades"). There is no written
> policy document, so qualification rests on the branch structure and the
> release contents below.

I found this:
https://github.com/lttng/lttng-tools/tree/stable-2.15#supported-versions:
|=3D=3D Supported versions
|
|The LTTng project supports the last two released stable versions
|(e.g. stable-2.13 and stable-2.12).
|
|Fixes are backported from the master branch to the last stable version unl=
ess
|those fixes would break the ABI or API. Those fixes may be backported to t=
he
|second-last stable version, depending on complexity and ABI/API compatibil=
ity.
|
|Security fixes are backported from the master branch to both of the last s=
table
|version and the second-last stable version.
|
|New features are integrated into the master branch and not backported to t=
he
|last stable branch.

I've added that to the commit in my branch.
I've noticed that it's very easy for a LLM to hallucinate a negative
answer: "This does not exist".

>   https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stabl=
e-point-release-upgrades
>   https://github.com/lttng/lttng-tools/blob/v2.15.1/ChangeLog
>   https://github.com/lttng/lttng-tools/tree/stable-2.15
>
> Upstream keeps a ChangeLog with a per-release entry list, and all 48
> entries for 2.15.1 (Jun 05 2026, against 2.15.0 in February) are fixes,
> tests, documentation or refactors. Seven address machine interface output
> alone; the rest cover a consumerd lockfile fd leak across fork+exec, a
> missing default kernel probe entry, an uninitialised read in uri_compare,
> a musl compatibility fix, popt error handling, test fixes, and one
> refactor preparing the CPU-mask escaping fix.
>
> Already tracked this way on the OE stable branches, counting only bumps
> since each branch forked: kirkstone took 2.13.4 -> 2.13.8 and 2.13.8 ->
> 2.13.9, scarthgap 2.13.11 -> 2.13.13. wrynose has taken none and sits at
> 2.14.1.
>
> AI-Generated: Kiro with Claude Opus 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>
> Adapted for wrynose: applied to lttng-tools_2.14.1.bb (upstream: lttng-to=
ols_2.15.1.bb).
> (cherry picked from commit 40f22582ff6989f9275808bfda229a8ec78504e4)
> ---
>  meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recip=
es-kernel/lttng/lttng-tools_2.14.1.bb
> index 3a3f2cff2c..3df9ed1c00 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
> @@ -54,7 +54,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-=
tools-${PV}.tar.bz2 \
> =20
>  SRC_URI[sha256sum] =3D "0e68eb27923621c4bc127cfce40422d28cf7e473fedf6229=
ae6c32ba5c5b7c6d"
> =20
> -inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
> +inherit autotools ptest pkgconfig useradd python3-dir manpages systemd u=
pstream-stable-release-point
> =20
>  CACHED_CONFIGUREVARS =3D "PGREP=3D/usr/bin/pgrep"
> =20


--=20
Yoann Congal
Smile ECS


