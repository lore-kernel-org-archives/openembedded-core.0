Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16110C77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 14:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.51822.1682344953972072615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 07:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 735B31FB;
	Mon, 24 Apr 2023 07:03:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14BDD3F64C;
	Mon, 24 Apr 2023 07:02:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] connman: backport fix for CVE-2023-28488
Date: Mon, 24 Apr 2023 15:02:31 +0100
Message-Id: <20230424140231.350204-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 14:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180355

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ify-and-sanitize-packet-length-first.patch | 63 +++++++++++++++++++
 .../connman/connman_1.41.bb                   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-gdhcp-=
Verify-and-sanitize-packet-length-first.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-=
and-sanitize-packet-length-first.patch b/meta/recipes-connectivity/connma=
n/connman/0001-gdhcp-Verify-and-sanitize-packet-length-first.patch
new file mode 100644
index 00000000000..8e2f47a1d55
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-gdhcp-Verify-and-san=
itize-packet-length-first.patch
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
+@@ -1319,9 +1319,9 @@ static bool sanity_check(struct ip_udp_dhcp_packet=
 *packet, int bytes)
+ static int dhcp_recv_l2_packet(struct dhcp_packet *dhcp_pkt, int fd,
+ 				struct sockaddr_in *dst_addr)
+ {
+-	int bytes;
+ 	struct ip_udp_dhcp_packet packet;
+ 	uint16_t check;
++	int bytes, tot_len;
+=20
+ 	memset(&packet, 0, sizeof(packet));
+=20
+@@ -1329,15 +1329,17 @@ static int dhcp_recv_l2_packet(struct dhcp_packe=
t *dhcp_pkt, int fd,
+ 	if (bytes < 0)
+ 		return -1;
+=20
+-	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
+-		return -1;
+-
+-	if (bytes < ntohs(packet.ip.tot_len))
++	tot_len =3D ntohs(packet.ip.tot_len);
++	if (bytes > tot_len) {
++		/* ignore any extra garbage bytes */
++		bytes =3D tot_len;
++	} else if (bytes < tot_len) {
+ 		/* packet is bigger than sizeof(packet), we did partial read */
+ 		return -1;
++	}
+=20
+-	/* ignore any extra garbage bytes */
+-	bytes =3D ntohs(packet.ip.tot_len);
++	if (bytes < (int) (sizeof(packet.ip) + sizeof(packet.udp)))
++		return -1;
+=20
+ 	if (!sanity_check(&packet, bytes))
+ 		return -1;
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/rec=
ipes-connectivity/connman/connman_1.41.bb
index 79542b2175d..3f2e29820f8 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -8,6 +8,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${B=
P}.tar.xz \
            file://CVE-2022-32293_p1.patch \
            file://CVE-2022-32293_p2.patch \
            file://CVE-2022-32292.patch \
+           file://0001-gdhcp-Verify-and-sanitize-packet-length-first.pat=
ch \
            "
=20
 SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-impleme=
nt-res_ninit.patch"
--=20
2.34.1


