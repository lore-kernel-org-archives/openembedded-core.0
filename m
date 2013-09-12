Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 175A561864
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 19:52:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8CJqBOJ025082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 12:52:12 -0700 (PDT)
Received: from [147.11.119.100] (147.11.119.100) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 12 Sep 2013 12:52:11 -0700
Message-ID: <52321B6A.4080100@windriver.com>
Date: Thu, 12 Sep 2013 14:52:10 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-6-git-send-email-jason.wessel@windriver.com>
	<1379009772.1285.30.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1379009772.1285.30.camel@dvhart-mobl4.amr.corp.intel.com>
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
X-List-Received-Date: Thu, 12 Sep 2013 19:52:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/12/2013 01:16 PM, Darren Hart wrote:
> On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
>> The syslinux.bbclass already has support for automatically generated
>> serial and graphics menu choices.  This patch adds the same concept to
>> the grub-efi menu.  That makes it possible to generate a single image
>> which can boot on a PCBIOS or EFI firmware with consistent looking
>> boot options.
>>
>> [YOCTO #4100]
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  meta/classes/grub-efi.bbclass     |   41 ++++++++++++++++++++++++-------------
>>  meta/conf/machine/qemux86-64.conf |    2 +-
>>  meta/conf/machine/qemux86.conf    |    2 ++
>>  3 files changed, 30 insertions(+), 15 deletions(-)
>>
>> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
>> index c6f5d4e..c07e4a1 100644
>> --- a/meta/classes/grub-efi.bbclass
>> +++ b/meta/classes/grub-efi.bbclass
>> @@ -9,6 +9,7 @@
>>  # External variables
>>  # ${INITRD} - indicates a filesystem image to use as an initrd (optional)
>>  # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
>> +# ${GRUB_GFXSERIAL} - set this to 1 to have graphics and serial in the boot menu
>>  # ${LABELS} - a list of targets for the automatic config
>>  # ${APPEND} - an override list of append strings for each label
>>  # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
>> @@ -16,6 +17,7 @@
>>  
>>  do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
>>  
>> +GRUB_SERIAL ?= "console=ttyS0,115200"
>>  GRUBCFG = "${S}/grub.cfg"
>>  GRUB_TIMEOUT ?= "10"
>>  #FIXME: build this from the machine config
>> @@ -55,6 +57,8 @@ python build_grub_cfg() {
>>          bb.error("WORKDIR not defined, unable to package")
>>          return
>>  
>> +    gfxserial = d.getVar('GRUB_GFXSERIAL', True) or ""
>> +
>>      labels = d.getVar('LABELS', True)
>>      if not labels:
>>          bb.debug(1, "LABELS not defined, nothing to do")
>> @@ -88,6 +92,12 @@ python build_grub_cfg() {
>>      else:
>>          cfgfile.write('timeout=50\n')
>>  
>> +    if gfxserial == "1":
>> +        btypes = [ [ " graphics console", "console=tty0" ],
>> +            [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
>> +    else:
>> +        btypes = [ [ "", "" ] ]
>> +
>>      for label in labels.split():
>>          localdata = d.createCopy()
>>  
>> @@ -95,24 +105,27 @@ python build_grub_cfg() {
>>          if not overrides:
>>              raise bb.build.FuncFailed('OVERRIDES not defined')
>>  
>> -        localdata.setVar('OVERRIDES', label + ':' + overrides)
>> -        bb.data.update_data(localdata)
>> +        for btype in btypes:
>> +            localdata.setVar('OVERRIDES', label + ':' + overrides)
>> +            bb.data.update_data(localdata)
>>  
>> -        cfgfile.write('\nmenuentry \'%s\'{\n' % (label))
>> -        if label == "install":
>> -            label = "install-efi"
>> -        cfgfile.write('linux /vmlinuz LABEL=%s' % (label))
>> +            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
>> +            lb = label
>> +            if label == "install":
>> +                lb = "install-efi"
>> +            cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))
>>  
>> -        append = localdata.getVar('APPEND', True)
>> -        initrd = localdata.getVar('INITRD', True)
>> +            append = localdata.getVar('APPEND', True)
>> +            initrd = localdata.getVar('INITRD', True)
>>  
>> -        if append:
>> -            cfgfile.write('%s' % (append))
>> -        cfgfile.write('\n')
>> +            if append:
>> +                cfgfile.write('%s' % (append))
>> +            cfgfile.write(' %s' % btype[1])
>> +            cfgfile.write('\n')
>>  
>> -        if initrd:
>> -            cfgfile.write('initrd /initrd')
>> -        cfgfile.write('\n}\n')
>> +            if initrd:
>> +                cfgfile.write('initrd /initrd')
>> +            cfgfile.write('\n}\n')
>>  
>>      cfgfile.close()
>>  }
> 
> I'm not very familiar with the cfgfile for menus and such, so I don't
> have much to add. The one thing that catches me by surprise is the need
> for the serial device. On EFI systems, grub here uses the EFI console
> service, so if that uses the serial port you get it for free, no need
> for GRUB to try and use it directly. In fact.... does the above not
> cause some kind of conflict between the EFI console service and grub
> serial?
> 

In part that is why it is optional.   With respect to the serial bits, these are only the kernel boot arguments we are talking about.  It doesn't seem that there is a "primary" display interface for the HCDP in the EFI firmware I have.   Additionally, the kernel throws the EFI serial console under the bus at ACPI probe time, while this certainly could also be a bug in the firmware I have on my test board, the only way to keep the serial port alive for a login and the kernel boot information was to specify console=ttyS0...

I have yet another system I need to try this on which has a much newer UEFI and a serial port, but I thought it would be best to get something out there that covers the "buggy firmwares" as well which can be built optionally. 


> Both of the following should be in a separate patch. In fact, they
> should probably have a qemux86-common.inc which took care of most of
> this (as was done recently for genericx86-common.inc).


So I am not sure that we want to patch up the qemux86* conf files at all.  Do we want to enable EFI + PCBIOS all the time now that we have a way to generate images (noting these images will work with runqemu)?  I figured I would just drop those modifications entirely.  I would expect something like a "all encompassing" white box BSP to select both, but for the qemux86*, I don't think it makes sense.

Cheers,
Jason.


> 
>> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
>> index c572225..6f68410 100644
>> --- a/meta/conf/machine/qemux86-64.conf
>> +++ b/meta/conf/machine/qemux86-64.conf
>> @@ -21,6 +21,6 @@ XSERVER = "xserver-xorg \
>>             xf86-input-evdev \
>>             xf86-video-vmware"
>>  
>> -MACHINE_FEATURES += "x86"
>> +MACHINE_FEATURES += "x86 efi"
>>  
>>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
>> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
>> index 94ee573..57a9a50 100644
>> --- a/meta/conf/machine/qemux86.conf
>> +++ b/meta/conf/machine/qemux86.conf
>> @@ -22,5 +22,7 @@ XSERVER = "xserver-xorg \
>>             xf86-video-vmware"
>>  
>>  MACHINE_FEATURES += "x86"
>> +MACHINE_FEATURES += "efi"
>> +#MACHINE_FEATURES += "pcbios"
>>  
>>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
> 


