Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB1FC79F99
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2588.1788641122151588458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DrDrVVJM;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e257a23aso1504918f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641120; x=1789245920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZiT7YZXfHIFHuPywyyqdzsbOS+46Pmrh2L032t9SEtM=;
        b=DrDrVVJMKPGmv1H2cwTECaz3GhR+RLTLTO942Px2dcZzLfa0wkFt36/HJk0SB2tUgM
         qLKrEeh6v6OqratrhBjLtnJGADHfzZMO6hg9JtM1cNlPHEP/6pI8GMdyQZ7zG2M8Ex1Z
         6t9LxuNA1vhtWCJ3uLWqAzmhMk2C98nVmO4vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641120; x=1789245920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZiT7YZXfHIFHuPywyyqdzsbOS+46Pmrh2L032t9SEtM=;
        b=ZXMypk4BQqD1cpIQdjSxthy5mmQC1UH8/2OHu+8H8DjbSabtf54BKoAMv1vNUmdZ5w
         S8UtL/wF9EfREVMmWOoBj80O776+gMuIGCuX33R7gjChrMr+l22OwZ31MGviny90ToP1
         84xqsWfNNNiCSJZ5ZpqCXQScjMeS3xnrcR605Qm4dwbGt2c2l99J+xZuKRfICDefFfDR
         6Gk1ogQdI+n0GXenVl8e40xpiefSn5a3Wc8dCt43tRVXqS+R+Be3eBD2Y1aJEyY2z6x4
         axNHj/IrIjqyFQPlABz0iu0PDL+6FS42/15E5ZtOm66hIDGk3SzaywFIn0sIL9p2O/w4
         d2vQ==
X-Gm-Message-State: AFuF++mj/3RAHZoNGfw/Y4Gk5QOLA71ApLKeNPKoj/wkHAx9NMmvl+VO
	D3Ww0L5nwiznqBphWgWXImk1lk4pIL6m9f4UZFvNzfN0VgFJvB2B0rva0ryHWEkmR1nwPWV/DgS
	qyS5aYFs=
X-Gm-Gg: AYBFou0S4cXzCnbjOvbD82gamoTqMMli65RzTL+ML8oZT/0y693JH+kgqwugRaTf6FR
	WO3rp87pfmJCBopigv8TyT/5nYBNV/S57ugu63vwLb2y+w54CQ7o7sZLtLBPkZDTU2+c8vIbQSu
	sDIl5qhIEu7qt4Ki9iNAwNZ/8VQd6K2j0jGm5ld9cxbm62KaHUPXLiUFJeQFvrGTmiU+c0PglMu
	+KM8uAMBAMp0cLDbp7mokjnWN411i32rHTvdZEF9Op9Th8RwSOUSvCLx2nx6a4oheZhA5op+AU0
	vkvCAHLB9sBcIanLB649gT5rm7q9UOtf/B4ly903SBUGGm5+yCec8R2FEAUUpZ+Bh5pH1FFQrxN
	8CLc0Vwy4l/qvauEMdZ1/ph4951wGjC+vYZUtDvEHi2MGOritj6CPTt62YaKVZ4KuYEhr9HILb7
	pDV8QnM4bGCZp65xpWd80W7Cm+vFneWH9TjNPwdK8bqO90/J66ZgfpN3qbO2YRjuH/Q6V0sl/TH
	Bc4PJVQhcaCnKd76bN1Ctch3QdlbtU49lcBg8bcoqKMUnHQ3N0RtLqGc4aXlBKjQg==
X-Received: by 2002:a5d:584f:0:b0:485:9309:6f07 with SMTP id ffacd0b85a97d-4859309765fmr5662199f8f.26.1788641120420;
        Sat, 05 Sep 2026 13:45:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/40] alsa-lib: patch CVE-2026-56109
Date: Sat,  5 Sep 2026 22:44:19 +0200
Message-ID: <93722085ad391a4b5ad5040352b1f920ed3ec24a.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245170

From: Peter Marko <peter.marko@siemens.com>

Pick patch listed in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-56109.patch        | 33 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
new file mode 100644
index 00000000000..c6ecc837f88
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
@@ -0,0 +1,33 @@
+From 536dd6f8affdf5197c12a63a71c92a70b2833cc0 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 8 Jun 2026 14:33:19 +0200
+Subject: [PATCH] conf: add missing return value check in parse_def()
+
+A malformed configuration may cause SIGSEGV.
+
+Link: https://lore.kernel.org/alsa-devel/CAGt8pqBU0p2voB+qHxWGcNJrKHAcBhAyHUUBPLBN-Yj_SiV6MQ@mail.gmail.com/
+Reported-by: Luigino Camastra <luigino.camastra@aisle.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-56109
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/536dd6f8affdf5197c12a63a71c92a70b2833cc0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/conf.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/conf.c b/src/conf.c
+index b0dd6298..e1dba23d 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -1485,6 +1485,10 @@ static int parse_def(snd_config_t *parent, input_t *input, int skip, int overrid
+ 			endchr = ']';
+ 		}
+ 		c = get_nonwhite(input);
++		if (c < 0) {
++			err = c;
++			goto __end;
++		}
+ 		if (c != endchr) {
+ 			if (n)
+ 				snd_config_delete(n);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index 1ebb3569256..04976f3bf77 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
 SRC_URI += "file://CVE-2026-25068.patch"
+SRC_URI += "file://CVE-2026-56109.patch"
 SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig

