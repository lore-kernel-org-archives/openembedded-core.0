Return-Path: <joaohf@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 51E1C60CEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 10:39:28 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id c9so664099qcz.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 03:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QNx6X/VwBUptECSkxNRLyKgK3M9UikTqbbPT7GoBRjQ=;
	b=isA3AkeqAGlb2RqeOHiYT5mMZNAdHPqIWILskaaJAShbho/j88n1UlfMJD+XPhphp2
	XFdIhFt7gDcS1vaI+vjcip5sPsrypaa32UVwRI2ozjxBrk52BPKTt1Ajczd8WlEf4Lom
	pfUBiv6k5jzeVU+mk3JyEuZuV2mhGkbs9fUc3QxLmJZGXYWFJ0Bf+sURDsEcwPs/9OVU
	je77OQ9XGkzRUpch55lnM+PS25/6M+0t8rNHGKi9akMuEb0icVeRtqzkUlBCQmEhVcdP
	HuVmTupRuF+QjD3u/8ils0byQTtI5V3YXSiMt9+VFoGHtIl79nqJBhz1APlMza1Ck7eC
	YlBA==
X-Received: by 10.49.3.199 with SMTP id e7mr5863378qee.10.1383129570191;
	Wed, 30 Oct 2013 03:39:30 -0700 (PDT)
Received: from jfreitas.padtec.com.br (apolo.padtec.com.br. [200.228.158.130])
	by mx.google.com with ESMTPSA id
	x10sm75679414qas.5.2013.10.30.03.39.26 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Oct 2013 03:39:29 -0700 (PDT)
From: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 08:37:42 -0200
Message-Id: <1383129462-27158-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] grub-efi.bbclass: Fixes GRUB_IMAGE when using boot-directdisk class
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
X-List-Received-Date: Wed, 30 Oct 2013 10:39:28 -0000

When boot-directdisk class is used and EFI boot is set the
grub-efi-${TRANSLATED_TARGET_ARCH}-native need to be dependent.
Allowing GRUB_IMAGE to be created and bootia32.efi got from the
image directory.

Signed-off-by: Joao Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/grub-efi.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 96fb98b..3765bfd 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -16,6 +16,7 @@
 # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
 
 do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
+do_bootdirectdisk[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
 
 GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUBCFG = "${S}/grub.cfg"
-- 
1.8.3.2


