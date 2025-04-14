Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29527C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 16:28:34 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.54295.1744648106831599311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 09:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l5JQ3X19;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7020d8b110aso38629647b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 09:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744648106; x=1745252906; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo5Sy0XCigqhbsKJQgQrOu2du3w3TD6Pc7oWP30sjHw=;
        b=l5JQ3X19eNwCuQYNqHYbQri0I4DpOxJik0OgTfAVdUKVJWLCMSHSzN6HD+nxE1QQ4j
         9QfxEAQ927zZyPbpd4bSEoeN1fccF6kefqZAlnw6Xwz79TfDQy79J/ihgHPSAWoqrVT5
         88TaFxpseQQ1/691xqH5y8u7/5YOcwmAPJ39DQpoGXeFRkuVbSi2/eWLIVKv2w8FvWC1
         0WjwmBwAMDyafEl1lLDPevol0ibfgObstC6g21EYTcc/izk2q8D1Ms7QQpBro39shiW+
         wMO9+5BF6eosbYr0KA0RFUWo9IO/hTG1uP2usFrZAlesrt4BBmfzjtwA4mWvN5Gag4Ss
         Ij9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744648106; x=1745252906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xo5Sy0XCigqhbsKJQgQrOu2du3w3TD6Pc7oWP30sjHw=;
        b=oVEmKGhpkXSUch0q8be7olrXYPN9fZDqjaUkzVcdOVZlfxk+nQ7wpArJXcojklUWm2
         aXGuKK2NQVj95P0Rl/b/9+Cr0yzfqfufQpWqEfy4IH+B8FThobHFoYPlmJZS4l2PWLTH
         rPtXnIvGT7i71X3Is4/OaSKkzRxnnBUMs4VCwnoyMQ+yoyuh4gc3TFmz6MbERNx49koI
         3kKZNnpZmrbJboBtI2z0Ua+zWhUo+YPAuxSD1b6MaxePlEvQ6iHoBvPG3fWvoHCVbwM1
         hM+/vQBT/BMCHvHqTttNk/7RdAAMzc4AEv3sc4QH8UIXeZZ/5efbYUMI5W+IlyJsjCuN
         SwrQ==
X-Gm-Message-State: AOJu0YyinW4DqYNki0IQMBOkVKjmuzxdbSGCIjpbCiN64veEc/CSIWNg
	zyU29raky832x8XzBsPKcZFh1oPb7flsJFecFXMMol9aCTlNvSpdsOC+JVz1JxrJ79fsd4JUfds
	nUxG6kcJEqTOGXmbSA38IKtj3xLU=
X-Gm-Gg: ASbGncv2RutkNI7y724L+0K7lgfRhOXi4twNMy3eAQA6M91OEmTYSpVlD2SKry1ZINC
	IpH4HA9wzKcPhfGQWiq+e2uZ0Bu3cAte/SggBTdDCVVng8VtB1iggLvCrKMBGZD3q/HoJi3q/Ah
	BWrZG1dwLaV5LpmRyGLOYpYYOeY/mSBy3p3A==
X-Google-Smtp-Source: AGHT+IFMs5WUD96+Cu1B+Ieo7gOBLh8Pewr56Vhnz+oCDum/bR9OMslsL78JufPLxyxM2yERCF8k2UWBfbtayq9E7hU=
X-Received: by 2002:a05:690c:640f:b0:702:46a3:4721 with SMTP id
 00721157ae682-705599cdeb9mr234797757b3.15.1744648105753; Mon, 14 Apr 2025
 09:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl>
 <Z_jy0-3v8qVSyll8@nuoska> <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
In-Reply-To: <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Mon, 14 Apr 2025 18:28:13 +0200
X-Gm-Features: ATxdqUGT754RIG9PVR1fuJWdO872FMGEbGi5h_hl0iTlqccFEliGD7EmnNMUaZ0
Message-ID: <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, mike.looijmans@topic.nl
Content-Type: multipart/alternative; boundary="0000000000009a06280632bf8a29"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 16:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214804

--0000000000009a06280632bf8a29
Content-Type: text/plain; charset="UTF-8"

Hi Mikko

Would it be possible to provide some numbers on the impact on the size of
the binaries and the additional dependencies that could be added to the
image with or without efi enabled?
I think the patch would be a very good compromise if the impact is
negligible, but otherwise the question is probably still valid.

Thank you
Adrian



Am Fr., 11. Apr. 2025 um 13:08 Uhr schrieb Mike Looijmans via
lists.openembedded.org <mike.looijmans=topic.nl@lists.openembedded.org>:

> On 11-04-2025 12:45, Mikko Rapeli wrote:
> > Hi,
> >
> > On Fri, Apr 11, 2025 at 10:40:25AM +0200, Mike Looijmans via
> lists.openembedded.org wrote:
> >> On 04-04-2025 18:29, Mikko Rapeli via lists.openembedded.org wrote:
> >>> For example genericarm64 enables "efi" in MACHINE_FEATURES
> >>> and in u-boot. Boot without "efi" in systemd works with
> >>> EFI protocols but for example efivars is not mounted at
> >>> all so various checks fail in userspace. Fix these by
> >>> enabling "efi" support by default to avoid making
> >>> it machine specific. Fixes efivars mount to
> >>> /sys/firmware/efi/efivars etc.
> >> Looks like all you need to do is include "efi" in your DISTRO_FEATURES
> for
> >> your product.
> > My product is actually oe-core and poky. Machine is genericarm64
> > which already has "efi" in MACHINE_FEATURES. I help Ross to maintain
> > this in oe-core/poky. Test target machines include qemu, TI BeaglePlay,
> > AMD KV260, AMD zcu102, rockpi4b, Synquacer etc. We plan to add
> > Qualcomm RB5 too but there is currently an issue with genericarm64
> > serial console there, some kernel driver dependency or module vs
> > built-in. I hope this gets sorted out soon.
> >
> >> You're offloading your problem onto others. If your patch gets merged,
> it
> >> would mean that I would have to devise some way to conditionally remove
> efi
> >> from the PACKAGECONFIG again.
> > Sorry but sensible defaults are not optimal for everyone. "efi" support
> > in systemd is in my opionion a good default for oe-core and poky
> > when systemd is selected as init.
> >
> > All arm and x86_64 machines in oe-core use qemu with u-boot or edk2/ovmf
> > in UEFI compatible fashion by default to test things. Yes, systemd
> > in rootfs will boot without "efi" enabled there but various checks
> > which rely on EFI interfaces can't be done since efivars is not
> > mounted.
>
> But qemu is not something that you'd find in an actual product...
>
> I feel that defaults should be based on real-life targets. None of the
> boards
> I worked with so far ever used EFI for booting. And that isn't because of
> lack
> of variance...
>
>
> > Richard already rejected making systemd machine specific by
> > enabling "efi" support via MACHINE_FEATURES. One alternative
> > could be to enable "efi" in DISTRO_FEATURES for "poky-altcfg"
> > which enables systemd as init, among other things.
>
> That's perfectly logic. If the systemd config becomes MACHINE specific,
> hundreds of other packages will also become machine specific. So using
> MACHINE_FEATURES in the systemd recipe is a big no no.
>
> >> I don't know what platforms you're targetting, but many embedded systems
> >> don't use EFI boot, and some even don't have a block device they could
> put a
> >> FAT partition on...
> > I target oe-core and poky defaults. This EFI support does not harm
> > platforms which don't have EFI firmware. Those configurations can
> > further optimise the setup including remove EFI support from systemd,
> > kernel, u-boot/edk2 etc. Many of default machine and distro features
> > and default packageconfig setups are not optimised for real products.
> > They are sensible defaults and good starting points. My argument is that
> > EFI firmware is so common as a default that support for it should
> > be enabled by default in systemd init of oe-core/poky. Upstream
> > u-boot defconfigs for all targets enable EFI support by default,
> > for example.
>
> I don't know what the "efi" config will actually produce in systemd.
> Ideally,
> one would build systemd with efi support enabled, and then decide when
> composing the image whether to include that or not. Something like adding
> "systemd-efi" to packagegroup-boot or so when MACHINE_FEATURES contains
> "efi".
>
> M.
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214732):
> https://lists.openembedded.org/g/openembedded-core/message/214732
> Mute This Topic: https://lists.openembedded.org/mt/112087523/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009a06280632bf8a29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mikko</div><div><br></div><div>Would it be possibl=
e to provide some numbers on the impact on the size of the binaries and the=
 additional dependencies that could be added to the image with or without e=
fi enabled?</div><div>I think the patch would be a very good compromise if =
the impact is negligible, but otherwise the question is probably still vali=
d.</div><div><br></div><div>Thank you</div><div>Adrian</div><div><br></div>=
<div><br></div><div><br></div><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 11. Apr. 2025 um 13:08=C2=
=A0Uhr schrieb Mike Looijmans via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;mike.looijmans=3D<a href=3D"mailto:topic.nl=
@lists.openembedded.org">topic.nl@lists.openembedded.org</a>&gt;:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 11-04-2025 12:45, Mikk=
o Rapeli wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Fri, Apr 11, 2025 at 10:40:25AM +0200, Mike Looijmans via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt;&gt; On 04-04-2025 18:29, Mikko Rapeli via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> wrote:<br>
&gt;&gt;&gt; For example genericarm64 enables &quot;efi&quot; in MACHINE_FE=
ATURES<br>
&gt;&gt;&gt; and in u-boot. Boot without &quot;efi&quot; in systemd works w=
ith<br>
&gt;&gt;&gt; EFI protocols but for example efivars is not mounted at<br>
&gt;&gt;&gt; all so various checks fail in userspace. Fix these by<br>
&gt;&gt;&gt; enabling &quot;efi&quot; support by default to avoid making<br=
>
&gt;&gt;&gt; it machine specific. Fixes efivars mount to<br>
&gt;&gt;&gt; /sys/firmware/efi/efivars etc.<br>
&gt;&gt; Looks like all you need to do is include &quot;efi&quot; in your D=
ISTRO_FEATURES for<br>
&gt;&gt; your product.<br>
&gt; My product is actually oe-core and poky. Machine is genericarm64<br>
&gt; which already has &quot;efi&quot; in MACHINE_FEATURES. I help Ross to =
maintain<br>
&gt; this in oe-core/poky. Test target machines include qemu, TI BeaglePlay=
,<br>
&gt; AMD KV260, AMD zcu102, rockpi4b, Synquacer etc. We plan to add<br>
&gt; Qualcomm RB5 too but there is currently an issue with genericarm64<br>
&gt; serial console there, some kernel driver dependency or module vs<br>
&gt; built-in. I hope this gets sorted out soon.<br>
&gt;<br>
&gt;&gt; You&#39;re offloading your problem onto others. If your patch gets=
 merged, it<br>
&gt;&gt; would mean that I would have to devise some way to conditionally r=
emove efi<br>
&gt;&gt; from the PACKAGECONFIG again.<br>
&gt; Sorry but sensible defaults are not optimal for everyone. &quot;efi&qu=
ot; support<br>
&gt; in systemd is in my opionion a good default for oe-core and poky<br>
&gt; when systemd is selected as init.<br>
&gt;<br>
&gt; All arm and x86_64 machines in oe-core use qemu with u-boot or edk2/ov=
mf<br>
&gt; in UEFI compatible fashion by default to test things. Yes, systemd<br>
&gt; in rootfs will boot without &quot;efi&quot; enabled there but various =
checks<br>
&gt; which rely on EFI interfaces can&#39;t be done since efivars is not<br=
>
&gt; mounted.<br>
<br>
But qemu is not something that you&#39;d find in an actual product...<br>
<br>
I feel that defaults should be based on real-life targets. None of the boar=
ds <br>
I worked with so far ever used EFI for booting. And that isn&#39;t because =
of lack <br>
of variance...<br>
<br>
<br>
&gt; Richard already rejected making systemd machine specific by<br>
&gt; enabling &quot;efi&quot; support via MACHINE_FEATURES. One alternative=
<br>
&gt; could be to enable &quot;efi&quot; in DISTRO_FEATURES for &quot;poky-a=
ltcfg&quot;<br>
&gt; which enables systemd as init, among other things.<br>
<br>
That&#39;s perfectly logic. If the systemd config becomes MACHINE specific,=
 <br>
hundreds of other packages will also become machine specific. So using <br>
MACHINE_FEATURES in the systemd recipe is a big no no.<br>
<br>
&gt;&gt; I don&#39;t know what platforms you&#39;re targetting, but many em=
bedded systems<br>
&gt;&gt; don&#39;t use EFI boot, and some even don&#39;t have a block devic=
e they could put a<br>
&gt;&gt; FAT partition on...<br>
&gt; I target oe-core and poky defaults. This EFI support does not harm<br>
&gt; platforms which don&#39;t have EFI firmware. Those configurations can<=
br>
&gt; further optimise the setup including remove EFI support from systemd,<=
br>
&gt; kernel, u-boot/edk2 etc. Many of default machine and distro features<b=
r>
&gt; and default packageconfig setups are not optimised for real products.<=
br>
&gt; They are sensible defaults and good starting points. My argument is th=
at<br>
&gt; EFI firmware is so common as a default that support for it should<br>
&gt; be enabled by default in systemd init of oe-core/poky. Upstream<br>
&gt; u-boot defconfigs for all targets enable EFI support by default,<br>
&gt; for example.<br>
<br>
I don&#39;t know what the &quot;efi&quot; config will actually produce in s=
ystemd. Ideally, <br>
one would build systemd with efi support enabled, and then decide when <br>
composing the image whether to include that or not. Something like adding <=
br>
&quot;systemd-efi&quot; to packagegroup-boot or so when MACHINE_FEATURES co=
ntains &quot;efi&quot;.<br>
<br>
M.<br>
<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214732): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214732" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214732</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112087523/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112087523/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com=
" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009a06280632bf8a29--

