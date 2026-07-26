Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18310C54F4D
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7392.1785054624995953218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hp1XAQnp;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so13930165e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054623; x=1785659423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0KZWUW8CeyYBBfN8dtrvRBiaYH3zE9X3K1gIXRZXtHo=;
        b=Hp1XAQnpbZSvQSntgn0VI4Tyn8LRy3RIROCsASGrIE8x16F5ifOr0ZxZIw08NBcYjr
         rMgzCJneiQP/RB8FMSeZCtz4kRC4bvyesTtcaV5by+fHtNKV0vUWOZnBcuqAGUK/qnAs
         4JVN+F+Q2pYBVx8EY2CD8Ub0bUyAbP4dKc61s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054623; x=1785659423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0KZWUW8CeyYBBfN8dtrvRBiaYH3zE9X3K1gIXRZXtHo=;
        b=jF6QntyHKwh6CFqNYgW/fdx4Gahe7kOV1RiPOYeC6Zkhcy8kVNEpUEX4JtvD2d0ezl
         1RmiTiYLhI3JuJwgdhbnLBeDi00mOjUnOKBZ9F+g2KXeOTmQkj2aKZI+tr3u7w8b40Mn
         LanFp0sQFn2qFLg3dVsYAFa/SgABSW0/aUz5pOTRoCmQII3xKJ9S5SryY/77dKVBv6QZ
         DJUY90lPwU8TssrM5DdZY+wtySQcycOvm4GmpHmHnqp/qhEfNbDXXwifUGYkGQUn9hjg
         hMo8P88SQiPu/JbXjHls5mjRG8Z3Z1QaUcLv7WpuMdywK0I7J06ugLNpQnPdMOWeU/jV
         gTXw==
X-Gm-Message-State: AOJu0YwD2zjb5cVbm3raCk3iOMNZEyHgOR7l4dusxLwrjgggm343N/Ju
	OWFAxRDKnpaUb1OgQ74TtjEI6Q2cxDshwgY5j1/qZ7iBCmjiWlvpkyVHhyPz4+mpmzWCV2mHDdy
	X6UcnPgs=
X-Gm-Gg: AR+sD10K4bxpdYkPez+OuIWRf8JCXksX7pTaC+novno3tWASKIoW1viF9LUjhFntv7+
	XlYfQ85QxEKoeHxRFL3oTTSb5u1oUkBPH1yeMi4+8aG2MUdonRDZAOlqqsI1+S/qxuuDIXIYGvj
	6aKoUN1A/Kg77cIZeKGS0imh//qoXoAriroAjEOVQDncA3/3X4caZdJvqyilgX4WQPjJrGOwozu
	ldPFyQcu0npDssh4cxLrB3lmiuR9RvRRZjRzpUCZ04kkm5p9XLQTtAUTlZrQRR2V2LbtGNdStYI
	tghT0C8aiXF2b65tUl29sqdXTcahYI4K9P6DY+4wRfzxrCOehSFQhSk2+EyJm4SYEsThH/+ALI/
	H2KfFKTwmPN4Q7aKtw+B+Vy8MqC/4hkFPXLfYeI+YJss6I6ILIdfyd3pGkI19oZojq9sTobCSXj
	dcnnXmj8sb5p/XOgfKdkbbpVvn2bHyEmtyuW4kmqV22GhfEovks7LdVG+rlFnFryFgwtt1lVDZk
	L8lXw==
X-Received: by 2002:a05:600c:5253:b0:495:7016:b875 with SMTP id 5b1f17b1804b1-496b5c7ca38mr52350265e9.13.1785054623207;
        Sun, 26 Jul 2026 01:30:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/31] gnutls: fix CVE-2026-42009
Date: Sun, 26 Jul 2026 10:29:47 +0200
Message-ID: <8f3c2010a6bb4b2e7f4508a3ea4c2717294d75a3.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242005

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1] and [2], as referenced in [3],
to address a DTLS packet reordering flaw where duplicate sequence numbers
could lead to unstable ordering or undefined behavior.

[1] https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3b3ee66d
[2] https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f925b76f
[3] https://security-tracker.debian.org/tracker/CVE-2026-42009

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-42009

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     | 66 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     | 47 +++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
new file mode 100644
index 00000000000..03214bab0ea
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
@@ -0,0 +1,66 @@
+From e1f366666c12f431151a04ada9cf9a30d602751b Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Tue, 21 Apr 2026 16:52:48 +0200
+Subject: [PATCH] lib/buffers: ensure packets have differing sequence
+ numbers
+
+There should normally be no packets with same sequence number and
+differing handshake type, unless an adversary crafts them.
+Discarding them allows to get rid of packets
+with duplicate sequence ID in the buffer,
+relieving us from the question of how to sort them later.
+
+CVE: CVE-2026-42009
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3b3ee66d]
+
+Backport Changes:
+- Adjusted the upstream hunk to match the GnuTLS 3.8.4 code layout.
+- The upstream commit uses the local recv_buf alias introduced later
+  in v3.8.13 by commit;
+  https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0.
+- GnuTLS 3.8.4 does not have that local recv_buf alias in
+  merge_handshake_packet(), so the backport replaces recv_buf[i] with the
+  existing session->internals.handshake_recv_buffer[i] access pattern.
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1848
+Fixes: CVE-2026-42009
+Fixes: GNUTLS-SA-2026-04-29-2
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit f01e21441e29052a6f0963840794c41d3b3ee66d)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ lib/buffers.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b054..e7f08b5625 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -968,8 +968,20 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 	int ret;
+ 
+ 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
+-		if (session->internals.handshake_recv_buffer[i].htype ==
+-		    hsk->htype) {
++		if (session->internals.handshake_recv_buffer[i].sequence == hsk->sequence) {
++			if (session->internals.handshake_recv_buffer[i].htype != hsk->htype) {
++				_gnutls_audit_log(
++					session,
++					"Discarded unexpected handshake packet "
++					"with duplicate sequence %d, but "
++					"mismatched type %s (previously %s)\n",
++					hsk->sequence,
++					_gnutls_handshake2str(hsk->htype),
++					_gnutls_handshake2str(
++						session->internals.handshake_recv_buffer[i].htype));
++				_gnutls_handshake_buffer_clear(hsk);
++				return 0;
++			}
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
new file mode 100644
index 00000000000..b26491840b5
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
@@ -0,0 +1,47 @@
+From 23fdcec4c6b5669296295ad3a9f87f6467eeb0f3 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <joshua@joshua.hu>
+Date: Tue, 21 Apr 2026 18:11:39 +0200
+Subject: [PATCH] buffers: fix handshake_compare when sequence numbers
+ match
+
+The comparator function used for ordering DTLS packets
+by sequence numbers did not follow qsort comparator contracts
+in case of packets with duplicate sequence numbers,
+which could lead to unstable ordering or undefined behaviour.
+Returning 0 in such cases makes the sorting stable.
+
+CVE: CVE-2026-42009
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f925b76f]
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1848
+Fixes: CVE-2026-42009
+Fixes: GNUTLS-SA-2026-04-29-2
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Joshua Rogers <joshua@joshua.hu>
+(cherry picked from commit f341441fad91142897d83b44a175ffc8f925b76f)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ lib/buffers.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index e7f08b5625..1ac27e4e96 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -844,11 +844,7 @@ static int handshake_compare(const void *_e1, const void *_e2)
+ {
+ 	const handshake_buffer_st *e1 = _e1;
+ 	const handshake_buffer_st *e2 = _e2;
+-
+-	if (e1->sequence <= e2->sequence)
+-		return 1;
+-	else
+-		return -1;
++	return (e1->sequence < e2->sequence) - (e1->sequence > e2->sequence);
+ }
+ 
+ #define SSL2_HEADERS 1
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 6d43c58df27..d27d2cfa748 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -43,6 +43,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-7.patch \
            file://CVE-2025-14831-8.patch \
            file://CVE-2025-14831-9.patch \
+           file://CVE-2026-42009_p1.patch \
+           file://CVE-2026-42009_p2.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"

