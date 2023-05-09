Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188DAC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 04:15:30 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.23965.1683605724583316315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 21:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OV4UE7R3;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso4899062a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 21:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683605724; x=1686197724;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/n391ndG9XVwRreF4KGjY11XzkZRg3HYhiUHl/z27M=;
        b=OV4UE7R3oma7hpD0TlIIM+qDva89lgg6dmdlV560zJ6TvTUD97IhrQCQwD9+HOQ/GT
         1GJ9P9O4El6JsfNCPUMdw+rz+2c+RGjazP+06NqS5gdHSJwNrR1d4eF/oBs4GyAr0Vcm
         lN8hW/tbbJjy9UpXJ1N9zX0+kAE3oSe1BMSUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683605724; x=1686197724;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/n391ndG9XVwRreF4KGjY11XzkZRg3HYhiUHl/z27M=;
        b=WCZWp8GodJbdVHnncNpe5zF6NV7HPHfLObf8oWphvcH1LsktufwAORTzJKD3/by3xY
         R7QrvWp5geX7xiRW0XAfsndBJKIPpf3IQTxDuKqm9L/oiPScFsPFwEybFp5TdUFBU3sQ
         C8dd8MQHavHDpRMAFCNYnooIpc/huTN0dkNtCOOMYENpzcZk6pElVp+WYkNRlVg4SLJw
         4rbBADMtRkAblUZ71Rq3OyZXPxNQFm+iunVkR9/GGTmQQnp2gSZl4I4+ib0e7J+gJEIm
         +uSJV94E9ZWIVm7hWD5CMur/yAnpl55fJV72V7YKX2pNNsZ52Evniirho1ltxC6jGVIF
         VO4A==
X-Gm-Message-State: AC+VfDxD5hWPHnIhZEU6OPxixkw/JRYLFYlOcU8YDtrIXE3cVSjkNs+o
	sb4u88m4dGS1VXzDgLBe25CabAkVllOrxj+oo7Q=
X-Google-Smtp-Source: ACHHUZ4gPD+GNwVERuvOIBXh3JmJuFIqyz0WSOLf1OAe1FG/Izkh0Fu//M6uJANCfgPRWU+5rxb2+A==
X-Received: by 2002:a05:6a20:3d28:b0:100:9b72:f3d8 with SMTP id y40-20020a056a203d2800b001009b72f3d8mr6117631pzi.36.1683605723786;
        Mon, 08 May 2023 21:15:23 -0700 (PDT)
Received: from asharma-Latitude-3400 ([122.161.87.195])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78686000000b00640ddad2e0dsm734083pfo.47.2023.05.08.21.15.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 21:15:23 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 09 May 2023 09:45:18 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [--subject-prefix=OE-core][dunfell-nut][PATCH] connman: Fix CVE-2023-28488 DoS in client.c
Date: Tue,  9 May 2023 09:45:05 +0530
Message-Id: <20230509041505.26889-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 04:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181031

Avoid overwriting the read packet length after the initial test. Thus
move all the length checks which depends on the total length first
and do not use the total lenght from the IP packet afterwards.

Fixes CVE-2023-28488

Reported by Polina Smirnova <moe.hwr@gmail.com>

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../connman/connman/CVE-2023-28488.patch      | 54 +++++++++++++++++++
 .../connman/connman_1.37.bb                   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch b/meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch
new file mode 100644
index 0000000000..ea1601cc04
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch
@@ -0,0 +1,54 @@
+From 99e2c16ea1cced34a5dc450d76287a1c3e762138 Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 11 Apr 2023 08:12:56 +0200
+Subject: gdhcp: Verify and sanitize packet length first
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/patch/?id=99e2c16ea1cced34a5dc450d76287a1c3e762138]
+CVE: CVE-2023-28488
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ gdhcp/client.c | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index 7efa7e45..82017692 100644
+--- a/gdhcp/client.c
++++ b/gdhcp/client.c
+@@ -1319,9 +1319,9 @@ static bool sanity_check(struct ip_udp_dhcp_packet *packet, int bytes)
+ static int dhcp_recv_l2_packet(struct dhcp_packet *dhcp_pkt, int fd,
+ 				struct sockaddr_in *dst_addr)
+ {
+-	int bytes;
+ 	struct ip_udp_dhcp_packet packet;
+ 	uint16_t check;
++	int bytes, tot_len;
+ 
+ 	memset(&packet, 0, sizeof(packet));
+ 
+@@ -1329,15 +1329,17 @@ static int dhcp_recv_l2_packet(struct dhcp_packet *dhcp_pkt, int fd,
+ 	if (bytes < 0)
+ 		return -1;
+ 
+-	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
+-		return -1;
+-
+-	if (bytes < ntohs(packet.ip.tot_len))
++	tot_len = ntohs(packet.ip.tot_len);
++	if (bytes > tot_len) {
++		/* ignore any extra garbage bytes */
++		bytes = tot_len;
++	} else if (bytes < tot_len) {
+ 		/* packet is bigger than sizeof(packet), we did partial read */
+ 		return -1;
++	}
+ 
+-	/* ignore any extra garbage bytes */
+-	bytes = ntohs(packet.ip.tot_len);
++	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
++		return -1;
+ 
+ 	if (!sanity_check(&packet, bytes))
+ 		return -1;
+-- 
+cgit 
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index 73d7f7527e..8062a094d3 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -14,6 +14,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://CVE-2022-23098.patch \
             file://CVE-2022-32292.patch \
 	     file://CVE-2022-32293.patch \
+            file://CVE-2023-28488.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.17.1


