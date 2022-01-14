Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B766C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 00:06:46 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.636.1642118805193078538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20E06iYC005737
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:06:44 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20E06hl5006912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:06:44 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 13 Jan 2022 16:06:44 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 16:06:43 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 13 Jan 2022 16:06:43 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 4/8] qemu: CVE-2021-3594
Date: Thu, 13 Jan 2022 19:06:37 -0500
Message-ID: <20220114000641.33969-4-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220114000641.33969-1-sakib.sajal@windriver.com>
References: <20220114000641.33969-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 20E06iYC005737
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 00:06:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160548

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3594.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 811bdff426..4198d3a52c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -76,6 +76,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3593.patch \
            file://CVE-2021-3595_1.patch \
            file://CVE-2021-3595_2.patch \
+           file://CVE-2021-3594.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3594.patch
new file mode 100644
index 0000000000..ec2a254c7d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch
@@ -0,0 +1,40 @@
+From 7a5ffd5475f2cbfe3cf91d9584893f1a4b3b4dff Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Fri, 4 Jun 2021 16:40:23 +0400
+Subject: [PATCH 07/12] udp: check upd_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3594
+Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/47
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3594
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ slirp/src/udp.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/slirp/src/udp.c b/slirp/src/udp.c
+index 0ad44d7c0..18b4acdfa 100644
+--- a/slirp/src/udp.c
++++ b/slirp/src/udp.c
+@@ -93,7 +93,10 @@ void udp_input(register struct mbuf *m, int iphlen)
+     /*
+      * Get IP and UDP header together in first mbuf.
+      */
+-    ip =3D mtod(m, struct ip *);
++    ip =3D mtod_check(m, iphlen + sizeof(struct udphdr));
++    if (ip =3D=3D NULL) {
++        goto bad;
++    }
+     uh =3D (struct udphdr *)((char *)ip + iphlen);
+=20
+     /*
+--=20
+2.31.1
+
--=20
2.33.0


