Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RBToS-0001X9-6F
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 17:55:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p95Fnc3B019778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Oct 2011 08:49:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 5 Oct 2011 08:49:38 -0700
Message-ID: <4E8C7C91.7070308@windriver.com>
Date: Wed, 5 Oct 2011 10:49:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <4E8B6564.4090002@balister.org>
	<4E8B67C5.8050602@intel.com>	<4E8B6C17.80509@balister.org>
	<4E8B6D47.9000600@intel.com> <4E8B8C05.5050508@windriver.com>
	<4E8C662B.4090300@balister.org>
In-Reply-To: <4E8C662B.4090300@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Wed, 05 Oct 2011 15:55:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/5/11 9:14 AM, Philip Balister wrote:
> On 10/04/2011 06:43 PM, Mark Hatle wrote:
>> On 10/4/11 3:32 PM, Saul Wold wrote:
>>> On 10/04/2011 01:27 PM, Philip Balister wrote:
>>>> On 10/04/2011 04:08 PM, Saul Wold wrote:
>>>>> On 10/04/2011 12:58 PM, Philip Balister wrote:
>>>>>> I'm about to start bringing some images I use from OE to OE-core. The
>>>>>> first issue I saw is there is no task-proper-tools in oe-core (where
>>>>>> oe-core means the set of layers created by the Angstrom setup scripts).
>>>>>>
>>>>> Philip,
>>>>>
>>>>> Have you looked at task-core-basic, it is supposed to be more of a
>>>>> desktop like set of tools, the idea being it's heavier weight than core,
>>>>> will move to supporting the non-graphical part of LSB.
>>>>>
>>>>> Another caveat for task-core-basic is that it's the largetest non-gplv3
>>>>> task that is used by core-image-basic.
>>>>>
>>>>> Does this task approach what you are looking for?
>>>>
>>>> It looks like a start, but I notice it brings in rpm. I'm not sure if I
>>>> want that. I would have thought that the package manager would be a
>>>> distro decision.
>>>>
>>> That's a bug that I would certainly take a patch for, unless rpm is
>>> required as part of LSB, that will need to be verified.
>>
>> The ability to install RPM packages is required by the LSB.  The LSB does not
>> require RPM however.  (yes I know, odd requirement, but with things like alien
>> it's doable on debian systems.)
>>
>> But yes, RPM is included to satisfy that requirement.
> 
> This is beginning to look like a trickier problem than I would like. 
> Between oe-core and meta-angstrom, there are a number of tasks/images to 
> start from, but they each have something I don't like:
> 
> 1) I do not want rpm in the image. This would confuse my customer base.
> 2) I am tired of dropbear, I want openssh only.
> 3) I need the full versions of tools, not the busybox ones.
> 4) I am not limited to gpv2 software.
> 
> Richard, it looks to me like we should add an item for the next Yocto 
> development cycle to review how images are built and try to make the 
> base stuff in oe-core more usable by everyone. We need to define what 
> choices are made by distros. For example opkg, rpm, no package 
> management in image. Images may want dropbear or openssh.
> 
> Short term, I think I'll copy the tasks/images into my bsp and get some 
> stuff together for testing. I'd like a better long term solution though.

I'd suggest for now you try "hob".  It's capable of setting up image classes
that can do exactly what you want.. selecting specific packages that must be on
the target image and generating it.

I think the key thing for oe-core is that we'll never have the "right" set of
predefined images.. but we do need something so we can run the specific suite of
tests to show that things are function, as well as give starting points.

And I absolutely agree that we need to re-evaluate the configurations and come
up with distribution flags (feature flags?) that can do things like
enable/disable busybox, dropbear and other tooling.  (GPLv2 packages are only
built if you've excluded GPLv3 from your build.. otherwise the latest/greatest
version is defaulted to on.)

--Mark

> Philip



