Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0780FECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 11:37:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8869.1663241812616925104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HSd7+ECW;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so17548037wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pjto8sdQfMQcYUGo4yjyffo4kQLxqiLeCotNfozDP+o=;
        b=HSd7+ECWoE2tQRpdn1AYAr1e0Mbld0uCGidcYjUeBtijjo7rzegQ9hxrcpZzhk1xZQ
         5HpvAOWnaxCJo1A/YCuhmRZ1N+LYO5SC2b6b41DIYwGy/hXqnyxklwRoyD30ul2A4rMq
         y/VFteBmi+7ba1r8HrGplUPwXytCtz9MBiQN8PG6XGbPYlhMt4amdx7JK0fRgMgw3F7P
         Uv7XJSGOuj+wj5awwbz7fQtUNrbYWsS9s+Zn8Ajlr2kZbZkXXrEz2BAhvfpgttKH7rGD
         yyyoKxof5GZk6nJfheXcDkrovqXbSeTUIrwv5WEITTD21VInwCeFztIQ3a6UAHxn4YpC
         eNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pjto8sdQfMQcYUGo4yjyffo4kQLxqiLeCotNfozDP+o=;
        b=eHJpfPUDr9JT2am2KSICIMCgnc9pra7TJRsj02cm7n3wAaw4A4+2FehMIyRN1dlbjP
         R0cOWEf3bdVaumFHEW19EiBhJj4GPmUNJj2nsoHInnASd8Ipf/TIWpAn0fr9t53gmxFj
         JgnUruCVXlKY45T3EXLfF97RRvIyshbORK/FHlaoWr+v5oZJuw2NCXoriJVC1sTpCw6W
         ZvqbG0UNXlCuAn7t/E+VDkOEDB3kDhkP3kaRy1sT9Lxe//y2agNqHSeFpb0jLOQNesjt
         vjstOQkE2FhjX8gVHDyB1hzE75qWKhOWgdKxJHvzihPbGwJU1jteJR3hirhPO0o5JsDq
         pgdw==
X-Gm-Message-State: ACgBeo0rEbGtd2y8yPgE4TLa+jhK9TzFF+N+yd7QrkDFSrSkHVsWJYs7
	ShTmgRiJ4zzsHzcH27ct56UCoLbRG02ZWQV5oww=
X-Google-Smtp-Source: 
 AA6agR6WGbUG9lgWcrqbU30jHe08ayy07wU0gR1dVd4LLLlrG2R0NNB4rO2RKVTtZ9gDHwJYbyIkwTi7e7VKLDHWXNI=
X-Received: by 2002:a05:600c:3844:b0:3a6:123:5ac5 with SMTP id
 s4-20020a05600c384400b003a601235ac5mr6273872wmr.102.1663241810932; Thu, 15
 Sep 2022 04:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
 <41221D4F-B1B5-4FFF-9F98-E8B4B8A035CB@arm.com>
 <CAJFpGrP11ifFQnK1n3MHvMUaJPwgh6igdav7zotvRQevX70vwg@mail.gmail.com>
In-Reply-To: 
 <CAJFpGrP11ifFQnK1n3MHvMUaJPwgh6igdav7zotvRQevX70vwg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Sep 2022 13:36:38 +0200
Message-ID: 
 <CA+chaQd5ZYV4jL6jRB-_M9LJuVqp13vHRE5zkueTjjXdp8xWGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Ross Burton <Ross.Burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000050f9a705e8b5a96b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 11:37:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170692

--00000000000050f9a705e8b5a96b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: nodejs error when it fails to load openssl errors is also a bit
confusing and needs OPENSSL_MODULES export:
https://lists.openembedded.org/g/openembedded-devel/message/96799

On Thu, Sep 15, 2022 at 1:26 PM Mikko Rapeli <mikko.rapeli@linaro.org>
wrote:

> Hi,
>
> On Thu, 15 Sept 2022 at 14:18, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 14 Sep 2022, at 09:09, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> > > Found the root cause. As suggested on #pyco too maybe native openssl
> > > was mising legacy support.
> > > It wasn't but loading the on purpose hidden openssl legacy.so was
> > > failing. It is located in
> > > recipe-sysroot-native/usr/lib/ossl-modules/legacy.so and only found
> > > via OPENSSL_MODULES
> > > variable which wasn't set for python3-native users. These custom
> > > variables are set in the native openssl
> > > wrapper script and this also fixes the not found openssl.cnf. Now I
> > > could send a patch which sets
> > > the OPENSSL_CONF, OPENSSL_ENGINES and OPENSSL_MODULES paths for pytho=
n3
> > > users via python3native.bbclass:
> >
> > I=E2=80=99m glad this was root-caused before it was merged, because yes=
, this is
> the =E2=80=98correct=E2=80=99 (best known) fix right now:
> >
> > ~/Yocto/meta-arm % git grep "export OPENSSL_MODULES"
> > meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb:exp=
ort
> OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
> > meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb:export
> OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
> > meta-arm/recipes-security/optee/optee.inc:export
> OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules=E2=80=9D
> >
> > A better solution is needed for sure.  At least when the certificates
> can=E2=80=99t be found you get somewhat understandable errors, the python=
3-crypto
> error is opaque at best.
> >
> > OpenSSL supporting runtime-relocation with a single variable would be
> nice, but iirc from glancing at the source code previously not a trivial
> change.  That said it does cause sufficient pain that maybe we just have =
to
> carry the patch.
> >
> > Alternatively, we extend the magic relocation to native recipes.  Even
> less trivial=E2=80=A6
>
> I'm working on the relocation patches but they are quite ugly, as are
> the various code paths inside openssl
> which handle these env variables and which fall back to compile time
> defaults.
>
> Though I suspect that openssl developers may not want see the patches
> resolving "OpenSSL_version" symbol
> at runtime for finding the config file paths... But it's still better
> than exporting these environment variables everywhere
> to get relocation working.
>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170691):
> https://lists.openembedded.org/g/openembedded-core/message/170691
> Mute This Topic: https://lists.openembedded.org/mt/93651845/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000050f9a705e8b5a96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: nodejs error when it fails to load openssl errors is=
 also a bit confusing and needs OPENSSL_MODULES export:<div><a href=3D"http=
s://lists.openembedded.org/g/openembedded-devel/message/96799">https://list=
s.openembedded.org/g/openembedded-devel/message/96799</a><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Sep 15, 2022 at 1:26 PM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@lin=
aro.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Thu, 15 Sept 2022 at 14:18, Ross Burton &lt;<a href=3D"mailto:Ross.Burto=
n@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 14 Sep 2022, at 09:09, Mikko Rapeli via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openembedded.org"=
 target=3D"_blank">linaro.org@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; Found the root cause. As suggested on #pyco too maybe native open=
ssl<br>
&gt; &gt; was mising legacy support.<br>
&gt; &gt; It wasn&#39;t but loading the on purpose hidden openssl legacy.so=
 was<br>
&gt; &gt; failing. It is located in<br>
&gt; &gt; recipe-sysroot-native/usr/lib/ossl-modules/legacy.so and only fou=
nd<br>
&gt; &gt; via OPENSSL_MODULES<br>
&gt; &gt; variable which wasn&#39;t set for python3-native users. These cus=
tom<br>
&gt; &gt; variables are set in the native openssl<br>
&gt; &gt; wrapper script and this also fixes the not found openssl.cnf. Now=
 I<br>
&gt; &gt; could send a patch which sets<br>
&gt; &gt; the OPENSSL_CONF, OPENSSL_ENGINES and OPENSSL_MODULES paths for p=
ython3<br>
&gt; &gt; users via python3native.bbclass:<br>
&gt;<br>
&gt; I=E2=80=99m glad this was root-caused before it was merged, because ye=
s, this is the =E2=80=98correct=E2=80=99 (best known) fix right now:<br>
&gt;<br>
&gt; ~/Yocto/meta-arm % git grep &quot;export OPENSSL_MODULES&quot;<br>
&gt; meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb:ex=
port OPENSSL_MODULES=3D&quot;${STAGING_LIBDIR_NATIVE}/ossl-modules&quot;<br=
>
&gt; meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb:export OPENSSL_=
MODULES=3D&quot;${STAGING_LIBDIR_NATIVE}/ossl-modules&quot;<br>
&gt; meta-arm/recipes-security/optee/optee.inc:export OPENSSL_MODULES=3D&qu=
ot;${STAGING_LIBDIR_NATIVE}/ossl-modules=E2=80=9D<br>
&gt;<br>
&gt; A better solution is needed for sure.=C2=A0 At least when the certific=
ates can=E2=80=99t be found you get somewhat understandable errors, the pyt=
hon3-crypto error is opaque at best.<br>
&gt;<br>
&gt; OpenSSL supporting runtime-relocation with a single variable would be =
nice, but iirc from glancing at the source code previously not a trivial ch=
ange.=C2=A0 That said it does cause sufficient pain that maybe we just have=
 to carry the patch.<br>
&gt;<br>
&gt; Alternatively, we extend the magic relocation to native recipes.=C2=A0=
 Even less trivial=E2=80=A6<br>
<br>
I&#39;m working on the relocation patches but they are quite ugly, as are<b=
r>
the various code paths inside openssl<br>
which handle these env variables and which fall back to compile time defaul=
ts.<br>
<br>
Though I suspect that openssl developers may not want see the patches<br>
resolving &quot;OpenSSL_version&quot; symbol<br>
at runtime for finding the config file paths... But it&#39;s still better<b=
r>
than exporting these environment variables everywhere<br>
to get relocation working.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170691): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170691" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170691</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93651845/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93651845/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000050f9a705e8b5a96b--

