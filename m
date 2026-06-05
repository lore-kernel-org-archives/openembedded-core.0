Return-Path: <philmd@mailo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2600CD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 06:35:39 +0000 (UTC)
Received: from mailo.com (mailo.com [213.182.54.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2621.1780641335657496573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailo.com header.s=mailo header.b=o6EBsfWP;
 spf=pass (domain: mailo.com, ip: 213.182.54.11, mailfrom: philmd@mailo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailo.com; s=mailo;
	t=1780641314; bh=qRiYEAcai5x2hAwgLHgaC3xveb0INDMB7037hi8xah4=;
	h=X-EA-Auth:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=o6EBsfWPzv1DW4lgBacPW3uNv9kjbFmeWXuDn94w2Sl56tmD3v+vQFx2MpYkSVRam
	 oXMATuToRl9AkYv1T1bapiFJAQYpLEyyyFOP+fzcVX2EUdF3UDiElfpu/X5mZ8g93V
	 ItpcYCZVeciXi06P++Yeg3bs2G3oB3EoF80AQOGs=
Received: by be1-1.in.mailobj.net [192.168.91.11] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Fri,  5 Jun 2026 08:35:14 +0200 (CEST)
X-EA-Auth: tE8NQjtYwmBjbYjsEFGSF1783zsObbQYQii8p0uuzpc9d/Yson/VFlQ49hmKY5LX7gMKLOA0s7xVzE0Bgv9LXXuTMnzEIOU/
Message-ID: <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com>
Date: Fri, 5 Jun 2026 08:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: ui: Regression calling eglInitialize() since v11.0.0
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
 <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com>
 <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Content-Language: en-US
In-Reply-To: <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 06:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238141

On 29/5/26 18:29, Alexander Kanavin wrote:
> On Fri, 29 May 2026 at 18:10, Quan Sun via lists.openembedded.org
> <Quan.Sun=windriver.com@lists.openembedded.org> wrote:
>> This is likely a real QEMU 11.0 regression, but may not be in QEMU's
>> code itself.  The QEMU 11.0 likely changed its display initialization to
>> be multi-threaded or reordered it, triggering a race condition in the
>> host's Wayland/EGL/Mesa stack. Maybe setting SDL_VIDEODRIVER=x11 could
>> solve the issue.
>>
>> This issue is different from the "glx: failed to create dri3 screen /
>> failed to load driver: vgem error" seen earlier, which was a missing GPU
>> driver issue on the host.
>>
>> If you have any detailed logs, please share with me and so I have more
>> contexts.
> 
> It's the same issue, I assure you. Qemu 10.x prints nothing and simply
> starts, while qemu 11.x first tries glx/dri3 , then wayland/egl/vgem
> (even though there's no wayland running on the build hosts), and then
> finally crashes, with the traceback that RP provided.
> 
> I don't think it's a race condition, as the failure is deterministic,
> but I agree that something has changed in qemu's GL initialization
> sequence.

Cc'ing Marc-André & Akihiko

Context:

https://lore.kernel.org/openembedded-core/7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org/

> Unfortunately there are no more detailed logs than this. We've
> considered disabling this test, as accelerated rendering directly into
> gtk/sdl windows is tricky to support, complicated to reproduce (with
> regressions like this), and has limited use. I've promised RP to write
> up a proposal to oe-architecture, and I'll get to it :)
> 
> Alex
> 




