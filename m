Return-Path: <tom.rini@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1CD78879
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:20:36 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id r39so6339777qtr.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vBq8EbnHEil/nV9d7DqWkB6P+CFvwNc7XciG6F41nk8=;
	b=FFG0+Y9zzlzgxwwsZX+JncktRZwzHtIlPqp/uEKIdropX1cmBq5E2wYYPbFqUwhjH5
	Am4koV4UwqUtByaA+4GoK8z76wkXyvRTqV1RCtgRmj2baNp0XPbwBzWM5c0ouK1kBRVZ
	HkGy7pldeFKYdnTvABV+nXCXSsawp0X82cl29OX9NsXnywYVy+FO6LNbuOoQf2S6Lo1o
	TJKpPiulUkqYXrui/Csl7g1PX3kvHtSLfEIdjGENg67sUX5COUyiNdjptkj+QQkrLaKF
	d8+dy+AnGY8NCaDmncfvyED7k1UhyBxpN5X85viIt1jYvakwbpwPc37ENd3pMsgcPykx
	gBrA==
X-Gm-Message-State: AKGB3mIzdSCZesZhiBNnNHV5M15tKxmHcDntoSUwjYnCD1pKWI5BiJWT
	B0Ke+jg3V4S+ZjW+DwbI5Ayf
X-Google-Smtp-Source: ACJfBouOz4amxSaqEl5yEsRFfReVGsTDG7Pl1zCrGoce9se/DIrqYC3b+tFNibw+WOPI9JS2HzBBHw==
X-Received: by 10.237.36.214 with SMTP id u22mr14276243qtc.16.1513221637134;
	Wed, 13 Dec 2017 19:20:37 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	s43sm2001533qta.49.2017.12.13.19.20.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 19:20:35 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 22:20:26 -0500
Message-Id: <1513221626-18805-5-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513221626-18805-1-git-send-email-trini@konsulko.com>
References: <1513221626-18805-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv4 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Thu, 14 Dec 2017 03:20:36 -0000

- Mount a '/media' partition to wic-image-minimal.wks with a known UUID.
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
index 9410b684bed8..ae69cb6e3ce2 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -4,6 +4,7 @@
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
 part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part /media --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label uuid-test --align 1024 --use-uuid --fsuuid 2c71ef06-a81d-4735-9d3a-379b69c6bdba
 part /mnt --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
 
 bootloader --ptable gpt --timeout=0  --append="rootwait console=tty0"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 651d575dc3b2..ccbc82ed9b46 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -634,10 +634,13 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.remove_config(config)
 
         with runqemu('wic-image-minimal', ssh=False) as qemu:
-            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' '"
+            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
+            cmd = "grep UUID= /etc/fstab"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt')
+            self.assertEqual(output, 'UUID=2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/media\text4\tdefaults\t0\t0')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
     @OETestID(1852)
-- 
2.7.4


