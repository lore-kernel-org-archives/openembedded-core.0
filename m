Return-Path: <akuster808@gmail.com>
Received: from mail-yk0-f193.google.com (mail-yk0-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0367671951
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 01:29:46 +0000 (UTC)
Received: by mail-yk0-f193.google.com with SMTP id r207so4472233ykd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 17:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0P1CXRE9iroaH+yPOYi13c18FNXGMfUKbgwIhxrD5Yo=;
	b=u8rPG1XqUN9BeiFsxGJbPGOVk+8y27J76fsiWXkJ/sH1j8c9V1iijfr1mZd68h+Rrk
	LXgV2vavzqdmTwI0+1P2jU5NfMhFvbIYbDi0/eWDfKYzpSSar5yIpxMUnoRwvlfLTvNb
	Y7mzv9Sx8Lrbr5JfcIh9jXOiuRVM8axnE5O6A40ugflQoUXhQy3YxopEt2hSHs5417FW
	EAMyq7rogVEJsVU+xp9oact81GyIBMkPDHYk3U4S9aT+t3EsC+Kzj8+EulyFdp3R4ujF
	3O2KIM5v2gbn4ECsLjEfS/ppFWMmjpclsgXiEGCzsQEFWzAoPhUZznlTQfFYtPQPz+pp
	BreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0P1CXRE9iroaH+yPOYi13c18FNXGMfUKbgwIhxrD5Yo=;
	b=gkv1KJq+qqmzy/i/zaDE4Wj83DCvzsTzpwgSCikc4IG8mprvtlkg4kHIVWCGDpxko9
	gQJ0ilTtHXTsWfDxUA9/0AHmZtSdq8juVwldVYyGW2XWLw/6Voxr2EvnGSlb7x9ureLm
	HjaKuGdWddyI03Y3codFrNII/lp84vmFL3QOVNvqXQIJgjJLZfji6Y9yzMoaqPlk/anb
	WzXZx4TMpjZxHwPnrO2m1eyvtnXEJmjc6muQeYIQYpwS6vumLtWLOzPvDN15dNespXL2
	Dbuh1tkMIxtl9lCqTFwjxJIblfZewDhqt/As5f6sMkebUXcn5NafiNov2rfOaG5nnQeH
	IlDQ==
X-Gm-Message-State: AG10YOQGQZ72PzYz64ItUklzH+8Pak1QvcGXznnNmxHMUohHwa6lBrSycT+xspsSSvp0AA==
X-Received: by 10.37.83.7 with SMTP id h7mr16484282ybb.55.1454981387203;
	Mon, 08 Feb 2016 17:29:47 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	e132sm5813430ywa.18.2016.02.08.17.29.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 17:29:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 17:29:41 -0800
Message-Id: <1454981383-15843-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/3] qemu: Security fix CVE-2016-1568
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
X-List-Received-Date: Tue, 09 Feb 2016 01:29:47 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-1568 Qemu: ide: ahci use-after-free vulnerability in aio port commands

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-1568.patch | 46 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
new file mode 100644
index 0000000..56fd346
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
@@ -0,0 +1,46 @@
+From 4ab0359a8ae182a7ac5c99609667273167703fab Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Mon, 11 Jan 2016 14:10:42 -0500
+Subject: [PATCH] ide: ahci: reset ncq object to unused on error
+
+When processing NCQ commands, AHCI device emulation prepares a
+NCQ transfer object; To which an aio control block(aiocb) object
+is assigned in 'execute_ncq_command'. In case, when the NCQ
+command is invalid, the 'aiocb' object is not assigned, and NCQ
+transfer object is left as 'used'. This leads to a use after
+free kind of error in 'bdrv_aio_cancel_async' via 'ahci_reset_port'.
+Reset NCQ transfer object to 'unused' to avoid it.
+
+[Maintainer edit: s/ACHI/AHCI/ in the commit message. --js]
+
+Reported-by: Qinghao Tang <luodalongde@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: John Snow <jsnow@redhat.com>
+Message-id: 1452282511-4116-1-git-send-email-ppandit@redhat.com
+Signed-off-by: John Snow <jsnow@redhat.com>
+
+Upstream-Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=4ab0359a8ae182a7ac5c99609667273167703fab
+
+CVE: CVE-2016-1568
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/ide/ahci.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: qemu-2.5.0/hw/ide/ahci.c
+===================================================================
+--- qemu-2.5.0.orig/hw/ide/ahci.c
++++ qemu-2.5.0/hw/ide/ahci.c
+@@ -910,6 +910,7 @@ static void ncq_err(NCQTransferState *nc
+     ide_state->error = ABRT_ERR;
+     ide_state->status = READY_STAT | ERR_STAT;
+     ncq_tfs->drive->port_regs.scr_err |= (1 << ncq_tfs->tag);
++    ncq_tfs->used = 0;
+ }
+ 
+ static void ncq_finish(NCQTransferState *ncq_tfs)
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index 6ad7bbb..e51ec16 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
+            file://CVE-2016-1568.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
2.3.5


