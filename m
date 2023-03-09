Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A36C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 10:40:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.10160.1678358392378187109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 02:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BKPUoOZM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id c18so809549wmr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678358390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lGFJmH8Bd/Euw18q5pt0wMIfLaI6NgEa4oTthskBJBw=;
        b=BKPUoOZMoLUnORH/khPAJzoyIdGjGE+qdUzlHI/Z0YoueiDb+fL9XPfcFoXTjOvpAZ
         /srMB7NAURff5kuw13MpJIgTdAlBEasEnQHtq+FJy/iudUdGm2u4dFfcfL/OmqXvfhE2
         H/+vuax7C3vNP3kdY1MtM5QGdJs+s5Au3VobY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGFJmH8Bd/Euw18q5pt0wMIfLaI6NgEa4oTthskBJBw=;
        b=nBhtc0iufbRoh0usFwN7CI0xNity8FX+SygzjPC6AUqmVB76z6cgGZPQZosk+aa4gM
         TlDDojtDASjU6VTLgfabQHoiz7zjjQhmn4QpOSrZyYnMwMJqgQWsdoWaWd/pn7Fhfuiu
         ocytaG1Cbab/39nEuH7jXgbG5rmk/49U4opaHCtz2XY5Yibvc/xFkNRLgHn0XFgCniTw
         1WCjJOdaGmePxkIcxEQUotWQHWB9aOeuZTYaNxxNjDNEo3Pu0Mf50B8tyb1pNMeEyeRy
         0SGhFVwRKE6ZBEwHcyMWtzwWHvJypdi7HxRzvg23poRORGkWrYh14iMs+7WzviRlNC4v
         6heg==
X-Gm-Message-State: AO0yUKWvwFjspxdYjmFllDHaAuXev43QAc4avGdw3tMpKzvoC2PRQhDu
	xbeDgny05KepqnstFJ9QUZE7Fw==
X-Google-Smtp-Source: AK7set90oCL4A0X0VorhwfdNmZ/5d+lY3fvhHRVPiKkQLcuDvOKvCNHZloRStnzoeBR6hDL5+TpgEA==
X-Received: by 2002:a05:600c:3d14:b0:3df:9858:c033 with SMTP id bh20-20020a05600c3d1400b003df9858c033mr18584941wmb.8.1678358390743;
        Thu, 09 Mar 2023 02:39:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e05:8348:1f1a:b973? ([2001:8b0:aba:5f3c:7e05:8348:1f1a:b973])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bc059000000b003e20cf0408esm2107525wmc.40.2023.03.09.02.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:39:50 -0800 (PST)
Message-ID: <39fcdfbf705f2d2f58bbf317171f0872df2aa2e1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] staging.bbclass: run prepare_recipe_sysroot
 after unpack, not fetch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 09 Mar 2023 10:39:49 +0000
In-Reply-To: <20230309103225.3110783-1-alex@linutronix.de>
References: <20230309103225.3110783-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178219

On Thu, 2023-03-09 at 11:32 +0100, Alexander Kanavin wrote:
> Otherwise nasty races between unpack and prepare_recipe_sysroot can occur=
:
>=20
> ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DIS=
ABLED=3D1; export PATH=3D"/srv/work/alex/poky/scripts/native-intercept:/srv=
/storage/alex/yocto/build-64-alt/tmp/sysroots-uninative/x86_64-linux/usr/bi=
n:/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-nativ=
e/4.7.0-r0/recipe-sysroot-native/usr/bin/python3-native:/srv/work/alex/poky=
/scripts:/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslir=
p-native/4.7.0-r0/recipe-sysroot-native/usr/bin/x86_64-linux:/srv/storage/a=
lex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-native/4.7.0-r0/recip=
e-sysroot-native/usr/bin:/srv/storage/alex/yocto/build-64-alt/tmp/work/x86_=
64-linux/libslirp-native/4.7.0-r0/recipe-sysroot-native/usr/sbin:/srv/stora=
ge/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-native/4.7.0-r0/r=
ecipe-sysroot-native/usr/bin:/srv/storage/alex/yocto/build-64-alt/tmp/work/=
x86_64-linux/libslirp-native/4.7.0-r0/recipe-sysroot-native/sbin:/srv/stora=
ge/alex/yocto/build-64-alt/tmp/work/x86_64-linux/libslirp-native/4.7.0-r0/r=
ecipe-sysroot-native/bin:/srv/work/alex/poky/bitbake/bin:/srv/storage/alex/=
yocto/build-64-alt/tmp/hosttools"; export HOME=3D"/home/alex"; git -c gc.au=
toDetach=3Dfalse -c core.pager=3Dcat checkout -B master 3ad1710a96678fe7906=
6b1469cead4058713a1d9 failed with exit code 127, output:\npython3: error wh=
ile loading shared libraries: libpython3.11.so.1.0: cannot open shared obje=
ct file: No such file or directory\n', None)
> DEBUG: Python function base_do_unpack finished
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/staging.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
> index e6d0d1d55c..ade5c03cd9 100644
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -647,7 +647,7 @@ do_prepare_recipe_sysroot[deptask] =3D "do_populate_s=
ysroot"
>  python do_prepare_recipe_sysroot () {
>      bb.build.exec_func("extend_recipe_sysroot", d)
>  }
> -addtask do_prepare_recipe_sysroot before do_configure after do_fetch
> +addtask do_prepare_recipe_sysroot before do_configure after do_unpack
> =20
>  python staging_taskhandler() {
>      bbtasks =3D e.tasklist

Before we start changing core dependencies, we need to better
understand what happened there. Whilst this patch might fix this case,
we'd likely just leave races elsewhere as other tasks call git too.

Which recipe was this?
Why is git calling into python?
Why didn't the staging code to move libs into position before binaries
prevent this?

Cheers,

Richard





