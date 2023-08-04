Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88091C001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 16:13:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1270.1691165611995292271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 09:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PTuF/n9a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe2bc27029so21918565e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691165610; x=1691770410;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=22Sl0wPuBSGn728b1JprX32yWIKeSavyux0HZDKjvCg=;
        b=PTuF/n9a97Pgci8L+/7OgJw3SRqcgudrubQzHpyV35+xH39zyV58UDdZ3ZMIlJkoDP
         WImi71LLEoVQl2jSLGvX1lNEUKPEb/Sz83PJA6r9L4cH2beHyvIChSSfooPxfeXb31ul
         SAEeNsCLyyij1DHuGfGEbZ9OivseI57Dj5+0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691165610; x=1691770410;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=22Sl0wPuBSGn728b1JprX32yWIKeSavyux0HZDKjvCg=;
        b=GbyC+9Dolyw7TxIc+cEsJcRgli6n1Z8QXr9vA0Wi5N5/zzUTX84JkV3qUKFoekQNdh
         zHQSIs1JuLUphfl4Z4uYF6uQg8egOEBu0Pxp5eHAOjdJxCcjP23xobZxHcFDmd76lMYS
         Tr5Jbxyx4Wa4rQmUrmJ8ddp/hluBxlhtJom/tJvZjlYscUXMQUGjRl1k1epX/NuKsUr8
         IBpPbv7jfYunQ51bS+okkGwgosqSf1j9KFgBJqkJor2sFWmAO7zqqG3PsACeHz9yZdn0
         cLGcLyii/it+aD8Ip74jpKg6kroxMg9MM7tM2ikzfq0FP3C3Z1ZJrxWtu+R9/6k6vIwD
         tCvQ==
X-Gm-Message-State: AOJu0Yxd1jr0xZ6O0BVG69zLi6QFG43luQlz9Fck59L3Om/23Lweext3
	cuLunQw7c/mpCQMmdKCYj1ZhVA==
X-Google-Smtp-Source: AGHT+IHoPDXQEwb7M2/Mvp0zK6uEj450kq8b3OH+/g8oD1f+OfqLkIAytRpiHr+OoY4ijI32mAG5qw==
X-Received: by 2002:a7b:c5cc:0:b0:3fb:b280:f548 with SMTP id n12-20020a7bc5cc000000b003fbb280f548mr1942070wmk.0.1691165610322;
        Fri, 04 Aug 2023 09:13:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a3d5:6a38:64fe:7f6c? ([2001:8b0:aba:5f3c:a3d5:6a38:64fe:7f6c])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c21d500b003fe18d03188sm2736058wmj.17.2023.08.04.09.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 09:13:29 -0700 (PDT)
Message-ID: <98fdb199de979c43ae8723cbf006388692c4edbb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] sstatesig: Fix pn and taskname derivation
 in find_siginfo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yang.xu@mediatek.com, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, Ross.Burton@arm.com
Date: Fri, 04 Aug 2023 17:13:29 +0100
In-Reply-To: <20230713021659.23130-1-yang.xu@mediatek.com>
References: <20230713021659.23130-1-yang.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 16:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185531

On Thu, 2023-07-13 at 02:16 +0000, Yang Xu via lists.openembedded.org
wrote:
> From: Yang Xu <yang.xu@mediatek.com>
>=20
> The `bb.siggen.compare_sigfiles` method transforms the key format from
> `[mc:<mc_name>:][virtual:][native:]<recipe path>:<taskname>` to
> `<recipe dir>/<recipe name>:<taskname>[:virtual][:native][:mc:<mc_name>]`
> by `clean_basepaths`. However, `find_siginfo` uses the original format
> to get the package name (pn) and task name.
>=20
> This commit corrects the method for deriving the pn and task name in
> `find_siginfo` and adds handling for multilib name.
> And add test for compare_sigfiles and find_siginfo working together.
>=20
> Signed-off-by: Yang Xu <yang.xu@mediatek.com>
> ---
>=20
> Notes:
>     v1: correct handling for pn and taskname for native target in find_si=
ginfo
>     v2: add handling for multilib target in find_siginfo
>     v3: add testcase for compare_sigfiles and find_siginfo work together.
>     v4: optimize testcase to avoid non-deterministic fail
>=20
>  .../recipes-test/binutils/binutils_%.bbappend |  2 +
>  meta/lib/oe/sstatesig.py                      | 17 ++--
>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 83 +++++++++++++++++++
>  3 files changed, 97 insertions(+), 5 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/binutils/binutils_%.bbappe=
nd
>=20
> diff --git a/meta-selftest/recipes-test/binutils/binutils_%.bbappend b/me=
ta-selftest/recipes-test/binutils/binutils_%.bbappend
> new file mode 100644
> index 0000000000..205720982c
> --- /dev/null
> +++ b/meta-selftest/recipes-test/binutils/binutils_%.bbappend
> @@ -0,0 +1,2 @@
> +# This bbappend is used to alter the recipe using the test_recipe.inc fi=
le created by tests.
> +include test_recipe.inc
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index f943df181e..f041a0c430 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -321,11 +321,18 @@ def find_siginfo(pn, taskname, taskhashlist, d):
>      if not taskname:
>          # We have to derive pn and taskname
>          key =3D pn
> -        splitit =3D key.split('.bb:')
> -        taskname =3D splitit[1]
> -        pn =3D os.path.basename(splitit[0]).split('_')[0]
> -        if key.startswith('virtual:native:'):
> -            pn =3D pn + '-native'
> +        if key.count(':') >=3D 2:
> +            splitit, taskname, affix =3D key.split(':', 2)
> +        else:
> +            splitit, taskname =3D key.split(':', 1)
> +            affix =3D ''
> +        pn =3D os.path.splitext(os.path.basename(splitit))[0].split('_')=
[0]
> +        affixitems =3D affix.split(':')
> +        if affixitems[0] =3D=3D 'virtual':
> +            if affixitems[1] =3D=3D 'native':
> +                pn =3D pn + '-native'
> +            if affixitems[1] =3D=3D 'multilib':
> +                pn =3D affixitems[2] + '-' + pn
> =20
>      hashfiles =3D {}
>      filedates =3D {}


I've stared at this patch long and hard and I'm coming to the
conclusion that whilst what you're doing improves things, there are
more corner cases remaining and we're just moving the problem to new
ones down the road. Having to hardcode in each of the class names and
special case them is a big warning sign.

I started wondering why we encode pathnames into the siginfo files. The
reason is that is how bitbake handles them within runqueue. In earlier
times when this was being built, that was fine but things have been
extended many times over since that decision was made.

The issue is that those "internal" representations don't map onto other
systems, so sstate writes files in a different format. There is no easy
way to map the original representations to the format used in the
sstate file names.

My conclusion is that we should change the siginfo files to have the
data already in "sstate" format. That does potentially break a few
things but is probably worth doing for the simplicity gains in code
like this.

Cheers,

Richard









