Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88066D1CDCF
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:14:02 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34998.1764821639173517414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kxjaATi+;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78a6c7ac3caso4726697b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764821638; x=1765426438; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dsHikW5K0YXvwo7IPnRQIlTiB3hTpUjUh3YO701YXPo=;
        b=kxjaATi+Db6F2v3K4aHXE68flaX4gbnwKibPLE06oib7oTFSrwq4ye3NeGu8wsul4l
         ZIpJM4oEUsgkKZr4m46Q7ct0u2ZhU2O1PUSrlSAW4MpDLX4RbdRaS+8cLFqgVP454M1+
         T4mvl8mcyGwIfx5wRHKH+/nxDJ/SvNMcuKaaVxQCCtDk3bEacHPa2eLdOuT/3v45nCsa
         YT40MiXSDLqolEmBFMtGtjfBHY/mrctcr/5rDjmDaVD5MdKTu6Ttyp6JKEFiEj/oNE/6
         pEKzqN/TTz5q9LvWgPkBdobKo4QmuPaz36CR3FQVLZf9zI4w6x+D8W9Dqi8h95JW37bs
         ESaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821638; x=1765426438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsHikW5K0YXvwo7IPnRQIlTiB3hTpUjUh3YO701YXPo=;
        b=saana4YqFByWIvJcc/xeVfTLRdLJHi5r1iTKeY7olGiZFM7em+G3ZRlNkSs46HcAGN
         Ng8aDNn8PJKsV4PjC5ENyaW60yN5wydsU6AzvZmpi8ErJyGr9mggN8Z/KmS6Dng6fm0J
         6lUhJbMD79pBl0TLMn0csJVI9UCFXOXeMOKk98sdSHMTAf4VwtTEwBT0PLUJng3R8HtR
         uLuJ+KXkgABIVNV4VR8GRxIchgIuyHB47JE627DnO8drL6gxPqtyY3aYnW3xFto5X55J
         fhbHsLyau0PV9U3XUjaV1wJ/7v58xsY6h904N2SY7Qr/IxyG/8DV+6F43sPhdfdtetOK
         Ar5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+GHwg6hK/hcfcWJQNL+hzpj/++m+yTWVg1x1QOkf35Yjuv46IdYcnvjk2MIUE7veu2uIbb5+/grXfJw3oIfk7yw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxiM20l6BnrDbSIS+CGoq4cVmUsYDIzLY/wiR7awIkja4iIVzhU
	DoAauQ7/utT0jLgC3mPlw5Q6nfzYoMxD7WIJWQrGRQKjyrwL3WBgHsFvWMQvGSG3tpJz323RDOQ
	VUqDSRH4dZun7DNaY63F88U4idWLsWBx06g2L
X-Gm-Gg: ASbGncvK8X2o74xpFEGzYWgZMgrE+VHd5eVdFwM+ZaWUnsQUl4bbVkWtmCfL5jSlzeH
	5pdoBaYsPzn50cuNZGvm3iCTsm9WiC3ci8OAGL1+hvN7rbKusBR3lfNUKh9sXDnqo6jSNEk+M2l
	1M92ha+dxtttIW2NnwRbJQFGRp0Id40cSz15yKRXNlZp7HPKa+KklEBxpFgxzbPydu4Plsp1Syz
	7Ej56hN//3tE6hx8lOAtjGmzfCqiX6kqSTVH+DEwVYg/VJ58JnD/vuj+owiZbJ59xgX9FLJxsiL
	jJ0QNO8fGIq5auMW9wFKRwsmvJBR0WBQ27+6k0lqIy1xct3zq9GVTxfnzo4FkE3F0PopkBFtmgv
	vTmroAB2fuPE=
X-Google-Smtp-Source: AGHT+IFvbbruOLGA7Wbgikn3jWNe7VaqDX9reGVs1Usb8gkuWA0zHI7AiHgwFFbQryv7fPmA4WRQOf+3DOJwqKyyDNU=
X-Received: by 2002:a05:690c:74c7:b0:786:7a54:4632 with SMTP id
 00721157ae682-78c0bed354amr38931397b3.13.1764821638252; Wed, 03 Dec 2025
 20:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20251202151032.15053-1-schonm@gmail.com> <20251202151032.15053-2-schonm@gmail.com>
 <DEOKWAS5XALU.VTBEZYEYZL1J@bootlin.com> <CABTo8gDkybOgXP0ot4iOyJtnezNbMghuhSf9yLLewH4YkLVdOg@mail.gmail.com>
In-Reply-To: <CABTo8gDkybOgXP0ot4iOyJtnezNbMghuhSf9yLLewH4YkLVdOg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Dec 2025 20:13:31 -0800
X-Gm-Features: AWmQ_bl5PY4cK7MMzs4KlzZNPiYurwIFVuvbI6qF4PWjMdB9oIw1BqQqKe9Sqzg
Message-ID: <CAMKF1speTaJmuv9+a-FSHBZ1s8gH-DpfJ0DQrEjUjNHprLtreQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] perl: upgrade 5.40.2 -> 5.42.0
To: schonm@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d70baf0645188e5b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227250

--000000000000d70baf0645188e5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 6:45=E2=80=AFPM J. S. via lists.openembedded.org <sc=
honm=3D
gmail.com@lists.openembedded.org> wrote:

> In the log files, I find
>
> Failed to load or import from ExtUtils::ParseXS (version 3.57). Please
> check that ExtUtils::ParseXS is installed correctly and that the
> newest version will be found in your @INC path
>
> I note that the version of libextutils-parsexs-perl provided by
> meta-openembeded is  3.35.  Which I guess is far out of date.
> Metacpan would suggest that is from a 2017 time frame.
>
>
Right, you might upgrade it and also propose it to migrating into core
layer at same time
and once merged send a patch to delete it from meta-perl as well.


> Jason.
>
> On Wed, Dec 3, 2025 at 7:26=E2=80=AFAM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> >
> > On Tue Dec 2, 2025 at 4:10 PM CET, J. S. via lists.openembedded.org
> wrote:
> > > License-Update: Checksum changed because in the license, the physical
> address
> > >   of the Free Software Foundation has been exchanged for a web addres=
s.
> > >
> > > Changes in perl 5.42.0: https://perldoc.perl.org/5.42.0/perldelta
> > >
> > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > ---
> >
> > Hi Jason,
> >
> > Thanks for your patch.
> >
> > It looks like some selftests are now failing:
> >
> > AssertionError:
> > Failed ptests:
> > {'libmodule-build-perl': ['t/xs']}
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2708
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/798
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2664
> >
> > Ptest logs can be found here:
> >
> >
> https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemux86=
-64-ptest/core-image-ptest-libmodule-build-perl/
> >
> https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemuarm=
64-ptest/core-image-ptest-libmodule-build-perl/
> >
> https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemuris=
cv64-ptest/core-image-ptest-libgpg-error/
> >
> > Can you have a look at these failures?
> >
> > Thanks,
> > Mathieu
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227248):
> https://lists.openembedded.org/g/openembedded-core/message/227248
> Mute This Topic: https://lists.openembedded.org/mt/116577571/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d70baf0645188e5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 3, =
2025 at 6:45=E2=80=AFPM J. S. via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;schonm=3D<a href=3D"mailto:gmail.com@lists.=
openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">In the log files, I find<=
br>
<br>
Failed to load or import from ExtUtils::ParseXS (version 3.57). Please<br>
check that ExtUtils::ParseXS is installed correctly and that the<br>
newest version will be found in your @INC path<br>
<br>
I note that the version of libextutils-parsexs-perl provided by<br>
meta-openembeded is=C2=A0 3.35.=C2=A0 Which I guess is far out of date.<br>
Metacpan would suggest that is from a 2017 time frame.<br>
<br></blockquote><div><br></div><div>Right, you might upgrade it and also p=
ropose it to migrating into core layer=C2=A0at same time</div><div>and once=
 merged send a patch to delete it from meta-perl as well.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
Jason.<br>
<br>
On Wed, Dec 3, 2025 at 7:26=E2=80=AFAM Mathieu Dubois-Briand<br>
&lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com" target=3D"_blank">=
mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue Dec 2, 2025 at 4:10 PM CET, J. S. via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a> wrote:<br>
&gt; &gt; License-Update: Checksum changed because in the license, the phys=
ical address<br>
&gt; &gt;=C2=A0 =C2=A0of the Free Software Foundation has been exchanged fo=
r a web address.<br>
&gt; &gt;<br>
&gt; &gt; Changes in perl 5.42.0: <a href=3D"https://perldoc.perl.org/5.42.=
0/perldelta" rel=3D"noreferrer" target=3D"_blank">https://perldoc.perl.org/=
5.42.0/perldelta</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail=
.com" target=3D"_blank">schonm@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt;<br>
&gt; Hi Jason,<br>
&gt;<br>
&gt; Thanks for your patch.<br>
&gt;<br>
&gt; It looks like some selftests are now failing:<br>
&gt;<br>
&gt; AssertionError:<br>
&gt; Failed ptests:<br>
&gt; {&#39;libmodule-build-perl&#39;: [&#39;t/xs&#39;]}<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73=
/builds/2708" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/73/builds/2708</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56=
/builds/798" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/valkyrie/#/builders/56/builds/798</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61=
/builds/2664" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/61/builds/2664</a><br>
&gt;<br>
&gt; Ptest logs can be found here:<br>
&gt;<br>
&gt; <a href=3D"https://valkyrie.yocto.io/pub/non-release/20251203-49/testr=
esults/qemux86-64-ptest/core-image-ptest-libmodule-build-perl/" rel=3D"nore=
ferrer" target=3D"_blank">https://valkyrie.yocto.io/pub/non-release/2025120=
3-49/testresults/qemux86-64-ptest/core-image-ptest-libmodule-build-perl/</a=
><br>
&gt; <a href=3D"https://valkyrie.yocto.io/pub/non-release/20251203-49/testr=
esults/qemuarm64-ptest/core-image-ptest-libmodule-build-perl/" rel=3D"noref=
errer" target=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20251203=
-49/testresults/qemuarm64-ptest/core-image-ptest-libmodule-build-perl/</a><=
br>
&gt; <a href=3D"https://valkyrie.yocto.io/pub/non-release/20251203-49/testr=
esults/qemuriscv64-ptest/core-image-ptest-libgpg-error/" rel=3D"noreferrer"=
 target=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20251203-49/te=
stresults/qemuriscv64-ptest/core-image-ptest-libgpg-error/</a><br>
&gt;<br>
&gt; Can you have a look at these failures?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Mathieu<br>
&gt;<br>
&gt; --<br>
&gt; Mathieu Dubois-Briand, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#227248): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/227248" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/227248</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116577571/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116577571/1997914</a><br>
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

--000000000000d70baf0645188e5b--

