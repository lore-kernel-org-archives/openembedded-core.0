Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7538ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:41:58 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.121.1663364510340715579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28GLfmM9023105
	for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 16:41:49 -0500
Message-ID: <28322394-c2dd-fc69-be32-466d0cf14906@kernel.crashing.org>
Date: Fri, 16 Sep 2022 16:41:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: wic/wks boot using labels instead of partitions
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:41:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170823

Is there a way to tell the _generated_ fstab to use labels to boot and not hard 
coded partitions?

If I remove the --ondisk <device> attribute from the wks file it defaults to 
/dev/sda.

What I tried was:

part /boot --source bootimg-partition --fstype=vfat --label boot --active 
--align 4 size 16
part / --source rootfs --fstype=ext4 --label root --align 4


If I manually add --no-fstab-update to the wks entries and add the following to 
the system default fstab:

LABEL=boot   /boot  vfat  default  0  2


This works.  But I'd like to automate it within the wks.

(Alternatively I could use uuid instead of label booting, but either case, I 
need to only boot with the uuid or label -- not the partition as the location of 
the disk can change.)

--Mark

