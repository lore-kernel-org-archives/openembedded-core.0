Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28510C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43745.1785192976195368589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MCmWT5hs;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956242332dso28391635e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192974; x=1785797774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7/4OWz8sfbRQOB1OMamG51+g5Xzvs6zAqwpw3/fkixg=;
        b=MCmWT5hs1TXTNhUQceydF+foCgxLOaLbaZBXM/4Cwh31wAXHYa0V27lW6derb43QlQ
         If0jKVOUgDMVOYwQl2oM3NsZH8MiD049ZpiVYzxltu+b16w6YXb/n4x11SKnnnfz+XHa
         vUG9o6zQQAKAf/p7OpUOn/E8iLoYsHcDyR4aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192974; x=1785797774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7/4OWz8sfbRQOB1OMamG51+g5Xzvs6zAqwpw3/fkixg=;
        b=SQ5HJUFwvpp174qrVNPF+nEYVurnzb2f6H9obc73qg2NDMkGF88OipcE9iCmpyQ7Wz
         9ZZ1FFva7E8AWBasl8/T/F+Mc4sf3VE5bcOSnpz5i5toFZUGgxjvbK92qxvdl8CRKvTj
         KOfmhfo9GSkGXzd/2zNcQyJylNYpadOyKeErGM8+PHH3PpxUtZ4+WPbYQEXGkGD5kmEa
         GXKAYj3w2PT84ikCTjwDzmkaVwTMf6GJRMh9Mdg3Fkf4O1qAHTVbdOuwwbAUdtPnjgvQ
         6mjP0K+TYxTduD7A+3jb70ZrCXJWQ/+taJd/ispeLyOLnK919oYZ2h1oLCU1QBY+75pK
         IFWw==
X-Gm-Message-State: AOJu0YzVotZeF3AWHjWtzKJkhfgr4OJXcfCqdKXkoLp8hClM/IL4sKFB
	2aiqQ07xYEPz2BuTFdcaJl57cr3bNCdmy77gqtyfCrvUUnL6ZeBKhoT/iVpHex+RvtJN9y3yLPE
	K06AosrY=
X-Gm-Gg: AR+sD11P4by/C5rgWI1tVNhgYwBNTGzUMp304ChzhHj8OtE+AXt3Csb/nrrO1O2ImUp
	KGjXJZlTIZahuuMVEfFBchBWwRcD7ioKEASwdQU9l0+UUtctk3aAxo99C8kewspBm5ajRmC6luV
	6N+McsDR4oPnKh6d36zm/EVRjqxxEmnCz8WTD5REJo8iBw0O6Kb+s5n4OKdATHVoprbKqLQCoym
	P46ZzIrD24hhsVxQDaC8AeUpxAOV3o5czo3hsRoKVdGUBHyJN/6eHqSUa7nOX4aDQer5QapRnXh
	39Pb6QPtyCsyvJ8UfihsUSNpW3B470mWkiJSlvLH974eck61tLkU81s4CviCECF9iBdwZZKZVr6
	gcOws/nZIFMlbLC6iKQKaCmIO4zUAE77SkzLbrelZk6OXtIMUhbfeGcnVFassWT3E3un9CXj4X/
	Xemv5xCh5gXvkn4QQ3oUN2zeWdviVPQavQCIP6L/gsCfLk01o2BhshVMZeTuTMUjm8P8bfyx+M1
	SaM+A==
X-Received: by 2002:a05:600c:1d0d:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-496b56b1b23mr124315675e9.7.1785192974314;
        Mon, 27 Jul 2026 15:56:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/36] rsync: Fix CVE-2026-43618
Date: Tue, 28 Jul 2026 00:55:22 +0200
Message-ID: <137902bbf8f0f8311ba12a165dc481b8c70d2a0a.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242115

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43618. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c44c90e9460c666c965446a8c0957f0b9fa4c66a
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-g37v-g3gj-pmwq

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rsync/files/CVE-2026-43618.patch          | 248 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43618.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
new file mode 100644
index 00000000000..d4b13d91818
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
index 47e195ef24a..f84f269692e 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p4.patch \
            file://CVE-2026-43619_p5.patch \
            file://CVE-2026-43619_p6.patch \
+           file://CVE-2026-43618.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 

