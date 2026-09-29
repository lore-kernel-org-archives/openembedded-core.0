Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDA4CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 17:10:45 +0000 (UTC)
Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1520.1790701840791558059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 10:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k0+5gQqn;
 spf=pass (domain: gmail.com, ip: 74.125.224.167, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8aa75b33a26so26147677b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 10:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790701840; cv=none;
        d=google.com; s=arc-20260327;
        b=WRsOJQ0Ef8cZNKik2UfNuW1aYz/7Cw7ii4r9neav2ImliIZGL9biDHWOZKjX5X4XX/
         quJuCVhD1enxydLppZuwpFhCbWe2VE2PCvb957NOVjdies+p2hFyTwYEZp9KP7wO+mfo
         OtH/1gdnfBnfzgcWp/f7s0XlazSii4EYU5AuVW5nm5sR7tKmu1PYqD6NTjfE93zl2Hzb
         F2bjeVOo9628avKENRjbWRWKGLPyLvkse0SU4o4ndOhRGczKyfgyZgvl4pFFZw5/B8XF
         pU5BYJ0MJJmna6zkQzGY8YCRjuUO4UeUFXr8BuxXTs45dEGWFUC0nXTw8DQJ3LWWhUIP
         q0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ll1byLUMZesZh4llfDWzLYH4u4e3qDdixm6bfDegNlQ=;
        fh=RzJEjDuxxa1JxttHdsPGpcXemcdkHsyu5Pa2xhvV8Qk=;
        b=NQyh71dRALUY6QSePkTjebgThKnKDcJXkKZ2K/lSEcq36zF42eqZA14ibHThWG0YyQ
         FKFyG5aUc4XObQO6TDSW0a1Y/wF90dqU/YxaRULIAPqRw9kjrjSlikXe0ZFh7ck5jYBL
         tBOzwZ84a/CCDEh03zJV7l+/KNp3dvneKDwVubOo1KOB64ifOViMeUzjP33p0UNRM2lJ
         xGJ3ZSMNRBs9Xo3AHjYlXX5CuCMGEuJQ7ktwTvSsCe+1RU5P7iKYa53RXmwBLMT2l2c5
         frWlYIEyIv97g1LS654ZimxY597EWfaeeuzBmo2LmR3D7Ubqiv2OoXwmyXJs6YHNNJ1A
         UG/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790701840; x=1791306640; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ll1byLUMZesZh4llfDWzLYH4u4e3qDdixm6bfDegNlQ=;
        b=k0+5gQqnNBcqZDlyi+alqjZw1mI3qydT5FNwym/ijUfMHjtamfhxw3UucJEaHxiL5T
         QIPXFQTbcZt+Umd6RPzLOpfhcb/EtrpQyyHzdgacDrauYCGhyFV1vS9ajLNWGonGyouU
         oT/pzwjmha1REwAf6Wzw/v+XLBrtW/0AN932ya2YnTT3ZwdF06gVs7E+CYWSZ1xHWDJl
         LOKYn+zC15lwaLvEBdrNarXEO5xgyLFduIGQH00oLGcSRgrievaDpCl7f68nt/qqMIfH
         gU4PhYk8rSkcdNEsQk6qh41oSx2l9yKS2/lAv6Ibwp9+3hqgMayb84xaH09k70lMPwIA
         CLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701840; x=1791306640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ll1byLUMZesZh4llfDWzLYH4u4e3qDdixm6bfDegNlQ=;
        b=MSZBzM0TaJR0vvCOgTxLSNTxnvmbKKbPDpVtf7Fi659BKYRz+WuicL/Whrz9rywwoP
         hvYDTscU6chuno3jgl/wjvJlu5u0ydiQBFnikxNVVHRBKT/PRMTeFfhK7hhqQ62A2bDT
         hjvf+dwBy+tw0KJS6PLQAjIjsFMHPaa2wQwhpS5l0egmB4rkS7PEFkypqy12dv53Zem9
         JDMIF81S1mCrOTPb/zrqBbpj/EQZiBxuk2GKsBxnVovo6Hl95cc12gpMF5wfQ8XqoiM3
         ZshhgM7aakykIS9Jjq0iFJCt2kR7iT0T7XNDER/ymVbNoHp/SzRVsON7Xy9Cja2jO/gQ
         yhJw==
X-Forwarded-Encrypted: i=1; AKwUvBze64P7ZuAHaaVm+10W+nbhuRRSzCto6CzJKEhcfeUSxH4pvY/xoNKZu3Gt4sdvYsd20/9S/LZr90N1asUNkfYkxA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKjThZ2xb5O8qSA3AtMzF1fx3VvlOx0SzTkyO5u+xp9uOoNmyFK
	1K33UMrUdc4v0vhaLK2QV3kPqnlJ4f5IEPHPwJnim3cnqdbpQ4ymm8gJH6lcc5xezG2YMCEe42t
	PcDQMneSyEgx/FtDdkrpbkYKSqxh3qsE=
X-Gm-Gg: AYBFou07C6Mr9DP+CeKNx+jpceMuPfzJiwElDNFfKaXYNayy0lAJ+anVat5u2TKyeJ6
	jDhbKOxtimcccveAjv2fgxW1SBuN7mjrZv6yQP3Cb/SPSSOZnO9zC/f5MxrhGKWTyrZYJ2Zuese
	YY62ghhlwqQaylzglmqLPCVFJ7Q1sbh53yu4ZEmnw1GKwNUSDoLog4NBzWpf7wpDplgj/E22kPk
	jlZxKrSaIzDgb4mpZBI/UnLtuTnbj5Fp13L6A8Sl8HXbS41xU1PjnXiaaZyy2ID0wY5GjQxbElu
	2EDJ7NVXj4ncOA1E1j2m///2eNU59gdAffOwFHmqXqGsrjocsbYv9yJsF1hHXmeMdzZu1TqGVdE
	j/nrcaZHrehXCxlbRgxQc41jdg3XyW3Kk7axs6l4as7aa4nzx2x8NYkZUULc9/cP+9AnGmvTwEB
	uHPjSj/9/ajCOBxak0YenGXqTxcKzTCsc2lWdDjCRJLTP/FCHCbTLH7u03Orbh+W82EWa9AXlRS
	B0Etb8taU9yukYStlZTja1+csk8rkcQRaduDpKEjCaN4r53BmPzi/iUC9ti/46Wy9+FlFwYlblz
	KuQ/GOo=
X-Received: by 2002:a05:690c:e147:20b0:883:768:7430 with SMTP id
 00721157ae682-8a64af5758amr70363047b3.34.1790701839454; Tue, 29 Sep 2026
 10:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
 <e97ebd18e97df989e06522e09735e185e2fbb6c6.camel@linuxfoundation.org>
 <fd2d10b8-5d64-42ab-aeb2-64e320e33851@est.tech> <d20ad5bc060f49a1174c62b8f7cd92bcbe5366c8.camel@linuxfoundation.org>
In-Reply-To: <d20ad5bc060f49a1174c62b8f7cd92bcbe5366c8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Sep 2026 10:10:13 -0700
X-Gm-Features: AclHuK8vYTk7fRjmxkl2yp_ssJNZB4ykMbedYBtAJUWHwsb4BOHY_xBGiqOJw-o
Message-ID: <CAMKF1soPO5FPAiX=A6QRTmmtUgufJmhdMU+oR2iKcUA4Ci68yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb: Upgrade 17.2 -> 18.1
To: richard.purdie@linuxfoundation.org
Cc: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000a16b4065ca243c4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 17:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246886

--0000000000000a16b4065ca243c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:45=E2=80=AFAM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Tue, 2026-09-29 at 17:56 +0200, Jaipaul Cheernam via
> lists.openembedded.org wrote:
> >
> > On 2026-09-29 14:08, Richard Purdie wrote:
> > > On Tue, 2026-09-29 at 11:35 +0200, Jaipaul Cheernam via
> > > lists.openembedded.org wrote:
> > > > NEWS:
> > > >
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_plain=
;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release
> > > >
> > > > - Refresh existing patches
> > > >
> > > > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > > I think this triggered:
> > >
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/478=
5
> > >
> > Hi Richard,
> >
> > I tried different combinations(with musl and without) locally on my
> > machine (ubuntu 24) and no issues found.
> >
> > Could this is be host contamination or sstate issue ?
> >
> > Can you retrigger autobuilder again ?
>
> No, I'm not doing that. A better question is could we look at
> config.log from the failing build. We can and it says:
>
> configure:29766: gcc  -o conftest
> -isystem/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/=
x86_64-linux/gdb-cross-x86_64/18.1/recipe-sysroot-native/usr/include
> -O2 -pipe     -isystem/srv/pokybuil
> d/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cros=
s-x86_64/18.1/recipe-sysroot-native/usr/include
> -I/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64=
-linux/gdb-cross-
> x86_64/18.1/recipe-sysroot-native/usr/include
> -L/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64=
-linux/gdb-cross-x86_64/18.1/recipe-sysroot-native/usr/lib
>                        -L/srv/p
> okybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/g=
db-cross-x86_64/18.1/recipe-sysroot-native/lib
>                        -Wl,--enable-new-dtags
>  -Wl,-rpath-link,/srv
> /pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux=
/gdb-cross-x86_64/18.1/recipe-sysroot-native/usr/lib
>
>  -Wl,-rpath-link,/srv/pokybuild/yocto-worker/musl-qemux86-64/b
> uild/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/recipe-sysroot-nat=
ive/lib
>
>  -Wl,-rpath,/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/w=
ork/x86_64-linux/gdb-cross-x86_64/
> 18.1/recipe-sysroot-native/usr/lib
>  -Wl,-rpath,/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/w=
ork/x86_64-linux/gdb-cross-x86_64/18.1/recipe-sysroot-native/lib
>
>          -Wl,-O1 -Wl,--allow-shlib-undefined
> -Wl,--dynamic-linker=3D/srv/pokybuild/yocto-worker/musl-qemux86-64/build/=
build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> -pthread conftest.c -lncurse
> sw -latomic -lm  >&5
> configure:29766: $? =3D 0
> configure:29766: ./conftest
> ./conftest: error while loading shared libraries: libatomic.so.1: cannot
> open shared object file: No such file or directory
> configure:29766: $? =3D 127
>
> which gives at least some hint as to what the issue may be...
>

It smells like frr issue -
https://git.openembedded.org/meta-openembedded/commit/?id=3D1c1e7a0bc7977f2=
cd7c3d8e95a8dc1ffda20b365


>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246882):
> https://lists.openembedded.org/g/openembedded-core/message/246882
> Mute This Topic: https://lists.openembedded.org/mt/121487421/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000a16b4065ca243c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 29,=
 2026 at 9:45=E2=80=AFAM Richard Purdie via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailt=
o:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, 2026-09-29 at 17:56 +0200, Jaipaul Cheernam via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a> wrote:<br>
&gt; <br>
&gt; On 2026-09-29 14:08, Richard Purdie wrote:<br>
&gt; &gt; On Tue, 2026-09-29 at 11:35 +0200, Jaipaul Cheernam via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; NEWS:<br>
&gt; &gt; &gt; <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutil=
s-gdb.git;a=3Dblob_plain;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release" rel=3D"norefer=
rer" target=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-g=
db.git;a=3Dblob_plain;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; - Refresh existing patches<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tec=
h&gt;<br>
&gt; &gt; I think this triggered:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/3/builds/4785" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/3/builds/4785</a><br>
&gt; &gt; <br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; I tried different combinations(with musl and without) locally on my <b=
r>
&gt; machine (ubuntu 24) and no issues found.<br>
&gt; <br>
&gt; Could this is be host contamination or sstate issue ?<br>
&gt; <br>
&gt; Can you retrigger autobuilder again ?<br>
<br>
No, I&#39;m not doing that. A better question is could we look at<br>
config.log from the failing build. We can and it says:<br>
<br>
configure:29766: gcc=C2=A0 -o conftest -isystem/srv/pokybuild/yocto-worker/=
musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/rec=
ipe-sysroot-native/usr/include -O2 -pipe=C2=A0 =C2=A0 =C2=A0-isystem/srv/po=
kybuil<br>
d/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-=
x86_64/18.1/recipe-sysroot-native/usr/include -I/srv/pokybuild/yocto-worker=
/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-<br>
x86_64/18.1/recipe-sysroot-native/usr/include=C2=A0 -L/srv/pokybuild/yocto-=
worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/1=
8.1/recipe-sysroot-native/usr/lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-L/srv/p<br>
okybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb=
-cross-x86_64/18.1/recipe-sysroot-native/lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,--enable-new=
-dtags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link,/srv<br>
/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/g=
db-cross-x86_64/18.1/recipe-sysroot-native/usr/lib=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpat=
h-link,/srv/pokybuild/yocto-worker/musl-qemux86-64/b<br>
uild/build/tmp/work/x86_64-linux/gdb-cross-x86_64/18.1/recipe-sysroot-nativ=
e/lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-Wl,-rpath,/srv/pokybuild/yocto-worker/musl-qemux86-64/=
build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/<br>
18.1/recipe-sysroot-native/usr/lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-rpath,/srv/pokybuild/=
yocto-worker/musl-qemux86-64/build/build/tmp/work/x86_64-linux/gdb-cross-x8=
6_64/18.1/recipe-sysroot-native/lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,-O1 -Wl,--allow-shlib-undefined -Wl,-=
-dynamic-linker=3D/srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread confte=
st.c -lncurse<br>
sw -latomic -lm=C2=A0 &gt;&amp;5<br>
configure:29766: $? =3D 0<br>
configure:29766: ./conftest<br>
./conftest: error while loading shared libraries: libatomic.so.1: cannot op=
en shared object file: No such file or directory<br>
configure:29766: $? =3D 127<br>
<br>
which gives at least some hint as to what the issue may be...<br></blockquo=
te><div><br></div><div>It smells like frr issue -=C2=A0<a href=3D"https://g=
it.openembedded.org/meta-openembedded/commit/?id=3D1c1e7a0bc7977f2cd7c3d8e9=
5a8dc1ffda20b365">https://git.openembedded.org/meta-openembedded/commit/?id=
=3D1c1e7a0bc7977f2cd7c3d8e95a8dc1ffda20b365</a></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246882): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246882" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246882</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121487421/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121487421/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000a16b4065ca243c4--

