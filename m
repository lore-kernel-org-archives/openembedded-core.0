Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F756C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:46:52 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.8245.1653050810604822788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 57B8E19019;
	Fri, 20 May 2022 14:46:48 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.173.254]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ns21n-0eyHo10; Fri, 20 May 2022 14:46:48 +0200
Message-ID: <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
Date: Fri, 20 May 2022 14:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220519184315.1e91b017@melee>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1653050808-00010BFA-5CB03BB3/0/0 CLEAN NORMAL
X-TOI-MSGID: a459ea2a-a4f0-48e0-8510-704de802dcb3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:46:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165933

i have started here locally to resolve all dependencies to be able to=20
build pipewire-native. Besides I tried to untie the node when building=20
libpam-native, because otherwise I can't compile openssh-native either.=20
All in all, the changes were more invasive than I had hoped. Quite some=20
recipes needed to be added for native and I'm not sure if anything got=20
broken in the process. In any case, RFC.=C2=A0 Test-wise, I ran -c=20
populate_sdk for my full image with about 13500 tasks. I had a problem=20
with nativesdk-cairo and had to disable a runtime test. But that was=20
related to the meson buildsystem. On the bright side, I otherwise had no=20
issues with building nativesdk and the changes also solved some of my=20
problems. nativesdk-libdecor-dev was created just fine here.

Since this is all very experimental and even unsure if this should end=20
up in core, editing the maintainer for libdecor still has time. For=20
libusb1 I added a PACKAGECONFIG option and a comment what you want to=20
enable it for. I'll send an updated patchset because it might be=20
interesting for some to experiment with it.

I also had to make some changes in meta-openembedded. I send these=20
patches to openembedded-devel

Markus

Am 19.05.22 um 18:43 schrieb Luca Ceresoli:
> And also this warning:
>
> WARNING: Nothing RPROVIDES 'nativesdk-libdecor' (but
> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/me=
ta/recipes-graphics/libdecor/libdecor_0.1.0.bb
> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
> 'nativesdk-libdecor' NOTE: Runtime target 'nativesdk-libdecor' is
> unbuildable, removing... Missing or unbuildable dependency chain was:
> ['nativesdk-libdecor'] WARNING: Nothing RPROVIDES
> 'nativesdk-libdecor-dev' (but
> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/me=
ta/recipes-graphics/libdecor/libdecor_0.1.0.bb
> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
> 'nativesdk-libdecor-dev' NOTE: Runtime target 'nativesdk-libdecor-dev'
> is unbuildable, removing... Missing or unbuildable dependency chain
> was: ['nativesdk-libdecor-dev']

