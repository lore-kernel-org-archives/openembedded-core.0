Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EA5FF6E7B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:39:29 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86720.1773779960403785159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZ0UxJdr;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64e8c7f5082so1176694d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773779959; cv=none;
        d=google.com; s=arc-20240605;
        b=VbtoPo9mHPrKDXSj0jFua/tbqrBT6gyJ5GkujN5OlS5F6/o5QKzjimQIOT2Lk34GiK
         0bCEygfmrNC6+JLLYYsqXJiOUGYH0Ub4C2tYBB94pR00lHHgEbqm8WTJD5cAWbrSdX0R
         /s04T7iy7kCju3xMF35A1NPcFuFJjujvo/TZeETyqNfdg46QXCzlyNmF091MqivbhusV
         OWCx2pJLVVTKQe5zsSsMRGn10IRE2U+PJVeR0guAURZWsDOluGAOTzhAc5RZJVKdoGi2
         ZlBRlbxxerwLvNmi5dsn0PRM4EsRtYtTsIYDrMocB0S1L2U73fYnHqQAbKyC6vQEKtNP
         BK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XGsL26zJwnQPKTDHzoz36MQc2dBJSYRBHyX4l63WLTw=;
        fh=hUVUF+Ud3eB2W5oXyGHPmWd8HBTgohiGsEe/gKWKlyI=;
        b=kjh4tdxVHlEBqy5YpS5/uBGPAolR0oLDOlqBYRKOoPR2mzYnrEFys4aOyGDsg8jJrw
         +PkXUcYkOdic7OaV3JB5PDLDG9SctQTTACZh8NNZGJ/UedTUOXX/zJTPzQWrK4dnJ8Yd
         VARvZLFv43r/Zn7LbWB7DxQJauCmD/iRhJ7IfyHG7JRx2FEF3Re01ecm3hlNTkZUoB6a
         Li++Ma63hz1X6wR4SbzOmoE9xWKBiqEsYHKX0aigPhYJLVznGoxwQkThalOsX9YJOI1E
         txEaRlcgmzC23G2eHN/teueQsuGkXYpMKfWbDTsQ+mONqFxmtQk3CN12HxgVmhPhuzqV
         Wu9A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779959; x=1774384759; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGsL26zJwnQPKTDHzoz36MQc2dBJSYRBHyX4l63WLTw=;
        b=QZ0UxJdr3dNvwqWgf1rjIWvpHaW53Me1/QCFjOwNnfHEWH1pukqRuo66/g0fnA//Fu
         oq2ys0HkJ+rNhC3UGDeLaeTxBwbmyIGr041IKBmVAp2rnS7GRfrZqRDf+IiztWfgAS+x
         YvuaVo2QBmlvYlJOO/UVZda8g643LVwuqm7tC5CKWKnVztSnUiDKJs9bnRVpLNZNyE9t
         f4TKs5QRwkvHpRUcbM4lRonSDxds2Q0C8qealyVE3b+GWI/M3MXRLY/kQpvLjQRxxQf9
         +kdO9j6hzwYf3BfkEvcVzqAjhLejrwV9odBU2AQpPcBMKz4eaGAlo7RSnkSPfDPxaQ1M
         KgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779959; x=1774384759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGsL26zJwnQPKTDHzoz36MQc2dBJSYRBHyX4l63WLTw=;
        b=iLYM/BdFuX4amqaUV+zQUDjgK8AvjVJfSTzUGEdZ+7WfkuzaS0FFvU1Soqa6ebuuAn
         hwTul6f/AuEcXdWNGILKAIHvfPKQTTkQJ6HWTDNJ687LVojeCJdKZuf02AVyb7r1oLJW
         g0r9ZfxcAAt+O7m1mSv7aXWUj/9XY7Y+nrd5q3OmOC/RaGgvuKh1mYN4PQ+QHTQniZM/
         42GXnCB51xswfv91VKlxz2glRVdRflRfPf3lzbOUKSxEXYeCYYfCF6PezhV/9b6Jmaro
         Ji/TyJj95Y0+C8g232wY+DF1BfreEY6nclIlyqJHYtB0koMFsD0h0F+2eGUhfh2p9+P5
         TIAA==
X-Forwarded-Encrypted: i=1; AJvYcCWts9qMkaKNiSqLr0XK2hlHbfU3fR0sClTiAkivvUoEqblY+Wt1YWqvctyAzBpQpsrxph6x6jNGy7tVL/J+4nrs6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxePyIe2fDv0iepDt66wT+AMPUvq9/BOOClX+SCiHQDijxm7UpQ
	nZTLrY9kfEQGOcfXCwEkgPNH1OtgJMKoo+hFB+kC3PPb52ZQE1KlxIcX6Q5Q1tqnQvqCLXU5cJB
	fGaW4+x+8aNQ6CkSH35JYvMjt6AujQnjPCQ==
X-Gm-Gg: ATEYQzzG/yVMUH1HwcZxZu7lY6VkwkNnwilMnNUpEEe2/TVL30pGZGxqvZW7cso4s4v
	GJj2BttuahDgb/iQrsi9sGsRB2RnTAnL4xmadGSDby1g1nZnKnOuTXe2/ICDoMALuKMQMRPo0Je
	u2W3zeIE9qagtC/eTO9sEqM3WLgh6wDXgMOZ6MC9Zf8Dm8t/N92YPVtWGJ30ZJhHG4UuzIEPQiZ
	ULfLQtEwCw7Y59vCzN0A34Cc8NqBTkwdejn+haCgOEpMdBD9ynDscckW3jxbX1N4vwElbYpgleu
	3dJXuo4mU96OczKpKawPspyHwS+DFLTbYZ6Xs8/Uk7K3y3uiY6LVJgPHQty8nDlHyUCXhIZLuTV
	Ryg4yqtNUrFyjvnCN1oS3C8Gr
X-Received: by 2002:a05:690e:158e:20b0:64e:7240:ce2c with SMTP id
 956f58d0204a3-64e91324d34mr1085128d50.22.1773779959181; Tue, 17 Mar 2026
 13:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260317112407.312819-1-kory.maincent@bootlin.com>
 <8ABAF2EF-06EE-43ED-8D90-589322F0CD84@arm.com> <20260317150420.07fcd2ac@kmaincent-XPS-13-7390>
In-Reply-To: <20260317150420.07fcd2ac@kmaincent-XPS-13-7390>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 13:38:52 -0700
X-Gm-Features: AaiRm5001szbRv-cVPf7jWJMHDiQpsefHz6rcP6Ma2Etjqw38T6qhGU7wE1atvA
Message-ID: <CAMKF1so9yGYEu8PnZ-Fs7RbipRJVCzHbMZmLH1+Ht+itajqJ3w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] default-providers: switch pkgconfig provider to pkgconf
To: kory.maincent@bootlin.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000006075db064d3e54ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233351

--0000000000006075db064d3e54ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 7:04=E2=80=AFAM Kory Maincent via lists.openembedde=
d.org
<kory.maincent=3Dbootlin.com@lists.openembedded.org> wrote:

> Hello Ross,
>
> On Tue, 17 Mar 2026 13:37:48 +0000
> Ross Burton <Ross.Burton@arm.com> wrote:
>
> > On 17 Mar 2026, at 11:24, Kory Maincent via lists.openembedded.org
> > <kory.maincent=3Dbootlin.com@lists.openembedded.org> wrote:
> > >
> > > pkg-config has been unmaintained since 2017. Major Linux distribution=
s
> > > such as Fedora, Debian, Alpine, and Arch Linux have all switched to
> > > pkgconf as their default pkg-config implementation. Upstream projects
> > > no longer use or recommend pkg-config. There is no reason for Yocto
> > > to keep lagging behind and continue using a dead tool.
> > >
> > > Switch the preferred providers for pkgconfig, nativesdk-pkgconfig and
> > > pkgconfig-native to pkgconf, aligning with the broader ecosystem.
> >
> > I=E2=80=99ve been working on this migration during this cycle and liter=
ally last
> > night did one last built of the universe with pkgconfig vs pkgconf. It=
=E2=80=99s
> not
> > quite as simple as just switching the providers, but it=E2=80=99s close=
.
>
> Oh, great!
>
> > > Should we keep making pkgconf emulate the legacy pkg-config behavior?
> > > At this point, projects have had sufficient time to adopt native
> pkgconf
> > > compatibility, so it may be worth dropping the wrappers and letting
> > > pkgconf behave as its own tool.
> >
> > This is a bigger question.  The pkgconf maintainers have Opinions on ho=
w
> > =E2=80=94variable and sysroots interact and simply dropping the fdo beh=
aviour
> does
> > result in build breakage.
>
> I know it will raise some discussion, but maybe we could align with
> Buildroot
> choice on this topic:
>
> https://github.com/buildroot/buildroot/blob/master/package/pkgconf/0001-O=
nly-prefix-with-the-sysroot-a-subset-of-variables.patch
>
>
Whats upstreams view on this patch ? it seems that it will be custom from
distro to distro. I wonder if upstream could consider an option
to add a list of such dirs via envvar or some other mechanism to insert it.


> Regards,
> --
> K=C3=B6ry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233324):
> https://lists.openembedded.org/g/openembedded-core/message/233324
> Mute This Topic: https://lists.openembedded.org/mt/118362272/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006075db064d3e54ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17,=
 2026 at 7:04=E2=80=AFAM Kory Maincent via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;kory.maincent=3D<a href=3D"mailto:=
bootlin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello=
 Ross,<br>
<br>
On Tue, 17 Mar 2026 13:37:48 +0000<br>
Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">Ro=
ss.Burton@arm.com</a>&gt; wrote:<br>
<br>
&gt; On 17 Mar 2026, at 11:24, Kory Maincent via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a><br>
&gt; &lt;kory.maincent=3D<a href=3D"mailto:bootlin.com@lists.openembedded.o=
rg" target=3D"_blank">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; pkg-config has been unmaintained since 2017. Major Linux distribu=
tions<br>
&gt; &gt; such as Fedora, Debian, Alpine, and Arch Linux have all switched =
to<br>
&gt; &gt; pkgconf as their default pkg-config implementation. Upstream proj=
ects<br>
&gt; &gt; no longer use or recommend pkg-config. There is no reason for Yoc=
to<br>
&gt; &gt; to keep lagging behind and continue using a dead tool.<br>
&gt; &gt; <br>
&gt; &gt; Switch the preferred providers for pkgconfig, nativesdk-pkgconfig=
 and<br>
&gt; &gt; pkgconfig-native to pkgconf, aligning with the broader ecosystem.=
=C2=A0 <br>
&gt; <br>
&gt; I=E2=80=99ve been working on this migration during this cycle and lite=
rally last<br>
&gt; night did one last built of the universe with pkgconfig vs pkgconf. It=
=E2=80=99s not<br>
&gt; quite as simple as just switching the providers, but it=E2=80=99s clos=
e.<br>
<br>
Oh, great!<br>
<br>
&gt; &gt; Should we keep making pkgconf emulate the legacy pkg-config behav=
ior?<br>
&gt; &gt; At this point, projects have had sufficient time to adopt native =
pkgconf<br>
&gt; &gt; compatibility, so it may be worth dropping the wrappers and letti=
ng<br>
&gt; &gt; pkgconf behave as its own tool.=C2=A0 <br>
&gt; <br>
&gt; This is a bigger question.=C2=A0 The pkgconf maintainers have Opinions=
 on how<br>
&gt; =E2=80=94variable and sysroots interact and simply dropping the fdo be=
haviour does<br>
&gt; result in build breakage.<br>
<br>
I know it will raise some discussion, but maybe we could align with Buildro=
ot<br>
choice on this topic:<br>
<a href=3D"https://github.com/buildroot/buildroot/blob/master/package/pkgco=
nf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch" rel=3D"no=
referrer" target=3D"_blank">https://github.com/buildroot/buildroot/blob/mas=
ter/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables=
.patch</a><br>
<br></blockquote><div><br></div><div>Whats upstreams view on this patch ? i=
t seems that it will be custom from distro to distro. I wonder if upstream =
could consider an option</div><div>to add a list of such dirs via envvar or=
 some other mechanism to insert it.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Regards,<br>
-- <br>
K=C3=B6ry Maincent, Bootlin<br>
Embedded Linux and kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233324" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118362272/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118362272/1997914</a><br>
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

--0000000000006075db064d3e54ae--

