Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4822DCA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 13:35:12 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.9702.1755783309690465635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 06:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N/L0nJHH;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e95075d60b6so738173276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755783309; x=1756388109; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r65Zne6UKnDYQIthroU0G/OJ1fE8Mn87G0mIMnT6Ykk=;
        b=N/L0nJHHqPQLdfS238QYXNdCbaya37JHBgLdKt5JQYp1SDE+Xk8ZPEZ6Tp6iarW4PI
         5yZhnXWyCXcUA+hZ5WvEJoJrvSuGDDts8qeS+i95+5DWBziOnwrAEHvYOCPq0bTpY4IU
         DK2YIhdEWmwopB2djxHWxwUJ2dzqy7WDZMWtMS21ZyaZ7ON2NfHMZMaEgKt3+fenUiV2
         86GIKdXFQRkyqZAEoDOUx8gDnu3uGyQTRbS32gmB047IhELGNWpqzUmisA8UeEDM3r6F
         itPBlU87oCvBACstRwqOw8Z422fFSlz31ik4gUwtWt+bVEDj0xnuTH99dDdH2Lh08uCE
         26rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783309; x=1756388109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r65Zne6UKnDYQIthroU0G/OJ1fE8Mn87G0mIMnT6Ykk=;
        b=MHkZ1pKajHO1/CWFmeJTEILkRDp3OASgQLNqP2Z2kImzaS64v9qb0ZxcLX48B6wRvO
         j2mpzB5kTCumtN1DxWT3z+h74n5obWzqS96MuTaL9HRM9qVo6I0ID/iER2y+z5iRZBc7
         dq07dawXewLZSExQOCDPN5N1pPyJsERHByiARDhDumpFwEYanGiAB88oroC8R6UFQKJK
         jzBmsZRMhubft/DQx/8PTLGRGu92bhVM/ViM5o1gSst1mhfpjWmJ4OirdwIKRsLVHZ6f
         75fGULqmBsZPCCOv6PAASLQj7uhRqauO1dIv8eMM5y/VYXfnVDDSPMHP2bN+qA9dLO1y
         AC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXilbvqSXIbk9b7pp0jbIlXgCOD/T9dRMEF2rcnr/D3pgvDeZZom+iraEXk6kgic7nxCEM96Wib93joEPnN1AgQGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6YqbMnhore4dWTzH36DMqXsKIdYtoyW7cymRAYw9R51k3bv/P
	3lf+tsRBEqMyQtXIV9Obdz2VY1hFXz2qSf9AZYs7pOXZai2BTxlW4gOJaGfb/LVSre3mGDSguEt
	sm4vtnZE65cye7BTceCRh3i6mtL7bUc0=
X-Gm-Gg: ASbGncvRcGRRCJ8sB57953r50gh5Wz1DUn3gMtd3qFYUCZTZMoLM/fKQ6B/oKmSoS5q
	bvrYsF3vJo8zOOpvO3kyEg2jS5FNF5Uti+dxfO6jAVXSOPed26HQ5x/mwDZuhzJSXSvAfnpRpbb
	+6z8atLhlgm2whiEJkrLZD5t7abtDMFoCXpjfXcJ+sbwIQh3o2wy9FRKOXMObIZqvWT8BAO9G+z
	dZQ0R/hI5vFkE/OeeU/467owgntBjlw+j29EZhXtfjLEbnu6CI=
X-Google-Smtp-Source: AGHT+IH7KhdcCzrLcp4jpEvx1mlNpvJXezJ+GW4DXjsraKcp2UvZoNwUr0sSAwGNTnVwDEKj9cD+YhM7igY1fA5bocw=
X-Received: by 2002:a05:6902:1108:b0:e93:326b:5391 with SMTP id
 3f1490d57ef6-e95088dafa1mr2863449276.5.1755783308600; Thu, 21 Aug 2025
 06:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250820132929.2644708-1-ross.burton@arm.com> <DC7ZDLOTYSQS.1SA72YH1CS6UT@bootlin.com>
In-Reply-To: <DC7ZDLOTYSQS.1SA72YH1CS6UT@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Aug 2025 06:34:56 -0700
X-Gm-Features: Ac12FXxnyKFF4i2eFOCdz3o494wDXzxOQy-Ypb1JsYPutDB_dEatHtz5S6l9dkE
Message-ID: <CAMKF1srWP1Jsf5CgzMVT4puh1x+NWn4+WAS3ZN-B9a+7mMZnzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe cleanup
To: mathieu.dubois-briand@bootlin.com
Cc: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000069694e063ce0283d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 13:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222239

--00000000000069694e063ce0283d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 1:59=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> wrote:

> On Wed Aug 20, 2025 at 3:29 PM CEST, Ross Burton via
> lists.openembedded.org wrote:
> > - There is no need for python3native, as this recipe doesn't depend on
> >   other python modules.
> >
> > - Inherit lib_package so the llvm-spirv binary is in a separate package
> >   to the libLLVMSPIRVLib.so library.
> >
> > - Remove obsolete CMake options that no longer appear to be required.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
>
> Hi Ross,
>
> It looks like we have a reproducibility issue:
>
> AssertionError: The following deb packages are different and not in
> exclusion list:
>
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/libllvmspirvlib-dbg_20.1.4-r0_amd64.deb
>
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/libllvmspirvlib20.1_20.1.4-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
>
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/ipk/./x86-64-v3/libllvmspirvlib-dbg_20.1.4-r0_x86-64-v3.ip=
k
>
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/ipk/./x86-64-v3/libllvmspirvlib20.1_20.1.4-r0_x86-64-v3.ip=
k
> The following rpm packages are different and not in exclusion list:
>
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/libllvmspirvlib-dbg-20.1.4-r0.x86_64_v3.rp=
m
>
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/rpm/./x86_64_v3/libllvmspirvlib20.1-20.1.4-r0.x86_64_v3.rp=
m
>
>
> http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250821-1clwvk91=
/packages/diff-html/
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2325
>

I think we still need RPATH_SKIP option

>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222224):
> https://lists.openembedded.org/g/openembedded-core/message/222224
> Mute This Topic: https://lists.openembedded.org/mt/114799103/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000069694e063ce0283d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Aug 21, 2025 at 1:59=E2=80=AFAM Mathieu Dubois=
-Briand via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;mathieu.dubois-briand=3D<a href=3D"mailto:bootlin.com@lists.opene=
mbedded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Wed Aug 20, 2025 at 3:29 PM CEST, Ross Burto=
n via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; - There is no need for python3native, as this recipe doesn&#39;t depen=
d on<br>
&gt;=C2=A0 =C2=A0other python modules.<br>
&gt;<br>
&gt; - Inherit lib_package so the llvm-spirv binary is in a separate packag=
e<br>
&gt;=C2=A0 =C2=A0to the libLLVMSPIRVLib.so library.<br>
&gt;<br>
&gt; - Remove obsolete CMake options that no longer appear to be required.<=
br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Ross,<br>
<br>
It looks like we have a reproducibility issue:<br>
<br>
AssertionError: The following deb packages are different and not in exclusi=
on list:<br>
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libllvmspirvlib-dbg_20.1.4-r0_amd64.deb<br>
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libllvmspirvlib20.1_20.1.4-r0_amd64.deb<br>
The following ipk packages are different and not in exclusion list:<br>
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/libllvmspirvlib-dbg_20.1.4-r0_x86-64-v3.ipk<=
br>
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/libllvmspirvlib20.1_20.1.4-r0_x86-64-v3.ipk<=
br>
The following rpm packages are different and not in exclusion list:<br>
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libllvmspirvlib-dbg-20.1.4-r0.x86_64_v3.rpm<=
br>
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/libllvmspirvlib20.1-20.1.4-r0.x86_64_v3.rpm<=
br>
<br>
<a href=3D"http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250821=
-1clwvk91/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">http://=
valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250821-1clwvk91/packages=
/diff-html/</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/buil=
ds/2325" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/37/builds/2325</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think we still=
 need RPATH_SKIP option=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Best regards,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#222224): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/222224" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/222224</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114799103/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114799103/1997914</a><br>
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

--00000000000069694e063ce0283d--

