Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA37C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:41:18 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7060.1784547674939227523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jAHA1pOi;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6399; q=dns/txt;
  s=iport01; t=1784547675; x=1785757275;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=D/5iVQDGUCoQX0VI2nV3NBKqUIUIdylH6MBqqUOq9Yc=;
  b=jAHA1pOigEqgRpbNgFv04YUkmog18HLXbvGAhUGJ/eE5rWRKa8dx0Auy
   jkFh67g0Nk1Lk0j46BFGuVdWdMpe+dCUtR7E42vj/Zs6AhUGhqQ/BbTuK
   LS31DFht+UhS5Cyto6aUjGnjV8uN43y16rBz0xIhsYxu23T8BVzm0hFzL
   U4t7D0yd22p3rTwlSyPiteX30x4RMfyVDkgNWa9Ec3b0ScIReJv3I01Rp
   dmryq3et63m6HSihoC+XY14RMTRfSeTC0KhJjZVaLW4brH2fnXUdoMs1j
   8ZEXUp67XvsZp0rmtlT1SPaSYn3cwWQocrw8+yqoxSdw/XHfGa+H2tZoG
   Q==;
X-CSE-ConnectionGUID: ZE6FvHEYRemPIRn9dmDpAw==
X-CSE-MsgGUID: K4Ok26JYTemgiSOJKUCojQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgBfCF5q/5L/Ja1aglmCV3RfQkkDlCaCIQOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgRCIMCAYJ0AxG8a4F5M4EBg?=
 =?us-ascii?q?ygBPwJDUNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKBFYNpgQWBXAGIJgSCIoEMg?=
 =?us-ascii?q?Voej25IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6gQKEd?=
 =?us-ascii?q?CMfAzl/gS91SnctahIXgSaCEgKBOwIHAwsYDUgRLDcUGQQ+bgeNPCOBTWsHd?=
 =?us-ascii?q?BoBByRQNVlODgOTJgE/kXyhEgoog3WMIZU6GjOqbAuYfY4KllCEaYFoPIFHC?=
 =?us-ascii?q?wdwFYMiCUoZD44tCwuDYIF/gxTFQDw1AgkDLwEBBwIHDgMLgWiEYY0dAQE?=
IronPort-Data: A9a23:dydH+6g7JGeE3YltsVM1py25X161MREKZh0ujC45NGQN5FlHY01je
 htvWmmOPf+KYGOmc4xyPYXi8h5UucDQm4M1TAA+r38yQypjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPjb8E4HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUq17hZH0Fjx
 MYVLQgsVBbSi+ea2JukH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9Jo3aGZQJzhzBz
 o7A10elJRJAav6u9TeA/XOXoc3soAj8WrtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:mCog360aITId3jHQhSvC4wqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3ACrQV22voBEbfLQxNTbQVseDk6IsXXyPz0lf9EnW?=
 =?us-ascii?q?1DF5IcrvERVq84Ip7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A9T4tfQ582rW1k77wJe89wZBexoxLv4OtUh4voKk?=
 =?us-ascii?q?LvsaFDgtSGAq2izaOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="498494821"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:41:14 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id B76DC18000238
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:41:13 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D8477CC037D; Mon, 20 Jul 2026 17:11:11 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 2/2] gnutls: Fix CVE-2026-42009
Date: Mon, 20 Jul 2026 17:10:46 +0530
Message-Id: <20260720114046.2487998-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720114046.2487998-1-deeratho@cisco.com>
References: <20260720110548.2458865-1-deeratho@cisco.com>
 <20260720114046.2487998-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241372

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
- Changes from v1 to v2: Refresh the patch on top of the latest wrynose
branch merged commit.
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

