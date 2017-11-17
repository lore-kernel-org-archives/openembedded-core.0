Return-Path: <tom.rini@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4CA78851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 16:08:29 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d15so7262132qte.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 08:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KyoY2CVhnFExO74eJXKUQssIg8UrQCphsv288cBJiik=;
	b=jHk0lSLrIkp7l8q5tmQIDyI6DoI7pDu1ent37oSVjMhyxY++dp6+cSqFiHpULAupI/
	2Anib9F9qrbql9p5EkW3fQWt8a75eT//tDeeW7zs7ndUyu1+3sSGRb7dx71yaUXpEW1l
	Jo5vczIsLB9svy33Y2hNTqE+Ri3w6/3MHd0kJvboEFDHi2iEjTKXiAptoWGCX3FtI/eH
	mienutRv+6Dqz7x9wj6LOzWh8w1J7/LsKl8i0uVnmIlI7I+ikE1L2aYWT7sIpotGvD7X
	8ySSrm2j+2MpBn7u87ZJKuyWC9+BqYgLElH+FunWwLKYGFzFhR7zLBlIxJrI15B31rc6
	c+sQ==
X-Gm-Message-State: AJaThX5wMVs1aaU//57kgBYenRtlfpSzXMsP5bpqZFHoJUrXEz9f9gYs
	RcJpCQn4t3U8QrwsZoVITU3d
X-Google-Smtp-Source: AGs4zMYxJtA3iozwXY7PBL+Lc74HOlFrRz0+iXB3tFCl7IP0erjv7WTRQAA7PtuunN1opFqv/K984g==
X-Received: by 10.55.158.132 with SMTP id h126mr9615782qke.245.1510934911035; 
	Fri, 17 Nov 2017 08:08:31 -0800 (PST)
Received: from opus.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	q37sm2714304qtj.66.2017.11.17.08.08.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 08:08:30 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 11:08:20 -0500
Message-Id: <1510934900-22044-5-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510934900-22044-1-git-send-email-trini@konsulko.com>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv2 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Fri, 17 Nov 2017 16:08:30 -0000

- Add a '/uuid' partition to wic-image-minimal.wks with a known UUID.
- In test_qemu, sort our output from checking the output of 'mount' as
  it may not be stable.  Also, do not check the exit code as passing any
  output to cut ensures a 0 exit code.
- Check for a 'UUID=' line in /etc/fstab with out expected output.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 1 +
 meta/lib/oeqa/selftest/cases/wic.py                     | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

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
index 651d575dc3b2..969ee1054d8b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(0, bitbake('wic-image-minimal').status)
         self.remove_config(config)
 
-        with runqemu('wic-image-minimal', ssh=False) as qemu:
-            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
+        with runqemu('wic-image-minimal', ssh=False, runqemuparams="nographic") as qemu:
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


