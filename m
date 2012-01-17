Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RnC87-00069w-Ks
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 17:43:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jan 2012 08:35:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107977229"
Received: from unknown (HELO envy.home) ([10.255.13.210])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2012 08:35:46 -0800
Message-ID: <4F159136.5030001@linux.intel.com>
Date: Tue, 17 Jan 2012 07:18:14 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <cover.1326221405.git.dexuan.cui@intel.com>
	<020d54ed54c0ad9a1a7cc63ca8660f5b5451b361.1326221405.git.dexuan.cui@intel.com>
	<4F0F0AE5.4040009@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FC9F275@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FC9F275@SHSMSX102.ccr.corp.intel.com>
X-Enigmail-Version: 1.3.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] self-hosted-image: generate the .hdddirect and .vmdk image files
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
X-List-Received-Date: Tue, 17 Jan 2012 16:43:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/17/2012 01:35 AM, Cui, Dexuan wrote:
> Darren Hart wrote on 2012-01-13:
>> Hi Dexuan,
>>
>> Please include a complete patch header. Much of your 0/1 content can
>> go here.
> (Sorry for the late reply! I overlooked the mails...)
> Ok, I'll pay attention to this in future.
> 
>> Comments below...
>>
>> On 01/10/2012 10:53 AM, Dexuan Cui wrote:
>>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>>> ---
>>>  meta/classes/boot-directdisk.bbclass          |   10 +++++++++-
>>>  meta/recipes-core/images/self-hosted-image.bb |   11 +++++++++--
>>>  2 files changed, 18 insertions(+), 3 deletions(-)
>>> diff --git a/meta/classes/boot-directdisk.bbclass
>>> b/meta/classes/boot-directdisk.bbclass index 8879ba8..83ec929 100644
>>> --- a/meta/classes/boot-directdisk.bbclass +++
>>> b/meta/classes/boot-directdisk.bbclass @@ -24,6 +24,7 @@
>>> do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
>>>
>>> syslinux-native:do_populate_sysroot \
>>>
>>> parted-native:do_populate_sysroot \
>>>
>>> mtools-native:do_populate_sysroot " +do_bootdirectdisk[depends] +=
>>> "qemu-native:do_populate_sysroot"
>>>
>>>  PACKAGES = " "
>>>  EXCLUDE_FROM_WORLD = "1"
>>> @@ -38,7 +39,7 @@ BOOTDD_EXTRA_SPACE ?= "16384"
>>>
>>>  AUTO_SYSLINUXCFG = "1"
>>>  LABELS = "boot"
>>> -APPEND = "root=/dev/sda2"
>>> +APPEND = "root=/dev/hda2"
>>
>> This seems like it had the potential to break other uses of hdddirect.
>> Qemu may use hda2, but other hdddirect users (external layers for
> Hi Darren, thanks for pointing this out!
> I thought it's ok since now I'm the only user ofhdddirect, but I didn't realize I might break external layers...
> 
>> example) may not. This feels like a MACHINE config to me. In fact,
>> machine's do already set APPEND for things like the console.
> I agree.
> So, I think here we should change the = to ?= like the below
> -APPEND = "root=/dev/sda2"
> +APPEND ?= "root=/dev/sda2"
> And in meta/conf/machine/include/qemu.inc, I can add a line
> APPEND = "root=/dev/hda2".
> 
> Does this sound ok?

That seems appropriate to me.

> 
>>
>>>  TIMEOUT = "10"
>>>  SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
>>>  SYSLINUXMENU = "${HDDDIR}/menu"
>>> @@ -50,6 +51,7 @@ build_boot_dd() {
>>>
>>>  	install -d ${HDDDIR}
>>>  	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage
>> ${HDDDIR}/vmlinuz
>>> +	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
>>
>> Hrm... syslinux.cfg wasn't installed before at all?
> I'm not very clear about the history, but according to syslinux.bbclass,
> iso and hddimg do invoke syslinux_populate, but hdddirect doesn't --
> I
> suppose hdddirect doesn't need all the functionality of
> build_syslinux_menu, so it tries to install the files itself, and
> unluckily it misses syslinux.cfg. Now there is no user of .hdddirect in
> poky, and I don't know there is any actual external user. This may
> explain why nobody complains. :-)

This sounds like an opportunity to modularize and reuse to me.

> 
> 
>>
>>>  	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys
>>> ${HDDDIR}/ldlinux.sys
>>>
>>>  	BLOCKS=`du -bks ${HDDDIR} | cut -f 1` @@ -83,6 +85,12 @@
>>>  build_boot_dd() { 	cd ${DEPLOY_DIR_IMAGE} 	rm -f
>>>  ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect 	ln -s
>>>  ${IMAGE_NAME}.hdddirect
>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
>>> +
>>> +	if [ "${NOVMDK}" != "1" ] ; then
>>> +		${STAGING_BINDIR_NATIVE}/qemu-img convert -O vmdk   \
>>
>> You've added a dependency on qemu-img, please add the appropriate
>> DEPENDS above.
> I have added the line in my patch:
> do_bootdirectdisk[depends] += "qemu-native:do_populate_sysroot"
> 
> I think this is enough?
> Need I add "DEPENDS += "qemu-native", too?

No, I don't think so. Is do_populate_sysroot the right task? That would
be my guess as well, but we should be confident.

> 
>>
>>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect \
>>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>>> +	fi
>>>  }
>>>  
>>>  python do_bootdirectdisk() {
> 
>> Darren Hart wrote on 2012-01-13:
>> On 01/10/2012 10:53 AM, Dexuan Cui wrote:
>>
>> A couple additional thoughts about the boot-directdisk class in general:
>>
>> So build_boot_dd needs a careful audit to ensure the various dd
>> commands do not stomp on eachother iirc, the dd of syslinux/mbr.bin
>> was stomping on the partition table or some such.
> Hi Darren,
> The dd-ing of mbr.bin actually writes only the first 440 bytes of $IMAGE -- please note
> the size of mbr.bin(generated by the recipe syslinux, I think) is 440 bytes rather than 512 bytes. :-)
> I think 440 is safe enough because it's even smaller than 512-16*4=448 bytes.
> 
>> Also note that it uses "mkdosfs -d" which we have purged (and it aint
>> coming back if my NACK is worth anything ;-). Sounds like we need to
>> abstract building msdos images into an msdosfs.bbclass. No reason to
> Would you volunteer to make a msdosfs.bbclass? :-)

Not in the near future unfortunately, I'm heavily overloaded as it is.
That said, please open a bug and we can find an appropriate owner.

> 
>> duplicate all the fatfs overhead calculations I did yesterday (See the
>> patch I sent yesterday to bootimg.bbclass).
> I agree.
> I see your patch has been in poky master now.
> If you could help to make msdosfs.bbclass, I would appreciate that a lot.
> Now I'm stick in something else and I'm afraid I can't start to work on this immediately. :-(
> 

Understood. Open the bug and explain what's needed and we'll prioritize
and assign it. There may also be others who would like this feature that
would be willing to pick up the task.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


