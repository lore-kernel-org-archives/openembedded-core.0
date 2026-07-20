Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4966EC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:06:18 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6604.1784545571485957990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CjY8Tf3b;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6303; q=dns/txt;
  s=iport01; t=1784545571; x=1785755171;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FDoa4XmQf4+Dg0SYOFPB+DuZLCFMSAakKGILyjS22Wc=;
  b=CjY8Tf3bn70Y0Z3CfwEkVIm1XcFjC4doeCQ0od97Xf2QFLup5JkzHy4x
   Z3vR+Q4QmY1AYT3+i+8v2MaaYo7tJTLkUN/1RnZE9meB1p9B3MTPNZwUR
   QAxoRj7qkqk045l56xiDsIMAvUtmbf5p6f6YupeY1Ov8jAPy4CuiO89pW
   P9emix4tezPbnScHZyt29Udfti37daJ85oR5iy/SsTLBtiiGLFzzJ9OOK
   lGX2vUbfUgZm+jBAIoZjUD9AHtr+xSQqf1/XRSDXvnC5qEHwwraygr4Gh
   SBJN8GxjNLTxelcCJVaZ2N5K9Jet0Ui1+tzNPMacv9tnUCS6pxcVZ3yIA
   Q==;
X-CSE-ConnectionGUID: bGO8ZFrTRTW3Kgdit/9yuQ==
X-CSE-MsgGUID: HvGQ2g/9Rte/2XGK2NuR2Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgA7AF5q/4v/Ja1aglmCV3RfQkkDlCaCIQOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgRCIMCAYJ0AxG8S4F5M4EBg?=
 =?us-ascii?q?ygBPwJDUNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKBFYNpgQWBXAGIJgSCIoEMg?=
 =?us-ascii?q?Voej25IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6gQKEd?=
 =?us-ascii?q?CMfAzl/gS91SnctahIXgSaCEgKBOwIHAwsYDUgRLDcUGQQ+bgeNPCOBTWsHd?=
 =?us-ascii?q?BoBByRQNVlODgOTJgE/kXyhEgoog3WMIZU6GjOqbAuYfY4KllCEaYFoPIFHC?=
 =?us-ascii?q?wdwFYMiCUoZD44tCwuDYIF/gxTGbjw1AgkDLwEBBwIHDgMLgWiEYY0dAQE?=
IronPort-Data: A9a23:51jPSKsn1IQA6MwDbhmWnPvtx+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW+FafqJNzb0KtgkPIix9EwE6sPWm9NiSAFvpXtgEX5HgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z8Esz1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8MlQUVNg7
 8AiFA9WTR+Phv7xkaOmc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHTH5kIxx3H/
 Aoq+UzZHD4jbtPYmACZ/zX2tsDsxwXmYtgrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:z4rh3awc1f47Py9oeJqwKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:vMnssWBtfufsIEL6EyNI0x4mNNoZSEHil1TfL06kTjd4VYTAHA==
X-Talos-MUID: 9a23:ON9KuASgB/FTDz0pRXTMmh5bbsgvsp6yBQdXobol4e+ZD3ZJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="512451372"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:06:10 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id E7DF218000340
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:06:09 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 150AFCC037D; Mon, 20 Jul 2026 16:36:08 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/2] gnutls: Fix CVE-2026-42009
Date: Mon, 20 Jul 2026 16:35:48 +0530
Message-Id: <20260720110548.2458865-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720110548.2458865-1-deeratho@cisco.com>
References: <20260720110548.2458865-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241360

From: Deepak Rathore <deeratho@cisco.com>

This patch applies upstream fixes [1] and [2], as referenced in [3],
to address a DTLS packet reordering flaw where duplicate sequence
numbers could lead to unstable ordering or undefined behavior.

Rebase CVE-2026-42009_p1.patch on top of the Wrynose
CVE-2026-33846 backport stack, which already includes the recv_buf
helper from upstream commit 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0.

[1] https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3b3ee66d
[2] https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f925b76f
[3] https://security-tracker.debian.org/tracker/CVE-2026-42009

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-42009

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     | 62 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     | 48 ++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
new file mode 100644
index 0000000000..f1ee618b48
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
@@ -0,0 +1,62 @@
+From d1191b910e63149a10647a089995d3cd85e16400 Mon Sep 17 00:00:00 2001
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
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1848
+Fixes: CVE-2026-42009
+Fixes: GNUTLS-SA-2026-04-29-2
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-42009
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3b3ee66d]
+
+Backport Changes:
+- Rebased on top of the Wrynose CVE-2026-33846 backport stack, which
+  already includes the recv_buf helper and sequence-number matching
+  prerequisite patches.
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit f01e21441e29052a6f0963840794c41d3b3ee66d)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/buffers.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 62f140ed3..e7f08b5625 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -971,8 +971,20 @@ static int merge_handshake_packet(gnutls_session_t session,
+ 		session->internals.handshake_recv_buffer;
+ 
+ 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
+-		if (recv_buf[i].htype == hsk->htype &&
+-		    recv_buf[i].sequence == hsk->sequence) {
++		if (recv_buf[i].sequence == hsk->sequence) {
++			if (recv_buf[i].htype != hsk->htype) {
++				_gnutls_audit_log(
++					session,
++					"Discarded unexpected handshake packet "
++					"with duplicate sequence %d, but "
++					"mismatched type %s (previously %s)\n",
++					hsk->sequence,
++					_gnutls_handshake2str(hsk->htype),
++					_gnutls_handshake2str(
++						recv_buf[i].htype));
++				_gnutls_handshake_buffer_clear(hsk);
++				return 0;
++			}
+ 			exists = 1;
+ 			pos = i;
+ 			break;
+-- 
+2.51.0
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
new file mode 100644
index 0000000000..6524cb47b4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
@@ -0,0 +1,48 @@
+From 5374a6d584b8598511f7880b4e64ee52ee1f0cc5 Mon Sep 17 00:00:00 2001
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
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1848
+Fixes: CVE-2026-42009
+Fixes: GNUTLS-SA-2026-04-29-2
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+CVE: CVE-2026-42009
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f925b76f]
+
+Signed-off-by: Joshua Rogers <joshua@joshua.hu>
+(cherry picked from commit f341441fad91142897d83b44a175ffc8f925b76f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
+2.51.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 03eee5c50e..3085a62310 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -34,6 +34,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0008-tests-mini-dtls-framents-link-to-gnulib.patch \
            file://CVE-2026-3832_p1.patch \
            file://CVE-2026-3832_p2.patch \
+           file://CVE-2026-42009_p1.patch \
+           file://CVE-2026-42009_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.35.6

