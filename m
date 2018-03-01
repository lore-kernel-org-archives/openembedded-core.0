Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA5E60616
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:59:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w21DwmDS007331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 1 Mar 2018 05:58:48 -0800
Received: from server.local (128.224.23.186) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 1 Mar 2018 05:58:47 -0800
To: "Maxin B. John" <maxin.john@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
	<20180301105836.GA14042@mbabyjoh-desk.ger.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <47964139-38be-5fb6-8084-6abad6d19fdd@windriver.com>
Date: Thu, 1 Mar 2018 08:59:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180301105836.GA14042@mbabyjoh-desk.ger.corp.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 01 Mar 2018 13:59:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-03-01 5:58 AM, Maxin B. John wrote:
> 
>> Also fails on musl:
>>
>> ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/meta/recipes-kernel/linux/kernel-devsrc.bb RDEPENDS on or otherwise requires it)
>>
>> Ross
>>
>> On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com> wrote:
> 
>   >On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
>   >> The existing kernel-devsrc package starts with a full copy of the kernel
>   >> source and then starts to strip out elements that are not required.
>   >>
>   >> This results in extra time (I/O) and extra space being taken up in the
>   >> final package. The main purpose of the kernel-devsrc package has been to
>   >> build modules against the running kernel, not to include a full copy of
>   >> the source code for re-building the kernel. The end result was a
>   >> 600M kernel-devsrc package.
> 
>   Other failures are listed below:
>   
>   arm64:
>   https://autobuilder.yocto.io/builders/nightly-arm64/builds/790/steps/Running%20Sanity%20Tests/logs/stdio
> 
>   RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase 1541: FAILED
> 
> HOSTCC  scripts/sortextable
>   scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
> #include <tools/be_byteshift.h>
>    ^~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
> make: *** [Makefile:557: scripts] Error 2
> ----------------------------------------------------------------------
> 
> Similar on qemuarm - poky-lsb :
> 
> https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/812/steps/Running%20Sanity%20Tests/logs/stdio
> 
> HOSTCC  scripts/recordmcount
> HOSTCC  scripts/sortextable
> scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
>      #include <tools/be_byteshift.h>
>                ^~~~~~~~~~~~~~~~~~~~~~
>                compilation terminated.
>                make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
>                make: *** [Makefile:557: scripts] Error 2
> -------------------------------------------------------------------------
> 
> Also on PowerPC:
> 
> https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/814/steps/Running%20Sanity%20Tests/logs/stdio
> 
> scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
>   #include <tools/be_byteshift.h>
>             ^~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
> make: *** [Makefile:557: scripts] Error 2

I have all these fixed now.

Will have a look at musl next.

Cheers,

Bruce

> 
> Best Regards,
> Maxin
> 


