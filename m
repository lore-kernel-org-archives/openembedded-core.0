Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4729BF46C40
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 14:10:47 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55787.1775484642174881452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 07:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jUgKxUNX;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66dd1b5bb6aso6472817a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 07:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775484640; cv=none;
        d=google.com; s=arc-20240605;
        b=YM/ryXc+gsfHek3sjZnPmgzu+SpqPSATDxxs3tDTHxtrw5ogqfdwXfhhhlnijGKxhZ
         tI6X62hkn1Nnw57vYb1yBA3qKrUfBluiql5/IendbhGPazILZ4QiYq5F/959DIkKZvOB
         HPcZ+Y5PzyUwxM2lSRSXix2idGwB13+Ree9hvW76NyTne1+bFCZ/lFmPE67y/BrzA2Uo
         I+RZDPirTEGi1mpN0iuFdLAT/vtZ5uE+kS3hI0m4tsorVIpEqvlS6eSE/FCfpzjhRsTf
         6n8Fx6fVnOwOiH/Jg/BnuOvVNUdiDrSyk27TVhDc8Ro2jbhplvEk25HWwW5tItW89r/O
         LSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ovDJYE6PG4DiaoZ9R3oy5BbN5IQ+ciBpxVTJzo5N+b4=;
        fh=6APFImPlY6ddmiAG7HmJzMkGhUQBh5M3QpbKucGsvDo=;
        b=NSvpSv/E/ynKoxPtmi91ruG0qGei2sotjoNJ7dw+3Ll4ZWK4lbPrhoxcM8Jrjx0nbR
         hl3wRA82wPD872R0BnWxXv+/MrmZHBhC7WFA4KxhYdFCAdSrv1TYdc2gEvebpN0C+96P
         2mmNcEKDsihYgI2SpZ30A4yxYJLuAPZ0zrYMXL3yrGzi4RZoRc0fo8hSqy/VUVo2+lPB
         dfr26RdEOqSj0m+tHbKRCy1BjNdk++6YAFIVzMl0IwD/qHlwZUHanxO9CyhiAoP/w69z
         c02A2i8GAwgWVLjI+VaFjk+qedMFo3SO1XDTqTFgQMiq2dCE1L832b1BjhuwQ+JCGfBE
         0rlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775484640; x=1776089440; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ovDJYE6PG4DiaoZ9R3oy5BbN5IQ+ciBpxVTJzo5N+b4=;
        b=jUgKxUNXiQf+QAfZGO/HsQq6L1edVjCktFWew6rSc3hfzWFjQLNYsDu43rOHAoTJBC
         ezOTZHfdLAt+GYc5Qru1K2vgNzfgJ/DrdlM0vtTXTZd9F5zmqO0CbTMFPpmWCoOYh1GV
         x3wu/gv7vXUdsMzhxdS01VEZSww1JlQjd7aAj04uBpSn9uuDZZThbmRpeW+opycsGMDH
         RdyiMrRwHe3YafMSle9qXfwh2gw1J32KygfzzZ6KEmofDHS02ya/4r/XN4Lwp+lCHoY3
         fi+GAKr3n2ZmvHqjF751wNJzvaLukoB/2poS7x4M7HmThxPhyBwZenQhycZqsL4mBBBE
         CwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775484640; x=1776089440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovDJYE6PG4DiaoZ9R3oy5BbN5IQ+ciBpxVTJzo5N+b4=;
        b=C4EWGX2Yfwd8Dmj88Z+mt9aF2FyxJxz4aWUDnfl3lCRhy9bYjqeUoYysmv1ELE0PfM
         uljNtUgBs+duabsEfoxySNRSD+AbZxc1EEG91eD9LOpORSNv6yG3zm0aQt1kpehXDG1X
         9sCqZ0EpFXDua2QolNtUdjUGr5rLto6pHvCqb9PuzslXvK8sniVlxG5y01PopIHpb12Q
         Xm1gHLM/FJfDNDEhljNSI6Wr9Nr5ZwxH83RI55YDDZx7evg5CyzqmCNDwNqfZpLEC6fY
         YdC7YA6gRPT8wDm4D6yf4drwTNVUyixzKjo6T19Sbv9KpS6L8tWf7P2uYgvFaJcSgUjr
         7pvw==
X-Forwarded-Encrypted: i=1; AJvYcCWXPwNCrQOWuArRneLdkuFcXCmHkkjzQNDN6+v5CAwRnGr2A1qSbF4tTddlFRgNqGpQC3UzxMNedt8Efu4AbF7Mcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxo2mQ/w56vH0HIwkWdthomaNEHfQOdkIahn/M0BwOQcWFPSIUN
	W97HO529CkPpU8nc2XOCYIQxXUOeKxa16oMzMQMpIGPWkpQ8Qrnl8dUNlEo4ADpjpTfwAXPMWgB
	rUP02UPp7vpeSTMoJ6iGfsZbWSFt/qqo=
X-Gm-Gg: AeBDiesA9x+Vq1zyTfFTE4FYwSRSf43DGlF1aVA+sYhrsxB6X6+QfKfGT3EMUknAjOU
	xxwK6yIUNjgd9JNGR5vOdgI3p6d+YAAOMMqKVP4sHuQU/wXE1nWPDoD1ZucYBT5IMEYicGd0rsS
	EL4aiDQDZxAiVTWzLqvT7mzH7WYlucoZw8LxiiUtVvlFoncwLV1rrG04GqdtVNkmngbQalqSAr2
	0v78UNSRC38dfTENJ89plqZ8vW1AY4LL/Z9R99aLawYtomFk7OzNKDTFhWvDicHajNRhcBAX46m
	/16Uf1iQbKvdOaFNtsw=
X-Received: by 2002:a17:907:3f1b:b0:b9c:bb29:7ce9 with SMTP id
 a640c23a62f3a-b9cbb298b40mr222958666b.50.1775484639907; Mon, 06 Apr 2026
 07:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260304103203.1649-1-wangmy@fujitsu.com> <20260304103203.1649-10-wangmy@fujitsu.com>
 <18A1AB06FB4E2AAD.263554@lists.openembedded.org> <DB5PR02MB102138C0C905B135CABFD77B5EF5DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102138C0C905B135CABFD77B5EF5DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 6 Apr 2026 15:10:28 +0100
X-Gm-Features: AQROBzAJjpjO5P6G22DgZjvuj0uH8HiyaL9M1hEBJAOdxz-3O2gcUU__Nty1zlg
Message-ID: <CANPvuRkT4CTkbwbOJthRtMZMbfsZtNQDHCtFCtAkLsWKaV2SVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
To: peter.kjellerstedt@axis.com
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000044140e064ecb3b81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 14:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234683

--00000000000044140e064ecb3b81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt via lists.openembedded.org <peter.kjellerstedt=3D
axis.com@lists.openembedded.org> escreveu (segunda, 6/04/2026 =C3=A0(s) 14:=
09):

> *ping*
>
> //Peter
>
>
+1

Given that gstreamer is a reference package on the multimedia front, I
believe it would be generally appreciated by the community to include
1.28.x in the next LTS.
The 1.26.x was released a year ago.

Jose


> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt via
> > lists.openembedded.org
> > Sent: den 30 mars 2026 18:23
> > To: wangmy@fujitsu.com; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 ->
> > 1.28.0
> >
> > What is the status of these patches, which upgrade the GStreamer recipe=
s
> > to version 1.28.0?
> >
> > I do not see them on neither master-next nor mathieu/master-next in
> > the openembedded-core-contrib repository.
> >
> > //Peter
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of wangmy via
> lists.openembedded.org
> > > Sent: den 4 mars 2026 11:32
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Wang Mingyu <wangmy@fujitsu.com>
> > > Subject: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28=
.0
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > 0002-tests-add-support-for-install-the-tests.patch
> > > refreshed for 1.28.0
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...2-tests-add-support-for-install-the-tests.patch | 14 +++++++-----=
--
> > >  ...treamer1.0_1.26.9.bb =3D> gstreamer1.0_1.28.0.bb} |  2 +-
> > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb =3D=
>
> gstreamer1.0_1.28.0.bb} (97%)
> > >
> > > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> > > index ccfc869813..720a6f0c97 100644
> > > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> > > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> > > @@ -1,4 +1,4 @@
> > > -From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 20=
01
> > > +From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 20=
01
> > >  From: Jose Quaresma <quaresma.jose@gmail.com>
> > >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> > >  Subject: [PATCH] tests: add support for install the tests
> > > @@ -12,17 +12,17 @@ Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> > >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > >  ---
> > >   meson.build                  |  4 ++++
> > > - meson_options.txt            |  1 +
> > > + meson.options                |  1 +
> > >   tests/check/meson.build      | 22 +++++++++++++++++++++-
> > >   tests/check/template.test.in |  3 +++
> > >   4 files changed, 29 insertions(+), 1 deletion(-)
> > >   create mode 100644 tests/check/template.test.in
> > >
> > >  diff --git a/meson.build b/meson.build
> > > -index 0a77e90..cadfaeb 100644
> > > +index 8adc055..b5c9e5b 100644
> > >  --- a/meson.build
> > >  +++ b/meson.build
> > > -@@ -664,6 +664,10 @@ if bashcomp_dep.found()
> > > +@@ -667,6 +667,10 @@ if bashcomp_dep.found()
> > >     endif
> > >   endif
> > >
> > > @@ -33,10 +33,10 @@ index 0a77e90..cadfaeb 100644
> > >   plugins_install_dir =3D join_paths(get_option('libdir'),
> 'gstreamer-1.0')
> > >
> > >   pkgconfig =3D import('pkgconfig')
> > > -diff --git a/meson_options.txt b/meson_options.txt
> > > +diff --git a/meson.options b/meson.options
> > >  index 39255cf..78af552 100644
> > > ---- a/meson_options.txt
> > > -+++ b/meson_options.txt
> > > +--- a/meson.options
> > > ++++ b/meson.options
> > >  @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value :
> false, description : 'Enable poiso
> > >   option('memory-alignment', type: 'combo',
> > >          choices : ['1', '2', '4', '8', '16', '32', '64', '128',
> '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> > > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> > > similarity index 97%
> > > rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> > > rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> > > index c66f614629..63633fea05 100644
> > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> > > @@ -22,7 +22,7 @@ SRC_URI =3D
> > > "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.=
x
> > >             file://0003-tests-use-a-dictionaries-for-environment.patc=
h
> \
> > >
>  file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
> > >             "
> > > -SRC_URI[sha256sum] =3D
> "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952ff23aecde80670c8"
> > > +SRC_URI[sha256sum] =3D
> "6c8676bc39a2b41084fd4b21d2c37985c69ac979c03ce59575db945a3a623afd"
> > >
> > >  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1',
> 'tests', '', d)} \
> > >                     check \
> > > --
> > > 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234678):
> https://lists.openembedded.org/g/openembedded-core/message/234678
> Mute This Topic: https://lists.openembedded.org/mt/118129968/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000044140e064ecb3b81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;peter=
.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.openembedded.org">axis.com=
@lists.openembedded.org</a>&gt; escreveu (segunda, 6/04/2026 =C3=A0(s) 14:0=
9):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">*ping*<br>
<br>
//Peter<br>
<br></blockquote><div><br></div><div>+1<br></div><div><br></div><div>Given =
that gstreamer is a reference package on the multimedia front, I believe it=
 would be generally appreciated by the community to include 1.28.x in the n=
ext LTS.</div>The 1.26.x was released a year ago.<div><br></div><div>Jose<b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">=C2=A0</div></div></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Peter Kjellerstedt via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: den 30 mars 2026 18:23<br>
&gt; To: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fuj=
itsu.com</a>; <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -&gt=
;<br>
&gt; 1.28.0<br>
&gt; <br>
&gt; What is the status of these patches, which upgrade the GStreamer recip=
es<br>
&gt; to version 1.28.0?<br>
&gt; <br>
&gt; I do not see them on neither master-next nor mathieu/master-next in<br=
>
&gt; the openembedded-core-contrib repository.<br>
&gt; <br>
&gt; //Peter<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=
=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">open=
embedded-core@lists.openembedded.org</a>&gt; On Behalf Of wangmy via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a><br>
&gt; &gt; Sent: den 4 mars 2026 11:32<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Cc: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; Subject: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -&g=
t; 1.28.0<br>
&gt; &gt;<br>
&gt; &gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; 0002-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt; refreshed for 1.28.0<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...2-tests-add-support-for-install-the-tests.patch | 14 +++=
++++-------<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://treamer1.0_1.26.9.bb" rel=3D"noreferre=
r" target=3D"_blank">treamer1.0_1.26.9.bb</a> =3D&gt; <a href=3D"http://gst=
reamer1.0_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28=
.0.bb</a>} |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 2 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http:/=
/gstreamer1.0_1.26.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_=
1.26.9.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.28.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">gstreamer1.0_1.28.0.bb</a>} (97%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-=
tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gst=
reamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt; index ccfc869813..720a6f0c97 100644<br>
&gt; &gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-a=
dd-support-for-install-the-tests.patch<br>
&gt; &gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-a=
dd-support-for-install-the-tests.patch<br>
&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; -From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0100<br>
&gt; &gt;=C2=A0 Subject: [PATCH] tests: add support for install the tests<b=
r>
&gt; &gt; @@ -12,17 +12,17 @@ Upstream-Status: Submitted [<a href=3D"https:=
//gitlab.freedesktop.org/gstreamer/gstreamer/-" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-</a><br>
&gt; &gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma=
.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
&gt; &gt; - meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt; &gt; + meson.options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0tests/check/meson.build=C2=A0 =C2=A0 =C2=A0 | 22 ++++=
+++++++++++++++++-<br>
&gt; &gt;=C2=A0 =C2=A0tests/check/<a href=3D"http://template.test.in" rel=
=3D"noreferrer" target=3D"_blank">template.test.in</a> |=C2=A0 3 +++<br>
&gt; &gt;=C2=A0 =C2=A04 files changed, 29 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 tests/check/<a href=3D"http://temp=
late.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/meson.build b/meson.build<br>
&gt; &gt; -index 0a77e90..cadfaeb 100644<br>
&gt; &gt; +index 8adc055..b5c9e5b 100644<br>
&gt; &gt;=C2=A0 --- a/meson.build<br>
&gt; &gt;=C2=A0 +++ b/meson.build<br>
&gt; &gt; -@@ -664,6 +664,10 @@ if bashcomp_dep.found()<br>
&gt; &gt; +@@ -667,6 +667,10 @@ if bashcomp_dep.found()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; &gt;=C2=A0 =C2=A0endif<br>
&gt; &gt;<br>
&gt; &gt; @@ -33,10 +33,10 @@ index 0a77e90..cadfaeb 100644<br>
&gt; &gt;=C2=A0 =C2=A0plugins_install_dir =3D join_paths(get_option(&#39;li=
bdir&#39;), &#39;gstreamer-1.0&#39;)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
&gt; &gt; -diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; &gt; +diff --git a/meson.options b/meson.options<br>
&gt; &gt;=C2=A0 index 39255cf..78af552 100644<br>
&gt; &gt; ---- a/meson_options.txt<br>
&gt; &gt; -+++ b/meson_options.txt<br>
&gt; &gt; +--- a/meson.options<br>
&gt; &gt; ++++ b/meson.options<br>
&gt; &gt;=C2=A0 @@ -16,6 +16,7 @@ option(&#39;poisoning&#39;, type : &#39;b=
oolean&#39;, value : false, description : &#39;Enable poiso<br>
&gt; &gt;=C2=A0 =C2=A0option(&#39;memory-alignment&#39;, type: &#39;combo&#=
39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choices : [&#39;1&#39;, &#39;2&=
#39;, &#39;4&#39;, &#39;8&#39;, &#39;16&#39;, &#39;32&#39;, &#39;64&#39;, &=
#39;128&#39;, &#39;256&#39;, &#39;512&#39;, &#39;1024&#39;, &#39;2048&#39;,=
 &#39;4096&#39;, &#39;8192&#39;, &#39;malloc&#39;, &#39;pagesize&#39;],<br>
&gt; &gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://=
gstreamer1.0_1.26.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1=
.26.9.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreame=
r1.0_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.0.bb=
</a><br>
&gt; &gt; similarity index 97%<br>
&gt; &gt; rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://g=
streamer1.0_1.26.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.=
26.9.bb</a><br>
&gt; &gt; rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gst=
reamer1.0_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28=
.0.bb</a><br>
&gt; &gt; index c66f614629..63633fea05 100644<br>
&gt; &gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0_1.26.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.26.9.b=
b</a><br>
&gt; &gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.28.0.b=
b</a><br>
&gt; &gt; @@ -22,7 +22,7 @@ SRC_URI =3D<br>
&gt; &gt; &quot;<a href=3D"https://gstreamer.freedesktop.org/src/gstreamer/=
gstreamer-$%7BPV%7D.tar.x" rel=3D"noreferrer" target=3D"_blank">https://gst=
reamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-=
use-a-dictionaries-for-environment.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tests-=
add-helper-script-to-run-the-installed_tests.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;8ee8772e468102ebe86d414d8c4c7440dd9=
1d9f3e9396952ff23aecde80670c8&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;6c8676bc39a2b41084fd4b21d2c37985c69=
ac979c03ce59575db945a3a623afd&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_E=
NABLED&#39;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0check \<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234678): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234678" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/234678</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118129968/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118129968/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div></div>

--00000000000044140e064ecb3b81--

