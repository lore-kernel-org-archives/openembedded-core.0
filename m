Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 520786E89B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 11:24:23 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u57so3992203wes.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 03:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lGLqsCZ54dc85vXX2SV6TXgb3n8bEucpkYjlgqHodv4=;
	b=SyhmSaCFimaB0dG0FhVe/+CkLgdGmciaWkXJYeCMgeKJN361KznD7AGry6JSQOIjb6
	rWtBWk6HlkoDFGZt/HmROgMJv5yZxgReDygwoL7dI5zKqAzyJ6sN9XGfqWpTItX/8Q2p
	wjVkE7N0LWIHnqUVaM7sOMoR9CWe/Vi/pm3ehyNrI6kYC9BwVhFffw9Lu4c3ND+7thKG
	F4n4Rzh9in/rgcitK/4qXp+czHEH041bD+Ial0ZW056iSSmy3Cl0pfcFHyF6rXIdWn2i
	7dZ5C7yaoHZkBQq5ac7bVwA1N3RC3uBfHs91GgsAhW1137WF4I37Z9IaCaYHRoh5cF61
	ngXQ==
X-Gm-Message-State: ALoCoQmNR786s0ejrj9DQjYA8wg4bxSrm8qckVmlNKFxG0QGy4T7xpfCKqI4PpciRwWDgPZRncvq
X-Received: by 10.194.236.9 with SMTP id uq9mr8653348wjc.31.1391513063670;
	Tue, 04 Feb 2014 03:24:23 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id uc9sm34848522wib.2.2014.02.04.03.24.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Feb 2014 03:24:23 -0800 (PST)
Message-ID: <52F0CDE6.6060808@linaro.org>
Date: Tue, 04 Feb 2014 12:24:22 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <52E1085F.3060607@linaro.org>
	<1391273061.2891.10.camel@dvhart-mobl.amr.corp.intel.com>
In-Reply-To: <1391273061.2891.10.camel@dvhart-mobl.amr.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] 'EFI' machine feature
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
X-List-Received-Date: Tue, 04 Feb 2014 11:24:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2014 05:44 PM, Darren Hart wrote:
> On Thu, 2014-01-23 at 13:17 +0100, Koen Kooi wrote:
>> Hi,
>>
>
> Hi Koen,
>
>> While working on the ARM support for GRUB I noticed that the EFI support
>> in OE-core is a mess. A lot of it is due to GRUB insisting on its
>> byzantine config/install/skynet system and the rest is due to the
>> EFI==x86 assumption.
>
> Some of the horrible not-really-native grub recipe wreakage was recently
> improved. But it is still rather arcane, agreed. The x86-ism was just a
> relic for that being where support was done first. So yes, all good
> stuff to see improved.
>
>>
>> To improve this I'd like to start with adding an 'efi' MACHINE_FEATURE,
>> which will:
>
> There is an efi MACHINE_FEATURE - so you want to extend that one right?

Ehm yes. When I asked on #oe I was told there isn't such a feature, but 
I stand corrected :)


>>
>> * Mask non-EFI configs like grub-pc/grub-uboot
>
> We need to be careful here. It is valid to build hybrid images which
> support both EFI and legacy PC boot (for example). We do this now with
> the EFI and PCBIOS MACHINE_FEATURES - see bootimg.bbclass. So on this
> one point, I'd say no, don't mask them. You can make them need to
> specify their own MACHINE_FEATURE though.

I had dismissed this usecase, but it seems people are actually using it, 
so I'll have to rethink this a bit.

>> * allow PACKAGECONFIG instead of distro/arch/machine overrides in grub2
>> * Activate logic in image classes to create a GPT EFI System Partition
>
> I'm not following this - but this isn't my area of expertise. How does
> PACKAGECONFIG help us here?

Due to the above this is moot now, but the idea was to check for the efi 
MACHINE_FEATURE and pass --target=efi to grub configure. But if we can't 
merge the recipes then this isn't an option.


> Also, keep in mind that while good for use on the actual device, GPT is
> problematic on disk images as the spec requirs the backup table on the
> last LBA of the disk, so using a disk image of even a slightly different
> size on a physical disk will result in irritating errors on boot. MSDOS
> partition tables are better for disk images (unfortunatley).  GPT is
> appropriate for tools like wic, however, which do deal with the physical
> device.

This is a big problem and I haven't found a nice way to repair the GPT 
during install or afterwards. Adding gptfdisk to OE would be a big step 
forward since parted is being less than helpful here.

>>
>> Further steps to address EFI support would be:
>>
>> * integrate gummiboot into OE-core (meta-intel has an old version)
>
> Yes please. Take that recipe, bump the SRCREVs, and submit it to
> oe-core. We've made some improvements to gummiboot recently for cross
> compilation and such, it would be nice to see these incorporated.

I have a working recipe for that, I just need to find time to clean it 
up and submit it, since that is a spare-time project.

>> * deprecate grub-(not really)native
>
> In favor of what? gummiboot? I'm all in favor of that!

For EFI grub-native isn't really needed, since it's just 'copy to ESP, 
create conf' and as you say, bootimg.bbclass already knows how to 
generate the grub config.

>> * create an efi bbclass that does the above ESP dance and knows how to
>> populate it further e.g. grub.cfg and bootloader-spec entries for gummiboot.
>
> The bootimg.bbclass does something along these lines and abstracts the
> various calls out to syslinux, grub, grub-efi, etc. Are you looking to
> expand this, replace it.... ?

I hadn't looked at bootimg.bbclass, but it seems it does most of what I 
need.
Someone told me that fedora has patches that teach grub to use f.d.o 
bootloader spec files (aka gummiboot configs), that could reduce 
codepaths in bootimg.bbclass, but I don't know if it's a good idea to 
patch grub that way. I guess I should look at that and send an RFC :)

>
>> * postinst magic to update bootloader config on kernel upgrade

I sent a seperate RFC for that.

>> Opinions/Flames/ACPI rants?
>>
>
> Generally speaking, this looks like the right approach.

Thanks for the feedback!

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

