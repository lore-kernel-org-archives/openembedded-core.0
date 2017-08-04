Return-Path: <california.l.sullivan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 34AD071B87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 20:54:02 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 04 Aug 2017 13:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,322,1498546800"; d="scan'208";a="115755625"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 04 Aug 2017 13:54:03 -0700
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1500848692.git.wei.tee.ng@intel.com>
	<7845bc41803435479389182bed1dfb5d410df24a.1500848692.git.wei.tee.ng@intel.com>
	<1501400871.22282.210.camel@linuxfoundation.org>
	<CBAEED2EB06BF94889E80B47A33FE329EE25D6@PGSMSX105.gar.corp.intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <72844ead-b913-5246-b5b6-99a05fdfae7e@intel.com>
Date: Fri, 4 Aug 2017 13:54:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CBAEED2EB06BF94889E80B47A33FE329EE25D6@PGSMSX105.gar.corp.intel.com>
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 3/3] core-image-minimal-initramfs: use initramfs-framework by default
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
X-List-Received-Date: Fri, 04 Aug 2017 20:54:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Wei Tee,

I'm not sure what is causing the issue you're seeing when trying to run 
the selftests, but I was able to track down the issue causing the 
selftests to fail in normal usage.

Apparently, only systemd-boot sets no "root=" kernel command line 
parameter when booting live. Our other bootloaders (grub, syslinux) set 
root=/dev/ram0. The selftests use syslinux.

 From what I can tell from the kernel docs, this is basically just a 
sentinel value to say "mount the initrd as root":
https://www.kernel.org/doc/html/v4.11/admin-guide/initrd.html

We already have the procedure correct, and just have to account for 
/dev/ram0 as well now.

I'll send a patch for it.

Thanks,
Cal

On 08/04/2017 12:17 AM, Ng, Wei Tee wrote:
> Hi Richard,
>
> Noted with the changes. I had try to reproduce the same failure log that you send to me. However, the result is different.
>
> How can I run the oe-selftest to test out the patch on my machine correctly? Can you verify with me whether the steps below are the correct steps?
> Firstly git clone a poky and meta-intel layer, then source a build. I also enable the oe-selftest configuration on my local.conf and run the command "oe-selftest -r runqemu.RunqemuTests.test_boot_deploy_hddimg"?
>
> I try to test the latest poky master branch without my "use initramfs-framework by default" commit, the oe-selftest for those two testcases are failed too)
> Here is the failure log that I captured: http://pastebin.intel.com/hefizelixo.vhdl
>
> Regards,
> Wei Tee
>
> -----Original Message-----
> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> Sent: Sunday, July 30, 2017 3:48 PM
> To: Ng, Wei Tee <wei.tee.ng@intel.com>; openembedded-core@lists.openembedded.org
> Cc: Wold, Saul <saul.wold@intel.com>
> Subject: Re: [OE-core] [PATCH 3/3] core-image-minimal-initramfs: use initramfs-framework by default
>
> On Sun, 2017-07-23 at 16:51 -0700, wei.tee.ng@intel.com wrote:
>> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>>
>> Use the initramfs-framework for initialization by default due to the
>> modularity and expansibility.
>>
>> [YOCTO #10987]
>>
>> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
>> ---
>>   meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> I'm afraid I had to revert this change:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=fab2219af4a6566124
> cf95d1d2648d4729391baf
>
> because it was causing oe-selftest failures as shown here:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/415/st
> eps/Running%20oe-selftest/logs/stdio
>
> Cheers,
>
> Richard


