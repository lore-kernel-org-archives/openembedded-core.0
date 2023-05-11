Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98194C7EE24
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:28:28 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.8920.1683840508245907245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2Ldpi8y7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6439df6c268so5791638b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683840507; x=1686432507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkiqVJHXj4fthCS72tS/6hPIhrgbiuag3vC5cUSteU0=;
        b=2Ldpi8y7PAI5eJDRRcz60tRCOKubJDCKgLxXxtTgpe2rcOpIeF6lhh75WnoDgZ7L5h
         54siRaBL5s5PsKmlgLUeDnDYQRWcdOyhBtAMw/Z4nuTH9syWJt76VpIb/HLi7PG3pGjV
         jQYXZZa9BOrJRbLlAtoBYN5hocLGUDEmqiNBcPIuoWUQxTjKo4VwoYfpcPGcvrjuItE3
         K5CPOLquGL8s3YEzz0LJy+Q7JTnf5cVU01HhDZCIG9UB9mdiQdbVxtbZ8W6Y8YZki60o
         MvlMp/6iQOXK/PfMzd8PqnUP6TNeGp3FzwfeG+3R6y9ita06DDRqXvFIgKvjAP2u1DN1
         7nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683840507; x=1686432507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkiqVJHXj4fthCS72tS/6hPIhrgbiuag3vC5cUSteU0=;
        b=TL1nmqKwLPkDXTs/j8noZ5r0yXdeV5ZPiwqZoCdTfCsyZ6eKN5JUgNzfqRKTDPAgN/
         lg2tPMP0Yb/rlFNJRnvWuMJazIL6R+MViPDdlChww25sOyyj+NcFWa3T2jTClVaR0tui
         0nXbsnw83FCXk+9rvEHPUEOXgteAjdVSoD/KxZN+ER03g+oa017X8CebdUHvC+GcOQP/
         c6bfR6WbjQLPd5jlXMRTPB7SrDkr+CUGuuqqS+ueTnmE6huEiKy3PrEiKqX7K53475lh
         4+feDsCk6KCnyHTOgtZ0cek032jZphIwmFALMSl7maseeK5jqjIPmyNCHGBusWJZCa3a
         vHOQ==
X-Gm-Message-State: AC+VfDwk4ANh+GQ1PyuHdCoGhDsDtZpJxXV133zndu8TgjIY7v4kneI7
	qrFsjgJVmD7wnEGfyf/LLJp96WdGUdAvIfHD1Bw=
X-Google-Smtp-Source: ACHHUZ4gkQKCywXm+bmhAhIzAsnaBHjeecqEYHpR6s/ZgX4yHTYeqGuh10aGuLkrSOUbUtOcQj3H+Q==
X-Received: by 2002:a05:6a20:7d86:b0:103:e3bc:5106 with SMTP id v6-20020a056a207d8600b00103e3bc5106mr4612884pzj.57.1683840507214;
        Thu, 11 May 2023 14:28:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e5-20020aa78c45000000b00640defda6d2sm5671981pfd.207.2023.05.11.14.28.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:28:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] connman: Fix CVE-2023-28488 DoS in client.c
Date: Thu, 11 May 2023 11:28:08 -1000
Message-Id: <47a9ae5592392bd10740e4571b06c8c739705058.1683840390.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683840390.git.steve@sakoman.com>
References: <cover.1683840390.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181150

From: Ashish Sharma <asharma@mvista.com>

Avoid overwriting the read packet length after the initial test. Thus
move all the length checks which depends on the total length first
and do not use the total lenght from the IP packet afterwards.

Fixes CVE-2023-28488

Reported by Polina Smirnova <moe.hwr@gmail.com>

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


