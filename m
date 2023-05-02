Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC43C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 12:38:40 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.127178.1683031110084065622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 05:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=B9QmSCNM;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b51fd2972so2654348b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683031109; x=1685623109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N81+KTI6NW2GbG3g4bzjjsq8okVp2URED6Y2SMxu1AE=;
        b=B9QmSCNMl6nCM7cnvMMwaG0B3HGyhKDLB+iNcCQsGLQ3Eka4S/SC0deuBAEvurbgGS
         crm3dJ0W/Rk35p617u6wJKmdlaOCILi43yx/yi6SKTgtkOCgKWZpbBZmsekeJ692cLIF
         ICZiadtvU7IXK51/Ql/h2tUxqI0gLkJPoogIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683031109; x=1685623109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N81+KTI6NW2GbG3g4bzjjsq8okVp2URED6Y2SMxu1AE=;
        b=fgKZKHByH5sfsztj5dD6PlcRsGCn9IF56JvnTgt1N9fxQWTgdZb24wdMLEUW6GlnTJ
         C2yD4wCYrElib6RDx5+gHUJpnc+4jaC+RWMNWF9FSW0KHQmlOf6o7eJ8hQp/lVuCOldw
         Ch9qsSnaA5UKQzzk67OHhmpRVephWPunnDsOLWPgf0v5TX2nwx/XUCG07k8+riTgG88L
         FpSdRoT5zY6sorEiPqSBAGClwSs49Qnx9QJPc331R0gV+8zKsYI4K03/89vvcg1+bcxa
         2wXvDNoMEZorPbKRgSv2GSVpYEPlUM1bOaOKUrYwKysyL2pwY2pQxVOv/Bnx1jE+hh+9
         XFWA==
X-Gm-Message-State: AC+VfDyzEuJu9JuQV9hOuauxxBUzXUYURLlK5X9kqoZG/78D4r8fciqK
	o+6MkdlIW5nHnuW5ZKn8paCoa2TRpaTaHKHRu6U=
X-Google-Smtp-Source: ACHHUZ7u8zEcJmXjW8dNATFH8YJUhGWe0AY134IrZnocr2hURiAOCZCeP3FE61VBG4Ig5Vrno/xINw==
X-Received: by 2002:a05:6a00:2e91:b0:63c:6485:d5e5 with SMTP id fd17-20020a056a002e9100b0063c6485d5e5mr24987027pfb.22.1683031109327;
        Tue, 02 May 2023 05:38:29 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.249])
        by smtp.gmail.com with ESMTPSA id h17-20020a056a001a5100b005abc30d9445sm21625751pfv.180.2023.05.02.05.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 05:38:28 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 02 May 2023 18:08:22 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] connman: fix CVE-2023-28488 DoS in client.c
Date: Tue,  2 May 2023 18:08:21 +0530
Message-Id: <20230502123821.433098-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 12:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180727

Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=99e2c16ea1cced34a5dc450d76287a1c3e762138

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../connman/connman/CVE-2023-28488.patch      | 60 +++++++++++++++++++
 .../connman/connman_1.41.bb                   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch b/meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch
new file mode 100644
index 0000000000..a6cabdfb20
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2023-28488.patch
@@ -0,0 +1,60 @@
+From 99e2c16ea1cced34a5dc450d76287a1c3e762138 Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 11 Apr 2023 08:12:56 +0200
+Subject: gdhcp: Verify and sanitize packet length first
+
+Avoid overwriting the read packet length after the initial test. Thus
+move all the length checks which depends on the total length first
+and do not use the total lenght from the IP packet afterwards.
+
+Reported by Polina Smirnova <moe.hwr@gmail.com>
+
+CVE: CVE-2023-28488
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=99e2c16ea1cced34a5dc450d76287a1c3e762138]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gdhcp/client.c | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/gdhcp/client.c b/gdhcp/client.c
+index 3016dfc..28fa606 100644
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
+2.25.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
index 79542b2175..27b28be41c 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -8,6 +8,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://CVE-2022-32293_p1.patch \
            file://CVE-2022-32293_p2.patch \
            file://CVE-2022-32292.patch \
+           file://CVE-2023-28488.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1


