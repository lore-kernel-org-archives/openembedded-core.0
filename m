Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3585C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 16:21:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.18110.1658679660853651283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 09:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eM8unqt0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id q18so2392046wrx.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=hxaBTWykvTZYcThysY0g5sOCclMRgeQB/PqQNJaPJoc=;
        b=eM8unqt07Nv8TyXoVjP8RU1/E+4jyqqYGeWo8t7T8Bc3Al4VWE+iuil5AP7yfU0yOP
         n2H2pZCIqoM6DIVafZEAnE3QBLonktyxnpeTn0vxnSOiUvgjXz703YGdMqSrRQXCwJaB
         73hM1wjEwAHIeuW7AhwOz1d+NleQ6j6CiMq/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=hxaBTWykvTZYcThysY0g5sOCclMRgeQB/PqQNJaPJoc=;
        b=EN3n2QAku8IsW41PBVxtFWO66nNmaPnylx4Ajy2BX293dpM8BW4Zj0TmKdA2doObRj
         DmpCOmfBvL7IOx1/pgV25y8JLCZmjtGYdw5pgy9Dd+oxChgF2qBnUddIPXQqavDmP5hB
         OmR++1aGX4iBASLfG2r/gJ/XopfJ1IExQVfHv+wmZIXU7E5g2tvkQLCkyjKAsb4I5WnG
         qr8bzJFkM8cBvYAdKJ2O1m7u+pPJRae9dlHuT0PW6Nz0kgRdG2r048qijGNmIMHgiizg
         j8R5A77jWgjBVSUOwlYkYTSe7MnqjbMS8bG6Df6xj46Sls05Vm/5fXAG7tfqQ97Xoak9
         HNOA==
X-Gm-Message-State: AJIora9s7zyZWcMnrbL9hLAGdf2pi2Uc+3r03kANYt20xKgqP3Eb6rOx
	317SDh38Oq/aZGqR38FrP9ca4Q==
X-Google-Smtp-Source: 
 AGRyM1vfcqiQh6bY4uDTOwNuy4/r32x9NzciDj30FyHpMKb57niKbh51DcCWoyqUZoWLvIbP72nOPw==
X-Received: by 2002:a5d:52cb:0:b0:21a:3cc5:f5f4 with SMTP id
 r11-20020a5d52cb000000b0021a3cc5f5f4mr5534286wrv.367.1658679659187;
        Sun, 24 Jul 2022 09:20:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3a49:d7f2:fe29:16f8?
 ([2001:8b0:aba:5f3c:3a49:d7f2:fe29:16f8])
        by smtp.gmail.com with ESMTPSA id
 k22-20020a5d5256000000b0021e2fccea97sm10022052wrc.64.2022.07.24.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 09:20:55 -0700 (PDT)
Message-ID: 
 <e6176b990acf909a305fe40b4fdd91c196c9a60f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/context: set branch name when
 creating temporary git repo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Sun, 24 Jul 2022 17:20:53 +0100
In-Reply-To: <20220722111534.2144462-1-ross.burton@arm.com>
References: <20220722111534.2144462-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 16:21:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168460

On Fri, 2022-07-22 at 12:15 +0100, Ross Burton wrote:
> Modern gits print a big note if no branch name is specified when
> creating a new repository.  Silence this by explicitly naming the new
> branch 'master' to match existing naming.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/selftest/context.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/c=
ontext.py
> index 78c7a467e2f..76a188397aa 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -92,7 +92,7 @@ class OESelftestTestContext(OETestContext):
>              if os.environ[e].endswith(builddir):
>                  os.environ[e] =3D os.environ[e].replace(builddir, newbui=
lddir)
> =20
> -        subprocess.check_output("git init; git add *; git commit -a -m '=
initial'", cwd=3Dnewselftestdir, shell=3DTrue)
> +        subprocess.check_output("git init -b master; git add *; git comm=
it -a -m 'initial'", cwd=3Dnewselftestdir, shell=3DTrue)
> =20
>          # Tried to used bitbake-layers add/remove but it requires recipe=
 parsing and hence is too slow
>          subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%=
s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=3Dnewbuilddir, shel=
l=3DTrue)

Doesn't work I'm afraid:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1220

Cheers,

Richard

