Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DD8C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:50:24 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.31513.1654519813972333123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 930226334;
	Mon,  6 Jun 2022 14:50:11 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.47.168]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nyCBJ-2YCLTd0; Mon, 6 Jun 2022 14:50:06 +0200
Message-ID: <af22fea5-01ac-7eb6-271c-487a86e23758@t-online.de>
Date: Mon, 6 Jun 2022 14:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCHv2 4/6] libsdl2: dont mix opengl and gles backends
 for wayland
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220604053028.4682-1-f_l_k@t-online.de>
 <20220604053028.4682-4-f_l_k@t-online.de>
 <d82cc562394b4cd74a3fedc53e6b41f7bb053f81.camel@linuxfoundation.org>
 <d5887223-b996-cd38-3fd2-b2e04d51ff90@t-online.de>
 <9dac6561419afa5777a01d1acbad52a623296d4f.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <9dac6561419afa5777a01d1acbad52a623296d4f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1654519806-0143C329-D70F7AC6/0/0 CLEAN NORMAL
X-TOI-MSGID: 0154374b-fd36-4f38-898b-4ee4974a325e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:50:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166625

I've read the error report for mingw build and did some tests yesterday.

Added meta-mingw to bblayers.conf and this to local.conf

SDKMACHINE="x86_64-mingw32"
DISTRO_FEATURES:remove = "x11"

and then did 'bitbake core-image-minimal -c do_populate_sdk'

This lead to the expected error message

| Checking whether type "fd_set" has member "fds_bits" : NO
| Checking whether type "fd_set" has member "__fds_bits" : NO
|
| ../xorgproto-2022.1/include/X11/meson.build:19:4: ERROR: Problem 
encountered: Your fd_set is too weird.
|
| A full log can be found at 
/home/flk/build/poky/build/tmp/work/x86_64-nativesdk-mingw32-w64-mingw32/nativesdk-xorgproto/2022.1-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed

I was able to fix this by changing the libsdl2.bbappend in meta-mingw 
like this:

PACKAGECONFIG:remove:mingw32:class-nativesdk = "x11 opengl gles2"

Like this libsdl2 doesn't try to build in gl for wayland either and my 
build succeeded.

I sent a patch to openembedded-devel for this yesterday.

In general, I think it's a matter of perspective. The current state 
forces me to request x11 globally and thus prevents me from deciding 
within recipes what to do for wayland and what to do for x11 
DISTRO_FEATURE. They always have to come in pairs. I thought that from 
wayland's point of view it would be ok to include and use x11, although 
it should not be done by default. I understand your concerns about 
losing the clean line when mixing x11/Wayland, and it was just an idea. 
If you don't like it, I have no problem with it.

Am 06.06.22 um 13:30 schrieb Richard Purdie:
> that isn't the issue.
>
> The challenge is you've changed the configuration and dependencies of
> libsdl and these new dependencies don't build on mingw. We need to
> correct either the configuration of mingw buildss (wrt
> DISTRO_FEATURES), or rethink the issues at hand here.

