Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25888C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9084.1740493812711932265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sGIoCpvp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2211acda7f6so127619605ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493812; x=1741098612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZv6ACgAaiSrj415nBbTglZgadnbuPvpJzvUVp4gsnY=;
        b=sGIoCpvphDzxZ48bGMw88WOuDPlYAMTlRM5CF9XMhFcynWPWfcJsKu/Fk2L4vIjyRU
         MLCD5kWdVIW4kODlwXpeauNgHYiHAxXN6U2QPML0bjoqG84Ijxg18KiftDDOzaXsCCCl
         bkEeW/qsVsT4rDnbzy6qEAHgYGM28Q42PLEtGDMYruA/N6I26uIIpBlbMo9TqnaRUrI+
         Xx5+tlC++zMaIrCT8ETT+EhcvJ5vhToTlmTaG9leYSrMPTmTUuytqRdKq0N8pM69u1mY
         IYtaJcQNPiUgJ1sDWCpVhu/6wVNWy6E0i7Sf5Mf88QhPjWBVW9/BWYNSCzhbK8zFW07v
         7bIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493812; x=1741098612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZv6ACgAaiSrj415nBbTglZgadnbuPvpJzvUVp4gsnY=;
        b=HCNw378Ab69T4vyC0MzZoMfHlj1kVEg0d/7ujxqPBB7VAiVpVi1BFI2cA1jY0KxSgP
         tSGR90nxg5aiwmWP2irhCI0UtHYEQ0K+ZURWbpZ1qv+L+wdM7WOfv3uGWJE3z6jCdQJh
         IAsKQ0HIeQQaAuTTfIGLrPGUg3oJfbHue09FaZqNqcKfn/jOnTkIodkPcBNLO0ovx6PD
         0gGKQQi5VP8albI3eR27Yha6sEpPkGWXni1cqc9lGdKMkoRtpoe0AkJlW2q7ZfHTwz/Z
         CP4dmKlFGMZ5WBBLAf4LSlMVKaZVRg0dEAmpDCU/mY98/x2+7xh446/rRxeqFxv/R7Ss
         J/Ng==
X-Gm-Message-State: AOJu0Yz6URnhsll8FiqBJ1Zw929s7pmxaToq97bpZJwnIft+T4CgKpK4
	w4e44STLK5bYce89QjtqIQf7HHr6iTGicqabYE4yk5VyA7YTb2tCVyHdw6fWaFGkSfj248Eg1ZE
	M
X-Gm-Gg: ASbGncsrHrsBS4zbVF0PDKx4tUYYJF4LKewmbeQ5IUcsrVS3JH0bkZR8R6lcg/1xL9Z
	1FTaX8npMsqWvft3NrcPPcDPwG1+XODBgGPo/wzrdCOFF0eFCUdjnYaqdlm1ZcYxcOsp5fVT4pV
	mVEIHJE0RzlwBddiV91kzb5b7RExstzeTY4J5r6F08A/EKQo91gihuP7KKK/WKc3Z0HmZ/Nr6dG
	4w5QmyvxsjTK0IH6xvRHmH3ROKxW9hRcFiu/fIaPFvgRH0T1DCfbztuoWlAHy4LKQU3Lsa1pXZ5
	8DLORqlFnWhhsOhtnA==
X-Google-Smtp-Source: AGHT+IGb8+s0e7SQ8cR+xt+F0oig4BE8gsJbCwWjjcEBk/3Kn9JkhYKu85I606HoVK1y0+j7tY12sQ==
X-Received: by 2002:a05:6a00:92aa:b0:732:2923:b70f with SMTP id d2e1a72fcca58-73426ceba49mr26178391b3a.11.1740493811623;
        Tue, 25 Feb 2025 06:30:11 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/22] u-boot: fix CVE-2024-57255
Date: Tue, 25 Feb 2025 06:29:39 -0800
Message-ID: <687b6e0a166d7dc999b7d226a9bd68155f59a03a.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211889

From: Hongxu Jia <hongxu.jia@windriver.com>

An integer overflow in sqfs_resolve_symlink in Das U-Boot before 2025.01-rc1
occurs via a crafted squashfs filesystem with an inode size of 0xffffffff,
resulting in a malloc of zero and resultant memory overwrite.

https://nvd.nist.gov/vuln/detail/CVE-2024-57255

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57255.patch         | 53 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
new file mode 100644
index 0000000000..4ca72da554
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
@@ -0,0 +1,53 @@
+From 5d7ca74388544bf8c95e104517a9120e94bfe40d Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 18:36:44 +0200
+Subject: [PATCH 2/8] squashfs: Fix integer overflow in sqfs_resolve_symlink()
+
+A carefully crafted squashfs filesystem can exhibit an inode size of 0xffffffff,
+as a consequence malloc() will do a zero allocation.
+Later in the function the inode size is again used for copying data.
+So an attacker can overwrite memory.
+Avoid the overflow by using the __builtin_add_overflow() helper.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57255
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/233945eba63e24061dffeeaeb7cd6fe985278356]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index 1430e671..16a07c06 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -422,8 +422,10 @@ static char *sqfs_resolve_symlink(struct squashfs_symlink_inode *sym,
+ 	char *resolved, *target;
+ 	u32 sz;
+ 
+-	sz = get_unaligned_le32(&sym->symlink_size);
+-	target = malloc(sz + 1);
++	if (__builtin_add_overflow(get_unaligned_le32(&sym->symlink_size), 1, &sz))
++		return NULL;
++
++	target = malloc(sz);
+ 	if (!target)
+ 		return NULL;
+ 
+@@ -431,9 +433,9 @@ static char *sqfs_resolve_symlink(struct squashfs_symlink_inode *sym,
+ 	 * There is no trailling null byte in the symlink's target path, so a
+ 	 * copy is made and a '\0' is added at its end.
+ 	 */
+-	target[sz] = '\0';
++	target[sz - 1] = '\0';
+ 	/* Get target name (relative path) */
+-	strncpy(target, sym->symlink, sz);
++	strncpy(target, sym->symlink, sz - 1);
+ 
+ 	/* Relative -> absolute path conversion */
+ 	resolved = sqfs_get_abs_path(base_path, target);
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index d9c6fcb993..cfe36256f3 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -12,6 +12,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2022-2347_1.patch \
                    file://CVE-2022-2347_2.patch \
                    file://CVE-2024-57254.patch \
+                   file://CVE-2024-57255.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0


