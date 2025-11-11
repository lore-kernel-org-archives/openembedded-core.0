Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494D3CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 04:06:05 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9707.1762833949706982171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 20:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqGyD3D/;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-640e065991dso2702755d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 20:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762833949; x=1763438749; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lDNj3jIpcYwDY6N0whmjJdaa9iFfOpBdt0N5KNUNTEs=;
        b=RqGyD3D/hYs8xg0oUImg9+KjuXXD4XirygfG4uk5GKV3MnOxzNB0FGhAYYmvLE4qex
         Y8hNfDhFKEYd4g+YK6ZWXtjXo/eOo6HnfcqOFIPdcV7GCqsdpEn1GSBGY5sPMB0L5PKB
         f1kuSDZcElFl79sSOBntWKvuY4vNulzSdyxcryT0Ry3jqlfpZgxvLWmhm6ZB4SpNqa3z
         ir/PeRktjMLyzr+C+RE9SrLWP4ZZiUTEcT2dpHNJHx0xBQfseVuOZjjLmuuswvI3LGa3
         N6v2/F95yXgkrFLVyZuO4IJiYny99bk+mmUMB8ReREO4zIHRXQsP8lX5xll2OlWtROKq
         H69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762833949; x=1763438749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDNj3jIpcYwDY6N0whmjJdaa9iFfOpBdt0N5KNUNTEs=;
        b=uPoHmz5ttuGTUNHGSmgAZEo1PLYD8VR941LEfJo8fTSFzx8YEOFkBVImwsEt7USa/6
         S+z3Psmow1nlm+bDCT8ZhV/W9gA0n2KUqANX8Hta39tWJxQ6RzNJzNqKwzuiW2Ta4l/q
         AWK4sSkOwoo5x13xKMDhn0eAZgxW/g9dLP6Ft3fImnf176mdrXuc5+cAa65cYdbF99zA
         o886/Lli6WzRE48wBtIwd1y5k1YqXKKiBFSRLFUr6HDCT9LrTKAvPks1WyLi7jkouhGW
         GQ6/ROsFH7Qqolg+BBAZXnHf6cBTMeJUXwzzT5JSfsPq9bSd0GZBOYNYYhDS/WA+yCU1
         u6yA==
X-Gm-Message-State: AOJu0Yzv6beQpxGSE5MRgxMlbRuXehwHlLlDnhEoDwiUUXkuzTQYh4Hd
	yHt1DYx/77yDa/wvI9E9MiPT9VRBvI833CuBNFk0mhgJc71mBNj03YBm+wIWasM/a+35pZmkq9G
	xAFSakckqLi1dkV6AcYTgIVAu6Ypyl0s=
X-Gm-Gg: ASbGncvTvC87AhbZvulHg2Sxsu8fzbcEAM0Nng3Xyn6gp2Er1efGvymdj/E5XvGM61h
	QW9lxaX49IBPKxp9hZDPpt5kx4KqG7mak4lPPiO5YNBl95eiHCiNpj5JsS3FYqplaOAcWrI71eh
	Mc9HPUocDO2zWsNfFx1U4MrV+8B9600lk9zrPKJLOW2kVzd61CUOfsiSaY+iN3mbMi78U5e8PKu
	L46F3d6UC1K3aCSkyB7RFcsx4vrOAQJysU093M3OPzxJD5TVQUIDALXf0/Jt6RwnH+PgNtGH1Hm
	SUaDllfaIITsGk71xoJOB5cPQ7LDNY/bi0kJqClRnB/+XTc0ZJ7Ip9EN5vIatZTYNKJqjkMNNPl
	FI50=
X-Google-Smtp-Source: AGHT+IGXXbOVv305gu647LlnJk+KThU1nsIRHfjx1k0S6Xcnuk5dyZMvr6PutRoTCDRQiofsFrNqcKerJuLzw/27S/g=
X-Received: by 2002:a05:690c:6104:b0:786:5fb0:3c08 with SMTP id
 00721157ae682-787d547235cmr104788827b3.63.1762833948703; Mon, 10 Nov 2025
 20:05:48 -0800 (PST)
MIME-Version: 1.0
References: <TYWPR01MB97080027B974D46CBD1830059BCFA@TYWPR01MB9708.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB97080027B974D46CBD1830059BCFA@TYWPR01MB9708.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Nov 2025 20:05:22 -0800
X-Gm-Features: AWmQ_bmIs1zp28zRPoI8GbRPKdYdfXe2T1_CPe5n5l5Ko7Gn31HOhDAvWHX5qbM
Message-ID: <CAMKF1socqsW+i_Eo+jYATg0kCSCO1MnVE1vfy_UYucqibub49g@mail.gmail.com>
Subject: Re: [OE-core] Question about contribution to openembedded-core
To: liuyd.fnst@fujitsu.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004f811a064349c3c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 04:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226144

--0000000000004f811a064349c3c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 7:41=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> Hi Richard
>
> I Read the commit 7b5fa59751262b9f47fa44db0374662d0fa3fa67 about poky
> repository.
>
> As poky repository is no longer being updated.
>
> I known two methods to replace previous Poky
>
>     a) switch to individual clones of bitbake, openembedded-core,
> meta-yocto and yocto-docs
>
>     b) use the new bitbake-setup
>
> I thought  there is no difference between those two methods for
> contribution. Is that right?
>

Yes that is. right, poky was a putting these layers into a
single repository downstream, but in essence they were still same
individually.
you would contribute to each one of them separately even before, now
its more transparent. Option a would mean you do it manually
option b is the new workspace setup tool which is newly added to bitbake
and can be used to assemble your projects using layers


>
> Cheers
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226143):
> https://lists.openembedded.org/g/openembedded-core/message/226143
> Mute This Topic: https://lists.openembedded.org/mt/116233408/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f811a064349c3c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 10,=
 2025 at 7:41=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"mai=
lto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div class=3D"msg1381087216734253600">




<div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:1em 0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Richard</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I Read the commit 7b5fa59751262b9f47fa44db0374662d0fa3fa67 about poky repos=
itory.</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
As poky repository is no longer being updated.=C2=A0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I known two methods to replace previous Poky</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 a) switch to individual clones of bitbake, openembedded-core,=
 meta-yocto and yocto-docs</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 b) use the new bitbake-setup</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I thought=C2=A0 there is no difference between those two methods for contri=
bution. Is that right?</div></div></div></blockquote><div><br></div><div>Ye=
s that is. right, poky was a putting these layers into a single=C2=A0reposi=
tory downstream, but in essence=C2=A0they were still same individually.</di=
v><div>you would contribute to each one of them separately even before, now=
 its=C2=A0more transparent. Option a would mean you do it manually</div><di=
v>option b is the new workspace setup tool which is newly added to bitbake =
and can be used to assemble your projects using layers=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g1381087216734253600"><div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"text-align:left;text-indent:0px;background-color:rgb(255,255,=
255);margin:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Ca=
libri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Cheers</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226143): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226143" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226143</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116233408/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116233408/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div></div>

--0000000000004f811a064349c3c3--

