Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A349C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 07:01:25 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.15852.1709881281602737724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 23:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CdII2aX+;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513382f40e9so2141920e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709881280; x=1710486080; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUQv3YWG/af+FjR3YulnWbpDSBo98VhaTxxVd+uGgvE=;
        b=CdII2aX+ZsrTav+21KiMFh9WlnxWWvBSFNORxzqdm1uepPabxu1HfO4GO8q+MXi6vh
         evBtIBdL4qWNmrOxzXL9R9pkyHqcou7HSpLvwvQ1RUdvM85MrZCOmpCDpNdo4LiRf/Jt
         gnTx/83lraFEfC+XXjf9XxufL2snJGqAoJ1BxS9YU7fgmlWQBtSRpPwyzS758jJNkHLf
         BsNYeMj8KGKJl3WpllWeZys8pZynOqLQEiRmbBZwVwuBoWcd/p/qtFWIJawSBW5ZqAyR
         OJn1I2y2qkvpSba67aJFbOWwRgwbqQ3wOyJTpkvggCbhjDzykdyR1PmYECnfci9PiDei
         BSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709881280; x=1710486080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUQv3YWG/af+FjR3YulnWbpDSBo98VhaTxxVd+uGgvE=;
        b=KC8U2Tjo79KgGSOATrY2VUh1aEZpOHJzghWKNSuMnhgkpV1211hSKo+XqvZ72k9V0X
         LzpcFKY19g6QYQLZawPzOiCoW4T2HRWb9mVunX28gDOJvWPxLNwgobH0T+s7S1ptgGA9
         gNSR9AZlOXrJ76XAJRvxtyBv44eqmNqTupR7yEu9x2n+CujGYJM0A+yeH1zUgquSVXxZ
         fa/rkA29JS+FnoRUuOXubOtSOv1BakB6L6JgW4pgIEMPdS2sMWI/EVWOcEKgI3MY2TRY
         NHTuv+EP2K99zjao1SXUdhYeJwkYZl+N5AzUEEkX69TVGTRm1uJmw4hZV7RIkkM3KT1/
         N7Dg==
X-Gm-Message-State: AOJu0YxzbD4op7GPjwwz5KShzZbD4dtzhcDn9+LS+q5Uk0tQMGiafJ4d
	J6HCeSnf95gwLMfXwWi0W0dqbhpriUo1bEVS5zfLo8ayh0idoDzx3iuTTmQG2E4RahFRFTGbv6G
	19hDfOT2K28cCy/XOGmjaYzVi6UQ=
X-Google-Smtp-Source: AGHT+IHiCUiXD0/RlA+0XQFTwZn8gDd5J5bix/gXrE8h3HWiJZKr9/K8y6+O/l2LhfoHLjOAgzEaXT2GqWF9aGZGDjY=
X-Received: by 2002:a2e:870a:0:b0:2d0:f258:df02 with SMTP id
 m10-20020a2e870a000000b002d0f258df02mr2591082lji.51.1709881279262; Thu, 07
 Mar 2024 23:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20240308050328.33102-1-nikhil.r@kpit.com>
In-Reply-To: <20240308050328.33102-1-nikhil.r@kpit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Mar 2024 08:01:07 +0100
Message-ID: <CANNYZj9v5FE6z552opyk_LsZpUx0nGpvGBiJ-wfUfA_YYGRhhQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH v2] librsvg: Fix do_package_qa error for librsvg
To: nikhil <nikhilar2410@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Nikhil R <nikhil.r@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 07:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196847

meta-rust is generally seen as obsolete, is there a particular reason
you need to use it with oe-core master, instead of the standard rust
recipes?

Even then, this looks like it needs to be fixed in meta-rust, rather
than individual recipes. The error does not occur with official rust
toolchain, so meta-rust should just copy what that does.

Alex

On Fri, 8 Mar 2024 at 06:03, nikhil <nikhilar2410@gmail.com> wrote:
>
> When using meta-rust layer for rust below
> do_package_qa error in librsvg is observed
>
> Fix the below error:
> ERROR: librsvg-2.52.10-r0 do_package_qa: QA Issue: File /usr/bin/rsvg-con=
vert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAGS?) File /usr=
/bin/rsvg-convert in package rsvg doesn't have GNU_HASH (didn't pass LDFLAG=
S?) [ldflags] ERROR: librsvg-2.52.10-r0 do_package_qa: Fatal QA errors were=
 found, failing task.
>
> Signed-off-by: Nikhil R <nikhil.r@kpit.com>
> ---
>  meta/recipes-gnome/librsvg/librsvg_2.56.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.56.3.bb
> index 9824b8898d..e6eece6858 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
> @@ -77,3 +77,5 @@ FILES:librsvg-gtk =3D "${libdir}/gdk-pixbuf-2.0/*/*/*.s=
o \
>  RRECOMMENDS:librsvg-gtk =3D "gdk-pixbuf-bin"
>
>  PIXBUF_PACKAGES =3D "librsvg-gtk"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196846): https://lists.openembedded.org/g/openembedde=
d-core/message/196846
> Mute This Topic: https://lists.openembedded.org/mt/104803790/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

