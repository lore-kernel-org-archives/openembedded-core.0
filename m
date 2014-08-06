Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39BC8609C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:20:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s76EK4Gl008160
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Aug 2014 07:20:04 -0700 (PDT)
Received: from [128.224.56.57] (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 07:20:03 -0700
Message-ID: <53E23999.1010809@windriver.com>
Date: Wed, 6 Aug 2014 10:20:09 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1407259572-35454-1-git-send-email-paul.gortmaker@windriver.com>
	<20140806082154.GB14848@jama>
In-Reply-To: <20140806082154.GB14848@jama>
X-Originating-IP: [128.224.56.57]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: create an all encompassing package group
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
X-List-Received-Date: Wed, 06 Aug 2014 14:20:09 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 14-08-06 04:21 AM, Martin Jansa wrote:
> On Tue, Aug 05, 2014 at 01:26:12PM -0400, Paul Gortmaker wrote:
>> Currently util-linux is fragmented into lots of small chunks,
>> and if one is looking to avoid using busybox wholesale, there
>> is currently no easy way to say "I want all of it".  Here we
>> create a packagegroup for all of the util-linux chunks, so
>> that it need not be duplicated by everyone wanting the same
>> overall goal of removing busybox.
> 
> Why don't you define these as empty packages with just RDEPENDS
> in util-linux?

Sorry, but I'm not quite sure I follow what you mean.  Can you
provide more detail, or perhaps point at a bb as an example
implementation of what you have in mind?

Thanks,
Paul.
--

> 
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-util-linux.bb b/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
>> new file mode 100644
>> index 000000000000..54151502b176
>> --- /dev/null
>> +++ b/meta/recipes-core/packagegroups/packagegroup-util-linux.bb
>> @@ -0,0 +1,69 @@
>> +#
>> +# Copyright (C) 2014 Wind River
>> +#
>> +
>> +SUMMARY = "util-linux Packages"
>> +DESCRIPTION = "Packages created from util-linux"
>> +PR = "r0"
>> +LICENSE = "MIT"
>> +
>> +inherit packagegroup
>> +
>> +PACKAGES = "\
>> +    packagegroup-util-linux \
>> +    packagegroup-util-linux-block \
>> +    packagegroup-util-linux-console \
>> +    packagegroup-util-linux-uid \
>> +    packagegroup-util-linux-misc \
>> +    packagegroup-util-linux-partition \
>> +    "
>> +
>> +RDEPENDS_packagegroup-util-linux = "\
>> +    packagegroup-util-linux-block \
>> +    packagegroup-util-linux-console \
>> +    packagegroup-util-linux-uid \
>> +    packagegroup-util-linux-misc \
>> +    packagegroup-util-linux-partition \
>> +    "
>> +
>> +RDEPENDS_packagegroup-util-linux-partition = "\
>> +    util-linux-fdisk \
>> +    util-linux-cfdisk \
>> +    util-linux-sfdisk \
>> +    util-linux-partx \
>> +    "
>> +
>> +RDEPENDS_packagegroup-util-linux-console = "\
>> +    util-linux-agetty \
>> +    util-linux-reset \
>> +    "
>> +
>> +RDEPENDS_packagegroup-util-linux-block = " \
>> +    util-linux-mkfs \
>> +    util-linux-mkfs.cramfs \
>> +    util-linux-fsck.cramfs \
>> +    util-linux-fstrim \
>> +    util-linux-fsck \
>> +    util-linux-blkid \
>> +    util-linux-libblkid \
>> +    util-linux-umount \
>> +    util-linux-mount \
>> +    util-linux-libmount \
>> +    util-linux-swaponoff \
>> +    "
>> +
>> +RDEPENDS_packagegroup-util-linux-uid = "\
>> +    util-linux-libuuid \
>> +    util-linux-uuidd \
>> +    util-linux-uuidgen \
>> +    util-linux-findfs \
>> +    "
>> +
>> +RDEPENDS_packagegroup-util-linux-misc = "\
>> +    util-linux-losetup \
>> +    util-linux-readprofile \
>> +    util-linux-lscpu \
>> +    util-linux-mcookie \
>> +    util-linux-bash-completion \
>> +    util-linux-hwclock \
>> +    "
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

