Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC75AC77B7A
	for <webhook@archiver.kernel.org>; Sat,  3 Jun 2023 17:52:16 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.2218.1685814728884220074
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jun 2023 10:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 0C869230A;
	Sat,  3 Jun 2023 19:52:06 +0200 (CEST)
Received: from [192.168.178.156] ([84.163.44.93]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q5VQ5-2RUZWq0; Sat, 3 Jun 2023 19:52:05 +0200
Date: Sat, 03 Jun 2023 19:51:59 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <NYUOVR.OW8C8JU503CT2@t-online.de>
In-Reply-To: 
	<0718565165c8175882355d0674588f71c36b8bb7.camel@linuxfoundation.org>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	<20230527133252.284132-2-f_l_k@t-online.de>
	<17635252DFD4EDDE.6918@lists.openembedded.org>
	<CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
	<VDGDVR.YBUKQ953M2TP3@t-online.de>
	<CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
	<POIDVR.URDIMNIKV0SE3@t-online.de>
	<CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
	<MEJDVR.WDZW7MFB3W9N1@t-online.de>
	<CANNYZj_-ptiJqvmf+cU0qV7VkKG0ds=guN9aTU1VirjcG8WjQA@mail.gmail.com>
	<7bb5f101af77af3a051a1b049206800aec542ccd.camel@linuxfoundation.org>
	<ZG5FVR.L4YKBKAES08S3@googlemail.com>
	<0718565165c8175882355d0674588f71c36b8bb7.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HP/ZZyhtekvoJ4EldFEc"
X-TOI-EXPURGATEID: 150726::1685814725-195BBE62-B5BBB8D7/0/0 CLEAN NORMAL
X-TOI-MSGID: bfd14201-e692-4a0b-a646-569f26b1ffa2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jun 2023 17:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182351

--=-HP/ZZyhtekvoJ4EldFEc
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 29. Mai 2023 um 13:34:40 +0100 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> I'm going to revert those changes and then we can work out the correct
> fix without any time pressures (and then I won't need to keep this on
> my 'need to do something about' mental checklist!).

I had some time to look at this problem. virtual/crypt-native is not 
installed into recipe-sysroot-native because of this entry in 
bitbake.conf:
ASSUME_PROVIDED = "virtual/crypt-native"

Removing the entry solved the issue for me. I could successfully build 
core-image-minimal for musl and glibc without crypt.h from host machine.

But I don't know the reason why this is ASSUME_PROVIDED, so I'm unsure 
if this should even be touched.

In a second step I created a musl-native recipe to be able to install 
musl crypt.h into recipe-sysroot-native, but I'm not sure if this is 
necessary either.

<https://github.com/MarkusVolk/openembedded-core/commits/virtual/crypt-native>


--=-HP/ZZyhtekvoJ4EldFEc
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 29. Mai 2023 um 13:34:40 +0100 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I'm going to revert those changes and then we can work out the correct
fix without any time pressures (and then I won't need to keep this on
my 'need to do something about' mental checklist!).</div></blockquote><div><br></div><div><div>I had some time to look at this problem. virtual/crypt-native is not installed into recipe-sysroot-native because of this entry in bitbake.conf:</div><div>ASSUME_PROVIDED = "virtual/crypt-native"</div><div><br></div><div>Removing the entry solved the issue for me. I could successfully build core-image-minimal for musl and glibc without crypt.h from host machine.</div><div><br></div><div>But I don't know the reason why this is ASSUME_PROVIDED, so I'm unsure if this should even be touched.</div><div><br></div><div>In a second step I created a musl-native recipe to be able to install musl crypt.h into recipe-sysroot-native, but I'm not sure if this is necessary either.</div></div><div><br></div><div><a href="https://github.com/MarkusVolk/openembedded-core/commits/virtual/crypt-native">https://github.com/MarkusVolk/openembedded-core/commits/virtual/crypt-native</a></div></div>
--=-HP/ZZyhtekvoJ4EldFEc--


