Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9272DC54F52
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43749.1785192979630425907
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=afeL3AE6;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49553515a8bso39036425e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192978; x=1785797778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KLrYa6huvcFEUJEO14B4nxz14jfDg7IlorgCJuYTUcI=;
        b=afeL3AE6tvhGOrowsLbss+SNOaB1NIH1MHMLglo2Yq9x2XBsJbGin2dtsbIcc2cdpL
         lNJC/mgr3JaSAyDDwy6Ssa3NqpV+ElRtEgfGRb8j4gbId8EAtiynIij32hn8I0cVXMVv
         VqfzjLjIa30CwoBVp2Fg8LsUygcCbwoA/pG0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192978; x=1785797778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KLrYa6huvcFEUJEO14B4nxz14jfDg7IlorgCJuYTUcI=;
        b=slVmHV85u2E8LuPrcWIOdnmX3bnfGMq34aIpkCeqdfYPzDlLZsGuE34pAm05j05MSv
         VlnPAubP1j7HAPFkWWtGnMEsK1k/xgLI68EgGrX1V97HKvSGIPHcIsX+YqlCi6l1QTzc
         uSlQ4QoqglwNOc4YYLJMfOQxLNK9KhVmUjx150WeFZyKf4V1qt85te3tNlXHtA/cyPDa
         rzd83p7gAfVe3sHwSX4J2h71EBme5ChrJADDa/E1TM4FIWKnJXvtYYVGwMPBifGwDAsC
         M67uFEpC/6tU3EP01kFn2jGDejOZtN2zqbn8vUxisuSz8C70dD4ldgpWVbSEC5Rsvvxj
         ALJg==
X-Gm-Message-State: AOJu0YzGXYv7UFX6Y9/2Y+e2QatxD7rWRdbDssPbHpyjeoJGkmg4MbEn
	IxmP/LxkFbgYRSPtCNGppDXAHkWfIymXDHZEMJrvAbwgwe40KPYZrFpUm+CsEiY42ufVEIBOE+a
	u83HBGww=
X-Gm-Gg: AR+sD11OOFZuMhkl6LDN3kmXzHqpB+d/6j+YvM7IGaw2uwMEmKv141Pw+XoCdRsw7Qa
	EhpgvvF8Oog7+Ux3ub/m2jgAkX98W9D6kHE8YzXlxGvsx4M8VbG2/UiJyAdzwnIo+f/ZbdHI77A
	SM3lfAsI3qHMJIrMO4opnuyijcXY6Z/o6/+v3C3ItFUVe0E8ophr+nRJx6u+l7heSF3Lf6ZFa+U
	oLuxaNSnLTAJBSvpiIavDetb+GBIk3xBY9CL/Fj9eyHybwwQDy/UDvutwsVDcWgHS1l04Ghld/w
	Xwms0sjg/m+aqWFNBP/JKyDamgZj7RDhFxXyfNxTh0N7wGq6oSeGBeXmu3GljDDtw7RBk8N3Lnc
	GcjykfbmyByHabGOCitW9QEDpuwz4Z3h48VR2tKVExOikM7biMswybVhfmxm4Z10QfvG2P4h117
	3cmO/+VvledxkaCu5yineT9CTF3E97wIK7+7Rsevf67NoXT86vpEFrriXfBdo71sS+01SvyF7Vo
	5yyGg==
X-Received: by 2002:a05:600c:870c:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-496b56f9749mr120537195e9.15.1785192977734;
        Mon, 27 Jul 2026 15:56:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/36] rsync: Fix CVE-2026-45232
Date: Tue, 28 Jul 2026 00:55:25 +0200
Message-ID: <9e76a8e19462dab7f04cfa36116ed882fa4947d9.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242119

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-45232. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-8f85-j2cv-59m8

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rsync/files/CVE-2026-45232.patch          | 240 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 241 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-45232.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch b/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch
new file mode 100644
index 00000000000..544793bd1d1
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch
@@ -0,0 +1,240 @@
+From de47c801a8083f1913e149c6ee6d0e864b728995 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba]
+
+(cherry picked from commit a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba)
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
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index d0d57defe8d..2744b3a80f7 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
            file://CVE-2026-43617.patch \
+           file://CVE-2026-45232.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 

