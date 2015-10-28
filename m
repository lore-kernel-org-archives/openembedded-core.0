Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id AF87275894
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 01:36:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9S1a5O1002515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 27 Oct 2015 18:36:05 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 27 Oct 2015 18:36:05 -0700
Message-ID: <56302682.5010006@windriver.com>
Date: Wed, 28 Oct 2015 09:36:02 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1445942620.git.hongxu.jia@windriver.com>	<34a726445da94bca0bf2f56f9823f176b837ac1d.1445942620.git.hongxu.jia@windriver.com>
	<CADkTA4PTc-jyJLKzARJftXU2g-jAVBN-_nAdwLdc509Hg7dtyA@mail.gmail.com>
In-Reply-To: <CADkTA4PTc-jyJLKzARJftXU2g-jAVBN-_nAdwLdc509Hg7dtyA@mail.gmail.com>
Cc: "Ashfield, Bruce" <bruce.ashfield@windriver.co>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel.bbclass: add kernel-devsrc to kernel-dev's RDEPENDS
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
X-List-Received-Date: Wed, 28 Oct 2015 01:36:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/2015 09:46 PM, Bruce Ashfield wrote:
> On Tue, Oct 27, 2015 at 6:45 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> In kernel-dev package, Nothing in ${KERNEL_SRC_PATH}.
> Honestly, I'd rather leave this as-is for now.
>
> I have a feature/bugzilla (call it what you want) for the 2.1 release to re-work
> the partitioning of these packages.
>
> kernel-dev and devsrc have been like this for a while now, and if someone
> really wants the source on their target, they've been adding devsrc as their
> package.
>
> If the split changes such that kernel-dev doesn't end up bringing the source,
> I'd rather not create another set of users that we need to migrate to some
> new packaging scheme.

OK, so we will wait your re-work, please drop this patch

//Hongxu


> Bruce
>
>> ...
>> $ find packages-split/kernel-dev
>> packages-split/kernel-dev
>> packages-split/kernel-dev/boot
>> packages-split/kernel-dev/boot/System.map-4.1.10-WR8.0.0.0_standard
>> packages-split/kernel-dev/boot/Module.symvers-4.1.10-WR8.0.0.0_standard
>> packages-split/kernel-dev/boot/config-4.1.10-WR8.0.0.0_standard
>> ..
>>
>> And package kernel-devsrc included ${KERNEL_SRC_PATH}, so we add
>> kernel-devsrc to kernel-dev's RDEPENDS
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 5e8b6cf..a07c5c1 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -357,7 +357,7 @@ PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-mod
>>   FILES_${PN} = ""
>>   FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>>   FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* /lib/modules/${KERNEL_VERSION}/build"
>>   FILES_kernel-vmlinux = "/boot/vmlinux*"
>>   FILES_kernel-modules = ""
>>   RDEPENDS_kernel = "kernel-base"
>> @@ -368,6 +368,7 @@ PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')
>>   RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
>>   PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>   RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> +RDEPENDS_kernel-dev += "kernel-devsrc"
>>   ALLOW_EMPTY_kernel = "1"
>>   ALLOW_EMPTY_kernel-base = "1"
>>   ALLOW_EMPTY_kernel-image = "1"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


