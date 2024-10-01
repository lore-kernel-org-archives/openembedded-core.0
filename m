Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EF4CEACCD
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 14:35:20 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.83409.1727793312210870489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 07:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPV6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1svdy2-0004UB-3S; Tue, 01 Oct 2024 16:35:10 +0200
Message-ID: <92a6efc1-51a0-4153-b894-581fbe868595@pengutronix.de>
Date: Tue, 1 Oct 2024 16:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [yocto] [PATCH v7 0/7] Add barebox bootloader support (and
 testing)
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, yocto@pengutronix.de
References: <20240919120640.19714-1-ejo@pengutronix.de>
 <b77f2c6737c330ef9ecce325d50a4aaa25b3e536.camel@linuxfoundation.org>
 <ee536d88a5b6468b20e37f3daabe4aa63047d1ad.camel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <ee536d88a5b6468b20e37f3daabe4aa63047d1ad.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 14:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205171

Hi,

On 20.09.24 12:37, Enrico Jörns wrote:
> Am Donnerstag, dem 19.09.2024 um 21:56 +0100 schrieb Richard Purdie:
>> This looked better in testing, thanks. There was:
>>
>> https://valkyrie.yoctoproject.org/#/builders/23/builds/168/steps/14/logs/stdio
>>
>> which is from oe-selftest on an ARM server though :/
>
> Thank you for the test log!> 
> I'll try to figure out why it works in my test setup but doesn't in the autobuilder..
> Not sure if I'll have the chance to reproduce it on an ARM host.

I tried reproducing the breakage on a Librecomputer Alta (Cortex-A73/A53) with Debian 12
for arm64, but without success. Details below.

I applied this series on top of commit

4fc8427a6c ("systemd: make home directory readable by systemd-coredump")

> Barebox doesn't seem to boot at all (or output is missing) and U-Boot got stuck.

Both barebox' oe-selftest:

  a3f@hass:~/poky/build$ oe-selftest -r barebox -v -v -v -K
  [1] 257856
  2024-09-27 15:06:52,672 - oe-selftest - INFO - Adding layer libraries:
  2024-09-27 15:06:52,672 - oe-selftest - INFO -  /home/a3f/poky/meta/lib
  2024-09-27 15:06:52,673 - oe-selftest - INFO -  /home/a3f/poky/meta-yocto-bsp/lib
  2024-09-27 15:06:52,674 - oe-selftest - INFO -  /home/a3f/poky/meta-selftest/lib
  2024-09-27 15:06:52,680 - oe-selftest - INFO - Checking base configuration is valid/parsable
  NOTE: Starting bitbake server...
  2024-09-27 15:06:59,982 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/a3f/poky/build-st/conf/local.conf
  2024-09-27 15:06:59,983 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
  2024-09-27 15:06:59,985 - oe-selftest - INFO - test_boot_barebox (barebox.BareboxTest.test_boot_barebox)
  2024-09-27 15:07:00,024 - oe-selftest - DEBUG - Writing to: /home/a3f/poky/build-st/conf/selftest.inc
  
  QB_DEFAULT_KERNEL = "barebox-dt-2nd.img"
  PREFERRED_PROVIDER_virtual/bootloader = "barebox"
  
  
  2024-09-27 15:23:54,349 - oe-selftest - INFO -  ... ok
  2024-09-27 15:23:54,357 - oe-selftest - INFO - ----------------------------------------------------------------------
  2024-09-27 15:23:54,358 - oe-selftest - INFO - Ran 1 test in 1019.863s
  2024-09-27 15:23:54,359 - oe-selftest - INFO - OK
  2024-09-27 15:24:08,447 - oe-selftest - INFO - RESULTS:
  2024-09-27 15:24:08,450 - oe-selftest - INFO - RESULTS - barebox.BareboxTest.test_boot_barebox: PASSED (1014.37s)
  2024-09-27 15:24:08,513 - oe-selftest - INFO - SUMMARY:
  2024-09-27 15:24:08,514 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1019.866s
  2024-09-27 15:24:08,515 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

and U-Boot's conclude successfully:

  a3f@hass:~/poky/build$ oe-selftest -r uboot -v -v -v -K
  2024-09-30 10:41:21,225 - oe-selftest - INFO - Adding layer libraries:
  2024-09-30 10:41:21,225 - oe-selftest - INFO -  /home/a3f/poky/meta/lib
  2024-09-30 10:41:21,225 - oe-selftest - INFO -  /home/a3f/poky/meta-yocto-bsp/lib
  2024-09-30 10:41:21,226 - oe-selftest - INFO -  /home/a3f/poky/meta-selftest/lib
  2024-09-30 10:41:21,229 - oe-selftest - INFO - Checking base configuration is valid/parsable
  NOTE: Starting bitbake server...
  2024-09-30 10:41:24,120 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/a3f/poky/build-st/conf/local.conf
  2024-09-30 10:41:24,125 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
  2024-09-30 10:41:24,131 - oe-selftest - INFO - test_boot_uboot (uboot.UBootTest.test_boot_uboot)
  2024-09-30 10:41:24,214 - oe-selftest - DEBUG - Writing to: /home/a3f/poky/build-st/conf/selftest.inc
  
  QB_DEFAULT_BIOS = "u-boot.bin"
  PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
  
  
  2024-09-30 10:52:59,680 - oe-selftest - INFO -  ... ok
  2024-09-30 10:52:59,692 - oe-selftest - INFO - ----------------------------------------------------------------------
  2024-09-30 10:52:59,693 - oe-selftest - INFO - Ran 1 test in 696.374s
  2024-09-30 10:52:59,695 - oe-selftest - INFO - OK
  2024-09-30 10:53:13,581 - oe-selftest - INFO - RESULTS:
  2024-09-30 10:53:13,584 - oe-selftest - INFO - RESULTS - uboot.UBootTest.test_boot_uboot: PASSED (695.55s)
  2024-09-30 10:53:13,647 - oe-selftest - INFO - SUMMARY:
  2024-09-30 10:53:13,648 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 696.378s
  2024-09-30 10:53:13,649 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)


> U-Boot log in the failed test says
> 
>> U-Boot 2024.07 (Jul 01 2024 - 18:07:18 +0000)
>> DRAM:  256 MiB
>> Core:  51 devices, 14 uclasses, devicetree: board
>> Flash: 64 MiB
>> Loading Environment from Flash... *** Warning - bad CRC, using default environment
>> In:    serial,usbkbd
>> Out:   serial,vidconsole
>> Err:   serial,vidconsole
>> Bus xhci_pci: Register 8001040 NbrPorts 8
>> Starting the controller
> 
> While my successful run goes further:
> 
>> [...]
>> Starting the controller
>> USB XHCI 1.00
>> scanning bus xhci_pci for devices... 3 USB Device(s) found
>> Net:   eth0: virtio-net#32
>> ESC[?25h
>> Hit any key to stop autoboot:  2
> 
> But not sure if this is an issue with USB emulation or something else...

My successful run looks identical to yours. barebox start up is also
successful and uneventful.

Note that barebox' XHCI driver doesn't have PCI support unlike U-Boot, so
if the same issue is affecting both barebox and U-Boot breakage in CI,
it might not be USB emulation related as barebox doesn't do any
USB on that platform...

Is `selftest -r uboot -v -v -v -K` close enough to what the CI server runs
or should I try something else to reproduce this?

Thanks,
Ahmad



> 
> 
> Regards, Enrico
> 
> 
>> Cheers,
>>
>> Richard
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

