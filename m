Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B2F5F609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 13:53:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2015 06:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,469,1427785200"; d="scan'208";a="496556883"
Received: from lpobrien-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.32])
	by FMSMGA003.fm.intel.com with ESMTP; 21 May 2015 06:53:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen.Pankratz@elektrobit.com
Date: Thu, 21 May 2015 14:53:37 +0100
Message-ID: <1953557.Q3PSlmcSRZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A3649393797@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A3649393797@deeres07.ebgroup.elektrobit.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problem with module.bbclass
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
X-List-Received-Date: Thu, 21 May 2015 13:53:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steffen,

On Thursday 21 May 2015 13:48:34 Steffen.Pankratz@elektrobit.com wrote:
> I am using
> http://git.openembedded.org/openembedded-core/tree/meta/classes/module.bbcl
> ass as a base for my recipe to compile a kernel module outside of the kernel
> tree.
> 
> This is my recipe:
> 
> DESCRIPTION = "Nouveau kernel module"
> SECTION = "kernel/modules"
> LICENSE = "CLOSED" #fixme
> PR = "r0"
> SRC_URI = "git://github.com/Gnurou/nouveau;protocol=https;branch=staging"
> SRCREV = "c256f9450c613cd5075fc8c4a407686925041487"
> S = "${WORKDIR}/git/drm/nouveau"
> inherit module
> 
> Naively, I hoped that would work out of the box. Of course it did not :) and 
every compiler call resulted in an error message like this:
> | make: *** [lib/nvif/notify.o] Error 1
> | In file included from ./lib/include/nvif/os.h:32:0,
> | 
> |                  from ./drm/nouveau/include/nvif/object.h:4,
> |                  from ./drm/nouveau/include/nvif/device.h:4,
> | 
> |                  from drm/nouveau/nvif/device.c:25:
> | /home/vagrant/repos/tk1/build/tmp/sysroots/x86_64-linux/usr/lib/arm-poky-l
> | inux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.2/include/stdint.h:9:26: fatal
> | error: stdint.h: No such file or directory| 
> |  # include_next <stdint.h>
> |  
> |                           ^
> | 
> | compilation terminated.
> 
> I could resolve that issue by adding the following line to my recipe:
> 
> EXTRA_OEMAKE='-C "${STAGING_KERNEL_DIR}"'
> 
> And another problem I had faced was that using:
> 
> S = "${WORKDIR}/git/drm/nouveau"
> 
> Compiled all kernel modules inside the kernel tree, instead only the nouveau
> kernel module.
> 
> I could solve that as well and finally I ended up with:
> 
> EXTRA_OEMAKE='-C "${STAGING_KERNEL_DIR}" M="${S}"/drm/nouveau/'
> 
> Now, I am not sure if I am doing something wrong or if there maybe is a
> problem with module.bbclass.

The original message makes it sound like the makefile for the module isn't 
using CC but instead calling gcc directly, and thus not getting the 
--sysroot option passed in - is that possible?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

