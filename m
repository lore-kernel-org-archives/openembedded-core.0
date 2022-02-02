Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE66C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 15:47:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.66229.1643816854011522828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 07:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 212FlWTv024545
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 212FlQXf023439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:31 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Feb 2022 07:47:26 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 07:47:26 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Feb 2022 07:47:26 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 3/8] qemu: fix CVE-2021-3595
Date: Wed, 2 Feb 2022 10:47:15 -0500
Message-ID: <20220202154720.18976-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220202154720.18976-1-sakib.sajal@windriver.com>
References: <20220202154720.18976-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 212FlWTv024545
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 15:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161213

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-3595_1.patch           |  41 +++
 .../qemu/qemu/CVE-2021-3595_2.patch           | 253 ++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 6b544a4344..811bdff426 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,6 +74,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3592_2.patch \
            file://CVE-2021-3592_3.patch \
            file://CVE-2021-3593.patch \
+           file://CVE-2021-3595_1.patch \
+           file://CVE-2021-3595_2.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
new file mode 100644
index 0000000000..9a0d39aa05
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_1.patch
@@ -0,0 +1,41 @@
+From 6b62a09d6c264cb84f560a418beb027f47bc5069 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Fri, 4 Jun 2021 16:34:30 +0400
+Subject: [PATCH 05/12] tftp: check tftp_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3595
+Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/46
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [3f17948137155f025f7809fdc38576d5d2451c3d]
+CVE: CVE-2021-3595
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ slirp/src/tftp.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
+index c6950ee10..e06911d42 100644
+--- a/slirp/src/tftp.c
++++ b/slirp/src/tftp.c
+@@ -446,7 +446,11 @@ static void tftp_handle_error(Slirp *slirp, struct =
sockaddr_storage *srcsas,
+=20
+ void tftp_input(struct sockaddr_storage *srcsas, struct mbuf *m)
+ {
+-    struct tftp_t *tp =3D (struct tftp_t *)m->m_data;
++    struct tftp_t *tp =3D mtod_check(m, offsetof(struct tftp_t, x.tp_bu=
f));
++
++    if (tp =3D=3D NULL) {
++        return;
++    }
+=20
+     switch (ntohs(tp->tp_op)) {
+     case TFTP_RRQ:
+--=20
+2.31.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch
new file mode 100644
index 0000000000..2c95bf74a1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3595_2.patch
@@ -0,0 +1,253 @@
+From d71caef98e331268519578fc0437e2ac02586940 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Fri, 4 Jun 2021 20:01:20 +0400
+Subject: [PATCH 06/12] tftp: introduce a header structure
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Instead of using a composed structure and potentially reading past the
+incoming buffer, use a different structure for the header.
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [990163cf3ac86b7875559f49602c4d76f46f6f30]
+CVE: CVE-2021-3595
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ slirp/src/tftp.c | 60 +++++++++++++++++++++++++-----------------------
+ slirp/src/tftp.h |  6 ++++-
+ 2 files changed, 36 insertions(+), 30 deletions(-)
+
+diff --git a/slirp/src/tftp.c b/slirp/src/tftp.c
+index e06911d42..a19c889d3 100644
+--- a/slirp/src/tftp.c
++++ b/slirp/src/tftp.c
+@@ -50,7 +50,7 @@ static void tftp_session_terminate(struct tftp_session=
 *spt)
+ }
+=20
+ static int tftp_session_allocate(Slirp *slirp, struct sockaddr_storage =
*srcsas,
+-                                 struct tftp_t *tp)
++                                 struct tftphdr *hdr)
+ {
+     struct tftp_session *spt;
+     int k;
+@@ -75,7 +75,7 @@ found:
+     memcpy(&spt->client_addr, srcsas, sockaddr_size(srcsas));
+     spt->fd =3D -1;
+     spt->block_size =3D 512;
+-    spt->client_port =3D tp->udp.uh_sport;
++    spt->client_port =3D hdr->udp.uh_sport;
+     spt->slirp =3D slirp;
+=20
+     tftp_session_update(spt);
+@@ -84,7 +84,7 @@ found:
+ }
+=20
+ static int tftp_session_find(Slirp *slirp, struct sockaddr_storage *src=
sas,
+-                             struct tftp_t *tp)
++                             struct tftphdr *hdr)
+ {
+     struct tftp_session *spt;
+     int k;
+@@ -94,7 +94,7 @@ static int tftp_session_find(Slirp *slirp, struct sock=
addr_storage *srcsas,
+=20
+         if (tftp_session_in_use(spt)) {
+             if (sockaddr_equal(&spt->client_addr, srcsas)) {
+-                if (spt->client_port =3D=3D tp->udp.uh_sport) {
++                if (spt->client_port =3D=3D hdr->udp.uh_sport) {
+                     return k;
+                 }
+             }
+@@ -148,13 +148,13 @@ static struct tftp_t *tftp_prep_mbuf_data(struct t=
ftp_session *spt,
+ }
+=20
+ static void tftp_udp_output(struct tftp_session *spt, struct mbuf *m,
+-                            struct tftp_t *recv_tp)
++                            struct tftphdr *hdr)
+ {
+     if (spt->client_addr.ss_family =3D=3D AF_INET6) {
+         struct sockaddr_in6 sa6, da6;
+=20
+         sa6.sin6_addr =3D spt->slirp->vhost_addr6;
+-        sa6.sin6_port =3D recv_tp->udp.uh_dport;
++        sa6.sin6_port =3D hdr->udp.uh_dport;
+         da6.sin6_addr =3D ((struct sockaddr_in6 *)&spt->client_addr)->s=
in6_addr;
+         da6.sin6_port =3D spt->client_port;
+=20
+@@ -163,7 +163,7 @@ static void tftp_udp_output(struct tftp_session *spt=
, struct mbuf *m,
+         struct sockaddr_in sa4, da4;
+=20
+         sa4.sin_addr =3D spt->slirp->vhost_addr;
+-        sa4.sin_port =3D recv_tp->udp.uh_dport;
++        sa4.sin_port =3D hdr->udp.uh_dport;
+         da4.sin_addr =3D ((struct sockaddr_in *)&spt->client_addr)->sin=
_addr;
+         da4.sin_port =3D spt->client_port;
+=20
+@@ -185,14 +185,14 @@ static int tftp_send_oack(struct tftp_session *spt=
, const char *keys[],
+=20
+     tp =3D tftp_prep_mbuf_data(spt, m);
+=20
+-    tp->tp_op =3D htons(TFTP_OACK);
++    tp->hdr.tp_op =3D htons(TFTP_OACK);
+     for (i =3D 0; i < nb; i++) {
+         n +=3D slirp_fmt0(tp->x.tp_buf + n, sizeof(tp->x.tp_buf) - n, "=
%s", keys[i]);
+         n +=3D slirp_fmt0(tp->x.tp_buf + n, sizeof(tp->x.tp_buf) - n, "=
%u", values[i]);
+     }
+=20
+-    m->m_len =3D G_SIZEOF_MEMBER(struct tftp_t, tp_op) + n;
+-    tftp_udp_output(spt, m, recv_tp);
++    m->m_len =3D G_SIZEOF_MEMBER(struct tftp_t, hdr.tp_op) + n;
++    tftp_udp_output(spt, m, &recv_tp->hdr);
+=20
+     return 0;
+ }
+@@ -213,21 +213,21 @@ static void tftp_send_error(struct tftp_session *s=
pt, uint16_t errorcode,
+=20
+     tp =3D tftp_prep_mbuf_data(spt, m);
+=20
+-    tp->tp_op =3D htons(TFTP_ERROR);
++    tp->hdr.tp_op =3D htons(TFTP_ERROR);
+     tp->x.tp_error.tp_error_code =3D htons(errorcode);
+     slirp_pstrcpy((char *)tp->x.tp_error.tp_msg, sizeof(tp->x.tp_error.=
tp_msg),
+                   msg);
+=20
+     m->m_len =3D sizeof(struct tftp_t) - (TFTP_BLOCKSIZE_MAX + 2) + 3 +
+                strlen(msg) - sizeof(struct udphdr);
+-    tftp_udp_output(spt, m, recv_tp);
++    tftp_udp_output(spt, m, &recv_tp->hdr);
+=20
+ out:
+     tftp_session_terminate(spt);
+ }
+=20
+ static void tftp_send_next_block(struct tftp_session *spt,
+-                                 struct tftp_t *recv_tp)
++                                 struct tftphdr *hdr)
+ {
+     struct mbuf *m;
+     struct tftp_t *tp;
+@@ -241,7 +241,7 @@ static void tftp_send_next_block(struct tftp_session=
 *spt,
+=20
+     tp =3D tftp_prep_mbuf_data(spt, m);
+=20
+-    tp->tp_op =3D htons(TFTP_DATA);
++    tp->hdr.tp_op =3D htons(TFTP_DATA);
+     tp->x.tp_data.tp_block_nr =3D htons((spt->block_nr + 1) & 0xffff);
+=20
+     nobytes =3D tftp_read_data(spt, spt->block_nr, tp->x.tp_data.tp_buf=
,
+@@ -259,7 +259,7 @@ static void tftp_send_next_block(struct tftp_session=
 *spt,
+=20
+     m->m_len =3D sizeof(struct tftp_t) - (TFTP_BLOCKSIZE_MAX - nobytes)=
 -
+                sizeof(struct udphdr);
+-    tftp_udp_output(spt, m, recv_tp);
++    tftp_udp_output(spt, m, hdr);
+=20
+     if (nobytes =3D=3D spt->block_size) {
+         tftp_session_update(spt);
+@@ -282,12 +282,12 @@ static void tftp_handle_rrq(Slirp *slirp, struct s=
ockaddr_storage *srcsas,
+     int nb_options =3D 0;
+=20
+     /* check if a session already exists and if so terminate it */
+-    s =3D tftp_session_find(slirp, srcsas, tp);
++    s =3D tftp_session_find(slirp, srcsas, &tp->hdr);
+     if (s >=3D 0) {
+         tftp_session_terminate(&slirp->tftp_sessions[s]);
+     }
+=20
+-    s =3D tftp_session_allocate(slirp, srcsas, tp);
++    s =3D tftp_session_allocate(slirp, srcsas, &tp->hdr);
+=20
+     if (s < 0) {
+         return;
+@@ -413,29 +413,29 @@ static void tftp_handle_rrq(Slirp *slirp, struct s=
ockaddr_storage *srcsas,
+     }
+=20
+     spt->block_nr =3D 0;
+-    tftp_send_next_block(spt, tp);
++    tftp_send_next_block(spt, &tp->hdr);
+ }
+=20
+ static void tftp_handle_ack(Slirp *slirp, struct sockaddr_storage *srcs=
as,
+-                            struct tftp_t *tp, int pktlen)
++                            struct tftphdr *hdr)
+ {
+     int s;
+=20
+-    s =3D tftp_session_find(slirp, srcsas, tp);
++    s =3D tftp_session_find(slirp, srcsas, hdr);
+=20
+     if (s < 0) {
+         return;
+     }
+=20
+-    tftp_send_next_block(&slirp->tftp_sessions[s], tp);
++    tftp_send_next_block(&slirp->tftp_sessions[s], hdr);
+ }
+=20
+ static void tftp_handle_error(Slirp *slirp, struct sockaddr_storage *sr=
csas,
+-                              struct tftp_t *tp, int pktlen)
++                              struct tftphdr *hdr)
+ {
+     int s;
+=20
+-    s =3D tftp_session_find(slirp, srcsas, tp);
++    s =3D tftp_session_find(slirp, srcsas, hdr);
+=20
+     if (s < 0) {
+         return;
+@@ -446,23 +446,25 @@ static void tftp_handle_error(Slirp *slirp, struct=
 sockaddr_storage *srcsas,
+=20
+ void tftp_input(struct sockaddr_storage *srcsas, struct mbuf *m)
+ {
+-    struct tftp_t *tp =3D mtod_check(m, offsetof(struct tftp_t, x.tp_bu=
f));
++    struct tftphdr *hdr =3D mtod_check(m, sizeof(struct tftphdr));
+=20
+-    if (tp =3D=3D NULL) {
++    if (hdr =3D=3D NULL) {
+         return;
+     }
+=20
+-    switch (ntohs(tp->tp_op)) {
++    switch (ntohs(hdr->tp_op)) {
+     case TFTP_RRQ:
+-        tftp_handle_rrq(m->slirp, srcsas, tp, m->m_len);
++        tftp_handle_rrq(m->slirp, srcsas,
++                        mtod(m, struct tftp_t *),
++                        m->m_len);
+         break;
+=20
+     case TFTP_ACK:
+-        tftp_handle_ack(m->slirp, srcsas, tp, m->m_len);
++        tftp_handle_ack(m->slirp, srcsas, hdr);
+         break;
+=20
+     case TFTP_ERROR:
+-        tftp_handle_error(m->slirp, srcsas, tp, m->m_len);
++        tftp_handle_error(m->slirp, srcsas, hdr);
+         break;
+     }
+ }
+diff --git a/slirp/src/tftp.h b/slirp/src/tftp.h
+index 6d75478e8..cafab03f2 100644
+--- a/slirp/src/tftp.h
++++ b/slirp/src/tftp.h
+@@ -20,9 +20,13 @@
+ #define TFTP_FILENAME_MAX 512
+ #define TFTP_BLOCKSIZE_MAX 1428
+=20
+-struct tftp_t {
++struct tftphdr {
+     struct udphdr udp;
+     uint16_t tp_op;
++} SLIRP_PACKED;
++
++struct tftp_t {
++    struct tftphdr hdr;
+     union {
+         struct {
+             uint16_t tp_block_nr;
+--=20
+2.31.1
+
--=20
2.33.0


