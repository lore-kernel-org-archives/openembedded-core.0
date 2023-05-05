Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68E3C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.30306.1683300005428383307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=200G1o0h;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-643a6f993a7so434629b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300004; x=1685892004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wmj93GyLObeisU5IaaU7K5kJspDh/Lk6WnCR6OQRDr4=;
        b=200G1o0hHZka1xeoCnLZ8PW+aL3o6SlSeCUPFBcboofpRg9P7TJG9MMtRYUM6iDj+t
         6t17+KAp0dOF+LiMo3/ifJGd/NxfO0RtXfQjGFjrB8W7kSWCtoWxY8BsOiwWMT2PrYDo
         okSfLPR4JDBAPkTzYK2j2NohFcij/pvLL3+GLHvA4BNoi3YdjuZjs+vd8B4PKC3Mn2v8
         lehUK9bMks586rvMusA1duqd5g+J3clJowlhImoqC+RJCRN5jj1Fal/tXDhnvL2wesBL
         jsc+iNEcnt6xIRMu058Mmqy7Y5mhfgWjD9enBAm1MEEgUxtOvkTGjKiCJCn2QLOPNxPm
         AsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300004; x=1685892004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmj93GyLObeisU5IaaU7K5kJspDh/Lk6WnCR6OQRDr4=;
        b=Xoph50scn1s1fOina+4jcii5KBJbqgkjKNlSIsipN650I8Fv7vKe0kQDEkV2e/bgZU
         m5ouFp1pSdrZXXpq0xY5NeD+qdgEgkqSuJQbN++aGNBvsS2UHjxMGUPaGD4AovoQOvR7
         21yuOkz3JCKLbxXx5cFXdsbbULlnV5SnZ24oVoF50KE5BHbVzJsdBesrKqPbCckzwFlJ
         3Y4Ux5js/lBhVTJXvl+yu930MUX/mzZ5cvsMhd0sza13JIu0O6BSQD97nPyRWG7bVqFR
         CAbPw+BfzS4eTHGEm9WokAfGEIhDZ6nCjqXW8bYxJmdxK2Z5mVRd+vR49FGspjugS7/I
         DW4Q==
X-Gm-Message-State: AC+VfDy4fK8ow1yLWALMn5gwt3VxFuUjjWzZ2UrGM48Qz6HckNe4royy
	XSdP+0XMKcrBDa3lwdSi76Jz2UCCqw2x8uQq8rI=
X-Google-Smtp-Source: ACHHUZ7CCBLCPU7yVQtmcWmRzVOswgMbjx0p/hhjGkhpaZCh9E6kFL4cSjT11CXsKbHIL9/IXjHD1Q==
X-Received: by 2002:a05:6a00:1a56:b0:643:b310:6816 with SMTP id h22-20020a056a001a5600b00643b3106816mr243436pfv.9.1683300004406;
        Fri, 05 May 2023 08:20:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/35] connman: backport fix for CVE-2023-28488
Date: Fri,  5 May 2023 05:19:12 -1000
Message-Id: <6ae794bfd0db6028c79c36d2fef47471916b357c.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180921

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ify-and-sanitize-packet-length-first.patch | 63 +++++++++++++++++++
 .../connman/connman_1.41.bb                   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch b/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch
new file mode 100644
index 0000000000..8e2f47a1d5
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch
@@ -0,0 +1,63 @@
+From 99e2c16ea1cced34a5dc450d76287a1c3e762138 Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 11 Apr 2023 08:12:56 +0200
+Subject: [PATCH] gdhcp: Verify and sanitize packet length first
+
+Avoid overwriting the read packet length after the initial test. Thus
+move all the length checks which depends on the total length first
+and do not use the total lenght from the IP packet afterwards.
+
+Fixes CVE-2023-28488
+
+Reported by Polina Smirnova <moe.hwr@gmail.com>
+
+CVE: CVE-2023-28488
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
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
+2.34.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
index 79542b2175..3f2e29820f 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -8,6 +8,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://CVE-2022-32293_p1.patch \
            file://CVE-2022-32293_p2.patch \
            file://CVE-2022-32292.patch \
+           file://0001-gdhcp-Verify-and-sanitize-packet-length-first.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.34.1


