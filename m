Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36315CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:26:42 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88783.1781346400154131914
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aU6lfO5X;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6427; q=dns/txt;
  s=iport01; t=1781346400; x=1782556000;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LvYkzEAEpALYDbdy8s2XqZ23VzFdsuYTuwf5c9R0i/Q=;
  b=aU6lfO5X/x0I4MLo1OV1dnE8zJDP1FqkIO2atkjol/blfSCWJrnANEyy
   CEkE2nMzWJNRiVhCf1UIaSfWTztLuEK8RzclQJARH9crBvBHzFQbfMEtd
   DQKribzCFoulcqRZigIvCk/L9Un8Y1NmbhhuUnMQ+IJbJ8CD+yMXEmVcd
   OpyEMd6zkH+7tC/SWIHY/Cuoje1G2v8bizhNWl5GpHpIuHoQrG8n8f+q7
   wKH9bnuGgkJazXQPN+UTgFiUp+pxqx3i3eMt5p6+l+UBNZUHqQi546ggr
   i4oCfqo6dxTSebaokmbKY5W1YqodQ+ukegX/23I+Ji0xyMAm/2AmF79Kp
   Q==;
X-CSE-ConnectionGUID: 3AH3YtBHSIalgkCKFzFINQ==
X-CSE-MsgGUID: AWqX6jwbQfSyY1bCjDffbA==
X-IPAS-Result: =?us-ascii?q?A0BIAgCrLy1q/4v/Ja1aglmCV3RfQkkDlCeCIQOeG4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUGAo1DAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnMCARGzUIF5M4EBg?=
 =?us-ascii?q?ygBPwJDUNssAQsUAYE4hT+IH1sYAYR8JxsbgXKBFYNpgQWBXAGIJgSCIoEMg?=
 =?us-ascii?q?V0ejx1IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBSoEraoEEh?=
 =?us-ascii?q?Q0jHwM5f4FzgShnZxUwNYECER8KHAMLGA1IESw3FBsEPm4HjF0XD4FMawd0G?=
 =?us-ascii?q?gEHJIEFWU4OA5MmAT+Rf6EPCiiDdYwhlToaM6psC5h9jgqVNIEchGiBaDyBR?=
 =?us-ascii?q?wsHcBWDIglKGQ+OLQsLg2CBf4MUwXwkNQIJAy8BAQcCBw4DC4FohGGNHAEB?=
IronPort-Data: A9a23:6hVPYqxetq/Ktw0yVdl6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUFz
 2YfWm2HMv2CNmamKo0jaoqwp0JS6pGGyoAyGVRk+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqazlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBofHdYp5sxXOkBH8
 fMbAxMjfD6iodvjldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tPy1imT6eT1RgFmUvqEwpWPUyWSd1ZCxYYaNJI3QGJg9ckCwj
 13fzzr7HRsjOueO+GOP2XCAiOHFtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:3UH7P6yzqWG515HnyErlKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:0yjO9243YA8EWcHLIdssr2c0QfE5WF3m7X7ULEyTKkh7ZpyzcArF
X-Talos-MUID: 9a23:3r9+5wkbhSA+BuZZUExwdnpLC95YvaaxAnkDqoQ34sOvNwB+NT202WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,202,1774310400"; 
   d="scan'208";a="494069255"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jun 2026 10:26:39 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 2ED9A18000350
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:26:39 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id D1593CB6A93; Sat, 13 Jun 2026 03:26:38 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/2] gnutls: fix CVE-2026-42009
Date: Sat, 13 Jun 2026 03:25:22 -0700
Message-Id: <20260613102520.3703528-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260613102520.3703528-1-sudumbha@cisco.com>
References: <20260613102520.3703528-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238672

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
---
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     | 66 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     | 47 +++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
new file mode 100644
index 0000000000..03214bab0e
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
index 0000000000..b26491840b
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
index 6d43c58df2..d27d2cfa74 100644
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
-- 
2.35.6


