Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F067CC36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 02:36:56 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.65467.1744079811335274513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 19:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3gpUSYp;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3fbaa18b810so1594137b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 19:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744079810; x=1744684610; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbbvDRlPVpxDEJly8eoO+BaPl2kUdsrudIeW504UCv8=;
        b=b3gpUSYp1XOYtF4ayMfDb4RNX7+sJl+IvsHqwcCAQpsXNHCrHccOZJL5CIh/qZ6fCi
         dMui3mWl4lvfhKWwXQS11wCQG3mmsYprqS5F5ahgfRJzkVoei+EDCKXOvAtdWXl3OrzE
         oJVikHEaXkeTwNHhKskRlNArJ02oxFRDPTnnbmQZxCz28CDwGIYj7LRUc5enEvWYJ664
         A4Gm7rySHSE1q63TkvrjoADyorfjwBqinnTuNduzWFDHtK5gcKpE2cSOT6rsynNu9Hbo
         Ue7shlsQli1Ew2jZaDO/FpLZKHXB0oOj+JaTHSwYXaXcu/11//e+LxhuF+dlvDuNzkwu
         rMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744079810; x=1744684610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbbvDRlPVpxDEJly8eoO+BaPl2kUdsrudIeW504UCv8=;
        b=Imeqcv/vbdXj9DDHmXksN3S4ikV9ZdqvfAvXnPZtKc3vyEYSzDaynra/gfhVtPPs50
         mb0/FW2Eo/q4C77KMBwGalxdqHckOCi996/g4yuZuPo9FQ7sK1ASzOyHVExPhxxnDNdv
         If+0Veq9sCrujZdHVinVnFZoCKvkRLMrPJuXuwgqrc8nw4dkDv9rYJd9dL7VqopK66kE
         q1sMYvz21Ku5kHDXlz5he/mPpPyvIhaUEhEQnEIGUqd6qGHDDF3KiAAmioOOyrhPkc8N
         MOkVR9RGKcyFZaqKsPit4of03HBRLNcrrRkmGX2DrN3HDF2wX9vJ3GQMEN2gpijFphse
         1nCg==
X-Gm-Message-State: AOJu0YzwdANdbRmj46axNVytyAtiuf0TxWtDM1BqErBMg1Lz65pjHNt1
	0jYhvzICNCA6kXJgFqtrV9wjsJdG/qX2ZSkPsBuzopy9vyYGxfywhyhdqgKd4fRmcvyNSDTzSCH
	e05icOs1L60E2z6mZXb/I4wYEAI0=
X-Gm-Gg: ASbGncsuTvdNxgW2rdTQCsuanq+EC778onWE4QSsM4x7n5qLIJ0HaepSbuyGNoJT5ly
	r5+ZIYlvFP2ubS6hU2nDK3w4XlCAQ2ROuYAC/fWY0o21ZwPu2karfxUGtg+Du8/aDoTVgKxjtSc
	z4F57fMH4tE4ttq5cgH52TdY6GYIYiqXNSJskbC4zsXmswlKs9dVMA8N+/Iw==
X-Google-Smtp-Source: AGHT+IGyHjFNY/WmOtDdbEgSR7xdD6RaqTu5LZ9n7f5tbB7JpPZ8Xhi1UVw7R0Ft3JdAfK3EAK30CLUZYOMzi1TWVFw=
X-Received: by 2002:a05:6808:6a82:b0:3f6:7b56:d10d with SMTP id
 5614622812f47-4004563cae1mr9338531b6e.33.1744079810547; Mon, 07 Apr 2025
 19:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250408015041.3803604-1-alistair.francis@wdc.com>
In-Reply-To: <20250408015041.3803604-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 19:36:24 -0700
X-Gm-Features: ATxdqUHH9MkbDam8O3lHfqEG7Wsiw_P-fNwQUsxkHRRJBBrHPxBeCCKFueLeatM
Message-ID: <CAMKF1srHEEo=-dofn9h+ieFTU9v+0raAaKyg9v=VNrtiGs3XjQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] ktls-utils: Initial commit
To: alistair23@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 02:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214503

On Mon, Apr 7, 2025 at 6:50=E2=80=AFPM Alistair Francis via
lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Package ktls-utils which includes tlsd.
>
> This is used when in-kernel TLS consumers need a mechanism to perform TLS
> handshakes on a connected socket to negotiate TLS session parameters that
> can then be programmed into the kernel's TLS record protocol engine.
>

It seems like meta-oe will be a better place for this recipe for now.

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../ktls-utils/ktls-utils_0.11.bb               | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-networking/recipes-kernel/ktls-utils/ktls-utils_=
0.11.bb
>
> diff --git a/meta-networking/recipes-kernel/ktls-utils/ktls-utils_0.11.bb=
 b/meta-networking/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> new file mode 100644
> index 0000000000..e85dc4ac72
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/ktls-utils/ktls-utils_0.11.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "TLS handshake utilities for in-kernel TLS consumers"
> +DESCRIPTION =3D "In-kernel TLS consumers need a mechanism to perform TLS=
 \
> +handshakes on a connected socket to negotiate TLS session parameters tha=
t \
> +can then be programmed into the kernel's TLS record protocol engine."
> +DEPENDS =3D "gnutls keyutils glib-2.0 libnl"
> +RDEPENDS:${PN} +=3D " gnutls"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd568123389d9a12625cca2b089b17=
28b"
> +
> +SRCREV =3D "5c3314b5728b272cbaf0d98f4d521cca9610b6bf"
> +SRC_URI =3D "git://github.com/oracle/ktls-utils.git;nobranch=3D1;protoco=
l=3Dhttps"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig systemd
> +
> +PACKAGECONFIG[systemd] =3D "--with-systemd,,systemd"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214502): https://lists.openembedded.org/g/openembedde=
d-core/message/214502
> Mute This Topic: https://lists.openembedded.org/mt/112146082/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

