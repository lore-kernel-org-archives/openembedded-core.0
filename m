Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id ECC2765CBC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 01:22:07 +0000 (UTC)
Received: by iodb91 with SMTP id b91so118251125iod.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P8xin8GzlYVu3e/KtzRMc8yMHGC3wLAdHIAbwtFLGrA=;
	b=Z0OqH4fEdZ4alfYMOraQiPng3jebQYYn9Ysjc7A76VKtAcxW1AWMBASZmUlXeWLa4H
	HkCchnK5/IQTXSX1wSx4NMocqUne1rZhu8HW/oIc7jsYcCZZJS738SSVvtduzaWHHZ6E
	ijt1VpzMcgcZSlA1AADfLmhX/lH3N99VBKhlfGbtsIEQxL4FXm2rXrJvYBMttcgeUSms
	9/5IEEiS2AktMbfZh565F1acy6wdBD6+ea/kvzCXa+SRG+eE4Kxq4HbPlFVcNMTcAfKc
	BvZkCwvZ8Ua0EfziOx8aJ4ptV+x2ZFQzkMaNQhVJklXzWcdUszFMM3NYZLQBbzhXkkba
	DDQw==
X-Received: by 10.107.17.166 with SMTP id 38mr16458824ior.21.1439688127922;
	Sat, 15 Aug 2015 18:22:07 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id 85sm9102909iot.6.2015.08.15.18.22.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Aug 2015 18:22:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Aug 2015 18:22:00 -0700
Message-Id: <1439688121-32636-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439688121-32636-1-git-send-email-raj.khem@gmail.com>
References: <1439688121-32636-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/4] core-image-minimal: Add 4M extra space when using systemd
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
X-List-Received-Date: Sun, 16 Aug 2015 01:22:10 -0000

qemu images fail to rebuild the hwdb due to no space letf on device

 systemd-hwdb-update.service - Rebuild Hardware Database
   Loaded: loaded (/lib/systemd/system/systemd-hwdb-update.service;
   static; vendor preset: enabled)
      Active: failed (Result: exit-code) since Sat 2015-08-15 21:39:28
      UTC; 28s ago
      Docs: man:hwdb(7)
            man:systemd-hwdb(8)
	        Process: 92 ExecStart=/bin/systemd-hwdb update
		(code=exited, status=1/FAILURE)
		 Main PID: 92 (code=exited, status=1/FAILURE)

	 Aug 15 21:39:28 qemux86 systemd-hwdb[92]:
		 Failure writing database //etc/udev/hwdb.bin:
		 No space left on device
		 Aug 15 21:39:28 qemux86 systemd[1]:
		 systemd-hwdb-update.service: Main process
		 exited, code=exited, status=1/FAILURE
		 Aug 15 21:39:28 qemux86 systemd[1]: Failed to
		 start Rebuild Hardware Database.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 9716274..8dd77b3 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -9,4 +9,4 @@ LICENSE = "MIT"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE ?= "8192"
-
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
-- 
2.5.0


