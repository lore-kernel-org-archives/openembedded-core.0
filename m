Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAA9960EE8
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:58:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8DLwsBF014887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Sep 2013 14:58:54 -0700 (PDT)
Received: from [172.25.32.34] (172.25.32.34) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 14:58:54 -0700
Message-ID: <52338A9D.7000307@windriver.com>
Date: Fri, 13 Sep 2013 16:58:53 -0500
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
In-Reply-To: <1379016587.1285.38.camel@dvhart-mobl4.amr.corp.intel.com>
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
X-List-Received-Date: Fri, 13 Sep 2013 21:58:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/12/2013 03:09 PM, Darren Hart wrote:
> On Thu, 2013-09-12 at 14:52 -0500, Jason Wessel wrote:
>> On 09/12/2013 01:16 PM, Darren Hart wrote:
>>> On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
>>>> The syslinux.bbclass already has support for automatically generated
>>>> serial and graphics menu choices.  This patch adds the same concept to
>>>> the grub-efi menu.  That makes it possible to generate a single image
>>>> which can boot on a PCBIOS or EFI firmware with consistent looking
>>>> boot options.
>>>>
>>>> [YOCTO #4100]
>>>>
>>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>>>> ---
>>>>  meta/classes/grub-efi.bbclass     |   41 ++++++++++++++++++++++++-------------
>>>>  meta/conf/machine/qemux86-64.conf |    2 +-
>>>>  meta/conf/machine/qemux86.conf    |    2 ++
>>>>  3 files changed, 30 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
>>>> index c6f5d4e..c07e4a1 100644
>>>> --- a/meta/classes/grub-efi.bbclass
>>>> +++ b/meta/classes/grub-efi.bbclass
>>>> @@ -9,6 +9,7 @@
>>>>  # External variables
>>>>  # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
>>>>  # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
>>>> +# ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
>>>>  # ${LABELS} - a list of targets for the automatic config
>>>>  # ${APPEND} - an override list of append strings for each label
>>>>  # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
>>>> @@ -16,6 +17,7 @@
>>>>  
>>>>  do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
>>>>  
>>>> +GRUB_SERIAL ?= "console=ttyS0,115200"
> 
> ...
> 
>>> I'm not very familiar with the cfgfile for menus and such, so I don't
>>> have much to add. The one thing that catches me by surprise is the need
>>> for the serial device. On EFI systems, grub here uses the EFI console
>>> service, so if that uses the serial port you get it for free, no need
>>> for GRUB to try and use it directly. In fact.... does the above not
>>> cause some kind of conflict between the EFI console service and grub
>>> serial?
>>>
>>
>> In part that is why it is optional.   With respect to the serial bits,
>> these are only the kernel boot arguments we are talking about.  It
> 
> 
> Hrm.... this should be handled with APPEND parameter from the machine
> configs, not a new GRUB_SERIAL statement....
> 


Well there is a problem with that.  You only have 1 APPEND, but I need 2 options.  The whole point is the ability to add SERIAL or Graphics console access for early boot all the way through user space hand off and seamlessly picking things up later in user space with mingetty etc...

This option is mainly used for the installer media and to provide a consistent look and feel regardless if you come from EFI or a PCIBIOS + syslinux.


> 
>>  doesn't seem that there is a "primary" display interface for the HCDP
>> in the EFI firmware I have.   Additionally, the kernel throws the EFI
>> serial console under the bus at ACPI probe time, while this certainly
>> could also be a bug in the firmware I have on my test board, the only
>> way to keep the serial port alive for a login and the kernel boot
>> information was to specify console=ttyS0...
> 
> Hrm.... interesting. I guess we'll just need to test more broadly.
> Indeed the kernel should be using it's own console= parameter, but
> again, that should come from the APPEND_machine variable.
> 
> 
>> I have yet another system I need to try this on which has a much newer
>> UEFI and a serial port, but I thought it would be best to get
>> something out there that covers the "buggy firmwares" as well which
>> can be built optionally.
> 
> Agreed, so long as it doesn't break the common case.


The common case is not broken.  This is something you have to turn on in the image or local.conf. 

The new patches will available soon for the whole series as soon as all the test hardware has booted in legacy and efi mode.

Cheers,
Jason.

