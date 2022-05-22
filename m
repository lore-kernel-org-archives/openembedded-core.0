Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82408C433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 08:48:36 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.14165.1653209311418719254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 01:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 53E888726;
	Sun, 22 May 2022 10:48:29 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.33.213]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nshGE-1bJxEP0; Sun, 22 May 2022 10:48:26 +0200
Message-ID: <1286dfdb-a0ac-67a7-a026-f95da89c35da@t-online.de>
Date: Sun, 22 May 2022 10:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
 <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
 <31d4ac7f1c8db63e0bcc2028c787dc59e30a2781.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <31d4ac7f1c8db63e0bcc2028c787dc59e30a2781.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1653209307-0000AD4E-DDC6BA3D/0/0 CLEAN NORMAL
X-TOI-MSGID: 4e93a5be-eca2-4274-85c3-4ab146b8bc7a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 08:48:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165972

Those are valid objections and I wasn't happy with how invasive the 
necessary changes were either. The reason I'm still working on it is 
that I'd really like to have an alignment for native/target for libsdl2. 
As it is, libsdl2-native unconditionally adds x11. From the perspective 
that we eventually want to reach the point where wayland/x11 becomes an 
either/or decision, I think that should be changed.

I did some cleanup and it is much less invasive now. To align 
native/target PACKAGECONFIG, only patches 1-3 are needed. 4-5 add 
pipewire and libdecor and I added them just for completeness.

The patches are made for kirkstone because I have too many problems with 
the poky master branch distracting me at the moment.

Markus

Am 21.05.22 um 09:48 schrieb richard.purdie@linuxfoundation.org:
> On Fri, 2022-05-20 at 14:46 +0200, Markus Volk wrote:
> A number of the things you're adding native versions to worry me a
> little since they're often functionality from the native system which
> we've been trying hard not to duplicate. For example, you wouldn't want
> two udevs running. Worse, it may be eudev but could also be systemd and
> the native binaries are supposed to run on both systems. Similarly, you
> wouldn't expect a build to start a local ssh server via openssh.
>
> With libpam, we'd want to be sure that the library works in a number of
> different environments.
>
> These issues are probably why you see the native PACKAGECONFIG for
> libsdl being a bit more minimal to avoid these kinds of dilemmas.
>
> I also noticed you renamed gles2 to gles and I'm not sure if that will
> catch existing users our or not.
>
> There are definitely good things in the patch, for example the removal
> of obsolete config but there are things I'm unsure about (e.g.
> pipewire, libpam) and things I do think may cause more problems than
> they solve (openssh-native and eudev-native).
>
> Cheers,
>
> Richard
>
>
>
>
>

