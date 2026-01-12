Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A11AC9EC9E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:24:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36601.1768235057071713545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d33bGdhg;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb2314f52so3518678f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768235055; x=1768839855; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+c5zPHV0f5hW/HMlEGMQSz0NmHW/3CFidrJUbNowa5g=;
        b=d33bGdhgpXn0mEQw3++t+0Fx1MvNm1Uxn28TyqIV9xx690zszszrqm6dIicEBEFHXZ
         pHifX/F1ss3cyJ+fX3rSphbdldnXtvkfX7Y2VoxyIs0gca+KFOkN5+k9CFQX+SFatvT6
         M/PLC2nBkmXG44Kkkt7fQU0DYnd8q293Dhdx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235055; x=1768839855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c5zPHV0f5hW/HMlEGMQSz0NmHW/3CFidrJUbNowa5g=;
        b=GTRJGq197CinMI0L92DP6nMEgCAndzKSjkoA7AoHyCfhadd3CFg16iIhWOfu4ekASv
         GH4NpaNTzujUdxQNVe0OIpEDx4etnq9trFKitxSMocwSzQNDRxV04Sy2fbXJNWNYbPmT
         FH4gnpply5V9W/u7qo30jKboyNmvXFWheYO3XivgUMCOiTLWT/4JLkmXlNzCaHSs1jjd
         nL+wBJg7wHPWDB4N0rxC9MAuJVHNgrDtNYIBOS6LzPy1iFuk9vL3f9/FPBmF2mo0kSh6
         1wH5o3Ciw8UYFki32ApQwOjkFd0VQGMgoFkcmWmC5MjWh8WZRgylcLg9hXN5lDZpchSy
         XJuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJzGjbXV+9XKeW4FK0bnJOUkR2SJHCNli1Zr6uJDaCda6beKgRg1bOTt+WcAhqtbzIp6qvAl2gwpXlCm5p0MFtpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJA98PLcichxBYauOaZe9w5SWyeaO4prUTMezpQGkFie/1QPZx
	O4iGnbG0d/25tpZCWpIHnMXx3tGaFkBnofb71dOUpNPXP2jmZ34ZWNYf1ZRamZxLzSK8blxMVlb
	Q8UhBSUsCUNGdIv4QPZVGWWevV6xagIm7FaJrycypUQ==
X-Gm-Gg: AY/fxX6eljG/6wN9Oop7LilaNxEt7u3g/SsFhUB4Js6Fw7zxn+Z5A8TFRVAVb/I5cyM
	D4XGDSbHY5N75R0ZvzXM+GH5Y1FrjVFyxHcJaWOk/7hhFmUAupNM9UyTqdisvK5CjYUGfpZtXS7
	xVdY5MmOfHjhRhxCun5fIR0gcd206aN9saIobyms+IeqnJzdANFtX00Kv2hWvPsdfVvjsVXourw
	hU5OPeJY/nuRshu48eStpGsDeBf4niyCylRhFHatQFS+tOTa1plN9nf6LYnQBZdOyCpLufboQ==
X-Google-Smtp-Source: AGHT+IFEQRxyasreKUoGdpThzv+PMlzPjCKG4IPd9RXZBc9QSXBtKHTiV9xZiqn+aGopHp/BEioWUHDHKrjJ0AvzFnY=
X-Received: by 2002:a05:6000:1449:b0:430:fd9f:e705 with SMTP id
 ffacd0b85a97d-432c3787561mr23023044f8f.27.1768235054954; Mon, 12 Jan 2026
 08:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20260110122753.381844-1-peter.marko@siemens.com> <DFMQVB547HXI.37E1WAP5SSS5Q@bootlin.com>
In-Reply-To: <DFMQVB547HXI.37E1WAP5SSS5Q@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 12 Jan 2026 17:23:48 +0100
X-Gm-Features: AZwV_Qhu7VHp6sTvwER222EaLY4Qf2gOgYOJO_7HtuoN8cLJsGmtJX8mEN_zF88
Message-ID: <CAMSfU+7zYSadRQizDqDWWVAj0rLJSgiZVhFzs=L-to0RigHQKg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libarchive: upgrade 3.8.4 -> 3.8.5
To: antonin.godard@bootlin.com
Cc: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000548b6f0648334e04"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229215

--000000000000548b6f0648334e04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 12 janv. 2026 =C3=A0 17:17, Antonin Godard via lists.openembedded.o=
rg
<antonin.godard=3Dbootlin.com@lists.openembedded.org> a =C3=A9crit :

> Hi,
>

Hello,


> On Sat Jan 10, 2026 at 1:27 PM CET, Peter Marko via lists.openembedded.or=
g
> wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Fixes regression of fix for CVE-2025-60753
> >
> > Release notes [1]:
> > Libarchive 3.8.5 is a bugfix release.
> > Notable bugxies:
> > * bsdtar: fix regression from 3.8.4 zero-length pattern issue bugfix
> (#2809)
> > * various small bugfixes in code and documentation
> >
> > [1] https://github.com/libarchive/libarchive/releases/tag/v3.8.5
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  .../libarchive/{libarchive_3.8.4.bb =3D> libarchive_3.8.5.bb}     | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb =3D>
> libarchive_3.8.5.bb} (96%)
> >
> > diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
> b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> > similarity index 96%
> > rename from meta/recipes-extended/libarchive/libarchive_3.8.4.bb
> > rename to meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> > index e89638f5c6..fcfaf5d231 100644
> > --- a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
> > +++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> > @@ -32,7 +32,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv=
"
> >  SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
> >  UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
> >
> > -SRC_URI[sha256sum] =3D
> "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
> > +SRC_URI[sha256sum] =3D
> "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
> >
> >  inherit autotools update-alternatives pkgconfig
> >
>
> After bisecting, I identified this patch to trigger errors on the
> Autobuilder,
> such as:
>
>   Exception: subprocess.CalledProcessError: Command 'tar
> --exclude=3D./sysroot-only -cf - -C
> /srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/all-po=
ky-linux/wayland-protocols/1.47/image
> -p -S . | tar -xf - -C
> /srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/all-po=
ky-linux/wayland-protocols/1.47/package'
> returned non-zero exit status 2.
>
>   Subprocess output:
>   got *at() syscall for unknown directory, fd 4
>   unknown base path for fd 4, path share
>   couldn't allocate absolute path for 'share'.
>   tar: ./usr/share: Cannot mkdir: Bad address
>   got *at() syscall for unknown directory, fd 4
>   unknown base path for fd 4, path share
>   couldn't allocate absolute path for 'share'.
>   ...
>
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4904276/raw_inl=
ine
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/3005
>
> Full build:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3034
>
> Can you have a look?
>

FYI, that is bug 16117 =E2=80=93 AB-INT: do_package: Error executing a pyth=
on
function in exec_func_python() autogenerated
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16117
And it is not linked to this patch (for example, I have this on whinlatter
which does not have this patch)

If you retry your build on any worker but stream9-vk-1 it should not have
this error.

Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229212):
> https://lists.openembedded.org/g/openembedded-core/message/229212
> Mute This Topic: https://lists.openembedded.org/mt/117190089/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000548b6f0648334e04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0lun. 12 janv. 20=
26 =C3=A0=C2=A017:17, Antonin Godard via <a href=3D"http://lists.openembedd=
ed.org" target=3D"_blank">lists.openembedded.org</a> &lt;antonin.godard=3D<=
a href=3D"mailto:bootlin.com@lists.openembedded.org" target=3D"_blank">boot=
lin.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br><=
/blockquote><div><br></div><div>Hello,</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
On Sat Jan 10, 2026 at 1:27 PM CET, Peter Marko via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> wrote:<br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt;<br>
&gt; Fixes regression of fix for CVE-2025-60753<br>
&gt;<br>
&gt; Release notes [1]:<br>
&gt; Libarchive 3.8.5 is a bugfix release.<br>
&gt; Notable bugxies:<br>
&gt; * bsdtar: fix regression from 3.8.4 zero-length pattern issue bugfix (=
#2809)<br>
&gt; * various small bugfixes in code and documentation<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/libarchive/libarchive/releases/tag/v=
3.8.5" rel=3D"noreferrer" target=3D"_blank">https://github.com/libarchive/l=
ibarchive/releases/tag/v3.8.5</a><br>
&gt;<br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libarchive/{<a href=3D"http://libarchive_3.8.4.bb" rel=3D"no=
referrer" target=3D"_blank">libarchive_3.8.4.bb</a> =3D&gt; <a href=3D"http=
://libarchive_3.8.5.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8=
.5.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-extended/libarchive/{<a href=3D"http://libar=
chive_3.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.4.bb</a=
> =3D&gt; <a href=3D"http://libarchive_3.8.5.bb" rel=3D"noreferrer" target=
=3D"_blank">libarchive_3.8.5.bb</a>} (96%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/libarchive/<a href=3D"http://libarc=
hive_3.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.4.bb</a>=
 b/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.8.5.bb" =
rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.5.bb</a><br>
&gt; similarity index 96%<br>
&gt; rename from meta/recipes-extended/libarchive/<a href=3D"http://libarch=
ive_3.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.4.bb</a><=
br>
&gt; rename to meta/recipes-extended/libarchive/<a href=3D"http://libarchiv=
e_3.8.5.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.5.bb</a><br=
>
&gt; index e89638f5c6..fcfaf5d231 100644<br>
&gt; --- a/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.=
8.4.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.4.bb</a><br>
&gt; +++ b/meta/recipes-extended/libarchive/<a href=3D"http://libarchive_3.=
8.5.bb" rel=3D"noreferrer" target=3D"_blank">libarchive_3.8.5.bb</a><br>
&gt; @@ -32,7 +32,7 @@ EXTRA_OECONF +=3D &quot;--enable-largefile --without=
-iconv&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://libarchive.org/downloads/li=
barchive-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://lib=
archive.org/downloads/libarchive-${PV}.tar.gz</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.libarchive.o=
rg/" rel=3D"noreferrer" target=3D"_blank">https://www.libarchive.org/</a>&q=
uot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;b2c75b132a0ec43274d2867221befcb425034cd0=
38e465afbfad09911abb1abb&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;8a60f3a7bfd59c54ce82ae805a93dba65defd041=
48c3333b7eaa2102f03b7ffd&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit autotools update-alternatives pkgconfig<br>
&gt;=C2=A0 <br>
<br>
After bisecting, I identified this patch to trigger errors on the Autobuild=
er,<br>
such as:<br>
<br>
=C2=A0 Exception: subprocess.CalledProcessError: Command &#39;tar --exclude=
=3D./sysroot-only -cf - -C /srv/pokybuild/yocto-worker/genericx86-64-alt/bu=
ild/build/tmp/work/all-poky-linux/wayland-protocols/1.47/image -p -S . | ta=
r -xf - -C /srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/wo=
rk/all-poky-linux/wayland-protocols/1.47/package&#39; returned non-zero exi=
t status 2.<br>
<br>
=C2=A0 Subprocess output:<br>
=C2=A0 got *at() syscall for unknown directory, fd 4<br>
=C2=A0 unknown base path for fd 4, path share<br>
=C2=A0 couldn&#39;t allocate absolute path for &#39;share&#39;.<br>
=C2=A0 tar: ./usr/share: Cannot mkdir: Bad address<br>
=C2=A0 got *at() syscall for unknown directory, fd 4<br>
=C2=A0 unknown base path for fd 4, path share<br>
=C2=A0 couldn&#39;t allocate absolute path for &#39;share&#39;.<br>
=C2=A0 ...<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/490427=
6/raw_inline" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/api/v2/logs/4904276/raw_inline</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/buil=
ds/3005" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/93/builds/3005</a><br>
<br>
Full build:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3034" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/3034</a><br>
<br>
Can you have a look?<br></blockquote><div><br></div><div>FYI, that is bug 1=
6117 =E2=80=93 AB-INT: do_package: Error executing a python function in exe=
c_func_python() autogenerated<br><a href=3D"https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D16117" target=3D"_blank">https://bugzilla.yoctoproject=
.org/show_bug.cgi?id=3D16117</a></div><div>And it is not linked to this pat=
ch (for example, I have this on whinlatter which does not have this patch)<=
/div><div><br></div><div>If you retry your build on any worker but=C2=A0str=
eam9-vk-1 it should not have this error.=C2=A0</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229212): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229212" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229212</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117190089/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117190089/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--000000000000548b6f0648334e04--

