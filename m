Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web10.3355.1598646049910237060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 13:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id BC94260901
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2020 20:20:42 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: bruce.ashfield@gmail.com
From: "Jack Mitchell" <ml@embed.me.uk>
Subject: Linux v5.8 modules, exec format error
Message-ID: <6e070a3d-a5f3-46bf-ac33-d7d6daf05b4f@embed.me.uk>
Date: Fri, 28 Aug 2020 21:20:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Having just upgraded my mainline kernel recipe to a v5.8/v5.9-rc2 kernel
from v5.5.8 I've found that modules have somehow broken. I've flicked
between the two and confirmed that the old kernel build works, and the
5.8/5.9 build doesn't. I haven't changed anything bar the git commit
hash. It's a very simple kernel recipe basically just inheriting the
kernel bbclass and setting SRCREV. Running on current tip of master.

I assume it's something symver related but wanted to ask if anybody
knows anything before I dig too deep.

Cheers,
Jack.

root@rk3399:~# uname  -a
Linux rk3399 5.9.0-rc2 #1 SMP PREEMPT Fri Aug 28 18:47:44 UTC 2020
aarch64 GNU/Linux

root@rk3399:~# modprobe g_ether
modprobe: ERROR: could not insert 'g_ether': Exec format error

root@rk3399:~# modinfo
/lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
filename:
/lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
license:        GPL
author:         David Brownell, Benedikt Spanger
description:    RNDIS/Ethernet Gadget
depends:        libcomposite,u_ether,usb_f_rndis
intree:         Y
name:           g_ether
vermagic:       5.9.0-rc2 SMP preempt mod_unload aarch64
parm:           idVendor:USB Vendor ID (ushort)
parm:           idProduct:USB Product ID (ushort)
parm:           bcdDevice:USB Device version (BCD) (ushort)
parm:           iSerialNumber:SerialNumber string (charp)
parm:           iManufacturer:USB Manufacturer string (charp)
parm:           iProduct:USB Product string (charp)
parm:           qmult:queue length multiplier at high/super speed (uint)
parm:           dev_addr:Device Ethernet Address (charp)
parm:           host_addr:Host Ethernet Address (charp)
parm:           use_eem:use CDC EEM mode (bool)

[jack@arch-corsair ~]$ file g_ether.ko
g_ether.ko: ELF 64-bit LSB relocatable, ARM aarch64, version 1 (SYSV),
BuildID[sha1]=375c0485cb8c4b013dc0694725457bd111899f8c, not stripped

