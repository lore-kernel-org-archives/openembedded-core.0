Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FA7CD98DC
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:15:30 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69133.1781266523300532639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=J1nWYsLN;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10211; q=dns/txt;
  s=iport01; t=1781266524; x=1782476124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JoYiaEjw0vBg0HSOFENHLEL1Z5IMDELFfpDqkfYgfmI=;
  b=J1nWYsLN7Pcje4XhzQBt9+IE+yGNXYLL2Wi8vNQgnl3Wi9Qthy9GHQWJ
   NTaVOvleV8aP+Yfqi/hzbQDGeLpzxfYRXLmTihwDnrt8qo79qY3hld5ct
   5xvt7l85NZvj+V8P6Kf/a3aku0Dl54PgmVuVm0oOUAxMLztGf3v1QaWEq
   hRu+yXMbifUxvqtoL6tgkFSyF4O7wRkLZFhG+gytI5BaCsrcc51gjco7O
   NIyyP8lxZPA/LTPAKGwZJFKwvsfAhbRj6td4AKNUG7LuP3tE3LH0S6WiR
   rHL39MwY+w1oQAdor+3EM3UnDfKsGZmG/AiUxTwOHxq+7NZ7WUNd8NnoZ
   Q==;
X-CSE-ConnectionGUID: eCwuLf3eSFClUF8rkG9oPQ==
X-CSE-MsgGUID: XKvUJWfhSqeMMTOEYMflpA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDn9itq/5D/Ja1aHgEBCxIMggULgld0X0JJlksDg?=
 =?us-ascii?q?ROQN4xRFIFqDwEBAQ9EDQQBAYUGAo1AAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8rIwgZgwIBgnMCA?=
 =?us-ascii?q?RGyPRo3giyBAYMoAT8CQ1DbLAELFAEFgTOFP4gfWxgBhHwnGxuBcoEVgTuBO?=
 =?us-ascii?q?HaBBYFcAgIBF4EJhwIEgiJ6EoFdHoIFgk2KGUiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDBsHBYFKgStqgQOFDSMfAzl/gXSBKGdpFTA1gQEBERIDC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB4wpGRcPggYxBwZNKBMBKgEXeg8UHYEpkmAJOZIGgTWfW?=
 =?us-ascii?q?goog3WMIZU6GjOEBJQXklELmH2OCpU2LC1BhGiBaDyBWXAVgyIJShkPjioDC?=
 =?us-ascii?q?wuDYIUTwnwkNQIJMgEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:QHmUYq6nQCMtG6DaWrX6EQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mcYUDuGOq2IazCmfdF/Ydvn/E5U75fdx9VmSQE+/H1nZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eMKYH58J5Wmx12
 9ccFR5ddBOs1uWO+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIaEIYPaHZkMxS50o
 Er23HrEIC4UNOeGxB+gzlWBt8rBmTvSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:/6yNZaB3J43tayrlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80l6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:/fwGC27zYp++zyRkctss+WULB+QrKXDm4lzUHmHoE2VGGbqtcArF
X-Talos-MUID: 9a23:U0xebgrvUKUT0YB/TokezwFBKvpK3KquM1kAtLA6nOS1ECJ0Ix7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493780413"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:15:22 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 49DFF1800023E;
	Fri, 12 Jun 2026 12:15:22 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id E7E36CC1611; Fri, 12 Jun 2026 05:15:21 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 6/6] rsync: Fix CVE-2026-45232
Date: Fri, 12 Jun 2026 05:13:34 -0700
Message-ID: <20260612121514.2282121-6-asparmar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238609

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream backport [1] for CVE-2026-45232 as mentioned in [2],
where an over-long proxy response line could write one byte past the
stack buffer.

[1] https://github.com/RsyncProject/rsync/commit/36860669cceaa2ca7cc84367d1fb8a3655560300
[2] https://www.cve.org/CVERecord?id=CVE-2026-45232

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-45232.patch          | 243 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 244 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-45232.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch b/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch
new file mode 100644
index 0000000000..d8e6c94b84
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch
@@ -0,0 +1,243 @@
+From cd379e2b19a9f2fa10cadbe179641acb33edb158 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 13 May 2026 20:35:35 +1000
+Subject: [PATCH] socket: reject over-long proxy response line
+
+fixes a one byte stack overflow when using RSYNC_PROXY with a
+malicious proxy.
+
+Reach: only when RSYNC_PROXY is set and a malicious or MITM'd
+proxy returns the pathological response.  The byte written is
+always '\0' and the attacker doesn't choose the offset, so impact
+is corruption of one adjacent stack byte and possible later
+misbehaviour or crash -- no information disclosure beyond the
+existing rprintf of buffer contents.
+
+Reported by Aisle Research via Michal Ruprich
+
+CVE: CVE-2026-45232
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/36860669cceaa2ca7cc84367d1fb8a3655560300]
+
+(cherry picked from commit 36860669cceaa2ca7cc84367d1fb8a3655560300)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ socket.c                                    |  30 +++--
+ testsuite/proxy-response-line-too-long.test | 128 ++++++++++++++++++++
+ 2 files changed, 145 insertions(+), 13 deletions(-)
+ create mode 100755 testsuite/proxy-response-line-too-long.test
+
+diff --git a/socket.c b/socket.c
+index c2075adf..6a8f6f4a 100644
+--- a/socket.c
++++ b/socket.c
+@@ -47,21 +47,23 @@ static struct sigaction sigact;
+ 
+ static int sock_exec(const char *prog);
+ 
++#define PROXY_BUF_SIZE 1024
++
+ /* Establish a proxy connection on an open socket to a web proxy by using the
+  * CONNECT method.  If proxy_user and proxy_pass are not NULL, they are used to
+  * authenticate to the proxy using the "Basic" proxy-authorization protocol. */
+ static int establish_proxy_connection(int fd, char *host, int port, char *proxy_user, char *proxy_pass)
+ {
+-	char *cp, buffer[1024];
+-	char *authhdr, authbuf[1024];
++	char *cp, buffer[PROXY_BUF_SIZE + 1];
++	char *authhdr, authbuf[PROXY_BUF_SIZE + 1];
+ 	int len;
+ 
+ 	if (proxy_user && proxy_pass) {
+-		stringjoin(buffer, sizeof buffer,
++		stringjoin(buffer, PROXY_BUF_SIZE,
+ 			 proxy_user, ":", proxy_pass, NULL);
+ 		len = strlen(buffer);
+ 
+-		if ((len*8 + 5) / 6 >= (int)sizeof authbuf - 3) {
++		if ((len*8 + 5) / 6 >= PROXY_BUF_SIZE - 3) {
+ 			rprintf(FERROR,
+ 				"authentication information is too long\n");
+ 			return -1;
+@@ -74,14 +76,14 @@ static int establish_proxy_connection(int fd, char *host, int port, char *proxy_
+ 		authhdr = "";
+ 	}
+ 
+-	len = snprintf(buffer, sizeof buffer, "CONNECT %s:%d HTTP/1.0%s%s\r\n\r\n", host, port, authhdr, authbuf);
+-	assert(len > 0 && len < (int)sizeof buffer);
++	len = snprintf(buffer, PROXY_BUF_SIZE, "CONNECT %s:%d HTTP/1.0%s%s\r\n\r\n", host, port, authhdr, authbuf);
++	assert(len > 0 && len < PROXY_BUF_SIZE);
+ 	if (write(fd, buffer, len) != len) {
+ 		rsyserr(FERROR, errno, "failed to write to proxy");
+ 		return -1;
+ 	}
+ 
+-	for (cp = buffer; cp < &buffer[sizeof buffer - 1]; cp++) {
++	for (cp = buffer; cp < &buffer[PROXY_BUF_SIZE - 1]; cp++) {
+ 		if (read(fd, cp, 1) != 1) {
+ 			rsyserr(FERROR, errno, "failed to read from proxy");
+ 			return -1;
+@@ -90,11 +92,13 @@ static int establish_proxy_connection(int fd, char *host, int port, char *proxy_
+ 			break;
+ 	}
+ 
+-	if (*cp != '\n')
+-		cp++;
+-	*cp-- = '\0';
+-	if (*cp == '\r')
+-		*cp = '\0';
++	if (cp == &buffer[PROXY_BUF_SIZE - 1]) {
++		rprintf(FERROR, "proxy response line too long\n");
++		return -1;
++	}
++	*cp = '\0';
++	if (cp > buffer && cp[-1] == '\r')
++		cp[-1] = '\0';
+ 	if (strncmp(buffer, "HTTP/", 5) != 0) {
+ 		rprintf(FERROR, "bad response from proxy -- %s\n",
+ 			buffer);
+@@ -110,7 +114,7 @@ static int establish_proxy_connection(int fd, char *host, int port, char *proxy_
+ 	}
+ 	/* throw away the rest of the HTTP header */
+ 	while (1) {
+-		for (cp = buffer; cp < &buffer[sizeof buffer - 1]; cp++) {
++		for (cp = buffer; cp < &buffer[PROXY_BUF_SIZE]; cp++) {
+ 			if (read(fd, cp, 1) != 1) {
+ 				rsyserr(FERROR, errno,
+ 					"failed to read from proxy");
+diff --git a/testsuite/proxy-response-line-too-long.test b/testsuite/proxy-response-line-too-long.test
+new file mode 100755
+index 00000000..7f55c43b
+--- /dev/null
++++ b/testsuite/proxy-response-line-too-long.test
+@@ -0,0 +1,128 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for the off-by-one stack OOB write in
++# establish_proxy_connection() in socket.c when a malicious or
++# man-in-the-middle HTTP proxy returns a first response line of
++# 1023+ bytes without a '\n' terminator.
++#
++# Pre-fix: the read loop walked buffer[0..sizeof-2] one byte at a
++# time, then post-loop logic did "if (*cp != '\n') cp++; *cp-- =
++# '\0';".  If no newline arrived before the loop filled the buffer,
++# cp was left at &buffer[sizeof-1] (never written by the loop),
++# *cp held stale stack bytes, and cp++ pushed cp one past the array.
++# The null-termination then wrote one byte out of bounds on the
++# stack.  AddressSanitizer reports stack-buffer-overflow at the
++# null-termination site.
++#
++# Post-fix: the bound-exhaustion case is detected by position and
++# rejected with an "proxy response line too long" message, so no
++# OOB write occurs and rsync exits with a non-signal status.
++
++. "$suitedir/rsync.fns"
++
++command -v python3 >/dev/null 2>&1 || test_skipped "python3 not available"
++
++workdir="$scratchdir/workdir"
++mkdir -p "$workdir"
++cd "$workdir"
++
++port_file="$workdir/port"
++proxy_log="$workdir/proxy.log"
++
++# A minimal TCP listener: binds to an ephemeral port on 127.0.0.1,
++# writes the chosen port to $port_file *before* accept() so the test
++# can synchronise without a sleep, accepts one connection, reads
++# until end-of-headers or 64 KiB, sends exactly 1023 bytes of 'X'
++# with no '\n', then closes.
++python3 - "$port_file" >"$proxy_log" 2>&1 <<'PYEOF' &
++import socket, sys, os
++port_file = sys.argv[1]
++s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
++s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
++s.bind(("127.0.0.1", 0))
++port = s.getsockname()[1]
++tmp = port_file + ".tmp"
++with open(tmp, "w") as fp:
++    fp.write("%d\n" % port)
++os.rename(tmp, port_file)   # atomic visibility to the shell side
++s.listen(1)
++conn, _ = s.accept()
++conn.settimeout(5)
++try:
++    data = b""
++    while b"\r\n\r\n" not in data and len(data) < 65536:
++        chunk = conn.recv(8192)
++        if not chunk:
++            break
++        data += chunk
++except socket.timeout:
++    pass
++conn.sendall(b"X" * 1023)    # exactly the buffer-1 trigger size
++try:
++    conn.shutdown(socket.SHUT_RDWR)
++except OSError:
++    pass
++conn.close()
++s.close()
++PYEOF
++proxy_pid=$!
++
++# Wait up to ~10s for the listener to publish its port.
++i=0
++while [ ! -s "$port_file" ] && [ $i -lt 10 ]; do
++    sleep 1
++    i=$((i + 1))
++done
++
++if [ ! -s "$port_file" ]; then
++    kill "$proxy_pid" 2>/dev/null
++    cat "$proxy_log" >&2 2>/dev/null
++    test_fail "proxy listener never published a port"
++fi
++
++port=`cat "$port_file"`
++case "$port" in
++    *[!0-9]*|"") kill "$proxy_pid" 2>/dev/null; test_fail "bogus port from listener: '$port'" ;;
++esac
++
++# Run rsync through the malicious proxy.  Any rsync:// URL works:
++# the proxy intercepts the CONNECT and never forwards anywhere.
++rsync_err="$workdir/rsync.err"
++
++# rsync MUST exit non-zero here (the proxy is misbehaving).
++# Use `|| status=$?` so we capture the real exit code under `sh -e`;
++# `if ! cmd; then status=$?` would only ever see 0 because the `!`
++# is the last command before `$?`.
++status=0
++RSYNC_PROXY="127.0.0.1:$port" \
++    $RSYNC rsync://example.invalid:873/whatever/ "$workdir/out/" \
++    >/dev/null 2>"$rsync_err" || status=$?
++
++# Reap the listener.
++wait "$proxy_pid" 2>/dev/null || true
++
++# 1. rsync must not have crashed (SIGSEGV/SIGABRT report >= 128).
++if [ "$status" -ge 128 ]; then
++    cat "$rsync_err" >&2
++    test_fail "rsync killed by signal (status=$status) -- possible stack OOB regression"
++fi
++
++# 2. rsync must have actually exited non-zero (i.e. saw the bad proxy).
++if [ "$status" -eq 0 ]; then
++    cat "$rsync_err" >&2
++    test_fail "rsync returned success despite malformed proxy response"
++fi
++
++# 3. The new error message must appear.
++if ! grep -q "proxy response line too long" "$rsync_err"; then
++    cat "$rsync_err" >&2
++    test_fail "expected 'proxy response line too long' in rsync stderr"
++fi
++
++echo "OK: over-long proxy response line rejected cleanly without crashing"
++exit 0
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index a27fb0f291..6c164521fb 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
            file://CVE-2026-43617.patch \
+           file://CVE-2026-45232.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.44.1


