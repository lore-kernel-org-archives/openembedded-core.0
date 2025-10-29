Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3131CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.13457.1761768736423996483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YeRjuz+V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-78125ed4052so443963b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761768736; x=1762373536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IIB036AdLgWL/xRXb+VKFMNGSrlcLuERwQdE9PSj2s=;
        b=YeRjuz+VjukLsyLpnI4zYbzLxThBPXfx/b7GKFRoslTNliQdeNFIIL8kiNQIcNqQjn
         DFC4reZW85Lmh7SQeG9wcFzETIuWB/6rPB4JD4off7jp9Cl7VXRx8/YYEcSTMoXGbV2g
         HTQbPr4HQ55Zw71CSv3+KsDUglHJ/8SKeWlDvETgiDsP4HVstw/XiwlzlojIyP/6a0iV
         xzhJxnlfpZJJJZR/6VCnyMrRzr6ORd9gG0hL6m/x0vzuWQmuecfPzHqyV5lhuqSbDAgg
         1Z8HigbCGDndC7STT3cMITBIhNRHghNYCMRYaNItm3uT+ASv8ZlSf4GXM27sZNU+q1RP
         8J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768736; x=1762373536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IIB036AdLgWL/xRXb+VKFMNGSrlcLuERwQdE9PSj2s=;
        b=BkjB+R/MpGJ9dXf7TWsTf89FrSH+lB0vjdUgjKE+IRtUCd997LKcSVrtxunCbhZTa4
         9uTpO161AEPezSKnTtM8lW625OTPY3A3hg2z8fQ+2IGlpMYrwVRx/QoFr6/TkMVOVVKL
         KQeJ94gHcXbMwDEh7p9UoRC6wO3VVBmGo8ZRF+uSLF1aQmbPgFcFA92LaXPpXaw0pyv7
         +nmcvLIOBKNQyiomA92AI7sqXHjWunNfU/ttFhhRFQTfq5Kd+562THNSi2vzU/fLBZSx
         chphvl2lMlVZ82LTz/b+2STpE6+AF//osLypYf1/tV6oHpRVYLIwbb6N2iovr4UlDHFH
         sKBA==
X-Gm-Message-State: AOJu0YzBZdJ+2AA4FY2OtPks8UblCCJV9VCl5KJKnM9mG+e8joa5MJm4
	HJeLT0JThRTL11QYxTM/6f+8QpoFyO7SySS3/AZab+PuWYDAH5iXwigdAm+mh/lyo0Qku93xTlY
	QefrLFuE=
X-Gm-Gg: ASbGncsKZhLiPMqyUyqlVa5cR3js7FQOcDTqAk+pyTH7EaLaHHqB4ImGPAGoIdk21RU
	/4ND2dbySdWnoALPQX7BpiOYofOMoZk9hgH6HQohZ3tdd7YcSGxPe/wRlSxkUKkR019bXW/K36/
	IRNDE66yPJbQHUKQ3sCxReNFgHM/+qg0vqIl9ttFsr1jmLFQ6UpxTQvX4RjmAMCKBNdt72Nyknz
	Vy4n+9yJviq9+knYenmE0r3PUH+tKnUzrleeTLTAaHWuIAM+3LXLFzcBYXwNAy+Sks/ezz3OFx8
	LVTFY/z+8ien1jg3RAkzTkyP6HXeDUGGXF6EakatZB8TiGrRMPv0kFR3TIhmmjknf4Q0rUDP1iF
	kWSpbqobC/UTTK2EvgGI89UpIW2aQHNm0XogWIU1QVhGABhSthWG/DJS46IE/R1jdyuY=
X-Google-Smtp-Source: AGHT+IFMlIgE4ksCuiryXwl2cng9dlXNTGOYMm1ahdeblXs+y99d20UFptHqR50Sirt74Kf0DXLUFw==
X-Received: by 2002:a05:6a00:8c5:b0:7a2:83f2:4989 with SMTP id d2e1a72fcca58-7a62a3609cfmr654092b3a.5.1761768735599;
        Wed, 29 Oct 2025 13:12:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm16522100b3a.63.2025.10.29.13.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:12:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/6] u-boot: fix CVE-2024-42040
Date: Wed, 29 Oct 2025 13:11:53 -0700
Message-ID: <5c086db3f44d44f31e90f95ccb429639a1ff481d.1761768602.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761768602.git.steve@sakoman.com>
References: <cover.1761768602.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225468

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport a patch [1] from upstrem to fix CVE-2024-42040 [2]

[1] https://source.denx.de/u-boot/u-boot/-/commit/81e5708cc2c865df606e49aed5415adb2a662171
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-42040

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-42040.patch         | 56 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
 2 files changed, 57 insertions(+)
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
index 3a48b63c42..da34e3d3e8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -23,6 +23,7 @@ SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2024-57258-2.patch \
            file://CVE-2024-57258-3.patch \
            file://CVE-2024-57259.patch \
+           file://CVE-2024-42040.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


