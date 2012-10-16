Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOC6k-0001XX-VC
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 20:43:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2012 11:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,595,1344236400"; d="scan'208";a="228192553"
Received: from unknown (HELO [10.255.13.226]) ([10.255.13.226])
	by orsmga002.jf.intel.com with ESMTP; 16 Oct 2012 11:29:53 -0700
Message-ID: <507DA7A0.5060100@linux.intel.com>
Date: Tue, 16 Oct 2012 11:29:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1349112564.32611.71.camel@phil-desktop>
	<507B3297.3010102@linux.intel.com>
	<1350297128.3259.132.camel@phil-desktop>
In-Reply-To: <1350297128.3259.132.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] insane: Rationalise phdrs-based QA checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2012 18:43:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2012 03:32 AM, Phil Blundell wrote:
> On Sun, 2012-10-14 at 14:45 -0700, Saul Wold wrote:
>> On 10/01/2012 10:29 AM, Phil Blundell wrote:
>>> Various different QA checks are based on essentially the same data from
>>> the ELF program headers.  Calling objdump to extract it repeatedly is
>>> inefficient, particularly if the shell is involved.  Instead, let's
>>> cache the output from objdump inside the qa.elf object and allow it to
>>> be reused by multiple tests.
>>>
>>> Also, using objdump instead of scanelf to check for bad RPATHs (in the
>>> same way that the useless-rpaths check was doing already) allows the
>>> dependency on pax-utils-native to be dropped.
>>>
>> This seems to be failing for a QemuArm build of world, specifically
>> lsbsetup, quilt, sysvinit, and foomatic-filters seems like its failing
>> on symlinks.
>
> I wasn't able to complete a build of world successfully due to some
> unrelated-looking breakage in xserver-xorg, but I did reproduce this
> problem by building quilt by hand.  The attached patch fixes it for me.
>
This is better, but I found another failure:

> ERROR: Error executing a python function in /intel/distro/meta/recipes-devtools/qemu/qemu_1.2.0.bb:
> ExecutionError: Execution of '/intel/poky/builds/world/tmp/sysroots/x86_64-linux/usr/bin/armv5te-poky-linux-gnueabi/arm-poky-linux-gnueabi-objdump -p /intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3/packages-split/qemu/usr/share/qemu/palcode-clipper' failed with exit code 1:
> /intel/poky/builds/world/tmp/sysroots/x86_64-linux/usr/bin/armv5te-poky-linux-gnueabi/arm-poky-linux-gnueabi-objdump: /intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3/packages-split/qemu/usr/share/qemu/palcode-clipper: File format not recognized
>

When I run file:
/intel/poky/builds/world/tmp/work/armv5te-poky-linux-gnueabi/qemu-1.2.0-r3/packages-split/qemu/usr/share/qemu/palcode-clipper: 
ELF 64-bit LSB executable, Alpha (unofficial), version 1 (SYSV), 
statically linked, not stripped

I was building qemuarm, but I had a done a qemuppc build earlier also.

Sau!

> thanks
>
> p.
>


