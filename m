Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791DCCD98DA
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:15:30 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69072.1781266523020001377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QtZXECON;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9012; q=dns/txt;
  s=iport01; t=1781266523; x=1782476123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=isfBTwXdyKwhFBbwk3JyV1TjmcTg+/uByErIIPjJRNg=;
  b=QtZXECONAOiB9XhSFQpRdNae3J6+68QlUYly6X/sHw1Wc1Z5oLQMDbsF
   4rN3NF5CmsWINXRnZKs7k09mf7i0c7Bm0B+KBkwJF95WUo3K8921VdNpm
   rl7kTBztWCrUg7A3BdQdqsOKfq5Xbk4RHwE8YOMF9f9xRfyPfFeH6uuVE
   HeK1dId+KXn/BqFsOULpS6GviSQnd/2EL/Tvu4sH8rKI2Rlgle8vmTVqh
   a+ks4yPSa21wdZ+pYtDlQzfYI1TvRIS1KMUdoiQ+ke9uYzlSfn3rlFYOL
   duAhRn20/gd3eKUJkIUJ1Pb+U5qnkmzwAHQjnmrNqHn1bc3qPZ2MSCqP2
   Q==;
X-CSE-ConnectionGUID: QY604+rPQI2awobnbQAyuQ==
X-CSE-MsgGUID: gBngwDW6T5GV7ZDWB/ZVpw==
X-IPAS-Result: =?us-ascii?q?A0BHAgDn9itq/5D/Ja1aHgEBCxIMggULgld0X0JJlksDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBgKNQAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvKyMIGYMCAYJzAgERsj0aN?=
 =?us-ascii?q?4IsgQGDKAE/AkNQ2ywBCxQBBYEzhT+IH1sYAYR8JxsbgXKBFAGBO4IugQWBX?=
 =?us-ascii?q?AICAReBDV+GHwSCDRV6EoFdHoh9hW5IgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQwbBwWBSoEraoEDhQ0jHwM5f4F0gShnaRUwNYEBARESAwsYDUgRL?=
 =?us-ascii?q?DcUGwQ+bgeMQhcPgh4ZB4EOASsXGFAGSBtTkygBBwySK6EPCiiDdYwhj0KFe?=
 =?us-ascii?q?BozqUaBJguYfY4KllCEaIFoPIFEDgdwFYMiCUoZD44qAwsLg2CFE8J8JDUCC?=
 =?us-ascii?q?TIBAQcCBw4DC4FohGGLHwImB4FOAQE?=
IronPort-Data: A9a23:HuwICKASzS3BLRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDsr1mQDy
 mNLDD2PaayOM2LzKd90bIXi8hgH75GHyYNnOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH8gWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+sQwVB11J7Uh27x+HmZE8
 /YhASEQV0XW7w626OrTpuhEnM8vKozveYgYoHwllW6fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYzBPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FAgi+O9aYqPIbRmQ+1atECXu
 U75oVikLS9FBvCg4323zGqz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KLpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:EoGRvazby5MFS4MWuvw3KrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICOsqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:h8cea2ywedI/e5tEWa7xBgUtK559Lj7H9E7xeUanDmxvQoS8WEKprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AFa14iA9LPslwj48mJAyBaeuQf8hC5auxJH9Trcg?=
 =?us-ascii?q?phZa2GRNafAWjlCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493381823"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:15:22 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id E1485180004B3;
	Fri, 12 Jun 2026 12:15:21 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7D646CBF203; Fri, 12 Jun 2026 05:15:21 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/6] rsync: Fix CVE-2026-43618
Date: Fri, 12 Jun 2026 05:13:31 -0700
Message-ID: <20260612121514.2282121-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260612121514.2282121-1-asparmar@cisco.com>
References: <20260612121514.2282121-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238605

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream backport [1] for CVE-2026-43618 as mentioned in [2],
where compressed-token decoding could overflow the token index.

[1] https://github.com/RsyncProject/rsync/commit/901041dddc9a343ed51f8e2cd3992aed3ae0180c
[2] https://www.cve.org/CVERecord?id=CVE-2026-43618

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43618.patch          | 252 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43618.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
new file mode 100644
index 0000000000..ed07491b50
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
@@ -0,0 +1,252 @@
+From b45912207aed17451adcda954b8bd6689714d2ed Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/901041dddc9a343ed51f8e2cd3992aed3ae0180c]
+
+Backport Changes:
+- Resolved context conflict against existing Scarthgap token
+  hardening by keeping the upstream
+  recv_compressed_token_num() helper call.
+- The upstream deletion hunks for the old inline
+  rx_token < 0 checks were absent or already different
+  in Scarthgap token.c. The backport keeps the
+  helper-based validation and omits those no-op
+  context deletions.
+
+(cherry picked from commit 901041dddc9a343ed51f8e2cd3992aed3ae0180c)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ receiver.c |  11 +++++-
+ token.c    | 102 ++++++++++++++++++++++++++++++-----------------------
+ 2 files changed, 67 insertions(+), 46 deletions(-)
+
+diff --git a/receiver.c b/receiver.c
+index 8f5b51dd..63e5cedb 100644
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
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 7dd4f7c471..e232abafc3 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p2.patch \
            file://CVE-2026-43619_p3.patch \
            file://CVE-2026-43619_p4.patch \
+           file://CVE-2026-43618.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.44.1


