Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91032C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 18:30:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.41029.1683657013564568994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 11:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dHjqrHSR;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1aaf21bb42bso44366135ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683657013; x=1686249013;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/n391ndG9XVwRreF4KGjY11XzkZRg3HYhiUHl/z27M=;
        b=dHjqrHSRTU8Ez+04BDZ7OyOZZ/prCUZ5Yh1vVnuTTTUuroCpyZ4VaD9iQyHu2LKTr+
         Q4bhLThWLcLwmfzVKhZns4hFzKmDJLtcb+CsBPBKyglZoHBBdE3ZfMAu9w5EjUaT05eO
         cvXv8y9GfEVAnVH6q8Ku48/JTOPHRFYZ8mMXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683657013; x=1686249013;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/n391ndG9XVwRreF4KGjY11XzkZRg3HYhiUHl/z27M=;
        b=IzlvrEHl5zFR+7p2gYnZXfTvzVx1KtrUP/8402RF9yZujLca4SyllI4C87QbqdNLyt
         zf2HLkjYCTtCJEefUplsnGlv/3+OTSZ3ttC3reCGrNhHlp7NGqg/e6i2O76JT0FQtXiR
         4Itu+1q6xNwZVF2F7gWfJ5V34wyNkv4F7FgmH94hBXOyoLXttESwBqj1Tf+t0WaNBg/R
         YzmPjnrNgzar6n2EjLVQz9Jb/ousg8DEWCMWn4e9kMk8O7BOc3ibigldjx3ZJ4d4s/B3
         XFQ5+kMoO+Ei+JloycICm+DZQOir7teLQtvpELPn2So1AlXwgFlbhSZgvAP8IK71GP5C
         sEOg==
X-Gm-Message-State: AC+VfDwzX8bGidA4XVqF9qAQ7aPkFaDqmOtcz1jZ2O+mTHhUs2fv1SWu
	cF97vkVBIjQOwFxPHwUcrdHJKcWHFzUoBMXMqQM=
X-Google-Smtp-Source: ACHHUZ5+88dlC9K48TvyK21KEFXZIQsJ+8J9U8GW5j+hnRDqAzvlhYKZQ6NAIOuz7h7F/KIgaFCJsQ==
X-Received: by 2002:a17:902:b08c:b0:1a1:ee8c:eef7 with SMTP id p12-20020a170902b08c00b001a1ee8ceef7mr15855580plr.48.1683657012690;
        Tue, 09 May 2023 11:30:12 -0700 (PDT)
Received: from asharma-Latitude-3400 ([122.161.87.195])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902864a00b001ab09f5ca61sm1921211plt.55.2023.05.09.11.30.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 11:30:12 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 10 May 2023 00:00:06 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] connman: Fix CVE-2023-28488 DoS in client.c
Date: Wed, 10 May 2023 00:00:04 +0530
Message-Id: <20230509183004.10338-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 18:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181083

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


