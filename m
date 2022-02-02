Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E761C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 15:47:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.66129.1643816854217189809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 07:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 212FlViR024544
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 212FlQXe023439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:31 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Feb 2022 07:47:26 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Feb 2022 07:47:25 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/8] qemu: fix CVE-2021-3593
Date: Wed, 2 Feb 2022 10:47:14 -0500
Message-ID: <20220202154720.18976-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220202154720.18976-1-sakib.sajal@windriver.com>
References: <20220202154720.18976-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 212FlViR024544
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 15:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161215

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3593.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 6c00bf274b..6b544a4344 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -73,6 +73,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3592_1.patch \
            file://CVE-2021-3592_2.patch \
            file://CVE-2021-3592_3.patch \
+           file://CVE-2021-3593.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3593.patch
new file mode 100644
index 0000000000..dd14c240a8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch
@@ -0,0 +1,40 @@
+From fe99634066e1074aaf55e83b576385877d7e4bcc Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Fri, 4 Jun 2021 16:32:55 +0400
+Subject: [PATCH 04/12] upd6: check udp6_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3593
+Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/45
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [de71c15de66ba9350bf62c45b05f8fbff166517b]
+CVE: CVE-2021-3593
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ slirp/src/udp6.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/slirp/src/udp6.c b/slirp/src/udp6.c
+index 6f9486bbc..8c490e4d1 100644
+--- a/slirp/src/udp6.c
++++ b/slirp/src/udp6.c
+@@ -28,7 +28,10 @@ void udp6_input(struct mbuf *m)
+     ip =3D mtod(m, struct ip6 *);
+     m->m_len -=3D iphlen;
+     m->m_data +=3D iphlen;
+-    uh =3D mtod(m, struct udphdr *);
++    uh =3D mtod_check(m, sizeof(struct udphdr));
++    if (uh =3D=3D NULL) {
++        goto bad;
++    }
+     m->m_len +=3D iphlen;
+     m->m_data -=3D iphlen;
+=20
+--=20
+2.31.1
+
--=20
2.33.0


