Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.63251.1600097570736673904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VePm50/c;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id o8so545529ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=md73isGjguq78GtgIYACwNYuBsjtWEEl+mNZ9t4fUtQ=;
        b=VePm50/c5QKbv/dh2HQ2YA5Z9Cn5Iq1R7AZtks4CEGKiG+2ANsdUCSpavDaGQYid+A
         dE0JzbVFuv3GRp/kj1ji5WskyX7x8MZvJAOb+wG6oTYX653AmLVJ/NnRBMRbCPlI1N8Q
         vzD9XxmENfkTnb3ociQpgzsukmaHIJr8nAcp8ZAzFOXRzSwR9nOWOIVYZ+3Mv5ERGIZs
         SBBTdgUcN1h7/Z986xI542DiZciQVtVIw+T4NAoNwnm2zhB1N4cXDlJz6WkoScF5LzLd
         HMCm6Nb5XBAnzLbPqgsYg48zsmEw09RX+TdvSz/sXvWgbXowHXRwP198g4PDUWYLJ9KQ
         DYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=md73isGjguq78GtgIYACwNYuBsjtWEEl+mNZ9t4fUtQ=;
        b=En8Nlgv7CoSuQJqfJDa4THQj66oG62shoVfyfCcIJ1n50u7MW6j+BSWdiDjnVq3xfX
         uNj7x/ZuhXojboz5WXfyGxhn79S7NmNumL5p3oRFnuqCfmrm0cr+SfLsVzRcfy9V5T+d
         o7VEarcGEHwnNtlNLxKniiIWhqrKvCbeTXcUT2ZhJ6EOdGls3KuyNNHqBtQ+3JzXlX5o
         TWfXdP8r1s0ailX6+CenpRRhaDtx9W/lBGv9/d69R0qhP8fBL+rbqh8KMo3ebr4dkMNK
         h3Wx/9IrRaa1NjuwnAYSYZJ2V6ryz8FBjV0+CUQenTLoPjyDdYe+MRQMBJYG6FUl18bg
         9MMQ==
X-Gm-Message-State: AOAM53103DwousmHrhqYjodcXGOjHDIIdvODwuAVyZ5pgCxLvFPSMrdS
	Q8IVvEY3z8nx4DJXRxPo+ep71csTysF4Cf72uVc=
X-Google-Smtp-Source: ABdhPJxAH3ob3Dt0dDFWFLY3107c31e/Q8l8b811Lc0jZ342aoE2uNGQodhlJixn8OoKfxpS9VzXp2ez7T7VpnW7Qek=
X-Received: by 2002:a17:906:4b18:: with SMTP id y24mr15092312eju.471.1600097569059;
 Mon, 14 Sep 2020 08:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200914151359.11240-1-jon.mason@arm.com>
In-Reply-To: <20200914151359.11240-1-jon.mason@arm.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 14 Sep 2020 17:32:37 +0200
Message-ID: <CA+chaQfAL+mvyG7smtku8za+6fvubybjjpOfu+g6dGfrJSoWJA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000035b87305af47bf6e"

--00000000000035b87305af47bf6e
Content-Type: text/plain; charset="UTF-8"

> This reduces the number of files from 12 to 2 for ARMv8a, and that is
excluding the 13 I am adding in this series that would otherwise be unique
files.

I don't have a strong opinion on this anymore, but is the number of the
include files the issue here?

I think the issue is the number of possible combinations and using the same
TUNE_PKGARCH for different tunes (unlike 32bit arm tune files which use
different). Bundling all these combinations in fewer include files doesn't
IMHO improve it.

With 32bit arm include files it was useful to be able to compare various
include files to check that they follow the same "structure" (or to add new
cortexa* one by copying existing and regex-replace).

Also AVAILTUNES will now contain all possible tunes from given family
(which makes it almost useless for aarch64 tunes). So instead of BSP
including .inc file corresponding with the core used in the MACHINE and
getting some "sane" default DEFAULTTUNE (plus some other possible options
listed in AVAILTUNES) we now force every BSP to set more
specific DEFAULTTUNE and then let user figure out what other DEFAULTTUNEs
might be compatible with it, e.g. when someone is doing multi MACHINE
builds and wants to share TUNE_PKGARCH between them (to save build time,
package feed size etc).

Cheers,

On Mon, Sep 14, 2020 at 5:14 PM Jon Mason <jdmason@kudzu.us> wrote:

> There is a large number of Arm Tune files located in
> meta/conf/machine/include/, and to support the current and upcoming Arm
> cores, more are needed.  Adding more files is simply going to make it
> harder to find the relevant ones for an OE/YP developer/user.  Also,
> there are problems with stale and erroneous configs (see my previous
> series), which will only be exacerbated by having more files.
>
> I am proposing a reorganization of the existing tune files by including
> them in the generic family include file.  For example, the
> tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> tune-cortexa57.inc would be moved into arch-armv8a.inc.  This reduces
> the number of files from 12 to 2 for ARMv8a, and that is excluding the
> 13 I am adding in this series that would otherwise be unique files.
>
> To use, simply add
> ...
> DEFAULTTUNE ?= "neoversen1"
> require conf/machine/include/arm/arch-armv8-2a.inc
> ...
>
> Which is arguably what should be done anyway (instead of taking the
> default of the tune include file).
> See the qemuarm64 patch in the series for a working example.
>
> Of course, by removing the existing tune files, current users are going
> to break.  A simple script can be written to use sed (or similar) to
> replace the relevant parts for those users that would be affected (at
> least for those that are in the layer index and update regularly).
>
> Thanks,
> Jon
>
> ---
>
> Originally sent as a RFC in
> https://lists.openembedded.org/g/openembedded-core/message/142324
>
> Given the generally positive feedback, sending as a patch series.
> Keeping the "hard fail" of the file removal (per Richards comment in
> https://lists.openembedded.org/g/openembedded-core/message/142356).
> Only difference of note is the removal of the "arm64: set BASE_LIB to
> lib64", as there needs to be more investigation (see
> https://lists.openembedded.org/g/openembedded-core/message/142414).
>
>
> Jon Mason (5):
>   arch-armv8-2a.inc: Add Cortex-A55 tunings
>   arch-armv8a.inc: Add existing tunings
>   qemuarm64: change tuning
>   arch-armv8a.inc: Add tunes for supported ARMv8a cores
>   arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores
>
>  .../machine/include/arm/arch-armv8-2a.inc     | 175 ++++++++++++++-
>  meta/conf/machine/include/arm/arch-armv8a.inc | 206 +++++++++++++++++-
>  meta/conf/machine/include/tune-cortexa32.inc  |  18 --
>  meta/conf/machine/include/tune-cortexa35.inc  |  17 --
>  meta/conf/machine/include/tune-cortexa53.inc  |  18 --
>  meta/conf/machine/include/tune-cortexa55.inc  |  13 --
>  .../include/tune-cortexa57-cortexa53.inc      |  15 --
>  meta/conf/machine/include/tune-cortexa57.inc  |  17 --
>  .../include/tune-cortexa72-cortexa53.inc      |  20 --
>  meta/conf/machine/include/tune-cortexa72.inc  |  13 --
>  .../include/tune-cortexa73-cortexa53.inc      |  20 --
>  meta/conf/machine/include/tune-thunderx.inc   |  19 --
>  meta/conf/machine/qemuarm64.conf              |   3 +-
>  13 files changed, 371 insertions(+), 183 deletions(-)
>  delete mode 100644 meta/conf/machine/include/tune-cortexa32.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa35.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa53.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa53.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa57.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa72.inc
>  delete mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa53.inc
>  delete mode 100644 meta/conf/machine/include/tune-thunderx.inc
>
> --
> 2.20.1
>
> 
>

--00000000000035b87305af47bf6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; This reduces the number of files from 12 to 2 fo=
r ARMv8a, and that is excluding the 13 I am adding in this series that woul=
d otherwise be unique files.</div><div><br></div><div>I don&#39;t have a st=
rong opinion on this anymore, but is the number of the include files the is=
sue here?</div><div><br></div><div>I think the issue is the number of possi=
ble combinations and using the same TUNE_PKGARCH for different tunes (unlik=
e 32bit arm tune files which use different). Bundling all these combination=
s in fewer include files doesn&#39;t IMHO improve it.</div><div><br></div><=
div>With 32bit arm include files it was useful to be able to compare variou=
s include files to check that they follow the same &quot;structure&quot; (o=
r to add new cortexa* one by copying existing and regex-replace).</div><div=
><br></div><div>Also AVAILTUNES will now contain all possible tunes from gi=
ven family (which makes it almost useless for aarch64 tunes). So instead=C2=
=
=A0of BSP including .inc file corresponding with the core used in the MACH=
INE and getting some &quot;sane&quot; default DEFAULTTUNE (plus some other =
possible options listed in AVAILTUNES) we now force every BSP to set more s=
pecific=C2=A0DEFAULTTUNE and then let user figure out what other DEFAULTTUN=
Es might be compatible with it, e.g. when someone is doing multi MACHINE bu=
ilds and wants to share TUNE_PKGARCH between them (to save build time, pack=
age feed size etc).</div><div><br></div><div>Cheers,</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 14, 2=
020 at 5:14 PM Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@ku=
dzu.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">There is a large number of Arm Tune files located in<br>
meta/conf/machine/include/, and to support the current and upcoming Arm<br=
>
cores, more are needed.=C2=A0 Adding more files is simply going to make it=
<br>
harder to find the relevant ones for an OE/YP developer/user.=C2=A0 Also,<=
br>
there are problems with stale and erroneous configs (see my previous<br>
series), which will only be exacerbated by having more files.<br>
<br>
I am proposing a reorganization of the existing tune files by including<br=
>
them in the generic family include file.=C2=A0 For example, the<br>
tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and<br>
tune-cortexa57.inc would be moved into arch-armv8a.inc.=C2=A0 This reduces=
<br>
the number of files from 12 to 2 for ARMv8a, and that is excluding the<br>
13 I am adding in this series that would otherwise be unique files.<br>
<br>
To use, simply add<br>
...<br>
DEFAULTTUNE ?=3D &quot;neoversen1&quot;<br>
require conf/machine/include/arm/arch-armv8-2a.inc<br>
...<br>
<br>
Which is arguably what should be done anyway (instead of taking the<br>
default of the tune include file).<br>
See the qemuarm64 patch in the series for a working example.<br>
<br>
Of course, by removing the existing tune files, current users are going<br=
>
to break.=C2=A0 A simple script can be written to use sed (or similar) to<=
br>
replace the relevant parts for those users that would be affected (at<br>
least for those that are in the layer index and update regularly).<br>
<br>
Thanks,<br>
Jon<br>
<br>
---<br>
<br>
Originally sent as a RFC in<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/1423=
24" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/message/142324</a><br>
<br>
Given the generally positive feedback, sending as a patch series.<br>
Keeping the &quot;hard fail&quot; of the file removal (per Richards commen=
t in<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/1423=
56" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/message/142356</a>).<br>
Only difference of note is the removal of the &quot;arm64: set BASE_LIB to=
<br>
lib64&quot;, as there needs to be more investigation (see<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/1424=
14" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/message/142414</a>).<br>
<br>
<br>
Jon Mason (5):<br>
=C2=A0 arch-armv8-2a.inc: Add Cortex-A55 tunings<br>
=C2=A0 arch-armv8a.inc: Add existing tunings<br>
=C2=A0 qemuarm64: change tuning<br>
=C2=A0 arch-armv8a.inc: Add tunes for supported ARMv8a cores<br>
=C2=A0 arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores<br>
<br>
=C2=A0.../machine/include/arm/arch-armv8-2a.inc=C2=A0 =C2=A0 =C2=A0| 175 +=
+++++++++++++-<br>
=C2=A0meta/conf/machine/include/arm/arch-armv8a.inc | 206 ++++++++++++++++=
+-<br>
=C2=A0meta/conf/machine/include/tune-cortexa32.inc=C2=A0 |=C2=A0 18 --<br>
=C2=A0meta/conf/machine/include/tune-cortexa35.inc=C2=A0 |=C2=A0 17 --<br>
=C2=A0meta/conf/machine/include/tune-cortexa53.inc=C2=A0 |=C2=A0 18 --<br>
=C2=A0meta/conf/machine/include/tune-cortexa55.inc=C2=A0 |=C2=A0 13 --<br>
=C2=A0.../include/tune-cortexa57-cortexa53.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 15 --<br>
=C2=A0meta/conf/machine/include/tune-cortexa57.inc=C2=A0 |=C2=A0 17 --<br>
=C2=A0.../include/tune-cortexa72-cortexa53.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 20 --<br>
=C2=A0meta/conf/machine/include/tune-cortexa72.inc=C2=A0 |=C2=A0 13 --<br>
=C2=A0.../include/tune-cortexa73-cortexa53.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 20 --<br>
=C2=A0meta/conf/machine/include/tune-thunderx.inc=C2=A0 =C2=A0|=C2=A0 19 -=
-<br>
=C2=A0meta/conf/machine/qemuarm64.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A013 files changed, 371 insertions(+), 183 deletions(-)<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa32.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa35.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa53.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa5=
3.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa57.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa5=
3.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa72.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa5=
3.inc<br>
=C2=A0delete mode 100644 meta/conf/machine/include/tune-thunderx.inc<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div>

--00000000000035b87305af47bf6e--
