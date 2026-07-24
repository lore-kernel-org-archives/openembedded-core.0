Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C89C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 04:40:42 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12754.1784868029708167073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 21:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KC7NOKd9;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9257; q=dns/txt;
  s=iport01; t=1784868029; x=1786077629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lnbRsU5wlTDaRzvRQtBtmTDv5flHDYSEnBWAeNMZV8s=;
  b=KC7NOKd90tANzpvcdt0cNPKq1bAfeUYpmvFtBW1JHkFr7QyZGCeZ2gA2
   Pu9RwUmpLNKJNXXPb0ZKL5IzyEdodKFdTguhISS3UI5Oj/kucJKR2u34M
   q+TGjBV4/WPZ+uWiJXpMNST/zdaPKQ5RKXlpdAoUV2kMNxDgWhG1gQ1wY
   Tt8ZYiG7H/aL+7lclKJex5occ/g/mm1jFvuk6+ZtRperC4ipWBf4KRQWZ
   AhRBYU4RRFUoZ0XhBBqEip2lYgvjPPjMVZePeWjP/N9oXdA2y1rNhq/s0
   2MeudypWu4ymDgUZp8pxlUvCusVm8rAJyy4TgwBiKO9wPRymJTY26EtX8
   w==;
X-CSE-ConnectionGUID: ENKfeR6gTHyLjCJtKTTmcw==
X-CSE-MsgGUID: l+/OHM5pSByHxkq3ZunMeQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgAQ7GJq/5T/Ja1aHgEBCxIMggULgld0X0JJA5ZHA?=
 =?us-ascii?q?54bgX4PAQEBD0QNBAEBhQUCjV8CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLysjCBmDAgGCdAIBEcEjG?=
 =?us-ascii?q?jeCLIEBgygBgVTbLgELFAEFgTOFP4ggXBgBhHwnGxuBcoEUAYE7gi6BBYFcA?=
 =?us-ascii?q?gOCA4YfBIINFXoSgVoehxSJIkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYEdgSx5hFcjHwM5f4EvdUp3LWkBEheBJoNJAoE3AwsYDUgRLDcUG?=
 =?us-ascii?q?QQ+bgeNayOCIBkHgQ4BKxcYUAZIG0QPkygBBwySK6EPCiiDdYwhj0KFeBozq?=
 =?us-ascii?q?mwLmH2OCpZQhGmBaDyBWXAVgyIJShkPjioDCwuDYIUTxSckNQIJAy8BAQcCB?=
 =?us-ascii?q?w4DC4FohGGLIS2BTwEB?=
IronPort-Data: A9a23:SfF5x602XMFKBVazUPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzJSn
 TFNWzqDM/yDazDwLt53aIuwoB9Uv5DUy4UyTgA63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EubjpIg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGIWcVM4AipOlLIXBq9
 9c6NBMxUhWImLfjqF67YrEEasULNsLnOsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiQC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+OW0a4WLJ4XRG625mG6c5
 SXh30GkGiowJfyPyiPewG+qo+L2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:ee3F7qrEflTUsOSoQDrtUYEaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:+7AUM25/KEjbVgke5tss2Wg3FM0fLHLh7Gb0IWSaFUVVdLieVgrF
X-Talos-MUID: 9a23:cZz5cwWxqgxO55/q/DuvwxZCEZpw2I6/KFAOiM40ps+hOBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,181,1779148800"; 
   d="scan'208";a="513765136"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 04:40:28 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 7F11C1800016D;
	Fri, 24 Jul 2026 04:40:28 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 295AFCBF202; Thu, 23 Jul 2026 21:40:28 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH v3 3/6] rsync: Fix CVE-2026-43618
Date: Thu, 23 Jul 2026 21:39:11 -0700
Message-Id: <20260724043914.4061351-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260724043914.4061351-1-asparmar@cisco.com>
References: <20260724043914.4061351-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 04:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241881

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43618. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c44c90e9460c666c965446a8c0957f0b9fa4c66a
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-g37v-g3gj-pmwq

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
Changes in v2:
- Clarified the Wrynose-specific Backport Changes metadata to describe the
  exact compressed-token decoder context differences. No functional code
  changes.

 .../rsync/files/CVE-2026-43618.patch          | 248 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43618.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
new file mode 100644
index 0000000000..d4b13d9181
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
@@ -0,0 +1,248 @@
+From a93cfc86b6daa2dfd754bcbe261cf01afef056f4 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 29 Apr 2026 11:10:59 +1000
+Subject: [PATCH] token: harden compressed-token decoding against integer
+ overflow
+
+The receiver's three compressed-token decoders --
+recv_deflated_token (zlib), recv_zstd_token, and
+recv_compressed_token (lz4) -- accumulated rx_token (a 32-bit
+signed counter) without overflow checking. A malicious sender
+could craft a compressed-token stream that walked rx_token past
+INT32_MAX, with careful manipulation leaking process memory
+contents to the wire (environment variables, passwords, heap
+pointers, library pointers -- significantly weakening ASLR
+and facilitating further exploitation).
+
+Cap rx_token at MAX_TOKEN_INDEX = 0x7ffffffe. Fold the
+bookkeeping into recv_compressed_token_num() and
+recv_compressed_token_run() shared by all three decoders. Reject
+negative or out-of-range token values explicitly. Also cap the
+simple_recv_token literal-block length at the source: any
+wire-supplied length > CHUNK_SIZE is ill-formed (the matching
+simple_send_token never writes a chunk larger than CHUNK_SIZE),
+so reject before looping on attacker-controlled bytes.
+
+Reach: an authenticated daemon connection with compression
+enabled (the default for protocols >= 30 when both peers
+advertise it). Disabling compression on the daemon
+("refuse options = compress" in rsyncd.conf) is the available
+workaround.
+
+Reporter: Omar Elsayed (seks99x).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43618
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/c44c90e9460c666c965446a8c0957f0b9fa4c66a]
+
+Backport Changes:
+- Resolved token.c context differences against Wrynose's 3.4.1
+  source, which lacks all three negative-token validation blocks
+  present in the upstream patch context.
+- The Wrynose hunk replaces the older per-decoder token bookkeeping
+  with the upstream recv_compressed_token_num() and
+  recv_compressed_token_run() helper calls at the matching zlib,
+  zstd, and lz4 decoder sites.
+
+(cherry picked from commit c44c90e9460c666c965446a8c0957f0b9fa4c66a)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ receiver.c |  11 +++++-
+ token.c    | 102 ++++++++++++++++++++++++++++++-----------------------
+ 2 files changed, 67 insertions(+), 46 deletions(-)
+
+diff --git a/receiver.c b/receiver.c
+index 8cf8366b..a487ad5a 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -318,7 +318,12 @@ static int receive_data(int f_in, char *fname_r, int fd_r, OFF_T size_r,
+ 		}
+ 	}
+ 
+-	while ((i = recv_token(f_in, &data)) != 0) {
++	while (1) {
++		data = NULL;
++		i = recv_token(f_in, &data);
++		if (i == 0)
++			break;
++
+ 		if (INFO_GTE(PROGRESS, 1))
+ 			show_progress(offset, total_size);
+ 
+@@ -326,6 +331,10 @@ static int receive_data(int f_in, char *fname_r, int fd_r, OFF_T size_r,
+ 			maybe_send_keepalive(time(NULL), MSK_ALLOW_FLUSH | MSK_ACTIVE_RECEIVER);
+ 
+ 		if (i > 0) {
++			if (!data) {
++				rprintf(FERROR, "Invalid literal token with no data [%s]\n", who_am_i());
++				exit_cleanup(RERR_PROTOCOL);
++			}
+ 			if (DEBUG_GTE(DELTASUM, 3)) {
+ 				rprintf(FINFO,"data recv %d at %s\n",
+ 					i, big_num(offset));
+diff --git a/token.c b/token.c
+index c108b3af..02dabd8d 100644
+--- a/token.c
++++ b/token.c
+@@ -291,6 +291,14 @@ static int32 simple_recv_token(int f, char **data)
+ 		int32 i = read_int(f);
+ 		if (i <= 0)
+ 			return i;
++		/* simple_send_token caps each literal chunk at CHUNK_SIZE;
++		 * reject anything larger so a hostile peer cannot drive the
++		 * read_buf below past our static CHUNK_SIZE buffer. */
++		if (i > CHUNK_SIZE) {
++			rprintf(FERROR, "invalid uncompressed token length %ld [%s]\n",
++				(long)i, who_am_i());
++			exit_cleanup(RERR_PROTOCOL);
++		}
+ 		residue = i;
+ 	}
+ 
+@@ -493,9 +501,52 @@ static char *cbuf;
+ static char *dbuf;
+ 
+ /* for decoding runs of tokens */
++#define MAX_TOKEN_INDEX ((int32)0x7ffffffe)
++
+ static int32 rx_token;
+ static int32 rx_run;
+ 
++static NORETURN void invalid_compressed_token(void)
++{
++	rprintf(FERROR, "invalid token number in compressed stream\n");
++	exit_cleanup(RERR_PROTOCOL);
++}
++
++static int32 recv_compressed_token_num(int f, int32 flag)
++{
++	if (flag & TOKEN_REL) {
++		int32 incr = flag & 0x3f;
++		if (rx_token > MAX_TOKEN_INDEX - incr)
++			invalid_compressed_token();
++		rx_token += incr;
++		flag >>= 6;
++	} else {
++		rx_token = read_int(f);
++		if (rx_token < 0 || rx_token > MAX_TOKEN_INDEX)
++			invalid_compressed_token();
++	}
++
++	if (flag & 1) {
++		rx_run = read_byte(f);
++		rx_run += read_byte(f) << 8;
++		if (rx_run <= 0 || rx_token > MAX_TOKEN_INDEX - rx_run)
++			invalid_compressed_token();
++		recv_state = r_running;
++	}
++
++	return -1 - rx_token;
++}
++
++static int32 recv_compressed_token_run(void)
++{
++	if (rx_run <= 0 || rx_token >= MAX_TOKEN_INDEX)
++		invalid_compressed_token();
++	++rx_token;
++	if (--rx_run == 0)
++		recv_state = r_idle;
++	return -1 - rx_token;
++}
++
+ /* Receive a deflated token and inflate it */
+ static int32 recv_deflated_token(int f, char **data)
+ {
+@@ -586,17 +637,7 @@ static int32 recv_deflated_token(int f, char **data)
+ 			}
+ 
+ 			/* here we have a token of some kind */
+-			if (flag & TOKEN_REL) {
+-				rx_token += flag & 0x3f;
+-				flag >>= 6;
+-			} else
+-				rx_token = read_int(f);
+-			if (flag & 1) {
+-				rx_run = read_byte(f);
+-				rx_run += read_byte(f) << 8;
+-				recv_state = r_running;
+-			}
+-			return -1 - rx_token;
++			return recv_compressed_token_num(f, flag);
+ 
+ 		case r_inflating:
+ 			rx_strm.next_out = (Bytef *)dbuf;
+@@ -616,10 +657,7 @@ static int32 recv_deflated_token(int f, char **data)
+ 			break;
+ 
+ 		case r_running:
+-			++rx_token;
+-			if (--rx_run == 0)
+-				recv_state = r_idle;
+-			return -1 - rx_token;
++			return recv_compressed_token_run();
+ 		}
+ 	}
+ }
+@@ -828,17 +866,7 @@ static int32 recv_zstd_token(int f, char **data)
+ 				return 0;
+ 			}
+ 			/* here we have a token of some kind */
+-			if (flag & TOKEN_REL) {
+-				rx_token += flag & 0x3f;
+-				flag >>= 6;
+-			} else
+-				rx_token = read_int(f);
+-			if (flag & 1) {
+-				rx_run = read_byte(f);
+-				rx_run += read_byte(f) << 8;
+-				recv_state = r_running;
+-			}
+-			return -1 - rx_token;
++			return recv_compressed_token_num(f, flag);
+ 
+ 		case r_inflated: /* zstd doesn't get into this state */
+ 			break;
+@@ -869,10 +897,7 @@ static int32 recv_zstd_token(int f, char **data)
+ 			break;
+ 
+ 		case r_running:
+-			++rx_token;
+-			if (--rx_run == 0)
+-				recv_state = r_idle;
+-			return -1 - rx_token;
++			return recv_compressed_token_run();
+ 		}
+ 	}
+ }
+@@ -992,17 +1017,7 @@ static int32 recv_compressed_token(int f, char **data)
+ 			}
+ 
+ 			/* here we have a token of some kind */
+-			if (flag & TOKEN_REL) {
+-				rx_token += flag & 0x3f;
+-				flag >>= 6;
+-			} else
+-				rx_token = read_int(f);
+-			if (flag & 1) {
+-				rx_run = read_byte(f);
+-				rx_run += read_byte(f) << 8;
+-				recv_state = r_running;
+-			}
+-			return -1 - rx_token;
++			return recv_compressed_token_num(f, flag);
+ 
+ 		case r_inflating:
+ 			avail_out = LZ4_decompress_safe(next_in, dbuf, avail_in, size);
+@@ -1018,10 +1033,7 @@ static int32 recv_compressed_token(int f, char **data)
+ 			break;
+ 
+ 		case r_running:
+-			++rx_token;
+-			if (--rx_run == 0)
+-				recv_state = r_idle;
+-			return -1 - rx_token;
++			return recv_compressed_token_run();
+ 		}
+ 	}
+ }
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 47e195ef24..f84f269692 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p4.patch \
            file://CVE-2026-43619_p5.patch \
            file://CVE-2026-43619_p6.patch \
+           file://CVE-2026-43618.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.35.6

