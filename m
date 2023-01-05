Return-Path: <felix.moessbauer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4D6C54E76
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 12:52:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.11802.1672923165294275592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 04:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=felix.moessbauer@siemens.com header.s=fm1 header.b=cjVplayh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-72506-20230105125241a83274b4aa6acbb5b2-atuq0d@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230105125241a83274b4aa6acbb5b2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Jan 2023 13:52:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EWLa+3a835uJKFlUBoLySymAHAqkbfluBhjk6eLNEQo=;
 b=cjVplayhP1iw5DuuAbcKyy2jhoCNxir6I/21/yFe1DyfcLNGwsKOEABEDWBgWmzzct+gYJ
 QFfYY4Wml/mNPPFa1VrvSO/+c32FACtv3wE17Bl+EF2akLNchl8bWE/yw2SUagbJWQf61Qx2
 KxIDb6bzf1kjDROmfkpe+/NOTnLJ0=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	alexandre.belloni@bootlin.com,
	richard.purdie@linuxfoundation.org,
	henning.schild@siemens.com,
	tobiasschmidl@siemens.com,
	luca.ceresoli@bootlin.com,
	Felix Moessbauer <felix.moessbauer@siemens.com>
Subject: [OE-core][PATCH 0/2] wic/plugins/images/direct: replace fstab entries
Date: Thu,  5 Jan 2023 12:52:21 +0000
Message-Id: <20230105125223.398216-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 12:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175518

For comparison, here the fstab files for the ext4 and the wic version
of the core-image-minimal (see below).

Putting all persons in CC who have been involved in the first try and in
the revert.

Best regards,
Felix Moessbauer
Siemens AG

.ext4
```
# stock fstab - you probably want to override this with a machine specific one

/dev/root            /                    auto       defaults              1  1
proc                 /proc                proc       defaults              0  0
devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults              0  0

# uncomment this if your device has a SD/MMC/Transflash slot
#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
```

.wic
```
# stock fstab - you probably want to override this with a machine specific one

proc                 /proc                proc       defaults              0  0
devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
tmpfs                /var/volatile        tmpfs      defaults              0  0

# uncomment this if your device has a SD/MMC/Transflash slot
#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0

/dev/sda1       /boot   vfat    defaults        0       0
UUID=c53e2046-48db-4533-8083-b997d9976fbf       /       ext4    defaults        0       0
```


Felix Moessbauer (2):
  wic/plugins/images/direct: replace fstab entries
  Revert "Revert "wic/plugins/images/direct: Allow changes in fstab on
    rootfs""

 scripts/lib/wic/plugins/imager/direct.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1


