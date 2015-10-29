Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 912BB755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 21:34:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2015 14:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,216,1444719600"; d="scan'208";a="806901873"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Oct 2015 14:34:29 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id AC52E6A4087; Thu, 29 Oct 2015 14:33:27 -0700 (PDT)
Received: from 10.252.141.62 (SquirrelMail authenticated user randy.e.witt)
	by linux.intel.com with HTTP; Thu, 29 Oct 2015 14:33:27 -0700 (PDT)
Message-ID: <64198.10.252.141.62.1446154407.squirrel@linux.intel.com>
In-Reply-To: <CAFoFrHZEFPucHjumrwKE4zs+n8EjcE3hJC_k2SotcrUwr6fphw@mail.gmail.com>
References: <CAFoFrHaiWeGDoRqDAqnKdKy30d+NihfsrvgT4z06F+8OZV0ApA@mail.gmail.com>
	<CAFoFrHZEFPucHjumrwKE4zs+n8EjcE3hJC_k2SotcrUwr6fphw@mail.gmail.com>
Date: Thu, 29 Oct 2015 14:33:27 -0700 (PDT)
From: randy.e.witt@linux.intel.com
To: "Naresh Bhat" <naresh.bhat@linaro.org>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Matt Fleming <matt.fleming@intel.com>, "Neri,
	Ricardo" <ricardo.neri@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>,
	"luv@lists.01.org" <luv@lists.01.org>
Subject: Re: luvOS yocto based project - "hvc0" respawning too fast
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
X-List-Received-Date: Thu, 29 Oct 2015 21:34:32 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi Naresh,

> +OE core ML
>
> On 27 October 2015 at 16:17, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> Hi Randy,
>>
>> The luvOS project is based on luv-yocto frame work.  I have built the
>> luvOS project for AArch64 architecture using qemuarm64.conf machine
>> configuration file and boot the luvOS image on QEMU machine (used
>> latest QEMU git repository image i.e. qemu-system-aarch64 QEMU
>> v2.4.50)
>>
>> I am facing the following issue on the console "INIT: Id "hvc0"
>> respawning too fast: disabled for 5 minutes"
>>

The easiest way for you to get around this without creating your own image
is to probably mimc what runqemu does. (which is the expected consumer of
the qemu images)

If you add "-device virtio-serial-device -chardev null,id=virtcon -device
virtconsole,chardev=virtcon" to the qemu commandline, this will add the
second serial port.
>> ...
>> .....
>>     [-] kernel-efi-warnings
>>       [+] EFI_BOOT_SERVICES_*_illegal_access... passed
>>
>> Ran 3 testsuites and 64 unittests, 53 passes, 15 fails, 3 skipped.
>>
>> Linux UEFI Validation Distribution 2.0-dev qemuarm64 ttyAMA0
>>
>> INIT: Id "hvc0" respawning too fast: disabled for 5 minutes
>> Linux UEFI Validation Distribution 2.0-dev qemuarm64 ttyAMA0
>>
>> qemuarm64 login: root
>> root@qemuarm64:~#
>> root@qemuarm64:~#
>>
>>
>> Can you please let me know how did you tested this patch on QEMU and
>> what are the parameter's you have passed for command line ? Can you
>> please help me to overcome from the above issue ?
>>
>> I am using following script to launch the QEMU -
>> https://wiki.linaro.org/LEG/Engineering/luvOS#How_to_test_luvOS_image_on_QEMU
>> and I can see the below patch introduced the hvc0
>>
>> [nareshbhat@Lenovo luv-yocto]$ git show
>> f44e043c752470b1ed4d22f3732dc0b362f83fd9
>> commit f44e043c752470b1ed4d22f3732dc0b362f83fd9
>> Author: Randy Witt <randy.e.witt@linux.intel.com>
>> Date:   Thu Aug 27 19:42:43 2015 -0700
>>
>>     qemuarm64.conf: Make the second serial console /dev/hvc0
>>
>>     Since the qemu for aarch64 must use a virtual console for the second
>>     serial port rather than emulating actual hardware, make sure the
>> correct
>>     device is specified so that a tty is actually started.
>>
>>     (From OE-Core rev: 5b720a69f0d181ab2de6032a6e3f5a0ee4a14302)
>>
>>     Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> diff --git a/meta/conf/machine/qemuarm64.conf
>> b/meta/conf/machine/qemuarm64.conf
>> index 7bbdad7..8459d0f 100644
>> --- a/meta/conf/machine/qemuarm64.conf
>> +++ b/meta/conf/machine/qemuarm64.conf
>> @@ -9,4 +9,4 @@ MACHINE_FEATURES = ""
>>
>>  KERNEL_IMAGETYPE = "Image"
>>
>> -SERIAL_CONSOLES = "38400;ttyAMA0 38400;ttyAMA1"
>> +SERIAL_CONSOLES = "38400;ttyAMA0 38400;hvc0"
>> [nareshbhat@Lenovo luv-yocto]$
>>
>>
>> Thanks and Regards
>> -Naresh
>


