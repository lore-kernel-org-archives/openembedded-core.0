Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625ACC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 12:44:41 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.82213.1675773873123874545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 04:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 729D91DE2D;
	Tue,  7 Feb 2023 13:44:29 +0100 (CET)
Received: from [192.168.178.83] ([84.163.46.4]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pPNKm-24RUMC0; Tue, 7 Feb 2023 13:44:28 +0100
Message-ID: <99d5f811-e365-7b63-7f07-82ebfe5a5d5f@t-online.de>
Date: Tue, 7 Feb 2023 13:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe-core][PATCHv2] wic-imager-direct.py: use fstab update also
 for root device
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
 Felix Moessbauer <felix.moessbauer@siemens.com>, henning.schild@siemens.com,
 luca.ceresoli@bootlin.com, richard.purdie@linuxfoundation.org,
 ross.burton@arm.com, tobiasschmidl@siemens.com
References: <20220930041807.2509199-1-f_l_k@t-online.de>
 <Yzd3sgaUonex6igX@mail.local> <OHQFJR.BSWQE91JLN3H@t-online.de>
 <Y0F1GfFyeQfLRJcW@mail.local>
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <Y0F1GfFyeQfLRJcW@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1675773868-AB7F2DFF-2C8FFC30/0/0 CLEAN NORMAL
X-TOI-MSGID: 2a72bb26-2549-45f8-a072-b6ab34140068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 12:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176814

I recently stumbled across this patch again and thought about possible 
pitfalls once more. I can't check the overlayfs selftest unfortunately. 
When I start it, it takes a long while and then 7 tests are successful 
and 6 are missing with 'qemu ended unexpectedly'. Regardless of whether 
I apply this patch. Probably my host system is missing something more 
basic for the qemu tests. I am not very knowledgeable about this.

But what I could imagine if the test still fails is that it might help 
to remove '--use-uuid' from meta-selftest/wic/overlayfs_etc.wks.in.

I will send another attempt for this and try to contact everyone who has 
dealt with the problem so far.

Am 08.10.22 um 15:03 schrieb Alexandre Belloni:
> On 08/10/2022 14:53:48+0200, Markus Volk wrote:
>> Am Sa, 1. Okt 2022 um 01:11:46 +0200 schrieb Alexandre Belloni via
>> lists.openembedded.org
>> <alexandre.belloni=bootlin.com@lists.openembedded.org>:
>>> This causes the following failure:
>>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4140/steps/14/logs/stdio>
>> Hi Alexandre,
>>
>> I've looked at the problem and can reproduce the errors when I run
>> 'oe-selftest -v -r overlay-fs', but unfortunately I can't really see what
>> exactly the problem is. qemu just ends unexpectedly and doesn't give much
>> useful information in its output. At least I am not able to find it.
>>
> The issue is probably that one:
> AssertionError: None is not true : diff: can't stat '/data/overlay-etc/lower/lower-layer-test.txt': No such file or directory
>
> is /data in /etc/fstab?
>

