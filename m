Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 9D32760797
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:46:35 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 91F4168A019; Fri, 13 May 2016 08:46:34 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id A305F68A019;
	Fri, 13 May 2016 08:46:33 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 6826D67400A0;
	Fri, 13 May 2016 09:46:33 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <573578BA.80207@windriver.com>
	<CAAQYJAsKMD38pM5nPCGPorcwKb0OqDpA2YYy0q6MxURjn=DBKg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57358659.4060206@mlbassoc.com>
Date: Fri, 13 May 2016 09:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsKMD38pM5nPCGPorcwKb0OqDpA2YYy0q6MxURjn=DBKg@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 May 2016 07:46:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-13 09:07, Andrea Adami wrote:
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
>
> IMHO for embedded devices it would be better to disable by default and
> let the distro/machine add a specific RRECOMMEND.

+1

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


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

