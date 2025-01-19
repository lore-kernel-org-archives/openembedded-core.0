Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57767C02187
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 15:40:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.17168.1737301254971407674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 07:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=erqxAFT2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a88ba968aso3344155f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 07:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737301253; x=1737906053; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6UH17APyYR73/pu/00kA4yD8m46rdHFcglEwf6lZfw=;
        b=erqxAFT2iCO8YjmTviZyxc7oqHYV7XFjl4GskVyEga5YW9qk2Z2IJyo1NtNV9IMf9l
         70kKEW4i98UPZcmls+OeJ4jfRTwO7K7/jgOF645y90BaGGeJE3T0F81ZPdOU1Mbv1VON
         zY3Iv3nKq642iiTWQcoNN6fTDtQXTt3khp8vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301253; x=1737906053;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6UH17APyYR73/pu/00kA4yD8m46rdHFcglEwf6lZfw=;
        b=iirgtmXWtI1tluwA6lHakuj7QXNq6JGuMTDOuE+Ffnb9lkNQgAUlWEVMII9le3OJSK
         z5CbQUK8tp8ixRXS536P7Tpr/q5QCetzq2ZPdWhBEEQ8yBxYarihqroK15CgKTPcnFSs
         xGldpoBn+nqXDUNQORdHExwZhiTdU9XKK1IE3oXDgMr53TMhptdcptz5XriXUVEfs62w
         faN63jZHf5Y1tcg7KWFIBZ62pn7jZNCUDLcp6Xrp7P9o8S2EcozOdWGcsXqvkuYv2cwa
         mREyP1XGbTDAMSyaaQWM4VWnRrhSF5k4HzfJIRoDq1tJyV3Pk/0WtW+vIZxisSWHgQVo
         bYIA==
X-Forwarded-Encrypted: i=1; AJvYcCVCO8qTxHvBpL7X9DZm2+YsvUkCykXhIwtu/L2EaeSEbSYuJschMojsnq/EUuhxFAvCocKg3NA5ZK0AGHerPHmH1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIX1RLsX95zRCUUEkaxPmgVPKcF3gWxNOTH7WGBWUrxjM+rNYv
	Ru3NWXMf6W/dxrl5Ly1Gdek4G9ZynnizzXkUUDrH5/Tgm/Aq5PjrJ1rGrPLXcholdU0DL60O9jD
	ed4Y=
X-Gm-Gg: ASbGncvVdSQIb0WX6x1X4d+goHwYdQINWnKCo+4rDqBSP2QOKop670FWSqugUyTOXh+
	aEv7VhwOAr9DnbYeodlXYrmF6HVQ5C9Y1W9ignXkqTCsshp05SN8gOtSidBjXJM7dGcwJaHu7mL
	irDoq6k+hgqNvA5y2XqR22/i/AGFW2V/hLEJraMHe2JMb8YVEggIFK9YfLIDiKmryXN5Xp+ZObW
	iLDSujqoGhPRFPPO9viyjDXusUFTe3+1Tt4ARwERBatuWY3CPhVy0TYUK2xZJbWJzdIh4FPNNh2
	B8glezRlF+taLmj06UGLM16LdVv8laT8KP4qKCO+OsWHbJPLdGyEzQ==
X-Google-Smtp-Source: AGHT+IFBymyjlZqb2FdejqgW5m4vSR2FOZUUydy0KymsTRqsUt/xx+67w0pEGAXvqQjBwjxgllmt9g==
X-Received: by 2002:a5d:64a3:0:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-38bf57a77a2mr11172275f8f.38.1737301253147;
        Sun, 19 Jan 2025 07:40:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc8d:dcfa:b189:c6? ([2001:8b0:aba:5f3c:fc8d:dcfa:b189:c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327decbsm8047579f8f.90.2025.01.19.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:40:52 -0800 (PST)
Message-ID: <41fb22dedbde1dca96112a31bb0b3e75ccf228f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pango: Restore the install tests for pango
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2025 15:40:51 +0000
In-Reply-To: <20250119153306.3842715-1-jiaying.song.cn@windriver.com>
References: <20250119153306.3842715-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 15:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210011

On Sun, 2025-01-19 at 23:33 +0800, Song, Jiaying (CN) via lists.openembedde=
d.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>=20
> Upstream removed the install-test and left only the build-test
> option,but this cannot be tested on the target. Therefore, the
> install-test is restored using the patch provided by upstream:
> https://salsa.debian.org/gnome-team/pango/-/blob/debian/latest/debian/pat=
ches/Revert-build-Drop-the-install-tests-option.patch
>=20
> Related discussions and commits:
> https://gitlab.gnome.org/GNOME/pango/-/issues/799
> https://gitlab.gnome.org/GNOME/pango/-/commit/2c637453aa1ece7daa9c477b95b=
20d993c70ab4e
> https://gitlab.gnome.org/GNOME/pango/-/commit/927abccf371cd823b185a6df98d=
871d12601220a
>=20
> Partial test log:
> # Start of break tests
> ok 1 /text/break/grapheme
> ok 2 /text/break/word
> ok 3 /text/break/sentence
> ok 4 /text/break/line # SKIP Test file not found
> ok 5 /text/break/emoji
> ok 6 /text/break/char
> # End of break tests
> # End of text tests
> PASS: pango/testboundaries_ucd.test
> SUMMARY: total=3D27; passed=3D27; skipped=3D0; failed=3D0; user=3D29.6s; =
system=3D18.0s; maxrss=3D35328
>=20
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
> =C2=A0.../distro/include/ptest-packagelists.inc=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> =C2=A0...-build-Drop-the-install-tests-option.patch | 316 +++++++++++++++=
+++
> =C2=A0meta/recipes-graphics/pango/pango/run-ptest=C2=A0=C2=A0 |=C2=A0=C2=
=A0 6 +
> =C2=A0meta/recipes-graphics/pango/pango_1.55.5.bb=C2=A0=C2=A0 |=C2=A0 16 =
+-
> =C2=A04 files changed, 337 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-graphics/pango/pango/0001-Revert-bu=
ild-Drop-the-install-tests-option.patch
> =C2=A0create mode 100644 meta/recipes-graphics/pango/pango/run-ptest
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index e2a90c1c2ef..e01b7a3c346 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -85,6 +85,7 @@ PTESTS_FAST =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 wayland \
> =C2=A0=C2=A0=C2=A0=C2=A0 xz \
> =C2=A0=C2=A0=C2=A0=C2=A0 zlib \
> +=C2=A0=C2=A0=C2=A0 pango \
> =C2=A0"
> =C2=A0PTESTS_FAST:append:libc-glibc =3D " glibc-y2038-tests"
> =C2=A0PTESTS_PROBLEMS:remove:libc-glibc =3D "glibc-y2038-tests"
> diff --git a/meta/recipes-graphics/pango/pango/0001-Revert-build-Drop-the=
-install-tests-option.patch b/meta/recipes-graphics/pango/pango/0001-Revert=
-build-Drop-the-install-tests-option.patch
> new file mode 100644
> index 00000000000..42e94422cc1
> --- /dev/null
> +++ b/meta/recipes-graphics/pango/pango/0001-Revert-build-Drop-the-instal=
l-tests-option.patch
> @@ -0,0 +1,316 @@
> +From 2e8c8aee4dc7cc069afaec3a2caaeeaa73d5b0ce Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Jeremy=3D20B=3DC3=3DADcha?=3D <jeremy.bicha@canonical.=
com>
> +Date: Mon, 10 Jun 2024 08:52:56 -0400
> +Subject: [PATCH] Revert "build: Drop the install-tests option"
> +
> +This reverts commit 2c637453aa1ece7daa9c477b95b20d993c70ab4e.
> +
> +Closes: https://gitlab.gnome.org/GNOME/pango/-/issues/799
> +
> +Upstream-Status: Backport [https://salsa.debian.org/gnome-team/pango/-/b=
lob/debian/latest/debian/patches/Revert-build-Drop-the-install-tests-option=
.patch]
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>

If it was not merged into the main upstream development branch, it is
not a backport. As far as I know this is Rejected upstream.

Cheers,

Richard

