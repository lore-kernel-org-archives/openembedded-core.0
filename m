Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74B2C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:08:10 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.10771.1678892886226786852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=paQLpeSm;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id m22so7946629ioy.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678892885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaJz/svNgzfsi3ZqtDTeovdPfmm7rWdi7EjA6f9lGc=;
        b=paQLpeSmMGdm+8kEE0BcsBY+Lk30Dp1dFOL6ov2DuaRB3v1Z/kFlgMieEkNcytTush
         Tdip318DIF3nrWI/M2F7TxOBz3+OOaJO86i606kaM1F/n0sv1Dr/JNoNbyJ18l1gjNrZ
         LxBAP9Y5BI1MBHcJM5LxkE8/7OnZu8+YmlhNGAa9B6jsMvLLJeoQ0R/2SC/2XWKsGyiS
         GRG3mjrJMzUTU/MbyX5oDbH1mOISlYHr9ad0VrtESXyQIAId7oQZ/8fn5/ATh15S/C/g
         c7hkfEXgjce+ND8G1gR5COCXjU76KW+/j2SPZ7ruZ16JvRLJez5xmtnW+/q/c5rNcNYk
         KhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678892885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaJz/svNgzfsi3ZqtDTeovdPfmm7rWdi7EjA6f9lGc=;
        b=zfKJfS/QPAd+B14jy2Ux03zNUofw29wUyg6V1Am4D1t5lXkjxwpL466WfhQaSj92Nn
         QG+p9CqYQovo8COnJNDCxCRYi7d3GJfetvh6WGOU8l6v+WzLCpSGut3MU/sj4xebK5XD
         sQt+ymKlHvcAyj2UQcuQWdIg1d3ppHWjdZo/yadgsqy5hxPiGPMBRpJm/Aj6kAUFek12
         WxxSIg7hbq+/+4BtFVLZm9V0DLemQLhSZD3DiOSwRI7Z7cOOyQTi+6kX77UrMHalIaWI
         n8ID3WdPuJ4TCc0kIdD9e+kmI6qkuoCgh0zDji4nmEGle7G7Bohxoo2YbTPJOJkSDyXk
         mSLg==
X-Gm-Message-State: AO0yUKUtZR/4o+yz5rw1MzxGn2bzr5yugJ1mn20D5ZY7y1e39IBLCju6
	Witk+VhlYhL8MnMNUpz8+gXph7h8ARV+lMGr+iQ=
X-Google-Smtp-Source: AK7set+yfK1mEZsphphoJA/FxUCKkiDx8Zuj0nYNamHoXPHr3fPdu9nK7nO8fBmf2ykNb646sckTclVMvMHEt4Rmuvg=
X-Received: by 2002:a02:a106:0:b0:406:122f:76ad with SMTP id
 f6-20020a02a106000000b00406122f76admr1807015jag.1.1678892885531; Wed, 15 Mar
 2023 08:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230315074851.26633-1-frederic.martinsons@gmail.com>
In-Reply-To: <20230315074851.26633-1-frederic.martinsons@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 15 Mar 2023 15:07:53 +0000
Message-ID: <CAO5Uq5SFyQ5vNXn9eizwYehXQWytCR3YP2fTgs6+dVGuASA92A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo.bbclass: use offline mode for building
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178580

On Wed, Mar 15, 2023 at 7:49=E2=80=AFAM Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> There should not be any network access during the build step so
> specify this explicitely to cargo.
> This will allow better error message, e.g:
>
> | Caused by:
> |  can't checkout from 'ssh://git@.../fmartinsons/zbus-git-dep-test.git':=
 you are in  the offline mode (--offline)
>
> Instead of
>
> |   Updating git repository `ssh://git@.../fmartinsons/zbus-git-dep-test.=
git`
> | warning: spurious network error (2 tries remaining): failed to resolve =
address for gitlab.com: Temporary failure in name resolution;class=3DNet (1=
2)
>
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>

Tested-by: Alex Kiernan <alex.kiernan@gmail.com>

> ---
>  meta/classes-recipe/cargo.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
> index 93e185f2c9..7a8cc1e751 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -39,7 +39,7 @@ MANIFEST_PATH ??=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
>
>  RUSTFLAGS ??=3D ""
>  BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D '1']=
}"
> -CARGO_BUILD_FLAGS =3D "-v --target ${RUST_HOST_SYS} ${BUILD_MODE} --mani=
fest-path=3D${MANIFEST_PATH}"
> +CARGO_BUILD_FLAGS =3D "-v --offline --target ${RUST_HOST_SYS} ${BUILD_MO=
DE} --manifest-path=3D${MANIFEST_PATH}"
>
>  # This is based on the content of CARGO_BUILD_FLAGS and generally will n=
eed to
>  # change if CARGO_BUILD_FLAGS changes.
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178525): https://lists.openembedded.org/g/openembedde=
d-core/message/178525
> Mute This Topic: https://lists.openembedded.org/mt/97622913/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

