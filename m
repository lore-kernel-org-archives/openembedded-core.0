Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85391C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 21:59:08 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27645.1785880746395764246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 14:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xeh5O5ba;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66804667af2so269824d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785880745; cv=none;
        d=google.com; s=arc-20260327;
        b=i49JvRFxDu3HN/+HZfTII4CqlR8QYvRlf6oLe6ltVzgyPHNfu5kVpalq8BbLg9EYau
         Vqiay0okdT1neDKsfgBAJmFnvgi/0c1qzxujYe9sToOO2Q4gMt3P8ob9QX4a6WsGTti4
         vOhPxW/wzvfPxWd3Sa4AWXyKBt0bQtVPCD1dZpnNOak/+IcRe57zACWEHwMEnfprD9SM
         i+wPzHKVvsDsQzwdfEY9WKuBhss/napvTjlYfq3/ZKkqgILXEolq+2tq+EOhmenRxGcD
         rydXUwS68a6tOvkEWk30mtRiwjaH13sViUeEFWmtr/H6WM0v/wPFqL5j0SQvGqQ+Rm7h
         F/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LTedtwyQ0NEHwdDt9txo50aNUsAxmeUk74NtYHbM8cY=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=U5zspzv5CxQ+M9b88u6W92pVRmnfUsQQK8usgoiYj+7V0FhdEFw1U2YIvB9BmAVk9b
         qvn6RigECTUPMr9CFzsKyzqbCJhvMjVTCjQ3dCO9l+AkDbSCpM5W2oiIsO6ZiDz7YV/r
         ykUKdfViceZqO5BJqMx66LUD7RJ/vZbU2idT4ylmeWyKaj4OzJXXddJyNf7TIBUAA7p7
         egT+wEnP5IgTzuW9PA7ll87kSi/KpLSfDwRrI2SE2cmyAyV1ivSCC7YRiQpAJJ+pKvPw
         9ikGWZRCliYWls7lmqFJ52wsXE6gk9vs4UP1VKAdwRF41PkFcJp1aFROXSMMlkzG7DKJ
         ZwaQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785880745; x=1786485545; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTedtwyQ0NEHwdDt9txo50aNUsAxmeUk74NtYHbM8cY=;
        b=Xeh5O5bakxSdu75gBfGmGZIVhMeutRTj1gCGsFn9eqQu5XawCmbCHzvAf+ouCLhlww
         QVBz9Ehjamq6xbLHv6x0Z5MhF3vYZ7yhFXJ/lshjrlFEHNPcm/24hsCC0IP+VdDE8kKY
         ewZKANFlvUp8l1wU6SMs3BgKY4ZmLJdPCUMjo5XID852+bWHjBPPZ3HIWHOJsASRQx38
         178QHSEH45zIyEJf95kDf5pvaxgUveXKYiU48IlDKWTGtnRMtO8VuxfMs5Mg8jyDO4wa
         GgCqwhv3ksN1O1iW66hCTjAoSIgqF4zGM3/7XVYtsCSeX6CraZ08U33wYlryeS1H1HMA
         DEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880745; x=1786485545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LTedtwyQ0NEHwdDt9txo50aNUsAxmeUk74NtYHbM8cY=;
        b=m+Db12F+F6Ar1Qas4D9ON13bjjbZSNbmejF0n/jli9/jOAVo3fa7Mb3HIxg133pgyb
         6bj84bo6Gj2E9kmGmJXSPABtnf1/0mp0UdvpFNHeN4I0d23k+jcbxiASsJ4M3SPUOwS6
         iA/SIhqpHQ6b7VA2v+up0u559aCD7oWHHlpUrmHQxGfZm50WTvTTv0UpGNaLoZJMMYQN
         Jr+pW823AaY4o0QpkXSfpHA1UD6wq4/9J3B4p7B2raTcbQ3MW461sg2ro1XkpS2pDuOE
         O1PM3FQzj2M3eZLFXIONNngvgD0o/jw/KSXvOlG+j+lnedffeRlgJD1KVbF2SIRcsz9l
         WP2w==
X-Gm-Message-State: AOJu0YyRScARtQ1xj/7I9LGGXfWR/wsQylu73VHoLCid+rDAzkSkZX48
	nwcCAY6XxMzGlAQryzdRC7JROOwJErwyexUGgDGWg1VBfUTpY3OSqCvk7QMSgMRt/xfE4GFZN3c
	v66K+xytfOMrGnZSY7+LDW5fVPdXqhxY=
X-Gm-Gg: AR+sD11K0FptbzMbOBhZHGnZ46RKDz8TjsopTQ9JqwtE7bg5h2oFk5PBaCLVydhjsMj
	TW+JT+PX3uPh/eaK8PEc0GBMbiTYwLPN+0JIx3fsFnE5KSwbv98vh3+6leR64MqG8pWFEWQ6pOA
	BG3o3Hev6Tg/qjmAdkUiXosK1+TRDuZg+UQet3VbHu5OZy64h3tBPRPhi4DhF4Z1pti0rluIGwG
	bbi3v4V6BXeibUzRWFj01OvLXvziBZZkoPWbK45fAlEb0hWXNGB+shLn3O0Xn9NlzLROAqSVJrc
	/nZW/jJdb8yLCg7iFXb4fatqhwisppZs9mvN1ByWGMnVkNqmExK2MNBm341vsIgYFB2uDQIsNn8
	r78tzeV3OEaUETFSHZ1N/6/tYx7+xmEmcz71FQ+MGfbMkuAygPUXNKzodRN5bpS5+LIDPOGMM3g
	4s0YCzc1EMvzwsVJKS9uDjjm58Vj/nPbBjqvxlU/Eh9kw=
X-Received: by 2002:a05:690e:12c9:b0:666:515c:5222 with SMTP id
 956f58d0204a3-6699aa95051mr1539759d50.29.1785880745354; Tue, 04 Aug 2026
 14:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
 <18C899AE0F118A3D.1990914@lists.openembedded.org> <18C8A8C4FB56E625.3417489@lists.openembedded.org>
 <19f7ec53e3ecdf3dece894a2049acd408ac6ef9b.camel@linuxfoundation.org>
In-Reply-To: <19f7ec53e3ecdf3dece894a2049acd408ac6ef9b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2026 14:58:39 -0700
X-Gm-Features: AUfX_mwTe-tp0bSCgYQ-hxYX_Uk3AznFfo5sUYWadoDRYjtk0MAOjsIOtdcBLmQ
Message-ID: <CAMKF1srr=zmjtfeYambpvx=2mTLaJ2SEbVs53CGQBjYKvn_tsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/9] libtool: 2.5.4 -> 2.6.2
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007028d106583fc31e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 21:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242804

--0000000000007028d106583fc31e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 1:13=E2=80=AFPM Richard Purdie via lists.openembedde=
d.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Tue, 2026-08-04 at 18:00 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Tue, 2026-08-04 at 13:23 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > Drop one patch applied upstream, refresh another.
> > > Switch to xz compressed source tarball.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  .../{libtool-2.5.4.inc =3D> libtool-2.6.2.inc}  |  5 +--
> > >  ...-cross_2.5.4.bb =3D> libtool-cross_2.6.2.bb} |  0
> > >  ...ative_2.5.4.bb =3D> libtool-native_2.6.2.bb} |  0
> > >  ...3-libtool-remove-help2man-dependency.patch | 17 ++++----
> > >  ...r-static-libs-for-internal-compiler-.patch | 39 ---------------
> > > ----
> > >  .../{libtool_2.5.4.bb =3D> libtool_2.6.2.bb}    |  0
> > >  ...ol_2.5.4.bb =3D> nativesdk-libtool_2.6.2.bb} |  0
> > >  7 files changed, 10 insertions(+), 51 deletions(-)
> > >  rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc =3D>
> > > libtool-2.6.2.inc} (85%)
> > >  rename meta/recipes-devtools/libtool/{libtool-cross_2.5.4.bb =3D>
> > > libtool-cross_2.6.2.bb} (100%)
> > >  rename meta/recipes-devtools/libtool/{libtool-native_2.5.4.bb =3D>
> > > libtool-native_2.6.2.bb} (100%)
> > >  delete mode 100644 meta/recipes-devtools/libtool/libtool/0005-
> > > libtool-Check-for-static-libs-for-internal-compiler-.patch
> > >  rename meta/recipes-devtools/libtool/{libtool_2.5.4.bb =3D>
> > > libtool_2.6.2.bb} (100%)
> > >  rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.4.bb
> > > =3D> nativesdk-libtool_2.6.2.bb} (100%)
> >
> > This breaks libunwind on qemuriscv64:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2034
>
> There are two possible fixes I found, we can either
> s/WCClinker/XCClinker/ on configure.ac or disable cxx exceptions (which
> would match aarch64/x86):
>

Lets disable cxx exceptions.


>
> diff --git a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
> b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
> index bc1a108e42..1a3a816d78 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.8.3.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.8.3.bb
> @@ -27,6 +27,8 @@ PACKAGECONFIG[zlib] =3D
> "--enable-zlibdebuginfo,--disable-zlibdebuginfo,zlib"
>  PACKAGECONFIG[latexdocs] =3D "--enable-documentation,
> --disable-documentation, latex2man-native"
>
>  EXTRA_OECONF =3D "--enable-static --disable-tests"
> +EXTRA_OECONF:append:riscv64 =3D " --disable-cxx-exceptions"
> +
>
>  # http://errors.yoctoproject.org/Errors/Details/20487/
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>
> not sure which is "right"...
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242802):
> https://lists.openembedded.org/g/openembedded-core/message/242802
> Mute This Topic: https://lists.openembedded.org/mt/120600439/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007028d106583fc31e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 4, =
2026 at 1:13=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto=
:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, 2026-08-04 at 18:00 +0100, Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Tue, 2026-08-04 at 13:23 +0100, Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; Drop one patch applied upstream, refresh another.<br>
&gt; &gt; Switch to xz compressed source tarball.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0.../{libtool-2.5.4.inc =3D&gt; libtool-2.6.2.inc}=C2=A0 |=
=C2=A0 5 +--<br>
&gt; &gt; =C2=A0...-<a href=3D"http://cross_2.5.4.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">cross_2.5.4.bb</a> =3D&gt; <a href=3D"http://libtool-cross_=
2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">libtool-cross_2.6.2.bb</a>} =
|=C2=A0 0<br>
&gt; &gt; =C2=A0...<a href=3D"http://ative_2.5.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ative_2.5.4.bb</a> =3D&gt; <a href=3D"http://libtool-native_=
2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2.6.2.bb</a>}=
 |=C2=A0 0<br>
&gt; &gt; =C2=A0...3-libtool-remove-help2man-dependency.patch | 17 ++++----=
<br>
&gt; &gt; =C2=A0...r-static-libs-for-internal-compiler-.patch | 39 --------=
-------<br>
&gt; &gt; ----<br>
&gt; &gt; =C2=A0.../{<a href=3D"http://libtool_2.5.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">libtool_2.5.4.bb</a> =3D&gt; <a href=3D"http://libtool_2=
.6.2.bb" rel=3D"noreferrer" target=3D"_blank">libtool_2.6.2.bb</a>}=C2=A0=
=C2=A0=C2=A0 |=C2=A0 0<br>
&gt; &gt; =C2=A0...<a href=3D"http://ol_2.5.4.bb" rel=3D"noreferrer" target=
=3D"_blank">ol_2.5.4.bb</a> =3D&gt; <a href=3D"http://nativesdk-libtool_2.6=
.2.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-libtool_2.6.2.bb</a>}=
 |=C2=A0 0<br>
&gt; &gt; =C2=A07 files changed, 10 insertions(+), 51 deletions(-)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc =3D=
&gt;<br>
&gt; &gt; libtool-2.6.2.inc} (85%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/libtool/{<a href=3D"http://lib=
tool-cross_2.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libtool-cross_2.5=
.4.bb</a> =3D&gt;<br>
&gt; &gt; <a href=3D"http://libtool-cross_2.6.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libtool-cross_2.6.2.bb</a>} (100%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/libtool/{<a href=3D"http://lib=
tool-native_2.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libtool-native_2=
.5.4.bb</a> =3D&gt;<br>
&gt; &gt; <a href=3D"http://libtool-native_2.6.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libtool-native_2.6.2.bb</a>} (100%)<br>
&gt; &gt; =C2=A0delete mode 100644 meta/recipes-devtools/libtool/libtool/00=
05-<br>
&gt; &gt; libtool-Check-for-static-libs-for-internal-compiler-.patch<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/libtool/{<a href=3D"http://lib=
tool_2.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libtool_2.5.4.bb</a> =
=3D&gt;<br>
&gt; &gt; <a href=3D"http://libtool_2.6.2.bb" rel=3D"noreferrer" target=3D"=
_blank">libtool_2.6.2.bb</a>} (100%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/libtool/{<a href=3D"http://nat=
ivesdk-libtool_2.5.4.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-lib=
tool_2.5.4.bb</a><br>
&gt; &gt; =3D&gt; <a href=3D"http://nativesdk-libtool_2.6.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">nativesdk-libtool_2.6.2.bb</a>} (100%)<br>
&gt; <br>
&gt; This breaks libunwind on qemuriscv64:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/45=
/builds/2034" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/45/builds/2034</a><br>
<br>
There are two possible fixes I found, we can either<br>
s/WCClinker/XCClinker/ on <a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a> or disable cxx exceptions (which<br>
would match aarch64/x86):<br></blockquote><div><br></div><div>Lets disable =
cxx exceptions.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
diff --git a/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.8=
.3.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.8.3.bb</a> b/meta/r=
ecipes-support/libunwind/<a href=3D"http://libunwind_1.8.3.bb" rel=3D"noref=
errer" target=3D"_blank">libunwind_1.8.3.bb</a><br>
index bc1a108e42..1a3a816d78 100644<br>
--- a/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.8.3.bb" =
rel=3D"noreferrer" target=3D"_blank">libunwind_1.8.3.bb</a><br>
+++ b/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.8.3.bb" =
rel=3D"noreferrer" target=3D"_blank">libunwind_1.8.3.bb</a><br>
@@ -27,6 +27,8 @@ PACKAGECONFIG[zlib] =3D &quot;--enable-zlibdebuginfo,--di=
sable-zlibdebuginfo,zlib&quot;<br>
=C2=A0PACKAGECONFIG[latexdocs] =3D &quot;--enable-documentation, --disable-=
documentation, latex2man-native&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-static --disable-tests&quot;<br>
+EXTRA_OECONF:append:riscv64 =3D &quot; --disable-cxx-exceptions&quot;<br>
+<br>
<br>
=C2=A0# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20487/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/20487/</a><br>
=C2=A0ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
<br>
not sure which is &quot;right&quot;...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#242802): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/242802" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/242802</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120600439/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120600439/1997914</a><br>
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

--0000000000007028d106583fc31e--

