Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A0DC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:33:20 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.12375.1742488394671120920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Suym2e4S;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30762598511so12089691fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742488393; x=1743093193; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1sFA2dBdVVvg8dvp7J/qix2spre8YV0csa3lDRcL8M=;
        b=Suym2e4S0LHg3utmwJay6pxW0tb44ktXUOpKY7dN9VpaeeR8y2PQIBW3MfI1bN97U3
         CX0WwMKitQt2wROcNwU7+3Ap4LJ9nEFUGUaw8qpFYsEWte0zKVoj1ZdV1NhdZQNDs/lq
         z5BYI6ZgWzA5sB/WLALOhsfjgt+Wk4NuUB7BLrxeb7tkxjIGN/QR5vMs90mHf02ZRG2w
         SGQD0W92DQHI1aWC5B9XXMaFLBbpNnElxh4MH5hooNdgrJ3USBJJt2mLWWOyTQHSVDFh
         vbeKNjFEfzFsgnnWLKdHwolewhxWZz/XShLAy6+PCbUclQH6fvszEC8wM291ZZ9HOa0I
         jY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742488393; x=1743093193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1sFA2dBdVVvg8dvp7J/qix2spre8YV0csa3lDRcL8M=;
        b=ZpTUFWRnIKlVLnjCtKn9tX6XVVKtZJhN/EsYnX5PXH1hZ2pMW91Hp6utsGVxJMkM0p
         XUngQDVR9vF2AD6gpfQ10cVzRr/vna14p8ZcBx7LBcY+zbYOAL8vN7O80N8J2Gh9ffQX
         H+f6zoD5fQ4J1HCo28qtITH8Ig2zFvJpmaFo4IJhlQxMVojlWDjVj2RWQSUZwlw9mgq0
         KZQYgaF/JFp6zws03PYYLfvHTtOQ5n1e5kmmtJ+GRmAFl/bniWSFS4myPZDvK9LZ1ccv
         MNj97AKANVSZXEa5THEXy/mMpLr11UFtuxKgORZwKqk1l06Q8EoURyjLnfa/TbNsQ/12
         crUA==
X-Gm-Message-State: AOJu0YyGuwHalDrQnWxovXjKfRmsDGSN6K3cwRxVDBU/6y32j3G1fjuq
	43Lbpu86ci5JZ4h8+PLsLO1VaJ6WHcuc25bpoAOcd2VdST4a8n8JBmNrspwgQeEz6k9XAfxi3i3
	gEAgElCLtpUGGrJ1wuhIVqeXnhj4=
X-Gm-Gg: ASbGncvP4ppoCZuGexL4jb/rTxTJecwpIH0C7/W+68bMti+fhxyBcp13O2ZJ20x361t
	RhNKum5Qjrj/rDXFmDsCoptpeAL/GqBduU+ES21lQNakX5uckaFzKffshB4tF0cQYfHRp9kBqDQ
	ivn6yQo9n3wL4gwBPG+dVEtpEjt5+6qzhzO/nMofw=
X-Google-Smtp-Source: AGHT+IGNumJQJKNGWoNYYgicjpjB17qfGI9gOj2j70i1/LtL6kO72KETgzef1ChC1SZNSLoDTYme+n0GtwYpnshkOQk=
X-Received: by 2002:a05:651c:2211:b0:30a:44ca:7e74 with SMTP id
 38308e7fff4ca-30d6a3e4308mr32684801fa.12.1742488392524; Thu, 20 Mar 2025
 09:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250319210905.1896983-1-jarsoper@gmail.com>
In-Reply-To: <20250319210905.1896983-1-jarsoper@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Mar 2025 17:33:00 +0100
X-Gm-Features: AQ5f1Jo_32Y4UsIfu_foXp_GVLJ1F-QdE9raTjVxBGg9vIKr1leqVXiAZ40XvlM
Message-ID: <CA+chaQfOho3=RFS9eQem1iLcEZSScrs+Rh8AcMDJHX3vgRh3SA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo: pass PACKAGECONFIG_CONFARGS to cargo build
To: jarsoper@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213414

The bbnote above wasn't updated to show the whole cargo call, which is
a bit confusing e.g. now I got:

NOTE: cargo build -v --frozen --target aarch64-webos-linux-gnu
--release --manifest-path=3D.../git//Cargo.toml
error: unexpected argument '--cfg' found

Usage: cargo build --verbose... --frozen --target [<TRIPLE>] --release
--manifest-path <PATH>

and was wondering where --cfg came from. Will send update for bbnote shortl=
y.

On Wed, Mar 19, 2025 at 10:09=E2=80=AFPM Jean-Pierre Geslin via
lists.openembedded.org <jarsoper=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Jean-Pierre Geslin <jarsoper@gmail.com>
>
> In order to allow rust packages to define PACKAGECONFIG options, append
> the contents of PACKAGECONFIG_CONFARGS to the build command.
> This patch was already submitted by Bartosz Golaszewski on older
> version but was never merged. It will be really usefull for Rust recipes.
>
> Signed-off-by: Jean-Pierre Geslin <jarsoper@gmail.com>
> ---
>  meta/classes-recipe/cargo.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
> index 76a39668c7..461d100dd9 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -48,7 +48,7 @@ oe_cargo_build () {
>         bbnote "Using rust targets from ${RUST_TARGET_PATH}"
>         bbnote "cargo =3D $(which ${CARGO})"
>         bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
> -       "${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
> +       "${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "=
$@"
>  }
>
>  do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213355): https://lists.openembedded.org/g/openembedde=
d-core/message/213355
> Mute This Topic: https://lists.openembedded.org/mt/111798103/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

