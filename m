Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A353C77B7F
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:06 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.36172.1683386698872850143
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Irj6JkRd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-643a6f993a7so1082817b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386698; x=1685978698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27gfOSCJ+ZyYIOsuUJAI5hqib3wgicEc2pQQk2F7Sf4=;
        b=Irj6JkRd0U6oi3xYDhvRhLzi6BZ+6s0+EfzqP3q/l3xw2JgZPkYQaOl3UH2ReazugV
         TVGBhoKRMAxN8VMZQnhYA0kF2lVojk7kZlbVGZuRnfuMJgvN0rIZjNlSb+TH1iWkChME
         fm2obiUN5Loq8QuxgdzFMcDN2tio2wwT+4DiraVVZ0Sz9JF+XLM+s+GxYbg1SSJcHvqL
         EZIAUowdm8x4JsXNrmUcSCwoK9ff3U6yGe1TYDYuzD1sWIA9kWUAscPnrXtzYIcLkcFs
         cPdAUZpa5IP/LaAzAD7lHjfsuQNCPY6K8vl2Z1pAwXtb925MaTwTKkUFElN4CihpgW44
         1rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386698; x=1685978698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27gfOSCJ+ZyYIOsuUJAI5hqib3wgicEc2pQQk2F7Sf4=;
        b=LZrBuNNRPs5M4VMsIyE14vZlD2E3NBCnQ2PUTXx43n+qqqBesi0YCBeGz81d4DSQoN
         AN4PF0cfnQ7IlRaK4ZoCVLWEuSfR+qOyljkcVf54rS7Oc5LWFdNu+lWFA5Yxl8PD9G+I
         diluItZiTyaXm9lc+pb2JJkQ8ss0lPDCtG0+24wonPBZ2y+Cnc93WgH+2FvCLH+7YN5S
         BMJ0lFuyS83XEv9rjO3BIMOnuC9SD4/3s86pcKYP2Gt0rfS/88ShjxzgUvIvD7pVFfjC
         gLzKVE7PlDmTfwkSA2F1n2Y3BqfwKaH5jiXJxEIH4wLJk519+nAxjVQm+tlMUaLM1icC
         dNuw==
X-Gm-Message-State: AC+VfDzjfdZJokrP8w77Y+YtYKRY2ungruZZhgOVaGYE1lWBlHWdIXlJ
	wY0CIHEjRsHlEpd5HbdmwzCSG6VlytzCsE0brpo=
X-Google-Smtp-Source: ACHHUZ4svv6Y70EF5YnRiVlJxjZ+GIApsCYasyNkqeAIui3MiPu3gSIL1eYc0rbs1rmwVGKEESdz0A==
X-Received: by 2002:aa7:8882:0:b0:643:5da1:d527 with SMTP id z2-20020aa78882000000b006435da1d527mr7786426pfe.27.1683386697885;
        Sat, 06 May 2023 08:24:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.24.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:24:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] connman: fix CVE-2023-28488 DoS in client.c
Date: Sat,  6 May 2023 05:24:32 -1000
Message-Id: <7a5d78de47cdd79bcb1b0e62a65e10705d59a7d9.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180985

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=99e2c16ea1cced34a5dc450d76287a1c3e762138

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


