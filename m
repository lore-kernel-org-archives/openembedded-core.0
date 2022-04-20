Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFFDC636FE
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.8633.1650465840963144414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1nhBYk-0004Yr-Ly; Wed, 20 Apr 2022 16:43:58 +0200
Message-ID: <29ddcf5f-5b9f-490b-2ed2-faac7f6985bd@pengutronix.de>
Date: Wed, 20 Apr 2022 16:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: wic --offset: how to create GPT images with out-of-order partitions?
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Joshua Watt <JPEWhacker@gmail.com>
Cc: Enrico Joerns <ejo@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164697

Hi,

I have existing systems that have the entries of the GPT partition table in a
different order than the on-disk order of the partitions: e.g. /dev/mmcblk0p7
is located at an earlier physical offset than /dev/mmcblk0p1.

I have written a genimage config to achieve the same result and am curious
to see whether this is possible with less dependencies by using a wic kickstart file.

There is an --offset command, which looked relevant, but it doesn't seem
to allow out-of-order creation:

  ERROR: Could not place sda2 at offset 4194304: next free sector is 262144 (delta: -253952)

Is this unsupported by wic or am I missing something?
For reference, this can be reproduced with:

  part rootfs-a --offset=64M --fixed-size=64M --fstype=ext4
  part env-a    --offset=4M  --fixed-size=8K  --source rawcopy --sourceparams="file=uboot-env.bin"
  bootloader --ptable gpt                                                                                                         

If I swap the partitions around, image creation succeeds, but I need
them ordered the other way round.

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

