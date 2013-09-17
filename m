Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63DB46B6CD
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 12:19:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8HCJwPP027256
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 05:19:58 -0700 (PDT)
Received: from [128.224.22.106] (128.224.22.106) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 17 Sep 2013 05:19:58 -0700
Message-ID: <523848EC.1000203@windriver.com>
Date: Tue, 17 Sep 2013 07:19:56 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
	<1379009772.1285.30.camel@dvhart-mobl4.amr.corp.intel.com>
	<52321B6A.4080100@windriver.com>
	<1379016587.1285.38.camel@dvhart-mobl4.amr.corp.intel.com>
	<52338A9D.7000307@windriver.com>
	<1379353761.1285.163.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1379353761.1285.163.camel@dvhart-mobl4.amr.corp.intel.com>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] grub-efi.bbclass: Add serial and graphics menu options
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
X-List-Received-Date: Tue, 17 Sep 2013 12:19:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/16/2013 12:49 PM, Darren Hart wrote:
> On Fri, 2013-09-13 at 16:58 -0500, Jason Wessel wrote:
>> On 09/12/2013 03:09 PM, Darren Hart wrote:
>>> On Thu, 2013-09-12 at 14:52 -0500, Jason Wessel wrote:
>>>> On 09/12/2013 01:16 PM, Darren Hart wrote:
>>>>> On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
> ...
>
>  
>>>>>> +GRUB_SERIAL ?= "console=ttyS0,115200"
>>> ...
>>>
>>>>> I'm not very familiar with the cfgfile for menus and such, so I don't
>>>>> have much to add. The one thing that catches me by surprise is the need
>>>>> for the serial device. On EFI systems, grub here uses the EFI console
>>>>> service, so if that uses the serial port you get it for free, no need
>>>>> for GRUB to try and use it directly. In fact.... does the above not
>>>>> cause some kind of conflict between the EFI console service and grub
>>>>> serial?
>>>>>
>>>> In part that is why it is optional.   With respect to the serial bits,
>>>> these are only the kernel boot arguments we are talking about.  It
>>>
>>> Hrm.... this should be handled with APPEND parameter from the machine
>>> configs, not a new GRUB_SERIAL statement....
>>>
>>
>> Well there is a problem with that.  You only have 1 APPEND, but I need
>> 2 options.  The whole point is the ability to add SERIAL or Graphics
>
> I don't follow. Do you mean you need both serial and VGA? That is still
> handled by the single variable. Take the FRI2 for example:
>
> APPEND += "console=ttyPCH1,115200 console=tty0"
>
> With what you have here, it seems to me this will be ignored and GRUB
> will instead pass console=ttyS0,115200 - which will not work on the
> FRI2.


This is fixed in the new series. 

The auto menu is intended to offer the end user the choice of which is their default console.  Obviously you can emit text to both, but you only get one selected as the default input device.

It might not be obvious but we use mingetty and selectively use the console.   The whole alternate boot thing is completely optional.  Now if you set the SERIAL stuff to be "".

It might even be better to point this out more directly by changing the variable names to something like ALT_CONSOLE...


>
>>  console access for early boot all the way through user space hand off
>> and seamlessly picking things up later in user space with mingetty
>> etc...
>>
>> This option is mainly used for the installer media and to provide a
>> consistent look and feel regardless if you come from EFI or a PCIBIOS
>> + syslinux.
> SYSLINUX also has some recipe-specific console options, but those are
> due to the syntax differences and are used to specify how syslinux talks
> to the device, while this appears to be Linux kernel syntax
> ("console=ttyS0") rather than grub syntax ("serial --unit=0
> --speed=115200")... and yet I don't see the "console=ttyS0" being passed
> to the kernel.... so I am confused. Where does the GRUB_SERIAL content
> actually get used? I mean besides the creation of the btypes array....


This is addressed to, but we may yet go another round to clean up the understanding of things.  A v3 to arrive soon.

Cheers,
Jason.


