Return-Path: <tom.rini@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id C52BB78672
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:58:40 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id s141so804731vkb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 09:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/q9bj/b86SkSQo87J0ayYSFMNNtrlMlASwU87UoxtDI=;
	b=h1d6rV5Yd8RC4s8oREXtcr4jj8dnIOs8MuO4J/oQN/+Q+VR6GScFl8vAGp+O44YzAS
	i+f/qzwO9nh3V6/M08fAb3XQOBzNKiXbzYs/2GCl61iPoPbJmQprnReORiZQ1S3VkDhd
	BsKy8qA1HBJfb+2hAhA5S8CwGACR4P4wEnSHH36h5/i3nxfI3wm459D3q7Ot1bxnKh+p
	sOe0gKPBYVXTuKu0hOjVE7NXBmvLTUmRhFV2vyVzOq81KzeihJ4C68ULnGNGDDwWUQB7
	qyI/m9RB1ZCRSPTey8oSyCOH+7Or77j1O2A10Kwzxb+1alcC3j0iflfFNMtv4FnWdsIi
	8Jhw==
X-Gm-Message-State: AKGB3mJpHT2ZgjSErqskBJqTyPtZ+dqPW9hpJwL5t5SLWEBxQ83q/OTf
	buO4d5YeK+zc1HHw/EokWEg3
X-Google-Smtp-Source: AGs4zMaj6QdMLlqehTL2FH1geXfjt7e9poZn5fZNT2q2PUx1dObZBKPjUJyCk+iTWuRJD5LEu59bpQ==
X-Received: by 10.31.63.5 with SMTP id m5mr5166083vka.105.1512496721505;
	Tue, 05 Dec 2017 09:58:41 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68])
	by smtp.gmail.com with ESMTPSA id 131sm305558vke.53.2017.12.05.09.58.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 09:58:39 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 12:58:30 -0500
Message-Id: <1512496710-10548-5-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512496710-10548-1-git-send-email-trini@konsulko.com>
References: <1512496710-10548-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv3 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Tue, 05 Dec 2017 17:58:41 -0000

- Add a '/uuid' partition to wic-image-minimal.wks with a known UUID.
- In test_qemu, sort our output from checking the output of 'mount' as
  it may not be stable.  Also, do not check the exit code as passing any
  output to cut ensures a 0 exit code.
- Check for a 'UUID=' line in /etc/fstab with out expected output.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 1 +
 meta/lib/oeqa/selftest/cases/wic.py                     | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 9410b684bed8..2fb34c4ef40a 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -5,5 +5,6 @@
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
 part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
 part /mnt --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
+part /uuid --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label uuid-test --align 1024 --use-uuid --fsuuid 2c71ef06-a81d-4735-9d3a-379b69c6bdba
 
 bootloader --ptable gpt --timeout=0  --append="rootwait console=tty0"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 651d575dc3b2..a4a53398f25f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -634,10 +634,13 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.remove_config(config)
 
         with runqemu('wic-image-minimal', ssh=False) as qemu:
-            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
+            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid')
+            cmd = "grep UUID= /etc/fstab"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt')
+            self.assertEqual(output, 'UUID=2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/uuid\text4\tdefaults\t0\t0')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
     @OETestID(1852)
-- 
2.7.4


