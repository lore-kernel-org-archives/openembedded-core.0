Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77CBA706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 13:14:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1NDEsni008509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Feb 2015 05:14:54 -0800 (PST)
Received: from server.local (128.224.23.72) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 23 Feb 2015 05:14:54 -0800
Message-ID: <54EB27CD.3000800@windriver.com>
Date: Mon, 23 Feb 2015 08:14:53 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1424610251.11836.74.camel@linuxfoundation.org>	
	<54EAB6E3.5010804@windriver.com>
	<1424686123.11836.76.camel@linuxfoundation.org>
In-Reply-To: <1424686123.11836.76.camel@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto task performance numbers
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
X-List-Received-Date: Mon, 23 Feb 2015 13:15:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-02-23 5:08 AM, Richard Purdie wrote:
> On Mon, 2015-02-23 at 00:13 -0500, Bruce Ashfield wrote:
>> Was this the 3.19 kernel you used for these stats ? I just ran a quick
>> test (i.e. not with buildstats) with my latest kernel tree (on my
>> crappy I/O laptop) and get the following:
>>
>> % time bitbake -f -c kernel_configme linux-yocto
>>
>> real    0m7.378s
>> user    0m4.356s
>> sys     0m5.553s
>>
>>
>> So I'm showing 7 seconds, versus 45 in your run .. and I'm showing:
>>
>> real    0m26.371s
>> user    0m12.561s
>> sys     0m19.534s
>>
>> For do_patch (and that is before the already in progress changes that
>> I mentioned earlier).
>>
>> Just with those differences alone, sounds like we should log this in
>> bugzilla and put the details of the configuration and build machines in
>> there .. since I'll need to isolate what is causing those extra long
>> runs, and ensure that everything is pushed to the various trees.
>
> I think I messed up and ran against a slightly different version. The
> numbers confirmed with 3.19 are:
>
> do_bundle_initramfs: Elapsed time: 0.03 seconds
> do_compile: Elapsed time: 78.07 seconds
> do_compile_kernelmodules: Elapsed time: 35.23 seconds
> do_configure: Elapsed time: 0.60 seconds
> do_deploy: Elapsed time: 14.39 seconds
> do_fetch: Elapsed time: 0.04 seconds
> do_install: Elapsed time: 2.02 seconds
> do_kernel_checkout: Elapsed time: 10.67 seconds
> do_kernel_configcheck: Elapsed time: 8.03 seconds
> do_kernel_configme: Elapsed time: 70.41 seconds
> do_kernel_link_vmlinux: Elapsed time: 0.03 seconds
> do_package: Elapsed time: 33.48 seconds
> do_packagedata: Elapsed time: 2.30 seconds
> do_package_qa: Elapsed time: 4.94 seconds
> do_package_write_ipk: Elapsed time: 68.72 seconds
> do_package_write_rpm: Elapsed time: 44.33 seconds
> do_patch: Elapsed time: 56.43 seconds
> do_populate_lic: Elapsed time: 0.14 seconds
> do_populate_sysroot: Elapsed time: 0.16 seconds
> do_shared_workdir: Elapsed time: 0.04 seconds
> do_sizecheck: Elapsed time: 0.03 seconds
> do_strip: Elapsed time: 0.03 seconds
> do_uboot_mkimage: Elapsed time: 0.02 seconds
> do_unpack: Elapsed time: 5.06 seconds
> do_validate_branches: Elapsed time: 0.69 seconds
>
> To get the numbers:
>
> bitbake linux-yocto -c cleansstate
> bitbake linux-yocto
> $ (cd tmp/buildstats/linux-yocto-qemux86-64/201502230954/linux-yocto-3.19+gitAUTOINC+8897ef68b3_43b9eced9b-r0/; grep El * | sed s/linux-yocto-3.19+gitAUTOINC+8897ef68b3_43b9eced9b-r0// | sed s/^.*:://)
>
> So configcheck is better but the other times still seem high.

Yep. configme should never take that long, so something different
is happening in your qemu build than mine. I'll dig up my other
speedup changes and run them against the same machine build and
see what I get.

I just did a run for qemumips, and patching took 9 seconds :)

Bruce

>
> Cheers,
>
> Richard
>


