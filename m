Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0342FC4451A
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:21:07 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7271.1784265662539563572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LR2RFfzl;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10234; q=dns/txt;
  s=iport01; t=1784265662; x=1785475262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JQtwBLPhw6W+CPoO+yPdrPFOql1mJm8gy1u7XZaf80k=;
  b=LR2RFfzlIxGNrHxgawqqJd9q2SFIB7GlzAg2gnBK8EfKz563YlL6Oe4v
   JOkMWp0/+jjB82jdokn6AEFzh6v9wjF+rArk8Mxg+YTP32nNis3tRDi8E
   a4IF/7YFZTQ8k0jIsb2PQGbSYDxTF1MTbmDzeEiVJTHmYCBDnN8Q5sG2o
   3aJwwMk7kWKP1dx2Xi/iHYRSbse1jMcSmtxbWYg/IASyM085+CL9cHcAz
   a6JfJMdK0m4ix1s6BbWEOEW5v+Sb4EGJAF0UJvQVs9yOxPPghPqVbsE0+
   uLesgBBtUDOh8pAWnq42Mh68hLWXoTAdBk9tqKuzOXellTpbUJtj68AYW
   Q==;
X-CSE-ConnectionGUID: uc4yo6I/Qs+Ho9QHbUKPkg==
X-CSE-MsgGUID: zpNOFe2hS/uUPWUWInu1xw==
X-IPAS-Result: =?us-ascii?q?A0AAAwByt1lq/4v/Ja1aHgEBCxIMggULgld0X0JJA5ZHA?=
 =?us-ascii?q?4ETkDeMURSBag8BAQEPRA0EAQGFBQKNUgImNgcOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvKyMIGYMCAYJ0A?=
 =?us-ascii?q?gERvHoaN4IsgQGDKAGBVNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKBFYE7gTh2g?=
 =?us-ascii?q?QWBXAIDgSCHAgSCInoSgVoegS2CSH6LDkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYEdgTqBAIR2Ix8DOX+BL3VKdy1pARIXgU6CFIE+AwsYD?=
 =?us-ascii?q?UgRLDcUGwQ+bgeNLxkjggcxBwZNKBMBKgEXeg8UHVtOkmAJOZIGgTWfWgoog?=
 =?us-ascii?q?3WMIZU6GjOEBJQXklELmH2OCpU2LC1BhGmBbwsqgVlwFYMiCUoZD44qAwsLg?=
 =?us-ascii?q?2CFE8lFJDUCCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:M/gbTaiLzyLIFrLbXyj4R6y/X161MREKZh0ujC45NGQN5FlHY01je
 htvW2qCbv/eZmX8eY0iati19UkAuZSHm4dqS1RkrS4wHihjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPvd8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUF8bpmBj9vs
 sUDaxAKPymjjd+V+LG0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9J4XTHpQFwRbEz
 o7A13bhJDY0OYaf8n2Yz0qTu9Dumz6iSJ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:AX5JKa5tQSQedf68CwPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:FDxbh2NJP/O2Ne5DRSI75UlKO4ccaT79yybpA0WFKl5qR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AgN1dAQ6aAg7dKehAheki5hCExox6+4KJJk1Xka5?=
 =?us-ascii?q?BpvS8ChFPGjGA1SSoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511398784"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:21:01 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 782A01800020D;
	Fri, 17 Jul 2026 05:21:01 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id C7ED0CC4D0E; Thu, 16 Jul 2026 22:21:00 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashishkumar Parmar <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 6/6] rsync: Fix CVE-2026-45232
Date: Thu, 16 Jul 2026 22:20:59 -0700
Message-Id: <20260717052059.773645-7-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717052059.773645-1-asparmar@cisco.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241118

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-45232. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-8f85-j2cv-59m8

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-45232.patch          | 240 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 241 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-45232.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch b/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch
new file mode 100644
index 0000000000..544793bd1d
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
index d0d57defe8..2744b3a80f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
            file://CVE-2026-43617.patch \
+           file://CVE-2026-45232.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.35.6

