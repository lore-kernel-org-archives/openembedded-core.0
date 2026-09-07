Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D23C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 22:10:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6616.1788819026389647466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 15:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Theo2CJ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48589798dbbso3313840f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788819024; x=1789423824; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/o1QAvQ7A0h0bLcGZQqcHgKp0f7act2IciVfSeKwd+s=;
        b=Theo2CJ8dx0E9VUmel3RS57TjPrtoOCxXN4WnQK7WfskTO1Vg9QXiE8wmqyg6GoCt+
         +Zt3wY6LAZSOkBOWUg/XQT4w7u2zxlegCoLk9fcAf6VuwfoBSAc1Zm4XbJJtCYMQnrol
         0oqbstOj2187rL8xEJKMIkBqhH1+51P9xnnwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819024; x=1789423824;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/o1QAvQ7A0h0bLcGZQqcHgKp0f7act2IciVfSeKwd+s=;
        b=GjcNkaWacD+tb3o9ot1BGK31H1rVFVQsgX7ST1EB+73ZG8VYjTmugxxOWF/DIrgZNF
         Vb81gMTC7kiJCYALbPkh874V+8ePcbviaAyvzRlOXP+rFpfUiWrg3HPVnS1WDVwJrTuA
         yW+OYwdrdtTZwEy5Wo7fC4BQWtbTagDeLMZIresdUibji1cl1vWWaMrj5KgVFLc4dhhA
         +cFU9Aj1LG1CkBU6ZJfpU70z8MAToruDa3ksmzC64JubBd4XKVBwSh2xJnjh3+qJ779n
         8LLxmDxeNpQo252peMoV5IDRb6eRY6EvKIR32AoYyi5WxLABly1fGXgftiYuSTtXgYhb
         Uvzw==
X-Forwarded-Encrypted: i=1; AKwUvByZyIsOX+JR7ymhu1eXNnrCbalouarqxP2jU7O8vRdUW7yIlQPJNzzWwNqb8N81eunB6/VevUdsQ0mBJL6NcFSsuw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mby5VG+WvF+jPrCLuHCER0rpg4PapWmVMnnGNrwZQzPtCwm5D6
	psRSzAxD8rOj+AeoOyQdwIWO1e8Om5A38uuRj4yU9nX7GOHKVlY0rv/Tc7a3u5kMIDg=
X-Gm-Gg: AYBFou1QVWfRbQYa+amyN7kPji1ggR66ZBlA6SwO3XwPX85+Tn76R0peaFkibk3H0t0
	iroDoBtGk+mFI5MCYtBTJznBtaoCXDTkKbNEHXTocEH5tYnYKQtEmBfc5DaNEEtCuwiIiXIcSeh
	fNu0NksYbx2Le9NIfqYB9KlHuqG2lR2tPSR4C3kMn/FqsSmgMGxb7+tUIu6eMfEw7d7JIW10i0A
	QxSDRj6O84PZA+LXIzV41ViK/+Xf6k5+O3emlkPMM1PR9M21oeWJS4uBQq70KP5tYjtnYxhQwq2
	Ss/qThCw6unNLemKeVBVZxr/v8XxsqLPWFtda8X+lRfZBr0xqghT7LwS6plAGIgY8/AjF7HGUQt
	/GCs0bbFq4+X09pkTeJimnYsv47VURm7OWZy9lcy5QjPgVLbtpJKbD+wBRsfohCjqbkACcOP7/e
	S3MPVQHHg4StXXEaTwSF3Ao8tzOaffY2Zb7c/+Of3yN4Q1VO6UZR0Dm9owzioBpqjye97NT+Qhx
	IBHGoAF1mNJvvCjGU59WvGBCanaIHAru79zdj38Jw/ms2d8UGIcfzcVhXFuMQlu
X-Received: by 2002:a5d:584d:0:b0:485:a517:62e6 with SMTP id ffacd0b85a97d-485a5176fbcmr1026311f8f.5.1788819024450;
        Mon, 07 Sep 2026 15:10:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e2ae:fec4:d03e:3153? ([2001:8b0:aba:5f3c:e2ae:fec4:d03e:3153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm25317598f8f.5.2026.09.07.15.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:10:23 -0700 (PDT)
Message-ID: <045094b5a06066727e7d5c3bf462c60da0d2232e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] toolchain-scripts: source
 target-specific environment setup scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Mon, 07 Sep 2026 23:10:21 +0100
In-Reply-To: <18D328AC1287253A.77878@lists.openembedded.org>
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
		 <20260807093116.3680514-2-Harish.Sadineni@windriver.com>
	 <18D328AC1287253A.77878@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 22:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245309

On Mon, 2026-09-07 at 22:56 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Fri, 2026-08-07 at 02:31 -0700, Sadineni, Harish via lists.openembedde=
d.org wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >=20
> > YOCTO [#15061]
> >=20
> > Export `OECORE_TARGET_SYS` in the generated SDK and tree environment
> > setup scripts, and source any `*.sh` files from
> > `environment-setup.d/${TARGET_SYS}` in addition to the existing
> > `environment-setup.d` directory.
> >=20
> > This complements the rust-cross-canadian changes, where Rust
> > environment setup scripts are installed under a target-specific
> > directory. By sourcing only the scripts that match the active target,
> > the SDK avoids loading environment settings for other target variants,
> > such as mixing 32-bit and 64-bit configurations in multilib SDKs.
> >=20
> > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > ---
> > =C2=A0meta/classes-recipe/toolchain-scripts.bbclass | 8 ++++++++
> > =C2=A01 file changed, 8 insertions(+)
> >=20
> > diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/class=
es-recipe/toolchain-scripts.bbclass
> > index d94dcdee39..f0f599959d 100644
> > --- a/meta/classes-recipe/toolchain-scripts.bbclass
> > +++ b/meta/classes-recipe/toolchain-scripts.bbclass
> > @@ -76,6 +76,7 @@ toolchain_create_sdk_env_script () {
> > =C2=A0	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family=
('TARGET_ARCH', d)}"' >>$script
> > =C2=A0	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
> > =C2=A0	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET=
', d)}"' >>$script
> > +	echo 'export OECORE_TARGET_SYS=3D"${TARGET_SYS}"' >> $script
> > =C2=A0
> > =C2=A0	echo 'unset command_not_found_handle' >> $script
> > =C2=A0
> > @@ -110,6 +111,7 @@ toolchain_create_tree_env_script () {
> > =C2=A0	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family=
('TARGET_ARCH', d)}"' >>$script
> > =C2=A0	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
> > =C2=A0	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET=
', d)}"' >>$script
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo 'export OECORE_TARGET_=
SYS=3D"${TARGET_SYS}"' >> $script
> > =C2=A0
> > =C2=A0	toolchain_shared_env_script
> > =C2=A0
> > @@ -172,6 +174,12 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup=
.d" ]; then
> > =C2=A0	=C2=A0=C2=A0=C2=A0 . \$envfile
> > =C2=A0=C2=A0=C2=A0=C2=A0 done
> > =C2=A0fi
> > +if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_S=
YS" ]; then
> > +=C2=A0=C2=A0=C2=A0 for envfile in \$OECORE_NATIVE_SYSROOT/environment-=
setup.d/\$OECORE_TARGET_SYS/*.sh; do
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . \=
$envfile
> > +=C2=A0=C2=A0=C2=A0 done
> > +fi
> > +
> > =C2=A0EOF
> > =C2=A0}
>=20
> Thanks to your other emails, I think I finally understand what is going
> on here. Sorry for being a bit slow in understanding the issues
> involved. I think what has been confusing me is that we have this code
> which was meant to handle the target specific scripts:
>=20
> https://git.openembedded.org/openembedded-core/commit/?id=3D2d9466734f0c0=
c90724820bc36992b2800ffa4d0
>=20
> which I appear to have added in 2014. I can't find any record of
> anything actually successfully adding a target environment.d file using
> the above layout, everything is nativesdk based as far as I can see.
> I'm not even sure it is possible to add such a thing easily.
>=20
> So your approach is probably the right one but at the same time, we
> should probably remove this other confusing one, assuming we can find
> nothing installing such scripts. That should reduce the confusion and
> code complexity a little.
>=20
> This does bring one further detail we need to get right, which is the
> name of the directory.
>=20
> The recipe is named: PN =3D "rust-cross-canadian-${TRANSLATED_TARGET_ARCH=
}"
>=20
> i.e. it regenerates if TARGET_ARCH changes.
>=20
> You're placing the files in TARGET_SYS, which is not equal to
> TARGET_ARCH. Which one is correct? If we build a target which combines
> glibc and musl, would we need a different rust-cross-canadian for each
> libc?
>=20
> I suspect PN is wrong and it should also use TARGET_SYS?
>=20
> The patches in this series also need to be the other way around - add
> the search path in first, then use it in the next patch.

I meant to also mention, if you add TARGET_SYS/TARGET_ARCH to the
search path, you can remove it from the script filename.

Cheers,

Richard

