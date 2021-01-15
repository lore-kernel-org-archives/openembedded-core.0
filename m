Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.334.1610747356531748961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 13:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rqbm/eV4;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id o5so2573991oop.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 13:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUx+woasZT0Z2cEr/sGwizsZSVk69wk+yJRDe0EXTe0=;
        b=rqbm/eV4DXeG1Sy3QXZO43cPBTEcaMgCwzReGVBz7rogHhI22wVGKxqkPsYlYwkZii
         34sgh3GNg/4OYwbvfjBc64mI1VThUcxi3VToFk8uCYevTb/0ymwo3sbQweklK8Jl1GPq
         UzlYUOP/ojqbw5RJHsYg9TL5roQ0db60/Id4iOfv3JF5hRk+HyzBABHWd/in4+ZO8arQ
         tRhYl+s1AgByW4n4K4DQTW4JPuxHHyJjanDpCwU9kAactxXpoYbtUdmyvySLfiLgnM2b
         TvSr6W2LiPz4+nXoTPZNzC7+D5qO5HxeNFywP/NRoeU2h66f47PnzibleXKeopa7ECHB
         094w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUx+woasZT0Z2cEr/sGwizsZSVk69wk+yJRDe0EXTe0=;
        b=HwiMTWaD6kTWaQl2LlWd8efmbgn0bZwhUePOpysQq2DOnAjWvrsbugl7iLv6TcrEB/
         G091YC53qzqnzPCuG3VtRIrrg+f6y6qsNW8lfU2Bj2n/0FwJtSJIeqDHqLavB5NGQ/ru
         VzRYG0k/36RCr6g2WbnxfhaNCZuNeY1q7PxZIw97RfsA1S+HLuKn+yEyWbIdnevmAU9Z
         aQ7xZ/DS6U3PtRHU0H43HKK0A7C+j8iplSTag05feGd8alfnyCArrjKidSDecMhC3V0m
         xpbh0aapgYlGsCbbsZ34IvdWFafG+ofUs1HT06ZqlHCBsLzt9hvxrznaIcPxkDABmHe3
         wObQ==
X-Gm-Message-State: AOAM533yYUwLcD3H23/r8mAzhajy+lPfDrnElIqWvIljLBjI8bBWWu/E
	DiEq2Vw1h2RLkzpF9Fgjt340NozenK3KSA==
X-Google-Smtp-Source: ABdhPJyjTWyRTgBEEmYICOzLiZZAhJqA2KrhkJl7zjPn67IA4PLjshUOVLoUA+f/CfLAuVjBrHm0Zw==
X-Received: by 2002:a4a:d148:: with SMTP id o8mr9824040oor.16.1610747355647;
        Fri, 15 Jan 2021 13:49:15 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id a18sm1903533oia.29.2021.01.15.13.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 13:49:15 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] systemd-conf: Allow systemd to manage QEMU wired networks
Date: Fri, 15 Jan 2021 15:49:03 -0600
Message-Id: <20210115214903.11811-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows systemd to manage wired network interfaces just like on actual
hardware. Systemd seems to be smart enough to not enable DHCP if the
interface was assigned a IP address in the kernel (e.g. by runqemu), so
the existing use cases should continue to work.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/systemd/systemd-conf_247.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf_247.2.bb b/meta/recipes-core/systemd/systemd-conf_247.2.bb
index 944b56ff82..ea35e83f4f 100644
--- a/meta/recipes-core/systemd/systemd-conf_247.2.bb
+++ b/meta/recipes-core/systemd/systemd-conf_247.2.bb
@@ -29,9 +29,6 @@ do_install() {
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
 	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
-
-	# Do not install wired.network for qemu bsps
-	rm -rf ${D}${systemd_unitdir}/network
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.30.0

