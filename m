Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SKWqa-0004X0-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:31:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3IFLec9001220
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 08:21:40 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 18 Apr 2012 08:21:39 -0700
Message-ID: <4F8EDC02.5040605@windriver.com>
Date: Wed, 18 Apr 2012 10:21:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org>
	<4F8C24CB.3080607@opendreambox.org> <1334587325.616.4.camel@ted>
	<4F8C379A.3070903@opendreambox.org> <4F8C3B19.40400@windriver.com>
	<4F8EA5CC.6010101@opendreambox.org> <1334749226.24091.67.camel@ted>
	<4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted> <4F8EAEAC.4080605@opendreambox.org>
	<1334753155.24091.84.camel@ted> <4F8ED1BE.8010109@opendreambox.org>
In-Reply-To: <4F8ED1BE.8010109@opendreambox.org>
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 15:31:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/12 9:37 AM, Andreas Oberritter wrote:
> On 18.04.2012 14:45, Richard Purdie wrote:
>> On Wed, 2012-04-18 at 14:08 +0200, Andreas Oberritter wrote:
>>> On 18.04.2012 14:00, Richard Purdie wrote:
>>>> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
>>>>> I had a lot of those (e.g. because armv7a-vfp-neon was including 20
>>>>> arm*feed.conf variants in /etc/opkg most of them empty - without
>>>>> Packages.gz).
>>>>>
>>>>> So I've added "filter" to distro-feed-configs
>>>>> http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=236aa553bb0f82f741c6edb793e96f421f24f4fa
>>>>> to add only feeds I'm generating (and I also don't want armv5* packages
>>>>> installed on armv7a-vfp-neon target unless user explicitly adds armv5*
>>>>> feed).
>>>>
>>>> This is the better solution. I think we need to get a better default
>>>> feed-config generation mechanism into the core. Distros may still need
>>>> to tweak it but it would be good to share some of the best practises...
>>>
>>> Did you look at the patch? Which default setting of
>>> SUPPORTED_EXTRA_ARCHS do you suggest?
>>
>> I did. I didn't say the above patch was a perfect solution.
>>
>>>   Do you think it's feasible to add
>>> every single downloadable arch to this variable? If a user of my distro
>>> decides to build it for some arm or x86 cpu, should he need to know
>>> which archs to add at this place?
>>
>> This is a place where the build system meets and interfaces with the
>> distro. No one policy in the build system is going to fit every distro's
>> needs, not should we ever aim to so.
>
> At least we should have defaults that actually work for someone. Now we
> don't and considering that distro-feed-configs.bb is the only place
> where PACKAGE_EXTRA_ARCHS is actually used, this would be very easy to
> accomplish. Especially because it worked well by default before Mark
> broke it.

PACKAGE_EXTRA_ARCHS is also used by Zypper, RPM configuration and other places. 
  In those cases it is a full list of all available (and compatible) package 
architecture types.

Coming from the RPM world, it seems very odd to me that a set of "extra_archs" 
can not list well, extra compatible archs without causing an error.  I have no 
idea how to reconcile this behavior, without making a package manager 
distro-feed specific solution.  (For RPM we absolutely want the existing behavior.)

--Mark

> I guess it's indeed better to just override the necessary bits in my
> distro instead of trying to get working defaults upstream.
>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



