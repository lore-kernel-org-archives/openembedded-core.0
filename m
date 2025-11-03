Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9697DCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2307.1762203569222157157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y8l+vXEX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a59ec9bef4so5953914b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203568; x=1762808368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDWCQe9NFH2ttJXNLXPTWFYa5WQZvItUUI4WsBw5sMY=;
        b=y8l+vXEXpXSn9p9zds7lJMpdhob+zi9yHaQ9rsnxedjfAhLyB3IwW7uUA/3yj5FM/o
         Tph4sWeMlJEHJycC+KFs7wP0RuV9WcjvtVGpbXkJOkoX2nHSAhsPNfQJn0HHnfJX73yu
         p9eowLuLGsARxP9KmdEQUOqFE4bRoNZHJcYdMkIhOXNZyDByZhfjZKANY0jlZfdnCSeq
         gCcTL6HqzZK3zcNRMGjsJ3YUsjjRiW+V7t+d++rjOJkef74PXmuIeWhuSzpAzYAZN8w1
         resyU4FxJXeBkI7uMKbIEZ5Rl0wWA9CGAJrs2X5Daw3Ma+o43+E6aSbU/LfHozKoewRI
         OLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203568; x=1762808368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDWCQe9NFH2ttJXNLXPTWFYa5WQZvItUUI4WsBw5sMY=;
        b=anQW8ThED5cgsx7pc02acPo7OJvBeCjX/6eAyYiRWZe7OQ4MWbeLKueTXUn/4yrF/y
         SQ9vLcyI6CsL7kJ4bIJgJSOA27xrEIjfiV2lEvFTuIdlNcGohE7ChraeAsYrl4b4nv66
         N4aMWFuK9AhhzamLIvBpAKAlBAXhrV6px1ceyfhT6q2EtAmGsqKpWE9O0pFG6RrQPBrV
         zy2O1DibO3Kcd0lgJtaCJUY3e+vxKX5SQTqq1xvFsOY3LRdRqTtpIsMDJTF33+NpjdRm
         U0P4n2yivJMOCKs4DTo8lNCtgW/t9j/qXLdanGlLk5Ib3nM8uEi18Ggkek34l+c3/QTB
         FmnQ==
X-Gm-Message-State: AOJu0Yy0YucEmyYyNRZ2mCjanBLVpCglawSO8UQBUPLSI6z42lYcDlC0
	zdXv6B/pukgwUvzXbUrmuDBWvjmbtHdXEvrSkQuhb8iwPPkyRa/EeFrJHjM1shEpd43cfek0GUd
	SVizaEPo=
X-Gm-Gg: ASbGncuDO0NOsXbdAtPEe/99O8YkqSq5zKFTyzBw0FIZ60LuL/b36SjDYRSAKBZu7Bo
	r3Z3WoiucFHYNP2iaMRhb2NkJ2mxW08ATCKCtzv6j4tnYVFhLpQKjXZ0AIX6mX3YqAzipaohmQ4
	mbDQ9XnxyeW6Jk75oWWo0vbfW3f3RWlBl5D+K5b04uI+T+0DZZXhH6Ghxc77Gny6Icx3HylaTqv
	EH359NwHTWiByL5C/yLPi1PM1mJjS6MkmbwEznGhgM4yHvN1ukWQffxs2xollGmQGgtg6f4oawv
	l0SL2NdEjOxbecUpK2hMY5ZIf3kHT+9hj6pCQlOyLmzdMY3WVQRgETPuA7aU9VGyk0zWWmg/ixI
	GtSUrxy79sV8P6Hw2k8/ODGgmsErCbYjcZrGHdEj8QDrMuTxqJo308KwHOJDcNcjMcrE=
X-Google-Smtp-Source: AGHT+IHj8RHqPfxzCu6x2B3gaRC8x8wTtJJb0Z2Li0dnJ+6YckroEiNLmzheeW1jBubJJocaN0qxkQ==
X-Received: by 2002:a17:90b:3a8c:b0:33b:b078:d6cc with SMTP id 98e67ed59e1d1-34083070ec7mr16847144a91.31.1762203568438;
        Mon, 03 Nov 2025 12:59:28 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] u-boot: fix CVE-2024-42040
Date: Mon,  3 Nov 2025 12:59:08 -0800
Message-ID: <f5b980ade1e952a181cb51d60268942095627c0d.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225697

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport a patch [1] from upstrem to fix CVE-2024-42040 [2]

[1] https://source.denx.de/u-boot/u-boot/-/commit/81e5708cc2c865df606e49aed5415adb2a662171
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-42040

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-42040.patch         | 56 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch
new file mode 100644
index 0000000000..2d250e51b7
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch
@@ -0,0 +1,56 @@
+From 1406fc918977bba4dac0af5e22e63a5553aa6aff Mon Sep 17 00:00:00 2001
+From: Paul HENRYS <paul.henrys_ext@softathome.com>
+Date: Thu, 9 Oct 2025 17:43:28 +0200
+Subject: [PATCH] net: bootp: Prevent buffer overflow to avoid leaking the RAM
+ content
+
+CVE-2024-42040 describes a possible buffer overflow when calling
+bootp_process_vendor() in bootp_handler() since the total length
+of the packet is passed to bootp_process_vendor() without being
+reduced to len-(offsetof(struct bootp_hdr,bp_vend)+4).
+
+The packet length is also checked against its minimum size to avoid
+reading data from struct bootp_hdr outside of the packet length.
+
+Signed-off-by: Paul HENRYS <paul.henrys_ext@softathome.com>
+Signed-off-by: Philippe Reynes <philippe.reynes@softathome.com>
+
+CVE: CVE-2024-42040
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/81e5708cc2c865df606e49aed5415adb2a662171]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ net/bootp.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/net/bootp.c b/net/bootp.c
+index 68002909634..843180d296c 100644
+--- a/net/bootp.c
++++ b/net/bootp.c
+@@ -362,6 +362,14 @@ static void bootp_handler(uchar *pkt, unsigned dest, struct in_addr sip,
+ 	debug("got BOOTP packet (src=%d, dst=%d, len=%d want_len=%zu)\n",
+ 	      src, dest, len, sizeof(struct bootp_hdr));
+ 
++	/* Check the minimum size of a BOOTP packet is respected.
++	 * A BOOTP packet is between 300 bytes and 576 bytes big
++	 */
++	if (len < offsetof(struct bootp_hdr, bp_vend) + 64) {
++		printf("Error: got an invalid BOOTP packet (len=%u)\n", len);
++		return;
++	}
++
+ 	bp = (struct bootp_hdr *)pkt;
+ 
+ 	/* Filter out pkts we don't want */
+@@ -379,7 +387,8 @@ static void bootp_handler(uchar *pkt, unsigned dest, struct in_addr sip,
+ 
+ 	/* Retrieve extended information (we must parse the vendor area) */
+ 	if (net_read_u32((u32 *)&bp->bp_vend[0]) == htonl(BOOTP_VENDOR_MAGIC))
+-		bootp_process_vendor((uchar *)&bp->bp_vend[4], len);
++		bootp_process_vendor((uchar *)&bp->bp_vend[4], len -
++				     (offsetof(struct bootp_hdr, bp_vend) + 4));
+ 
+ 	net_set_timeout_handler(0, (thand_f *)0);
+ 	bootstage_mark_name(BOOTSTAGE_ID_BOOTP_STOP, "bootp_stop");
+-- 
+2.49.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d366f10398..7a63420642 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,9 @@ PE = "1"
 # repo during parse
 SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
+           file://CVE-2024-42040.patch \
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.43.0


