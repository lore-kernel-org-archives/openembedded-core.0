Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8DEC636F8
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web09.18424.1650115869053612594
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 06:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout11.t-online.de (Postfix) with SMTP id 68A9B390C
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:31:07 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.170.52]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nfiVz-1umImv0; Sat, 16 Apr 2022 15:31:03 +0200
Message-ID: <df0adffa-18c4-fdf1-008b-6fd1a8d1265a@t-online.de>
Date: Sat, 16 Apr 2022 15:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] Intermittent failure issue summary
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: 
 <d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1650115863-000116DC-C343B647/0/0 CLEAN NORMAL
X-TOI-MSGID: 753700b9-cff6-45ac-a17f-5c858f058e32
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164542

the systemd issue could be this ?

https://github.com/systemd/systemd/pull/22552/commits/de90700f36f2126528f7ce92df0b5b5d5e277558

Am 16.04.22 um 12:26 schrieb Richard Purdie:
> I'm guessing a lot of people don't follow the intermittent issues. I therefore
> thought I'd share a summary of some of them along with some random thoughts on
> them. There is a mix of different things here, each needing different skills.
>
> Systemd daemon-reload unit restart failures:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14787
> AlexK has got part way in figuring out the circumstances of this, any systemd
> experts able to spot what I think is a service file dependency issue?
>
> EFI Boot Failure:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14018
> "oe-selftest - efibootpartition.GenericEFITest.test_boot_efi selftest"
> Does anyone know the EFI boot process and know what logging we might add to the
> system so we gain more insight when this happens?
>
> Bitbake parsing error:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14665
> "Parsing recipes...ERROR: ParseError in None: Not all recipes parsed, parser
> thread killed/died? Exiting" - I just can't spot the logic bug causing this
> error (and some similar variants), maybe someone else can?
>
> sstate files not found:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14775
> For this one I think we need to write a standalone replica of the tests against
> an sstate mirror that sstate.bbclass runs to check if sstate objects exist. That
> way we could try different load levels against the project server and see
> whether it is the sstate/fetcher code (which does weird things with threads and
> concurrent connections) or if it is the server side of things that has some
> limit we can't spot.
>
> pseudo do_flush_pseudodb task error:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14654
> not sure why this sometimes happens, like need to sport the race in the pseudo
> shutdown code.
>
> Memory resident bitbake PR Serv issue:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14786
> This is one of the blocking issues on moving to memory resident bitbake by
> default
>
> x86 boot log serio/CD drive timeout in qemu:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14743
> We've talked about disabling some of the peripherals we don't need/care about
> such as psmouse and the CD drive. Anyone fancy digging into this with upstream
> qemu? I suspect there are other people who'd like this too.
>
> Bitbake Server timeout:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14201
> This one really needs a rework of bitbake's main loop with a new thread so that
> the UI and server can talk even when whatever it is doing (parsing, event
> handlers) is blocked. No takers?! Just thought I'd add to the list! :)
>
>
> These are 8 of the issues and probably the most frequent/annoying or ones where
> there is a clearish path forward. The full list of 57:
>
> https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT
>
> (it was over 70 at one point, we've beaten it down a bit)
>
> Cheers,
>
> Richard
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164532): https://lists.openembedded.org/g/openembedded-core/message/164532
> Mute This Topic: https://lists.openembedded.org/mt/90503262/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

