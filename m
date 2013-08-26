Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14B296A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 01:11:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q1BHG0029291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2013 18:11:17 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 25 Aug 2013 18:11:17 -0700
Message-ID: <521AAB34.3010203@windriver.com>
Date: Sun, 25 Aug 2013 21:11:16 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Elvis Dowson <elvis.dowson@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
In-Reply-To: <835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Mon, 26 Aug 2013 01:11:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-25 2:02 PM, Elvis Dowson wrote:
> Hi,
>
> On Aug 25, 2013, at 9:43 PM, rewitt@declaratino.com wrote:
>
>>>
>>> Thanks! Any idea why the qemu with hard float configuration has a kernel panic with linux-yocto?
>>
>> init is going away so the kernel panics. Usually this means it couldn't
>> run the init on the rootfilesystem. Try adding keep_bootcon to your
>> kernel command line and see if that gives anymore debug.
>
> I ran bitbake linux-yocto -c menuconfig
>
> and noticed that the wrong ARM architecture was selected (it was using the same one set using tune-arm926ejs.inc)
>
> The thing is I don't see a defconfig anywhere, and I was wondering how the linux-yocto kernel picks up the defconfig from the standard/base branch.
>

qemuarma9 would be building and booting from the 
standard/arm-versatile-926ejs
branch, and re-use the base policies of the kernel.

It adds only the following board options, found in:

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.10/tree/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9.cfg?h=meta

Bruce

-----

CONFIG_ARCH_VEXPRESS=y

#
# Versatile Express platform type
#
CONFIG_ARCH_VEXPRESS_CA9X4=y
CONFIG_PLAT_VERSATILE=y
CONFIG_ARM_TIMER_SP804=y

#
# Bus support
#
CONFIG_ARM_AMBA=y

#
# Kernel Features
#
CONFIG_SMP=y
CONFIG_NR_CPUS=4

#
# Floating point emulation
#
CONFIG_VFP=y
CONFIG_VFPv3=y
CONFIG_NEON=y

CONFIG_SMSC911X=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL011=y
CONFIG_SERIAL_AMBA_PL011_CONSOLE=y

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set

CONFIG_MTD=y
CONFIG_MTD_CMDLINE_PARTS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_INTELEXT=y

CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"

#
# on-CPU RTC drivers
#
CONFIG_RTC_CLASS=y
CONFIG_RTC_DRV_PL031=y

#
# Watchdog Device Drivers
#
CONFIG_ARM_SP805_WATCHDOG=y
CONFIG_WATCHDOG_NOWAYOUT=y

CONFIG_HAVE_ARM_TWD=y
CONFIG_LOCAL_TIMERS=y

CONFIG_HIGHMEM=y

CONFIG_SCSI=y
CONFIG_BLK_DEV_SD=y

CONFIG_USB=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_STORAGE=y

CONFIG_HOTPLUG=y
CONFIG_HOTPLUG_CPU=y

CONFIG_I2C=y
CONFIG_I2C_VERSATILE=y

# This is for the keyboard / mouse
CONFIG_SERIO_AMBAKMI=y

------

> A TI OMAP 4430 Pandaboard or i.MX6 quad-core SABRE development kit platform would do, but not sure how the linux-yocto kernel works, in terms of pre-selecting the correct defconfig file.
>
> Best regards,
>
> Elvis Dowson
>


