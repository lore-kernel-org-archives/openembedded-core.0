Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B64C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 09:54:48 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9276.1783677281923566769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 02:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=au5c1tvz;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6427; q=dns/txt;
  s=iport01; t=1783677281; x=1784886881;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SsCLkrK0Jm8ndpwH2rklSqSjnifGxwsk6qGesYPpCGY=;
  b=au5c1tvzRmjryXZ/Ubc5896f5avGFPts2QwAW7EMX4yUnCKSSU5EQGb5
   wkVFPhE9kBI9hO4tSoeQXXp/5YniSWvIAPSOilXXN+u7gNs4Q93WKTZYq
   j2zsK7SdV5oaHNfGvy28uM3CZHdQbLkiRwRCzs/8Nayg02/QQaaFXvH7o
   0nZ7lJ4+n0Qk6Y9IHLSxDqVAr6lSHdCSmh++0oQcuCAa/R3ZXufxkAT2y
   vMUIHJhOO3p+47f8D4jIImW9dZSpHUu2pYyR1uyZsqME8YDOUetcRyboU
   nC3juCpDHWYdmO236R0Qra9jKcUlC35DUwdksAoXU/4pJAcWKn49zt1s/
   Q==;
X-CSE-ConnectionGUID: CELMFVcOSASRjIljQoUH5Q==
X-CSE-MsgGUID: uqDeWYsXRCaIBjNZyReBtQ==
X-IPAS-Result: =?us-ascii?q?A0BDAgDFwFBq/4r/Ja1aglmCV3RfQkkDlCaCIZ4egX4PA?=
 =?us-ascii?q?QEBD0QNBAEBklQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgEtCwEYAVkDAQJaIyGDAgGCcwIBEbpagXkzgQGDKAE/AkNQ2y4BC?=
 =?us-ascii?q?xQBgTiFP4gfWxgBhHwnGxuBcoEVg2mBBYFcAYgmBIIigQyBWh6Pd0iBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgVmBAoR5Ix8DOX+BMHVKe?=
 =?us-ascii?q?S2BARIeCoFSghYCVQMLGA1IESw3FBsEPm4HjUUXD4FMawd0GgEHJIEFWU4OA?=
 =?us-ascii?q?5MmAT+Rf6EPCiiDdYwhlToaM6psC5h9jgqVNIEchGmBaDyBRwsHcBWDIglKG?=
 =?us-ascii?q?Q+OLQsLg2CBf4MUyUckNQIJAy8BAQcCBw4DC4FohGGNHQEB?=
IronPort-Data: A9a23:G+g306Cp8b4RARVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDwh1DYGn
 GMeWWqPaKzbNmTwfd53OYq39hsG7ZbSztRrOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD9i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE6NhKKW8INqoj091NA0BK9
 8UfFRBQV0XW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FEpj+iyb4WJIbRmQ+1Ih2qVm
 VPdz17SCzAwNvqt2ACI2G6V07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:oWRF16xzdq37MCzrQUNPKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTnjAsi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:O2FbPW3f5zsh/G7nLfwkqbxfMe0BV1Pjx1DrCnSCC0dtSoSSdH/NwfYx
X-Talos-MUID: 9a23:CCZdeAZJW7PT3uBTqibAiQ5TL/dSyK2PIkIro4Q8tuOYDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507877743"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 09:54:41 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id D04E218000295
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:54:40 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 6F4D7CAF087; Fri, 10 Jul 2026 02:54:40 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/2] gnutls: Fix CVE-2026-42009
Date: Fri, 10 Jul 2026 02:54:22 -0700
Message-ID: <20260710095422.3042774-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240626

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
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     | 67 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     | 48 +++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
new file mode 100644
index 0000000000..066322cd75
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
@@ -0,0 +1,67 @@
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
+- Adjusted the upstream hunk to match the GnuTLS 3.8.12 code layout.
+- The upstream commit uses the local recv_buf alias introduced later
+  in v3.8.13 by commit;
+  https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0.
+- GnuTLS 3.8.12 does not have that local recv_buf alias in
+  merge_handshake_packet(), so the backport replaces recv_buf[i] with the
+  existing session->internals.handshake_recv_buffer[i] access pattern.
+
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
+2.51.0
+
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
+2.51.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index c6cbc9f46c..e6afb4870e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -26,6 +26,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://c99.patch \
            file://CVE-2026-3832_p1.patch \
            file://CVE-2026-3832_p2.patch \
+           file://CVE-2026-42009_p1.patch \
+           file://CVE-2026-42009_p2.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
-- 
2.51.0


