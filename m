Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id AB5166BBDE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 08:27:22 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 9C03010C0752;
	Wed, 16 Jan 2019 00:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1547627243; bh=7CO9CXdMSQQgPIfZermCWkbAkTC85tyzaLXiBEhk8Lc=;
	h=From:To:Cc:Subject:Date:From;
	b=DLj8ILdMYRVVGl2Fhzw/Ox395WsNbzpPCFqr3tJWd5N5UoSJpggnHdAQ70F8dWPua
	mKEXxP9KV/fiBQRFs7VHbKic+c/f2QOB+JnjrYupEYYk0DlOjj8CrS7TOUmyVwM9kh
	JpRwTOFFotTQziV2VlsNRIvurpwOjAdb6s2jVZgSUvFvf3AVFSNGVR2Hf1DBXMeyFU
	I6dsZZv1fhP8MjUz3vzHJXqldhRTr24UQrHSSNd6QA+NTlRWdZYkLxI5rFRsHk7N/4
	r+PgRAjpEsa3xNEXZU4JKAOGVp0STzE+OZWSp4A6xFEPHG7Yi2XOFnlh286AIuWTbr
	fHi5eKOJgFi5A==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 7B2B350AE;
	Wed, 16 Jan 2019 00:27:21 -0800 (PST)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 11:27:19 +0300
Message-Id: <20190116082719.36093-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Maciej Borzecki <maciej.borzecki@open-rnd.pl>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH] wic: sdimage-bootpart: Use mmcblk0 drive instead of bogus mmcblk
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
X-List-Received-Date: Wed, 16 Jan 2019 08:27:22 -0000

Apparently either nobody ever used sdimage-bootpart.wks
or fstab was kept untouched due to "--no-fstab-update" usage as
some boards like IMX may have, see [1].

Otherwise addition of the following line to the target's fstab:
---------------------->8-----------------
/dev/mmcblkp1   /boot   vfat    defaults        0       0
---------------------->8-----------------

gets us unusable target:
---------------------->8-----------------
[*     ] A start job is running for dev-mmcblkp1.device (23s / 1min 30s)
[ TIME ] Timed out waiting for device dev-mmcblkp1.device.
[DEPEND] Dependency failed for /boot.
[DEPEND] Dependency failed for Local File Systems.

You are in emergency mode. After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or "exit"
to boot into default mode.
Press Enter for maintenance
---------------------->8-----------------

Fix it with use of "mmcblk0" device name.

[1] https://lists.yoctoproject.org/pipermail/meta-freescale/2018-February/022156.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 scripts/lib/wic/canned-wks/sdimage-bootpart.wks | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/sdimage-bootpart.wks b/scripts/lib/wic/canned-wks/sdimage-bootpart.wks
index 7ffd632f4a..63bc4dab6a 100644
--- a/scripts/lib/wic/canned-wks/sdimage-bootpart.wks
+++ b/scripts/lib/wic/canned-wks/sdimage-bootpart.wks
@@ -2,5 +2,5 @@
 # long-description: Creates a partitioned SD card image. Boot files
 # are located in the first vfat partition.
 
-part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 16
-part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16
+part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 4
-- 
2.16.2


