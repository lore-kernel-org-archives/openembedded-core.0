Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 90B8061FE1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 23:27:37 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so6026079pad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 16:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=nfUIgo4SrxAnviH1Mr7GE+/0m2XHrY1Bv1cN65pOpps=;
	b=iIc7L+4ex50Wb5CCLvU2IqR5SMhI6VF4/q1BQ5+2fB2yQ/NCF5HiFNz4iY/GPo85Tn
	S0Gvvq7/qQhUDJ37ya8L5AR08Rosz0NPlj3ccP6ukrG8EBuVBli02gq1tnPpDIx2RPc8
	G0nMMKGnXF/6snGpFE33oNPPydQYotbsFAYnyy+2aU9zzp5KtWXPk0vRWB894v7qGXfC
	KFyTh2wra6UZLC+vM7r2rxt96X4DCmglSJUHsferlhh8bdAPcl1duDmAreidiW2+0Cwc
	f5vkgPE0BifJqs04/ulTQzj3I3yEidP5KD2PY85whM7EmJLWm/3+zEjQzcdpMFwWE+03
	hWYw==
X-Received: by 10.68.219.70 with SMTP id pm6mr28528720pbc.154.1373412457970;
	Tue, 09 Jul 2013 16:27:37 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	eq5sm30467328pbc.15.2013.07.09.16.27.35 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 16:27:36 -0700 (PDT)
Message-ID: <51DC9B41.3000100@gmail.com>
Date: Wed, 10 Jul 2013 09:22:41 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1373379161-25047-1-git-send-email-net147@gmail.com>
	<1373406532.3429.5.camel@envy.home>
In-Reply-To: <1373406532.3429.5.camel@envy.home>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] boot-directdisk: mount root by MBR disk signature for Linux 3.8+
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
X-List-Received-Date: Tue, 09 Jul 2013 23:27:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2013 7:48 AM, Darren Hart wrote:
> On Wed, 2013-07-10 at 00:12 +1000, Jonathan Liu wrote:
>> The root device is currently set as /dev/hda2. However, this is
>> only correct if it's the first IDE drive. If booting off the first SATA
>> drive instead, it would be /dev/sda2. It's not the first drive, neither
>> /dev/hda2 or /dev/sda2 would be correct.
>>
>> The solution to this has typically been to use the filesystem UUID to
>> specify the root device but this requires extra support in the initrd.
>> Linux 3.8 introduces the ability to specify the root device using the
>> MBR disk signature and the partition number which is much simpler to
>> use and avoids the extra overhead of an initrd.
>>
>> This change uses the MBR disk signature to specify the root device when
>> using Linux 3.8+ and CONFIG_BLOCK (required for root=PARTUUID=)
>> is enabled in the kernel.
>>
>> This has been tested with QEMU x86 and Intel Desktop Board D2500HN using
>> an image recipe inheriting boot-directdisk and core-image.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/classes/boot-directdisk.bbclass | 30 +++++++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
>> index efeadab..f97060f 100644
>> --- a/meta/classes/boot-directdisk.bbclass
>> +++ b/meta/classes/boot-directdisk.bbclass
>> @@ -35,7 +35,9 @@ BOOTDD_EXTRA_SPACE ?= "16384"
>>   # Get the build_syslinux_cfg() function from the syslinux class
>>   
>>   AUTO_SYSLINUXCFG = "1"
>> -SYSLINUX_ROOT ?= "root=/dev/sda2"
>> +SYSLINUX_FIXED_ROOT = "root=/dev/sda2"
>> +SYSLINUX_UUID_ROOT = "root=PARTUUID=${DISK_SIGNATURE}-02"
> Why  '=' and not '?=' for the above? Shouldn't the user be able to
> override these?
Ok.
>
>> +SYSLINUX_ROOT ?= "${@'${SYSLINUX_UUID_ROOT}' if has_kernel_mbr_partuuid_support(d) else '${SYSLINUX_FIXED_ROOT}'}"
>>   SYSLINUX_TIMEOUT ?= "10"
>>   
>>   inherit syslinux
>> @@ -98,6 +100,10 @@ build_boot_dd() {
>>   	parted $IMAGE set 1 boot on
>>   	parted $IMAGE print
>>   
>> +	# Disk signature generated by parted isn't really random, so use our own generated signature
>> +	echo -ne "$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')" | \
>> +		dd of=$IMAGE bs=1 seek=440 conv=notrunc
> Oi! So, can "fold -w 2 | tac | paste -sd '' be replaced with "rev" from
> the standard util-linux package?
>
> And the sed command... just insert "\x" every two characters? That
> doesn't seem to add any more randomness.... maybe I'm missing the point
> here?
fold -w 2 | tac | paste -sd '' is to reverse the hex bytes. the sed 
command is to convert the hex bytes aabbccdd to \xaa\xbb\xcc\xdd and 
pass to echo -ne to convert the hex bytes to binary. I can remove fold 
-w 2 | tac | paste -sd '' and add rev after converting to binary.
>
>
>> +
>>   	OFFSET=`expr $END2 / 512`
>>   	dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
>>   	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
>> @@ -113,4 +119,26 @@ python do_bootdirectdisk() {
>>       bb.build.exec_func('build_boot_dd', d)
>>   }
>>   
>> +def generate_disk_signature():
>> +    import uuid
>> +    return str(uuid.uuid4())[:8]
>> +
>> +def get_kernel_version(d):
>> +    import subprocess
>> +    version_cmd = r"grep '^VERSION\s*=' '%s/Makefile' | grep -o '[0-9]*$'" % (d.getVar("STAGING_KERNEL_DIR", True))
>> +    version = int(subprocess.Popen(version_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0])
>> +    patchlevel_cmd = r"grep '^PATCHLEVEL\s*=' '%s/Makefile' | grep -o '[0-9]*$'" % (d.getVar("STAGING_KERNEL_DIR", True))
>> +    patchlevel = int(subprocess.Popen(patchlevel_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0])
>> +    return (version, patchlevel)
>> +
>> +def has_kernel_config_option(option, d):
>> +    import subprocess
>> +    grep_cmd = r"grep '^CONFIG_%s=y$' '%s/.config'" % (option, d.getVar("STAGING_KERNEL_DIR", True))
>> +    return subprocess.call(grep_cmd, shell=True, stdout=subprocess.PIPE) == 0
> Is there a specific kernel option to test for the MBR disk signature
> support or is that inherent in the block drivers now? It would be nice
> if we could skip the kernel version check, that code looks dangerously
> fragile (no fault of yours).
The commit which adds the support is 
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=d33b98fc82b0908e91fb05ae081acaed7323f9d2. 
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/init/do_mounts.c?id=refs/tags/v3.8.13 
indicates PARTUUID= support is only enabled with CONFIG_BLOCK.
Alternatively, instead of checking kernel version I could just add an 
option to enable the PARTUUID support and add a comment in the class 
that you need Linux 3.8+ with CONFIG_BLOCK. It would be disabled by 
default in that case and if they are using an older kernel version with 
the feature manually backported, they can explicitly enable it.
>
>> +
>> +def has_kernel_mbr_partuuid_support(d):
>> +    return get_kernel_version(d) >= (3, 8) and has_kernel_config_option("BLOCK", d)
>> +
>> +DISK_SIGNATURE := "${@generate_disk_signature()}"
>> +
>>   addtask bootdirectdisk before do_build
Regards,
Jonathan

