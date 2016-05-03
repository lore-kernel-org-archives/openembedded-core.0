Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 57B7260125
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 11:57:27 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id y84so18951871lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=n5x1kXQpPoA1dtsuLkQ3zjedWWwlgAHa4GdXGJumzww=;
	b=XlmUZ9FlvId0PowqA+kxLzff5jt0DMo367L+gbPdyqXGf6PrC1bdA/80exRXC4c6E5
	VDARZqK1/4O6EfY/HaJuodJJSpTR6k8kucPRnrHhNa6vkwCaMcinCv0/vDG/Be9cT7UY
	ERVHSZAgUFEZmlGXDstE5TZrU9HzBghHOtoqjnyaNgojakqvY+SY2r9AGGiN3A7HqDPm
	pGfcK71RptdCDtm829CSlZQpIUlPQsCoAg/72A0RnnptM4ga7omPlyGSOZPr47puBENU
	8cQ7b1Kl+/JwnORWgz64p11sybILWcndmPy4aGZhCPSaEBn0qY2bqJFQ8K/TOaZo7WIr
	n1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n5x1kXQpPoA1dtsuLkQ3zjedWWwlgAHa4GdXGJumzww=;
	b=KcNJY5pPJu5rnca9pbJvlAweGjH3IChckhFrTmjHJti+2BqwbvgUwv+zyFjT6756Lc
	PueVpDgj82FFiijzfh2h9aktEgkEeQVVZ6HrmI2FlvYeezAwlxoji/ij2hEJm5MwL4aN
	Shl5/zGGRH9lqnKf4k0hio1rAVf1BeBsT4K5mGp/XkjA28Td6BiwuBxKw57qdfiKmxjU
	pJpCQ5k6Mrv0jhL0npwrcE5FEV0U+labjbCxvkxm4r1UHW+JQSjby0yi+8PeN0vynC9c
	CbPIfajo8iJrNDMR7BCe2ADfpZ5D9Hy6uja8lRL/T9+P91PCNDQGXSWBjb5+rkgKEuKO
	lang==
X-Gm-Message-State: AOPr4FUjViw21UAYxIg7b9gjQKMts9pMYBLKxdtTGt+2NisMl5stzUakWtYNSv2vPlHWSg==
X-Received: by 10.25.18.215 with SMTP id 84mr1007690lfs.154.1462276647158;
	Tue, 03 May 2016 04:57:27 -0700 (PDT)
Received: from localhost (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	k190sm459796lfb.34.2016.05.03.04.57.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 04:57:26 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 13:57:16 +0200
Message-Id: <1462276636-17946-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 2.8.1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation for opkg & openssl-cnf
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
X-List-Received-Date: Tue, 03 May 2016 11:57:30 -0000

When enabling extra DEBUGFS image generation with opkg, the following error is
seen when openssl-cnf is included in the image.

Collected errors:
 * file_md5sum_alloc: Failed to open file /mnt/cs-builds/anders/oe-build/build-ccu/tmp/work/ccu-oe-linux-gnueabi/ccu-image/1.0-r0/rootfs/usr/lib/ssl/openssl.cnf: No such file or directory.

Lots of similar issues was fixed by an earlier commit in oe-core,
5084ed9401250ed269a49d27b303806ab173c5d5, but openssl-cnf is outside of that fix.

Followup to [YOCTO #9490]

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0546c1e..95fd3ab 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -907,7 +907,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
         self.pm.install_complementary()
 
-        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg'])
+        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
 
-- 
2.8.1


