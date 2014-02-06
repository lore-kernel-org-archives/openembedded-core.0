Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD5B6D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 05:20:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2014 21:16:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,791,1384329600"; d="scan'208";a="450549586"
Received: from unknown (HELO [10.254.106.59]) ([10.254.106.59])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2014 21:20:20 -0800
User-Agent: Microsoft-MacOutlook/14.2.2.120421
Date: Wed, 05 Feb 2014 21:20:08 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <CF185AA7.62BD0%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] linux-yocto: Use PACKAGE_ARCH in build dir
In-Reply-To: <CADkTA4OVfau9egNsK_nd2O2gq=WQF89Zh=-2=-AncbgfVStbjw@mail.gmail.com>
Mime-version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: Use PACKAGE_ARCH in build dir
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
X-List-Received-Date: Thu, 06 Feb 2014 05:20:35 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 2/5/14, 20:30, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

>On Wed, Feb 5, 2014 at 11:02 PM, Darren Hart <dvhart@linux.intel.com>
>wrote:
>> The current linux-yocto build dir (B) includes MACHINE. This has been
>> appropriate as kernels are typically built machine-specific. We have
>> recently introduced an intel-common type kernel which can be shared
>> across multiple machines sharing a common base (intel-core2-32,
>> intel-corei7-64). In these cases, the kernel is built for a something
>> more generic than MACHINE, and the current mechanism results in
>> something like this when building for MACHINE=sys940x (using
>>intel-common):
>>
>> tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
>> 
>>3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-sys940x-noemgd-standard-b
>>uild
>>
>> Note the descrepancy between core2-32-intel-common and
>> linux-sys940x-noemgd-standard-build. This becomes counterintuitive at
>> the very least when switching to another machine and attempting to reuse
>> this build. This patch swaps MACHINE for PACKAGE_ARCH (which is
>> typically MACHINE_ARCH for linux-yocto), resulting in the following
>> build path:
>>
>> tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
>> 
>>3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-core2-32-intel-common-sta
>>ndard-build
>>
>> The impact to existing MACHINEs is a replace of - with _ if MACHINE
>> contains one or more - charachters.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto.inc |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 2bee042..4ed3188 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -31,7 +31,7 @@ inherit kernel
>>  inherit kernel-yocto
>>  require linux-dtb.inc
>>
>> -B = "${WORKDIR}/linux-${MACHINE}-${LINUX_KERNEL_TYPE}-build"
>> +B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
>
>But for truly machine specific kernel builds, won't this cause us
>collisions ?

I don't see how. Note the build paths above. For truly machine-specifc
builds, the WORKDIR is already machine-specific (because the PACKAGE_ARCH
is MACHINE_ARCH), so there is no need to specify the MACHINE in the S or B
dirs really at all. In fact, just calling this linux-build without any
other modifier would be fine I think. What I attempted here was in keeping
with the intent of the design: identify what we are building for in the B
dir.

--
Darren



