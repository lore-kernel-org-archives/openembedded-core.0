Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D506C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 14:35:14 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.88170.1718721310730353006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 07:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 45IEX2k3017649;
	Tue, 18 Jun 2024 09:33:03 -0500
Received: from [192.168.2.37] ([192.168.2.37])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 45IEX16x009104;
	Tue, 18 Jun 2024 09:33:01 -0500
Message-ID: <12a0304b-5ccf-433f-82bb-d246c6123c32@kernel.crashing.org>
Date: Tue, 18 Jun 2024 09:33:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-security] The future of
 meta/conf/distro/include/cve-extra-exclusions.inc
Content-Language: en-US
To: Andrew Murray <amurray@thegoodpenguin.co.uk>, rybczynska@gmail.com
Cc: yocto-security@lists.yoctoproject.org,
        OE-core <openembedded-core@lists.openembedded.org>,
        Ross Burton <ross.burton@arm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Steve Sakoman <steve@sakoman.com>
References: <CAApg2=Se=zVM47pFHWfMsNpKJ++L9tAbihFNkER-wS3ZadxfZg@mail.gmail.com>
 <CALqELGxucTijw35nd1-WTHdvOQkgpiTLJ6+U_ndTfmwAZnEziw@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CALqELGxucTijw35nd1-WTHdvOQkgpiTLJ6+U_ndTfmwAZnEziw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 14:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200873



On 6/18/24 9:21 AM, Andrew Murray wrote:
> Hi Marta,
> 
> On Tue, 18 Jun 2024 at 14:55, Marta Rybczynska via
> lists.yoctoproject.org <rybczynska=gmail.com@lists.yoctoproject.org>
> wrote:
>>
>> Hello all,
>> During the cve-check work, the cve-extra-exclusion.inc file is causing difficulties. It is a global place for all CVEs, without linking them to the recipe or package affected. When we do not generate the CVE data at build, we have no information which of those ignores apply to each recipe - and we get the whole list for every single package...
>>
>> What about suggesting everyone to put CVE_STATUS by default in the affected recipe, and not in that file?
> 
> I guess the reason cve-extra-exclusions.inc exists in the first place
> is indicated by this comment in the file:
> 
> "# The file is not included by default since users should review this
> data to ensure
> # it matches their expectations and usage of the project."
> 
> And the original commit:
> 
> "    The preferred methods for CVE resolution are:
> 
>      1. Version upgrades where possible
>      2. Patches where not possible
>      3. Database updates where version info is incorrect
>      4. Exclusion from checking where it is determined that the CVE
>         does not apply to our environment
> 
>      In some cases none of these methods are possible. For example the
>      CVE may be decades old with no apparent resolution, and with broken
>      links that make further research impractical. Some CVEs are vauge
>      with no specific action the project can take too.
> 
>      This patch creates a mechanism for users to remove this type of
>      CVE from the cve-check results via an optional include file.
> 
>      Based on an initial patch from Steve Sakoman <steve@sakoman.com>
>      but extended heavily by RP.
> "
> 
> I interpret this as: we've decided to ignore some CVEs because they
> don't seem possible to patch and aren't relevant, but we recommend
> that our users review this because these may be contentious.
> 
> I think we should move any non-contentious CVEs ignores to the
> relevant packages, forget about the remainder of the CVEs in the file,
> and then retire use of the file.

I agree with this.  The CVEs really need to be handled within the context of the 
recipe(s) themselves now.

We've moved from 'project wide CVE info' to 'component specific CVE info', and 
the component level really is an individual recipe namespace.

--Mark

> People that build products based on Yocto that care about
> vulnerabilities will likely have a means to monitor vulnerabilities
> going forward (e.g. Yocto's own cve-check combined with CVE_STATUS -
> or a third party), as part of that process they'll have a means to
> ignore CVEs that they don't care about. If there is any question of
> whether a CVE should be ignored then let's leave that to the user.
> They'll have to go through a list of unresolved CVEs anyway, so the
> few in cve-extra-exclusions doesn't seem like a problem to me.
> 
> If we're too keen on ignoring CVEs (and ignore something an end user
> may wish to not ignore), then you'll make more work for the end user
> as they'll want to vet the CVE_STATUS ignores already made by the
> Yocto project to gain confidence in the project's efforts.
> 
> Thanks,
> 
> Andrew Murray
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1201): https://lists.yoctoproject.org/g/yocto-security/message/1201
> Mute This Topic: https://lists.yoctoproject.org/mt/106740991/3616948
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

