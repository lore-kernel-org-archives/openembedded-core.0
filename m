Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CA4EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 08:44:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.8285.1690879453732565710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 01:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hhcPFgRr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe110de46dso32928265e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690879452; x=1691484252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=udd8hbMJKMG4Q3DVVfAqdUXsZ01lXgQ0uIS+mDNQQtA=;
        b=hhcPFgRrJRd8Z2ZQF+M7xaEiL7ZE52vepcdpiqI02coknjaWLruAELnyVx9PGVnD0L
         W4hr2TPWWaQDGYuC9WmfEdBdpiJDxszIsmyFmryYBYPJ6/VFZIofKI9PT7oibI0kEy5m
         eHZ+gNJ8XGG9hMG8yjHg3p7IVVRPnCF51Ba08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690879452; x=1691484252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udd8hbMJKMG4Q3DVVfAqdUXsZ01lXgQ0uIS+mDNQQtA=;
        b=QxSbN3lHZoeWVnBVlbgzS/2j/uAlRgOcQyK49HvEfRgYcKyGmTL7YwJGQyB9dithGZ
         izPEN91yDTFoRZSRBtuB2Ery2WlfBd+wEcM6xO7yExB5VjgqXlhaaptBT+7BN4dgHZHP
         vKfiYUIElKM4tKtOHIvaEl4JYmmMRxy1QP0bv2wcz3hTZm2uBqB5YMLzW/QTA3WxslhZ
         pv7jR1RphMVxHJrdCQnB9j86V6aLM9uL1vTv933TYLZxGPtLKVL61/C2YHezYH1CJ4Qu
         G3k1GcUYVmlGP0Nvv9T3hkkpB2v5Ae6C8mK0jGktQnzUasJ/65gt3YzVg+DbBgyKDrJK
         PtoA==
X-Gm-Message-State: ABy/qLYGQJ1WtzBb1Lm8noSTvES4ucBo12BR6hu5KBEM0E44p2CCuQ4t
	yTJ9crHid6u+aptIGPHThyHBHA==
X-Google-Smtp-Source: APBJJlHPCXWk7eJ/f0+GXyJQgfI/aSxW0Wrw1T3QPFXUa5GY8V1G4U9pqDM7U4dtkrRYa5IG85xUDA==
X-Received: by 2002:a5d:658a:0:b0:317:4a0b:c4db with SMTP id q10-20020a5d658a000000b003174a0bc4dbmr1516511wru.71.1690879451976;
        Tue, 01 Aug 2023 01:44:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b7:1714:595d:8417? ([2001:8b0:aba:5f3c:e3b7:1714:595d:8417])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b003143be36d99sm15449327wrw.58.2023.08.01.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 01:44:11 -0700 (PDT)
Message-ID: <bf9c75ff0f54303fdf56c48b79c4d0084303f05a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] cargo_common.bbclass: Handle Cargo.lock
 modifications for git dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Date: Tue, 01 Aug 2023 09:44:10 +0100
In-Reply-To: <3553fa6951145c0504e272b0c57eecbf109e7488.1690795930.git.frederic.martinsons@gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
	 <3553fa6951145c0504e272b0c57eecbf109e7488.1690795930.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 08:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185213

On Mon, 2023-07-31 at 11:44 +0200, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> Now we use --frozen, Cargo.lock cannot be modified by cargo build.
> These patched git dependencies requires that the git url is removed
> from Cargo.lock.
>=20
> Fixes #15104
>=20
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes-recipe/cargo_common.bbclass | 40 ++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
> index db54826ddb..01afb74640 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -117,6 +117,8 @@ cargo_common_do_configure () {
>  }
> =20
>  python cargo_common_do_patch_paths() {
> +    import shutil
> +
>      cargo_config =3D os.path.join(d.getVar("CARGO_HOME"), "config")
>      if not os.path.exists(cargo_config):
>          return
> @@ -146,6 +148,44 @@ python cargo_common_do_patch_paths() {
>              print('\n[patch."%s"]' % k, file=3Dconfig)
>              for name in v:
>                  print(name, file=3Dconfig)
> +
> +    if not patches:
> +        return
> +
> +    # Cargo.lock file is needed for to be sure that artifacts
> +    # downloaded by the fetch steps are those expected by the
> +    # project and that the possible patches are correctly applied.
> +    # Moreover since we do not want any modification
> +    # of this file (for reproducibility purpose), we prevent it by
> +    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
> +    # here is better than letting cargo tell (in case the file is missin=
g)
> +    # "Cargo.lock should be modified but --frozen was given"
> +
> +    manifest_path =3D d.getVar("MANIFEST_PATH", True)
> +    lockfile =3D os.path.join(os.path.dirname(manifest_path), "Cargo.loc=
k")
> +    if not os.path.exists(lockfile):
> +        bb.fatal(f"{lockfile} file doesn't exist")
> +
> +    # There are patched files and so Cargo.lock should be modified but w=
e use
> +    # --frozen so let's handle that modifications here.
> +    #
> +    # Note that a "better" (more elegant ?) would have been to use cargo=
 update for
> +    # patched packages:
> +    #  cargo update --offline -p package_1 -p package_2
> +    # But this is not possible since it requires that cargo local git db
> +    # to be populated and this is not the case as we fetch git repo ours=
elf.
> +
> +    newlines =3D []
> +    with open(lockfile, "r") as f:
> +        for line in f.readlines():
> +            if not line.startswith("source =3D \"git"):
> +                newlines.append(line)
> +
> +    lockfile_mod =3D lockfile + ".new"
> +    with open(lockfile_mod, "w") as f:
> +        f.writelines(newlines)
> +
> +    shutil.move(lockfile_mod, lockfile)
>  }
>  do_configure[postfuncs] +=3D "cargo_common_do_patch_paths"

This patch isn't "wrong" but there are some tips we've picked up over
the years of doing this which might help things in the future.

Some questions:

What happens if we run the cargo_common_do_patch_paths function
multiple times?
What happens if the user hits Ctrl+C at an inopportune moment?

In this case the function is mostly ok but it might easily change in
the future to something that isn't.

The best practise we've come to is the pattern of firstly copy X to
X.orig if X.orig doesn't exist. This ensures you always start from a
pristine backup. You can then directly open and write to X reading from
X.orig.

This ensures that both of the questions I ask above become non-issues.

I'm know I'm being a little picky by mentioning this but I do want to
raise awareness of the better pattern in general and make sure that
examples in the class code are good as people will copy them!

Cheers,

Richard










