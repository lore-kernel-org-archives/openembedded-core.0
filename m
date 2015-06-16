Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4495773BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 13:48:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5GDmN4v015513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jun 2015 06:48:23 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 Jun 2015 06:48:22 -0700
Message-ID: <55802926.7020009@windriver.com>
Date: Tue, 16 Jun 2015 09:48:22 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1434370643.9085.98.camel@intel.com>	
	<557F2BF1.5000605@windriver.com>
	<1434441993.9085.152.camel@intel.com>
In-Reply-To: <1434441993.9085.152.camel@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: KCONF_AUDIT_LEVEL + kernel_configcheck
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jun 2015 13:48:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-16 04:06 AM, Patrick Ohly wrote:
> On Mon, 2015-06-15 at 15:48 -0400, Bruce Ashfield wrote:
>> On 2015-06-15 8:17 AM, Patrick Ohly wrote:
>>> Hello!
>>>
>>> In Fido and master, the following patch changed the default value of
>>> KCONF_AUDIT_LEVEL:
>>>
>>> $ git annotate origin/fido -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
>>> ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	308)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
>>> $ git annotate origin/master -- meta/classes/kernel-yocto.bbclass | grep KCONF_AUDIT_LEVEL
>>> ad4d5949	(Bruce Ashfield	2015-02-18 16:15:35 -0500	309)    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
>>>
>>> At least if I read it right, that wasn't the intention. The commit
>>> explicitly says that the default should be 1:
>>>
>>>       The visibility of auditing is controlled by KCONF_AUDIT_LEVEL:
>>>
>>>          0: no reporting
>>>          1: report options that are specified, but not in the final config
>>>          2: report options that are not hardware related, but set by a BSP
>>>
>>>       The default level is 1, with level 2 and above being for BSP development
>>>       only.
>>
>> The line is correct, since we don't want it warning for non linux-yocto
>> meta-data enabled kernels. The default is indeed 1, since I set it in
>> the common include file. That was the default I was referring to in that
>> change.
>
> Ah, I missed that other part of the patch. You are right of course.
>
>>> foobar.cfg is used (the CONFIG_SECURITY_SMACK part is used) but the
>>> CONFIG_FOOBAR part of course is not. Shouldn't this trigger the
>>> "specified values did not make it into the kernel's final
>>> configuration"?
>>
>> To keep the noise down, I'm only emitting partial audit information and
>> the warnings only apply to options that are tagged as "hardware", since
>> that is also a synonym to 'required' in the configuration scheme.
>>
>> .. and no. That isn't common knowledge, since I've been slowly changing
>> and making the audit information more visible, but don't want to flood
>> too many warnings, or create an ABI that limits how we can change things.
>
> That explains it then. I don't remember how I learned about this kernel
> configuration check (might have seen the error message at some point)
> and came away with the impression that it applies to all configuration
> options.


It was visible, then hidden, and then made visible again. So it has
been a balancing act all along.

>
> I cannot say how much noise it would create in practice, but at least I
> had one specific case where I was using a non-hardware configuration not
> supported by the kernel and would have appreciated a warning about
> that ;-}

This is good feedback, and I am planning to expose more of the output,
including some dependency information (since without giving hints on how
to fix a warning .. more warnings are not all that helpful :)

Cheers,

Bruce

>


