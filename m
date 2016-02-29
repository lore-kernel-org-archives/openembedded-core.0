Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6B57326D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 23:42:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1TNgKFK028031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Feb 2016 15:42:21 -0800 (PST)
Received: from server.local (128.224.20.122) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Feb 2016 15:42:20 -0800
To: "Sullivan, California L" <california.l.sullivan@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
	<48F3FC2919BF894DA92986D5D64EA12801A6424A@ORSMSX103.amr.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56D4D75B.3060606@windriver.com>
Date: Mon, 29 Feb 2016 18:42:19 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <48F3FC2919BF894DA92986D5D64EA12801A6424A@ORSMSX103.amr.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "WOLD,
	SAUL" <saul.wold@intel.com>
Subject: Re: [v2 PATCH 0/8] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 29 Feb 2016 23:42:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-29 6:01 PM, Sullivan, California L wrote:
> On 02/29/2016 02:10 PM, Bruce Ashfield wrote:
>> Hi all,
>>
>> v2: actually cc oe-core on the series.
>>
>> Here is the consolidated pull request for linux-yocto 4.1 and 4.4. Most of the
>> changes are updates to -stable for the kernels, and the others are updates for
>> specific boards.
>>
>> I've been building and booting these for qemu*, but of course, more mileage and
>> combinations in the autobuilder is best.
>>
>> Some things to note:
>>
>>   - We have some refactored kernel configuration updates to the base/core policy
>>     of the standard kernel, with a new "developer" kernel type being available,
>>     leaving standard as a smaller variant. Existing board configs have been
>>     flipped to use developer, so they'll see no change, leaving new board configs
>>     to take advantage of the smaller, standard kernel type.
> It looks like this change hasn't been integrated into the kernel cache yet.

I just pushed the fixed patch to the end of zedd/kernel:

--------------------------
commit caaa5922cca50eab479dfe0e20ae466e92a09775
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Mon Feb 29 18:39:24 2016 -0500

     linux-yocto/kernel-meta: ktype refactoring: move DEBUG_KERNEL, 
EXPERT and EMBEDDED

     Integrating the folliwing patch series from Cal:

       This patch series refactors the ktypes so that base and standard 
ktypes
       do not enable EMBEDDED, EXPERT, or DEBUG_KERNEL. The reason this
       decision was made is because production platforms likely do not want
       DEBUG_KERNEL enabled, and EMBEDDED selects EXPERT which selects
       DEBUG_KERNEL.

       A new ktype called "developer" was also created. This ktype
       enables the options now missing from standard and base, making it 
easy
       to maintain the functionality of a BSP through simply swapping 
the ktype
       from standard to developer. The preempt-rt ktype is now based off of
       developer in order to maintain its functionality.

       The new standard ktype does not include EMBEDDED, EXPERT, or
       DEBUG_KERNEL. Without DEBUG_KERNEL it loses a number of debug 
features
       that are selected by default. Without EXPERT it gains 
RFKILL_INPUT and
       DEBUG_MEMORY_INIT, while losing VMSPLIT_3G. These are only 
available to
       configure with CONFIG_EXPERT=y and default to EXPERT or !EXPERT. Not
       selecting EMBEDDED has no apparent impacts.

       Some coordination is required for this change, as existing BSPs 
WILL be
       affected, and will either need to accept the changes in the standard
       ktype or move to the developer ktype.

       California Sullivan (12):
         features/debug: add debug-kernel feature
         ktypes: add developer ktype
         ktypes/base: Disable EMBEDDED and DEBUG_KERNEL
         CONFIG_PROCESSOR_SELECT: do not enable
         intel-common-drivers.scc: move profiling and latencytop to a 
new file
         romley.scc remove profiling and latencytop features
         bsp/intel-common: add intel-core* developer BSPs
         preempt-rt.scc: include developer ktype instead of standard
         intel-common: add intel-developer-drivers.scc to preempt-rt BSPs
         CONFIG_I2C_I801: set option to yes in intel-core* BSPs
         bsp: add developer common-pc BSPs
         bsp: remove profiling and latencytop from non-developer 
common-pc BSPs

     Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-------------------

Bruce

>
> ---
> Cal Sullivan
>
>>
>>   - The yocto reference BSPs haven't been updated yet, and we need to find
>>     someone with the h/w to do the updates. These may just have to stay on
>>     4.1 LTSI for this cycle.
>>
>>   - We are still seeing the 32 bit x86 X issue on the 4.4 kernel , with a splat on
>>     boot up. I've tried to bisect this twice, leading to inconclusive results, but
>>     regardless, I need to march 4.4 onto the latest -stable, and we'll continue
>>     looking into this issue in the M4 timeframe.
>>
>>   - There still seem to be some races in perf, and something is up with sstate
>>     and the kexec/kboot builds using meta-initramfs and linux-yocto-tiny-kexecboot.
>>     Now that these updates are out, I'll revisit them and hold any stable updates
>>     (unless there are significant CVEs) in the M4 cycle.
>>
>> Cheers,
>>
>> Bruce
>>
>> The following changes since commit 4006a7f2762ccd5dcbc6cdff49482d4387a73261:
>>
>>    sanity: Fix int verses string reference (2016-02-28 22:54:09 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib zedd/kernel
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (8):
>>    linux-yocto/4.1: Galileo updates
>>    linux-yocto/4.1: clkdev updates
>>    linux-yocto/4.1: update to 4.1.18
>>    linux-yocto/4.4: yaffs2 build fixes
>>    linux-yocto: braswell: Remove feature and move DRM_I915_PRELIMINARY_HW_SUPPORT option
>>    linux-yocto/4.4: update to -stable 4.4.2
>>    linux-yocto/4.1: iwlwifi: mvm: don't allow sched scans without matches to be started
>>    linux-yocto/4.4: update to 4.4.3
>>
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
>>   meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
>>   meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
>>   meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
>>   meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
>>   6 files changed, 32 insertions(+), 32 deletions(-)
>>
>


