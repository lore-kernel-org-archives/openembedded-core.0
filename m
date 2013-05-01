Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UXY1V-0000ja-D7
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 16:28:55 +0200
Received: by mail-pb0-f46.google.com with SMTP id xa7so745593pbc.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=i+rx7qou7tBvDiqCae6moN6tP3qAJC/887h2lHjKAfY=;
	b=X2OO/ZYBzjR7/8RnIZbw0UZcwUnfcp0n3taesHB5ENCEssArPuln1MjFv4EyMemZZy
	VMafZ9/zDkzByLbsXup+XRBbsEJpqjRdIUF3rx9ZmsQR3vdTEGsmsyH8L2Bbsji3dYxF
	D2ueIR8lxa50h7nZ9WvKn91Nzxy/hki8moo54ZM7XzY8qgr4lv4vuAineagdBTqFQoR4
	e+uwZCzKmvTrP2yxhBwpDErg5aGqRanRYJY/bKi8hx2SAuBlQ+pXc3RUSz2onroDSW50
	Lt4ksnTYvK3MB4w2pmEbE6tck3lVo7K+2tYxZaL39LDuKhW4tGFU2yd0KRbPGHDWvo3s
	WyHg==
X-Received: by 10.69.1.39 with SMTP id bd7mr4142146pbd.188.1367417452276;
	Wed, 01 May 2013 07:10:52 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id zo4sm1479525pbc.21.2013.05.01.07.10.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 07:10:51 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2013 00:22:38 +1000
Message-Id: <1367418158-28751-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] boot-directdisk: Fix race condition with bootimg
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
X-List-Received-Date: Wed, 01 May 2013 14:28:58 -0000

If "vmdk" is added to IMAGE_FSTYPES when building core-image-minimal,
there is a race condition where the bootdirectdisk and bootimg tasks
may execute concurrently. The bootdirectdisk task is copying the
contents of ${HDDDIR} into ${HDDIMG} but at the same time, the bootimg
task is writing to ${HDDDIR}/rootfs.img.

This race condition can result in one of the following errors:
- An hdddirect image is created with an incomplete rootfs.img
  (the bootimg task may not have finished writing to rootfs.img yet).
  This would result in an invalid operation error when /init in initrd
  tries to loopback mount rootfs.img to /rootfs.
- A "Disk full" error is generated in the bootdirectdisk task
  because it calculates the number of blocks for the image before
  rootfs.img is written but by the time is gets to copying the contents
  of ${HDDDIR} into ${HDDIMG}, the writing of ${HDDDIR}/rootfs.img by
  the bootimg task results in the size of ${HDDDIR} exceeding the
  initially calculated number of blocks for the image.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index d265485..fcbee8a 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -96,5 +96,5 @@ python do_bootdirectdisk() {
     bb.build.exec_func('build_boot_dd', d)
 }
 
-addtask bootdirectdisk before do_build
+addtask bootdirectdisk after do_bootimg before do_build
 do_bootdirectdisk[nostamp] = "1"
-- 
1.8.2.1



