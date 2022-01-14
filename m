Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43D4C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:03:29 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.10828.1642183408742115886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20EI3QtN024194
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:03:27 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20EI3QpV010183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:03:26 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 14 Jan 2022 10:03:26 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 10:03:25 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 14 Jan 2022 10:03:25 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 1/8] qemu: fix CVE-2021-3592
Date: Fri, 14 Jan 2022 13:03:13 -0500
Message-ID: <20220114180320.3526-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 20EI3QtN024194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160574

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3592_1.patch           |  58 ++++++
 .../qemu/qemu/CVE-2021-3592_2.patch           | 165 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-3592_3.patch           |  40 +++++
 4 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3592_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3592_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3592_3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 463339e42b..6c00bf274b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -70,6 +70,9 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-3607.patch \
            file://CVE-2021-3608.patch \
            file://CVE-2021-3682.patch \
+           file://CVE-2021-3592_1.patch \
+           file://CVE-2021-3592_2.patch \
+           file://CVE-2021-3592_3.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3592_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3592_1.patch
new file mode 100644
index 0000000000..e374959594
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3592_1.patch
@@ -0,0 +1,58 @@
+From 0123c625aed2ed0679fa8c084104699d918c1da6 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Fri, 4 Jun 2021 15:58:25 +0400
+Subject: [PATCH 01/12] Add mtod_check()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Recent security issues demonstrate the lack of safety care when casting
+a mbuf to a particular structure type. At least, it should check that
+the buffer is large enough. The following patches will make use of this
+function.
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [93e645e72a056ec0b2c16e0299fc5c6b94e4ca17]
+CVE: CVE-2021-3592
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ slirp/src/mbuf.c | 11 +++++++++++
+ slirp/src/mbuf.h |  1 +
+ 2 files changed, 12 insertions(+)
+
+diff --git a/slirp/src/mbuf.c b/slirp/src/mbuf.c
+index 54ec721eb..cb2e97108 100644
+--- a/slirp/src/mbuf.c
++++ b/slirp/src/mbuf.c
+@@ -222,3 +222,14 @@ struct mbuf *dtom(Slirp *slirp, void *dat)
+=20
+     return (struct mbuf *)0;
+ }
++
++void *mtod_check(struct mbuf *m, size_t len)
++{
++    if (m->m_len >=3D len) {
++        return m->m_data;
++    }
++
++    DEBUG_ERROR("mtod failed");
++
++    return NULL;
++}
+diff --git a/slirp/src/mbuf.h b/slirp/src/mbuf.h
+index 546e7852c..2015e3232 100644
+--- a/slirp/src/mbuf.h
++++ b/slirp/src/mbuf.h
+@@ -118,6 +118,7 @@ void m_inc(struct mbuf *, int);
+ void m_adj(struct mbuf *, int);
+ int m_copy(struct mbuf *, struct mbuf *, int, int);
+ struct mbuf *dtom(Slirp *, void *);
++void *mtod_check(struct mbuf *, size_t len);
+=20
+ static inline void ifs_init(struct mbuf *ifm)
+ {
+--=20
+2.31.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3592_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3592_2.patch
new file mode 100644
index 0000000000..799a95417e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3592_2.patch
@@ -0,0 +1,165 @@
+From fc2a4797f55016e78f2cde4806b05368fa5b7a97 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Fri, 4 Jun 2021 19:25:28 +0400
+Subject: [PATCH 02/12] bootp: limit vendor-specific area to input packet
+ memory buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+sizeof(bootp_t) currently holds DHCP_OPT_LEN. Remove this optional field
+from the structure, to help with the following patch checking for
+minimal header size. Modify the bootp_reply() function to take the
+buffer boundaries and avoiding potential buffer overflow.
+
+Related to CVE-2021-3592.
+
+https://gitlab.freedesktop.org/slirp/libslirp/-/issues/44
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [f13cad45b25d92760bb0ad67bec0300a4d7d5275]
+CVE: CVE-2021-3592
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ slirp/src/bootp.c | 26 +++++++++++++++-----------
+ slirp/src/bootp.h |  2 +-
+ slirp/src/mbuf.c  |  5 +++++
+ slirp/src/mbuf.h  |  1 +
+ 4 files changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/slirp/src/bootp.c b/slirp/src/bootp.c
+index 46e96810a..e0db8d196 100644
+--- a/slirp/src/bootp.c
++++ b/slirp/src/bootp.c
+@@ -92,21 +92,22 @@ found:
+     return bc;
+ }
+=20
+-static void dhcp_decode(const struct bootp_t *bp, int *pmsg_type,
++static void dhcp_decode(const struct bootp_t *bp,
++                        const uint8_t *bp_end,
++                        int *pmsg_type,
+                         struct in_addr *preq_addr)
+ {
+-    const uint8_t *p, *p_end;
++    const uint8_t *p;
+     int len, tag;
+=20
+     *pmsg_type =3D 0;
+     preq_addr->s_addr =3D htonl(0L);
+=20
+     p =3D bp->bp_vend;
+-    p_end =3D p + DHCP_OPT_LEN;
+     if (memcmp(p, rfc1533_cookie, 4) !=3D 0)
+         return;
+     p +=3D 4;
+-    while (p < p_end) {
++    while (p < bp_end) {
+         tag =3D p[0];
+         if (tag =3D=3D RFC1533_PAD) {
+             p++;
+@@ -114,10 +115,10 @@ static void dhcp_decode(const struct bootp_t *bp, =
int *pmsg_type,
+             break;
+         } else {
+             p++;
+-            if (p >=3D p_end)
++            if (p >=3D bp_end)
+                 break;
+             len =3D *p++;
+-            if (p + len > p_end) {
++            if (p + len > bp_end) {
+                 break;
+             }
+             DPRINTF("dhcp: tag=3D%d len=3D%d\n", tag, len);
+@@ -144,7 +145,9 @@ static void dhcp_decode(const struct bootp_t *bp, in=
t *pmsg_type,
+     }
+ }
+=20
+-static void bootp_reply(Slirp *slirp, const struct bootp_t *bp)
++static void bootp_reply(Slirp *slirp,
++                        const struct bootp_t *bp,
++                        const uint8_t *bp_end)
+ {
+     BOOTPClient *bc =3D NULL;
+     struct mbuf *m;
+@@ -157,7 +160,7 @@ static void bootp_reply(Slirp *slirp, const struct b=
ootp_t *bp)
+     uint8_t client_ethaddr[ETH_ALEN];
+=20
+     /* extract exact DHCP msg type */
+-    dhcp_decode(bp, &dhcp_msg_type, &preq_addr);
++    dhcp_decode(bp, bp_end, &dhcp_msg_type, &preq_addr);
+     DPRINTF("bootp packet op=3D%d msgtype=3D%d", bp->bp_op, dhcp_msg_ty=
pe);
+     if (preq_addr.s_addr !=3D htonl(0L))
+         DPRINTF(" req_addr=3D%08" PRIx32 "\n", ntohl(preq_addr.s_addr))=
;
+@@ -179,9 +182,10 @@ static void bootp_reply(Slirp *slirp, const struct =
bootp_t *bp)
+         return;
+     }
+     m->m_data +=3D IF_MAXLINKHDR;
++    m_inc(m, sizeof(struct bootp_t) + DHCP_OPT_LEN);
+     rbp =3D (struct bootp_t *)m->m_data;
+     m->m_data +=3D sizeof(struct udpiphdr);
+-    memset(rbp, 0, sizeof(struct bootp_t));
++    memset(rbp, 0, sizeof(struct bootp_t) + DHCP_OPT_LEN);
+=20
+     if (dhcp_msg_type =3D=3D DHCPDISCOVER) {
+         if (preq_addr.s_addr !=3D htonl(0L)) {
+@@ -235,7 +239,7 @@ static void bootp_reply(Slirp *slirp, const struct b=
ootp_t *bp)
+     rbp->bp_siaddr =3D saddr.sin_addr; /* Server IP address */
+=20
+     q =3D rbp->bp_vend;
+-    end =3D (uint8_t *)&rbp[1];
++    end =3D rbp->bp_vend + DHCP_OPT_LEN;
+     memcpy(q, rfc1533_cookie, 4);
+     q +=3D 4;
+=20
+@@ -364,6 +368,6 @@ void bootp_input(struct mbuf *m)
+     struct bootp_t *bp =3D mtod(m, struct bootp_t *);
+=20
+     if (bp->bp_op =3D=3D BOOTP_REQUEST) {
+-        bootp_reply(m->slirp, bp);
++        bootp_reply(m->slirp, bp, m_end(m));
+     }
+ }
+diff --git a/slirp/src/bootp.h b/slirp/src/bootp.h
+index a57fa51bc..31ce5fd33 100644
+--- a/slirp/src/bootp.h
++++ b/slirp/src/bootp.h
+@@ -114,7 +114,7 @@ struct bootp_t {
+     uint8_t bp_hwaddr[16];
+     uint8_t bp_sname[64];
+     char bp_file[128];
+-    uint8_t bp_vend[DHCP_OPT_LEN];
++    uint8_t bp_vend[];
+ };
+=20
+ typedef struct {
+diff --git a/slirp/src/mbuf.c b/slirp/src/mbuf.c
+index cb2e97108..0c1a530f1 100644
+--- a/slirp/src/mbuf.c
++++ b/slirp/src/mbuf.c
+@@ -233,3 +233,8 @@ void *mtod_check(struct mbuf *m, size_t len)
+=20
+     return NULL;
+ }
++
++void *m_end(struct mbuf *m)
++{
++    return m->m_data + m->m_len;
++}
+diff --git a/slirp/src/mbuf.h b/slirp/src/mbuf.h
+index 2015e3232..a9752a36e 100644
+--- a/slirp/src/mbuf.h
++++ b/slirp/src/mbuf.h
+@@ -119,6 +119,7 @@ void m_adj(struct mbuf *, int);
+ int m_copy(struct mbuf *, struct mbuf *, int, int);
+ struct mbuf *dtom(Slirp *, void *);
+ void *mtod_check(struct mbuf *, size_t len);
++void *m_end(struct mbuf *);
+=20
+ static inline void ifs_init(struct mbuf *ifm)
+ {
+--=20
+2.31.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3592_3.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3592_3.patch
new file mode 100644
index 0000000000..f07a0faeb7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3592_3.patch
@@ -0,0 +1,40 @@
+From d175694c607273b6c8f09717de9c455891d6765d Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Fri, 4 Jun 2021 16:15:14 +0400
+Subject: [PATCH 03/12] bootp: check bootp_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3592
+Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/44
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [2eca0838eee1da96204545e22cdaed860d9d7c6c]
+CVE: CVE-2021-3592
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ slirp/src/bootp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/slirp/src/bootp.c b/slirp/src/bootp.c
+index e0db8d196..cafa1eb1f 100644
+--- a/slirp/src/bootp.c
++++ b/slirp/src/bootp.c
+@@ -365,9 +365,9 @@ static void bootp_reply(Slirp *slirp,
+=20
+ void bootp_input(struct mbuf *m)
+ {
+-    struct bootp_t *bp =3D mtod(m, struct bootp_t *);
++    struct bootp_t *bp =3D mtod_check(m, sizeof(struct bootp_t));
+=20
+-    if (bp->bp_op =3D=3D BOOTP_REQUEST) {
++    if (bp && bp->bp_op =3D=3D BOOTP_REQUEST) {
+         bootp_reply(m->slirp, bp, m_end(m));
+     }
+ }
+--=20
+2.31.1
+
--=20
2.33.0


