Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5E26A6F8F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:05:55 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id im17so7732893vcb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=KCDmflReCj51Ee8M2+h4T8K7ZkE5qvPbGMmGcbbS6Yw=;
	b=Y7j2ksKzSs6iuMhwwp2R8t8ak9/aF9rq/asPOn7DpAX6Cj13qh7WUFg5TNlCorOhX7
	73DHvUPAS8A9bINI61yPhqptewzomXgf16QNnroH2NIV7cUi00AvAcLW6PFsSRr83NHr
	uNZscUejICr+Nu7RY4j2oSImkQ+l2MPygz937rKqMlIGLP3aiB335Auy42/I+tJrmSjw
	/fxWsSxlqPY4hOcha2HhLFc75yb/ZznGb34QdHfzujv40MX957gpFL+fkZ1IRNrSPV8p
	rG7keY5X6hy9g8stNC8fLd2H+wa/R4YuNjl+maycO33mpdc/JFZss4zmj7RZl+PIQh97
	8jrg==
X-Received: by 10.52.0.176 with SMTP id 16mr132064vdf.60.1395158756565;
	Tue, 18 Mar 2014 09:05:56 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id v20sm4467408vdj.0.2014.03.18.09.05.55
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Mar 2014 09:05:56 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 13:05:44 -0300
Message-Id: <1395158745-9424-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH] wic: Add SD/MMC-Cards support
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
X-List-Received-Date: Tue, 18 Mar 2014 16:06:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the following .wks is set up to mmcblk0 (sdcard)

part /boot --source bootimg-pcbios --ondisk mmcblk0 --fstype=msdos --label boot --active --align 1024
part / --source rootfs --ondisk mmcblk0 --fstype=ext3 --label platform --align 1024

bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"

And the user inspect this file /var/tmp/wic/build/hdd/boot/syslinux.cfg, 
the 'root=' will be '/dev/mmcblk02' instead of '/dev/mmcblk0p2'.

This patch add the support to constrain the disk and make the adjusts when
mmcblk devices are used.

I am not sure if is not necessary to fix others places. Until now it's the single point.

João Henrique Ferreira de Freitas (1):
  wic: Add SD/MMC-Cards support to '--ondisk' param

 scripts/lib/mic/imager/direct.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.8.3.2


