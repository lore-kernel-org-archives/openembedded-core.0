Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BABCC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 12:18:30 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.7330.1667909903142472161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 04:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e/uggRHm;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id d6so20972534lfs.10
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 04:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/zMlIdCLflNnhnp7UrR0VqoOJCDqIPSeGDBpHOp6Fs=;
        b=e/uggRHmK7a7w9xSTy3KuzCEp/FRNqYxzJZ67Lk68QT7QlsRTYA4obaCvLif5bm4wE
         qfCn2Ogh6eza7OTq7sgZ5ErKrlZGFmNzeMkY5+Ldsq9xbv4u6ApXizh2Eqh9/V6Befns
         1L2Y+m2yCjePbg6yLWbDLnQaIcWfdVtjosgnCugnlTH3vVS2xwv71BkPd7PA+fhBL/uc
         xtqgmaxmCxERGE3AtYEVgQCCyFfYp638C0CzTHi6ET3D1WwIODjkErXQTHipCmi4ZwxR
         tHgD0pV32hqncCOqm/8GIYwLZbn90VDO8BaseseqiBdrA5xxHuoqqccf2K581Ayl6ewr
         Ft0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/zMlIdCLflNnhnp7UrR0VqoOJCDqIPSeGDBpHOp6Fs=;
        b=ynROrmBsQ95QGEk8XE3mBjHZFmf+yaWowKvbPNgRXueU82L+5jjWjtEf4ZmqiuUADK
         +bXQe4u4qG+Pz5quEd6ejyIWjiqFSZhq+1xWU2WDpbCsHBZQYX/hp3cKS97osYO2Mt8e
         y8ZC0m+su2J4P9r5yYvzLD7cu5CF+SIV7gNZIYobABarHMKVPRbUQ29JvAlaAwlgCLi4
         a4fVN51OYvu70+YXFZ5+GYEvZhZuLfcZhJ3qlJ37wg4L6sn4lI+BhdDlcYeHF2RJ0GBM
         RG/mDtxTiK1DdpIlEYgOcSQmrkmw9wXQlvOngJDwi2jFureSXOCd8Ip5Xgsc7S+bGuXm
         FZyw==
X-Gm-Message-State: ACrzQf3t0L2KcSTjuqiN66xuiWvpfd7xhXDDuiwKYir4jL7ScB+IK7K1
	YXHTATEx4s+bGL5DzWUdLTIL6ac0Uw46S1Mx/S8=
X-Google-Smtp-Source: AMsMyM6y7WRW88os7eYuyhca60iQoCzR5HYWaO41rpbjuH7qkNlFjIhAdtdhcQDLqczkA6jB3wPqOppU2+x9mGC+K5Q=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr18914361lfl.367.1667909901236; Tue, 08
 Nov 2022 04:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com> <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
 <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com> <CANNYZj_EO7LRfzGb86D1s=YMB1Vz=1VYVropJo7VGPvsq5_FsA@mail.gmail.com>
 <a0ba0394-c43e-b21a-1a2b-e5a7ea016404@vaisala.com>
In-Reply-To: <a0ba0394-c43e-b21a-1a2b-e5a7ea016404@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 13:18:10 +0100
Message-ID: <CANNYZj_40ANh2DWbijg47=5MgYku2sw6bBg11heqWW6aVP1OgQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e3d9c05ecf489a6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 12:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172964

--0000000000002e3d9c05ecf489a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this a recommendation somewhere official?

Alex

On Tue 8. Nov 2022 at 13.04, Niko Mauno <niko.mauno@vaisala.com> wrote:

> My understanding wrt. Y2038 and 32-bit glibc hosts was such that it
> makes sense to set said compiler flags globally to ensure user space
> wide Y2038 compliance. So I encountered this compiler error while
> building poky reference images with additional effective
>
>    TARGET_CPPFLAGS +=3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64"
>
> declaration in meta/conf/distro/include/tclibc-glibc.inc.
>
> -Niko
>
> On 8.11.2022 13.50, Alexander Kanavin wrote:
> > So you need to set -D_TIME_BITS=3D64
> > -D_FILE_OFFSET_BITS=3D64 to get some error? But why set that, shouldn=
=E2=80=99t
> > the defaults work?
> >
> > Alex
> >
> > On Tue 8. Nov 2022 at 12.48, Niko Mauno <niko.mauno@vaisala.com
> > <mailto:niko.mauno@vaisala.com>> wrote:
> >
> >     I have not studied the issue, but in order to reproduce this error =
I
> >     add
> >     'MACHINE =3D "qemuarm"' to local.conf then issue 'bitbake kbd' agai=
nst
> >     current master while TARGET_CPPFLAGS value is set to "-D_TIME_BITS=
=3D64
> >     -D_FILE_OFFSET_BITS=3D64".
> >
> >     -Niko
> >
> >     On 8.11.2022 11.14, Alexander Kanavin wrote:
> >      > We do build for 32 bit arm targets, so is this seen only in
> specific
> >      > circumstances? What are they?
> >      >
> >      > Alex
> >      >
> >      > On Tue, 8 Nov 2022 at 01:09, Niko Mauno via
> >     lists.openembedded.org
> >     <http://lists.openembedded.org/
> >      > <niko.mauno=3Dvaisala.com@lists.openembedded.org
> >     <mailto:vaisala.com@lists.openembedded.org>> wrote:
> >      >>
> >      >> For now add exemption in order to avoid following failure durin=
g
> >      >> do_compile()
> >      >>
> >      >>    |
> >
>  .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/re=
cipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-l=
inux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ver:2:
> syntax error in VERSION script
> >      >>    | collect2: error: ld returned 1 exit status
> >      >>
> >      >> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
> >     <mailto:niko.mauno@vaisala.com>>
> >      >> ---
> >      >>   meta/recipes-core/kbd/kbd_2.5.1.bb
> >     <http://kbd_2.5.1.bb/
> >      >>   1 file changed, 3 insertions(+)
> >      >>
> >      >> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb
> >     <http://kbd_2.5.1.bb/
> >      >> index aa3ab6e121..b623aecd36 100644
> >      >> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> >     <http://kbd_2.5.1.bb/
> >      >> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> >     <http://kbd_2.5.1.bb/
> >      >> @@ -18,6 +18,9 @@ SRC_URI =3D
> >     "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> >      >>
> >      >>   SRC_URI[sha256sum] =3D
> >     "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
> >      >>
> >      >> +# Compiling 64 bit time for 32 bit host is broken
> >      >> +GLIBC_64BIT_TIME_CPPFLAGS =3D ""
> >      >> +
> >      >>   PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pa=
m',
> >     d)} \
> >      >>                     "
> >      >>
> >      >> --
> >      >> 2.36.1
> >      >>
> >      >>
> >      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      >> Links: You receive all messages sent to this group.
> >      >> View/Reply Online (#172940):
> >     https://lists.openembedded.org/g/openembedded-core/message/172940
> >     <https://lists.openembedded.org/g/openembedded-core/message/172940
> >      >> Mute This Topic:
> >     https://lists.openembedded.org/mt/94880633/1686489
> >     <https://lists.openembedded.org/mt/94880633/1686489
> >      >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >      >> Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <https://lists.openembedded.org/g/openembedded-core/unsub
> >      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      >>
> >
>

--0000000000002e3d9c05ecf489a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is this a recommendation somewhere official?</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Alex=C2=A0</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 8. Nov 2022 a=
t 13.04, Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com">niko.maun=
o@vaisala.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">My understanding wrt=
. Y2038 and 32-bit glibc hosts was such that it <br>
makes sense to set said compiler flags globally to ensure user space <br>
wide Y2038 compliance. So I encountered this compiler error while <br>
building poky reference images with additional effective<br>
<br>
=C2=A0 =C2=A0TARGET_CPPFLAGS +=3D &quot;-D_TIME_BITS=3D64 -D_FILE_OFFSET_BI=
TS=3D64&quot;<br>
<br>
declaration in meta/conf/distro/include/tclibc-glibc.inc.<br>
<br>
-Niko<br>
<br>
On 8.11.2022 13.50, Alexander Kanavin wrote:<br>
&gt; So you need to set -D_TIME_BITS=3D64<br>
&gt; -D_FILE_OFFSET_BITS=3D64 to get some error? But why set that, shouldn=
=E2=80=99t <br>
&gt; the defaults work?<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Tue 8. Nov 2022 at 12.48, Niko Mauno &lt;<a href=3D"mailto:niko.mau=
no@vaisala.com" target=3D"_blank">niko.mauno@vaisala.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank"=
>niko.mauno@vaisala.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have not studied the issue, but in order to repro=
duce this error I<br>
&gt;=C2=A0 =C2=A0 =C2=A0add<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;MACHINE =3D &quot;qemuarm&quot;&#39; to local.=
conf then issue &#39;bitbake kbd&#39; against<br>
&gt;=C2=A0 =C2=A0 =C2=A0current master while TARGET_CPPFLAGS value is set t=
o &quot;-D_TIME_BITS=3D64<br>
&gt;=C2=A0 =C2=A0 =C2=A0-D_FILE_OFFSET_BITS=3D64&quot;.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-Niko<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 8.11.2022 11.14, Alexander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; We do build for 32 bit arm targets, so is thi=
s seen only in specific<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; circumstances? What are they?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Alex<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Tue, 8 Nov 2022 at 01:09, Niko Mauno via<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org" rel=3D"no=
referrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org/" rel=
=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;niko.mauno=3D<a href=3D"mailto:vaisala.co=
m@lists.openembedded.org" target=3D"_blank">vaisala.com@lists.openembedded.=
org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vaisala.com@lists.open=
embedded.org" target=3D"_blank">vaisala.com@lists.openembedded.org</a>&gt;&=
gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; For now add exemption in order to avoid f=
ollowing failure during<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; do_compile()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 |<br>
&gt;=C2=A0 =C2=A0 =C2=A0.../build/tmp/work/cortexa15t2hf-neon-poky-linux-gn=
ueabi/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../=
../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.lib=
s/libtswrap.ver:2: syntax error in VERSION script<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 | collect2: error: ld return=
ed 1 exit status<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Signed-off-by: Niko Mauno &lt;<a href=3D"=
mailto:niko.mauno@vaisala.com" target=3D"_blank">niko.mauno@vaisala.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:niko.mauno@vaisala.com=
" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0meta/recipes-core/kbd/<a href=
=3D"http://kbd_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">kbd_2.5.1.bb<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kbd_2.5.1.bb/" rel=3D"norefer=
rer" target=3D"_blank">http://kbd_2.5.1.bb/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(=
+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; diff --git a/meta/recipes-core/kbd/<a hre=
f=3D"http://kbd_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">kbd_2.5.1.bb=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kbd_2.5.1.bb/" rel=3D"norefer=
rer" target=3D"_blank">http://kbd_2.5.1.bb/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; index aa3ab6e121..b623aecd36 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --- a/meta/recipes-core/kbd/<a href=3D"ht=
tp://kbd_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">kbd_2.5.1.bb</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kbd_2.5.1.bb/" rel=3D"norefer=
rer" target=3D"_blank">http://kbd_2.5.1.bb/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +++ b/meta/recipes-core/kbd/<a href=3D"ht=
tp://kbd_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">kbd_2.5.1.bb</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kbd_2.5.1.bb/" rel=3D"norefer=
rer" target=3D"_blank">http://kbd_2.5.1.bb/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; @@ -18,6 +18,9 @@ SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.=
tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;ccdf452387a6380973d2927363e9cbb939fa2068915a6=
f937ff9d24522024683&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +# Compiling 64 bit time for 32 bit host =
is broken<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +GLIBC_64BIT_TIME_CPPFLAGS =3D &quot;&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0PACKAGECONFIG ?=3D &quot;${@b=
b.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;pam&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 2.36.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Links: You receive all messages sent to t=
his group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; View/Reply Online (#172940):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/172940" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/172940</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/172940" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/message/172940</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Mute This Topic:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/mt/948806=
33/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/mt/94880633/1686489</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/94=
880633/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/94880633/1686489</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Group Owner: <a href=3D"mailto:openembedd=
ed-core%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core=
+owner@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; <br>
</blockquote></div></div>

--0000000000002e3d9c05ecf489a6--

