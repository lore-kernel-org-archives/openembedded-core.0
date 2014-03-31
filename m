Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2DD360C22;
	Mon, 31 Mar 2014 22:31:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2VMVIpC020221
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 15:31:18 -0700 (PDT)
Received: from server.local (128.224.23.102) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 31 Mar 2014 15:31:18 -0700
Message-ID: <5339ECE5.40501@windriver.com>
Date: Mon, 31 Mar 2014 18:32:05 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20140330090302.B0FBA50478@opal> <20140330113031.GF2428@jama>
	<53382C05.70506@windriver.com> <20140331215105.GI2425@jama>
In-Reply-To: <20140331215105.GI2425@jama>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : linux-yocto/3.10: fix drm build failure
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
X-List-Received-Date: Mon, 31 Mar 2014 22:31:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-03-31, 5:51 PM, Martin Jansa wrote:
> On Sun, Mar 30, 2014 at 10:36:53AM -0400, Bruce Ashfield wrote:
>> On 2014-03-30, 7:30 AM, Martin Jansa wrote:
>>> On Sun, Mar 30, 2014 at 09:03:02AM +0000, git@git.openembedded.org wrote:
>>>> Module: openembedded-core.git
>>>> Branch: master
>>>> Commit: 42c0eba4fac6b8bd28b58ec04574d04b0ab0c457
>>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=42c0eba4fac6b8bd28b58ec04574d04b0ab0c457
>>>>
>>>> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> Date:   Thu Mar 27 13:22:32 2014 -0400
>>>>
>>>> linux-yocto/3.10: fix drm build failure
>>>>
>>>> Andrea Adami reported the following build failure:
>>>>
>>>>       .../drm/drm_mm.h:105:2: error: implicit declaration of function
>>>>       'BUG_ON' [-Werror=implicit-function-declaration]
>>>>       |   BUG_ON(!hole_node->hole_follows);
>>>>       |   ^
>>>>       |   CC      drivers/pci/setup-res.o
>>>>       |   CC      drivers/gpu/drm/i915/i915_drv.o
>>>>       | cc1: some warnings being treated as errors
>>>>       | make[6]: *** [drivers/gpu/drm/ttm/ttm_agp_backend.o] Error 1
>>>>       | make[5]: *** [drivers/gpu/drm/ttm] Error 2
>>>>
>>>> Cherry picking mainline commit 86e81f0e6 [drm/mm: include required headers in drm_mm.h]
>>>> fixes the build problems.
>>>>
>>>> cc: Andrea Adami <andrea.adami@gmail.com>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>
>>>> ---
>>>>
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
>>>>    meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
>>>>    meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
>>>>    3 files changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>>>> index 9b0c5d3..fe6773a 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>>>> @@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
>>>>    KBRANCH = "standard/preempt-rt/base"
>>>>    KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>>>>
>>>> -SRCREV_machine ?= "f121a3aa028df37b8050779adaa239d29aaa2edd"
>>>> -SRCREV_machine_qemuppc ?= "7172d3cbc73584e724b61ef5d13fc3519720f4c0"
>>>> +SRCREV_machine ?= "f4351616572c6ad5a8b71b1becf02c3e779b85b8"
>>>> +SRCREV_machine_qemuppc ?= "a6dfc85e99633d739068a03d2551e39847628551"
>>>>    SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
>>>>
>>>>    SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>>> index baa82fd..123f307 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>>> @@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.34"
>>>>
>>>>    KMETA = "meta"
>>>>
>>>> -SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>>>> +SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>>>>    SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
>>>>
>>>>    PV = "${LINUX_VERSION}+git${SRCPV}"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>>>> index 56fbd07..49dd13d 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>>>> @@ -11,13 +11,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
>>>>    KBRANCH_qemux86-64  = "standard/common-pc-64/base"
>>>>    KBRANCH_qemumips64 = "standard/mti-malta64"
>>>>
>>>> -SRCREV_machine_qemuarm ?= "e18e8c2c7cad913a25342f9f860eeeefce24b8aa"
>>>> -SRCREV_machine_qemumips ?= "6f191aaecfdbebda450cec4a1f30fb0d1a2ed889"
>>>> -SRCREV_machine_qemuppc ?= "ba2e16160c7f910de432511ca0008101a7b2263b"
>>>> -SRCREV_machine_qemux86 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>>>> -SRCREV_machine_qemux86-64 ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>>>> -SRCREV_machine_qemumips64 ?= "e05f0378e9c21d689eed8aacb306d2c1a044e0d0"
>>>> -SRCREV_machine ?= "2ee37bfe732c73f7d39af55875ce8d30b282471c"
>>>> +SRCREV_machine_qemuarm ?= "0e99eabbe5b3bec853ace496f94612bc37800260"
>>>> +SRCREV_machine_qemumips ?= "b6b20f49e9a169a0672b7cc2d7b93d6652ca7873"
>>>> +SRCREV_machine_qemuppc ?= "d71b782615b802c78e1586494b94dd40531775c8"
>>>> +SRCREV_machine_qemux86 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>>>
>>> Is it correct revision?
>>>
>>
>> I can confirm that that is the right revision. I wonder what the fetcher
>> is doing, or is something in the infrastructure caching and older
>> revision ?
>
> Sorry for noise, it was after all our mirror not getting updates
> anymore, fetching it manually works.

No worries. Better to report and have me poke at it, then letting it sit.
It's not like I don't cross up SRCREVs periodically :(

Bruce

>
>> yow-bashfiel-d3 [/home/bruc...o-3.10.git]> git branch --contains
>> c7739be126930006e3bfbdb2fb070a967abc5e09
>>     standard/arm-versatile-926ejs
>>     standard/axxia/base
>> * standard/base
>>     standard/beagleboard
>>     standard/ck
>>     standard/common-pc-64/base
>>     standard/common-pc-64/chiefriver
>>     standard/common-pc-64/crystalforest
>>     standard/common-pc-64/jasperforest
>>     standard/common-pc-64/rangeley
>>     standard/common-pc-64/romley
>>     standard/common-pc-64/sugarbay
>>     standard/common-pc/atom-pc
>>     standard/common-pc/base
>>     standard/crownbay
>>     standard/edf
>>     standard/emenlow
>>     standard/fri2
>>     standard/fsl-mpc8315e-rdb
>>     standard/ltsi
>>     standard/minnow
>>     standard/mti-malta32
>>     standard/mti-malta64
>>     standard/ocf
>>     standard/preempt-rt/base
>>     standard/preempt-rt/fri2
>>     standard/preempt-rt/minnow
>>     standard/preempt-rt/qemuppc
>>     standard/preempt-rt/routerstationpro
>>     standard/qemuppc
>>     standard/routerstationpro
>>     standard/sys940x
>>     standard/tiny/base
>>     standard/tiny/common-pc
>>     standard/tiny/fri2
>>     standard/tiny/minnow
>>
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.10/commit/?h=standard/common-pc/base&id=c7739be126930006e3bfbdb2fb070a967abc5e09
>>
>>
>> Bruce
>>
>>> ERROR: Fetcher failure: Unable to find revision c7739be126930006e3bfbdb2fb070a967abc5e09 in branch
>>> standard/common-pc/base even from upstream
>>> ERROR: Logfile of failure stored in: work/qemux86-webos-linux/linux-yocto/1_3.10.34+gitAUTOINC+df3aa753c8_c7739be126-r0/temp/log.do_fetch.73290
>>>
>>>> +SRCREV_machine_qemux86-64 ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>>>> +SRCREV_machine_qemumips64 ?= "88abb1eb327f4e3c711d19a228cb153fdd9b3506"
>>>> +SRCREV_machine ?= "c7739be126930006e3bfbdb2fb070a967abc5e09"
>>>>    SRCREV_meta ?= "df3aa753c8826127fb5ad811d56d57168551d6e4"
>>>>
>>>>    SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-commits mailing list
>>>> Openembedded-commits@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>>
>>
>


