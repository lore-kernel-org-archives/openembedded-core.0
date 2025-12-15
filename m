Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC74D5B17B
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 14:57:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50692.1765810668741366527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 06:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 5BFEvkvq211131;
	Mon, 15 Dec 2025 08:57:46 -0600
Received: from [192.168.2.103] ([192.168.2.103])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 5BFEvjvQ011135;
	Mon, 15 Dec 2025 08:57:46 -0600
Message-ID: <f8bab7af-8c4a-449a-b53d-b35433010b15@kernel.crashing.org>
Date: Mon, 15 Dec 2025 08:57:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Openembedded-architecture] [RFC] RPROVIDES and buildhistory
To: adam.blank.g@gmail.com, openembedded-core@lists.openembedded.org
Cc: openembedded-architecture@lists.openembedded.org
References: <CAFAffzy_4x6VYuFvjqavkhZ746xKaRC6Yf1fZ=Lkrv2bvQP=XA@mail.gmail.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAFAffzy_4x6VYuFvjqavkhZ746xKaRC6Yf1fZ=Lkrv2bvQP=XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 14:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227738



On 12/14/25 11:56 AM, Adam Blank via lists.openembedded.org wrote:
> I've recently come across a problem, which has apparently been around for a long 
> time, and yet has somehow remained unnoticed.
> 
> Facts:
> - bash and busybox recipes conditionally (based on usrmerge in the 
> DISTRO_FEATURES) declare some RPROVIDES
> - what they declare in RPROVIDES are actually file paths - e.g. '/bin/sh', 
> '/bin/ash' or '/bin/bash'
> - resulting entries in their packagedata are "correct" - i.e. 'RPROVIDES = 
> /bin/sh /bin/bash'
> - resulting entries in their buildhistory are mangled - i.e. 'RPROVIDES = bib 
> bin bash sh'
> 
> Thesis:
> - such entries in RPROVIDES (or any other package namespace related variable) 
> are an error (at least looking at what insane.bbclass deems an acceptable 
> package name)
> - buildhistory should be consistent in its processing of package names with 
> packagedata
> 
> I'd like to ask for your comments as to what would be the best way to approach 
> this. My view would be to fix the recipes, the buildhistory.bbclass but also 
> make sure that all package related variables are guarded in equal degree in all 
> relevant stages (e.g. in the insane.bbclass).

I don't believe this is an error.  When packages are processed, any scripts are 
evaluated to determine what they require to be run.

A LARGE number of package have:

#! /bin/bash
#! /bin/sh

and other values, which are inserted into the RDEPENDS for that file/package.

Normally these values are resolved by the package manager to the list of files 
installed.  Something installs /bin/bash, so it must then provide /bin/bash.

HOWEVER, there are two cases where this is not true.  The first is with "update 
alternatives", /bin/sh for instance isn't supplied directly, but bash (and other 
posix shells) can be listed as the 'alternative' for /bin/sh.  So something in 
the system says "I supply /bin/sh, even though I don't actually have the _file_ 
/bin/sh."  (This is usually the ash package BTW.)

The second case is the one you are asking about, usrmerge.  In the case of 
usrmerge, the files live in /usr/bin, not /bin.  So the package manager has no 
way to know that '/usr/bin/sh' satisfies '/bin/sh'.  So we require a manual 
RPROVIDE for this case.

(/usr/bin/env is another common RDEPENDS.  So even if usrmerge were reversed, 
all of the file installed into /bin and /sbin, instead of /usr/bin and /usr/sbin 
the same issue would be occurring.)

> Thanks,
> Adam
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2210): https://lists.openembedded.org/g/openembedded-architecture/message/2210
> Mute This Topic: https://lists.openembedded.org/mt/116779688/3616948
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

