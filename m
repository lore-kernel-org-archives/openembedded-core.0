Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3114A6072C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:23:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4D7NJg3021567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 May 2016 00:23:19 -0700 (PDT)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 13 May 2016 00:23:19 -0700
To: Andrea Adami <andrea.adami@gmail.com>
References: <573578BA.80207@windriver.com>
	<CAAQYJAsKMD38pM5nPCGPorcwKb0OqDpA2YYy0q6MxURjn=DBKg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573580E5.7090404@windriver.com>
Date: Fri, 13 May 2016 15:23:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsKMD38pM5nPCGPorcwKb0OqDpA2YYy0q6MxURjn=DBKg@mail.gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: krogoth's core-image-minimal is much bigger than jethro's
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
X-List-Received-Date: Fri, 13 May 2016 07:23:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/13/2016 03:07 PM, Andrea Adami wrote:
> On Fri, May 13, 2016 at 8:48 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> * For ext4:
>>    11M -> 26M
>>    The similar to vmdk, qcow2 and iso.
>>
>> * For tar.bz2:
>>    2.7M -> 4.5M
>>
>> The main problem is eudev-hwdb which would be 12M after installed, jethro
>> doesn't use this, but udev by default, and it's gone in krogoth.
>> $ du -sh core-image-minimal/1.0-r0/rootfs/etc/udev/*
>> 0        core-image-minimal/1.0-r0/rootfs/etc/udev/cache.data
>> 6.4M     core-image-minimal/1.0-r0/rootfs/etc/udev/hwdb.bin
>> 5.2M     core-image-minimal/1.0-r0/rootfs/etc/udev/hwdb.d
>> 8.0K     core-image-minimal/1.0-r0/rootfs/etc/udev/rules.d
>> 4.0K     core-image-minimal/1.0-r0/rootfs/etc/udev/udev.conf
>>
>> Is there an easier way to fix this problem, please ? It's not a good
>> news for the user who uses core-imag-minimal/udev when they want to
>> upgrade to krogoth. And this would hurt the small device which uses
>> udev.
>>
>
> Somehow we have to explicitely opt-out:
>
> +BAD_RECOMMENDATIONS += "eudev-hwdb"

Does udev still work without eudev-hwdb, please ?

// Robert

>
> IMHO for embedded devices it would be better to disable by default and
> let the distro/machine add a specific RRECOMMEND.
>
> Regards
> Andrea
>
>>
>> The conf is:
>> MACHINE = "qemux86-64"
>> DISTRO = "poky"
>> PACKAGE_CLASSES = "package_rpm"
>> EXTRA_IMAGE_FEATURES = "debug-tweaks"
>> USER_CLASSES = "buildstats image-mklibs"
>>
>> $ bitbake core-image-minimal
>>
>> For jethro:
>> $ ls -lh core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
>> 11M  core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
>> $ du -sh core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
>> 7.9M core-image-minimal-qemux86-64-20160513061306.rootfs.ext4
>>
>> For krogoth:
>>
>> $ ls -lh core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
>> 26M core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
>>
>> $ du -sh core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
>> core-image-minimal-qemux86-64-20160513061459.rootfs.ext4
>>
>> --
>> Thanks
>>
>> Robert
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

