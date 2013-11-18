Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECB6B6BF0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 08:30:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAI8UakR015415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 00:30:36 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 18 Nov 2013 00:30:34 -0800
Message-ID: <5289D015.9010605@windriver.com>
Date: Mon, 18 Nov 2013 16:30:13 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <52859586.5040001@windriver.com>	<1384517930.6460.151.camel@ted>
	<CAP9ODKqt_jfNPE=FhtRrwDWospD1KZF7N1hP58kAJi7c1jtxzA@mail.gmail.com>
In-Reply-To: <CAP9ODKqt_jfNPE=FhtRrwDWospD1KZF7N1hP58kAJi7c1jtxzA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] let PACKAGES_DYNAMIC be optional ?
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
X-List-Received-Date: Mon, 18 Nov 2013 08:30:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2013 09:25 PM, Otavio Salvador wrote:
> On Fri, Nov 15, 2013 at 10:18 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2013-11-15 at 11:31 +0800, Robert Yang wrote:
>>> Currently, the recipe which uses PACKAGES_DYNAMIC usually generates
>>> a lot of packages which costs a lot of time on building the recipe
>>> and do_rootfs, for example, the perl and kernel:
>>>
>>> $ ls tmp/deploy/rpm/armv5te/perl-module-* | wc -l
>>> 621
>>>
>>> $ ls tmp/deploy/rpm/qemux86/kernel-module-* | wc -l
>>> 268
>>>
>>> Also, the eglibc-locale generates more than 300 packages.
>>>
>>> Take perl as an example:
>>>
>>> 1) We generate 621 perl-module-* packages, but the package *perl-modules*
>>>      requires all of them, so once *perl-modules* is installed, all the other
>>>      perl-module-* will be installed and we can't remove any of them since
>>>      perl-modules rdepends on it, if there is a way to package all of these
>>>      perl-module-* into one package (they are about 10MB), it would save a lot
>>>      of time on do_package* and do_rootfs.
>>>
>>> 2) The nativesdk.bbclass can't support PACKAGES_DYNAMIC, for example, it can't
>>>      change the perl-module-app-cpan to nativesdk-perl-module-app-cpan since
>>>      there is no perl-module-app-cpan in PACKAGES when nativesdk.bbclass
>>>      changes the variable's name.
>>>
>>> Can we add a way to let the PACKAGES_DYNAMIC be optional ? for example,
>>>
>>> PACKAGES_DYNAMIC[perl] = "0"
>>>
>>> will disable the perl's PACKAGES_DYNAMIC, and will pack the files as other
>>> recipes do, and of course we need to do some work on the recipe.
>>
>> Before we consider doing this, I'd actually like to see real numbers
>> about how big this problem is.
>>
>> Why? Speaking as someone who has looked specifically at perl and the
>> kernel, I don't believe there is a huge amount of time spent dealing
>> with the individual packages and that maintaining two build paths is
>> actually worse than they minimal performance impact this has.
>>
>> In particular, I'd note that the locale generation happens in parallel
>> with other parts of the build and is not a significant factor in overall
>> build times.
>>
>> The time would be better spent reducing the size of the kernel source
>> installed into the sysroot for example (Bruce is planning action on
>> this).
>
> I agree on Richard on this; keeping too many different build routes
> introduces more test burden and it's only worth if the gain is huge.
>

Sounds reasonable, I will try sooner to see the gain.

// Robert



