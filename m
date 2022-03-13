Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66ACDC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 16:24:36 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.16375.1647188674501256630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 09:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout07.t-online.de (Postfix) with SMTP id 73D2617679;
	Sun, 13 Mar 2022 17:24:30 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.13]) by fwd77.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nTR19-26OCpN0; Sun, 13 Mar 2022 17:24:27 +0100
Message-ID: <3b240596-ca62-1bb6-1e56-d4478bf10436@t-online.de>
Date: Sun, 13 Mar 2022 17:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [meta-oe][PATCHv2] mesa: update to 22.0.0
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20220311172010.2490948-1-f_l_k@t-online.de>
 <0abd18c8268323c953e66ac12185de8641a37ac0.camel@linuxfoundation.org>
 <7RWL8R.KIOTTKEBL4AT2@t-online.de>
 <ad0bfaa3e9c8700ce92ffa524196a1a0d4aa09c9.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <ad0bfaa3e9c8700ce92ffa524196a1a0d4aa09c9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647188667-0001606D-7DB0A5D1/0/0 CLEAN NORMAL
X-TOI-MSGID: 08845412-928e-4194-8ff1-0c90724f0359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 16:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163113


Am 13.03.22 um 13:40 schrieb Richard Purdie:
> The autobuilder ran into similar issues. The problem was the loss of "dri" from
> the PACKAGECONFIG which triggers the RPROVIDES of libgl. I was able to fix it
> with the addition of:
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 503a7efba5..2a89b8e8f0 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -227,7 +227,7 @@ python __anonymous() {
>       if "-native" in d.getVar("PN"):
>           suffix = "-native"
>       for p in (("egl", "libegl", "libegl1"),
> -              ("dri", "libgl", "libgl1"),
> +              ("opengl", "libgl", "libgl1"),
>                 ("gles", "libgles1", "libglesv1-cm1"),
>                 ("gles", "libgles2", "libglesv2-2"),
>                 ("gles", "libgles3",)):
>
>
> Cheers,
>
> Richard
>
>
Ah, thank you. I overlooked that. It's always a good feeling to know why 
something is happening.

