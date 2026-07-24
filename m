Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5EBC531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 04:40:42 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12755.1784868029711075031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 21:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kIUuE55X;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9374; q=dns/txt;
  s=iport01; t=1784868030; x=1786077630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pG6VhkgvdHjrwzPa84qFjLRBTxnKdepuJyM7oznk7/A=;
  b=kIUuE55XbXnhwb1S+GyxikSuC4ILAxzrExixhICBW1KRgMA6V4lOzjVg
   2xrLcYQzLoJEnpK2I8UwmKOiUpDXDSMrdMMRvPBBStQXSZ0/JiEmBOvZe
   DG9kqGS7V3aILbJS+snjfuR85cDryd6VAbkiSk27smjzHc2vVXqwcyviR
   gWtnJ6m9bssBo7lmkb30/cUb1JBK9yAa7qCi9U4jioDM9LRHMrSD1jAzA
   CQ2IZCN7RpkfDQ+OLocr3AHaatx06pDEZ0zdnnLkR/cJK5PR+ghJ0ljyG
   QHQspGRiRgNMdanQrQKFSvi8aiqK/D4+ERFRE3tk3NfYVbBp0M0F+xAom
   g==;
X-CSE-ConnectionGUID: DdgLulzgRpqihE1mvBuHgA==
X-CSE-MsgGUID: tqiiDtGDQHOsJv3P8/Aj1w==
X-IPAS-Result: =?us-ascii?q?A0AnAAAb62Jq/5T/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJA4xviVgDnhsUgWoPAQEBD0QNBAEBhQUCjV8CJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLysjC?=
 =?us-ascii?q?BAJgwIBgnQCARHBKho3giyBAYMoAYFU2y4BCxQBBYEzAYU+iCBcGAFEhDgnG?=
 =?us-ascii?q?xuBcoEVgTuCLoEFgVwCA4EghwIEgiJ6EoFaHjKBOn2NTUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgSx5hFcjHwM5f4EvdUp3LWkBEheBJ?=
 =?us-ascii?q?oNJAoE3AwsYDUgRLDcUGQQ+bgeNayOBUGkHAXoTAStGOTUdGxwXDRweEZJXD?=
 =?us-ascii?q?Bsnj2WCIYE1n1oKKIN1jCGPQoV4GjOEBJQXklELmH2OCpU0gRyEaYFoPIFZc?=
 =?us-ascii?q?BU7gmcJShkPjigFCwuDYIUTxSckNQIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:hSI3LKqpuycosVj/S858N8/tpuFeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmFP/iJZGOmf9x0aojkpx8B7cTUmtdnSQdvpX89QSIS+OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8k834JwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sp7DkVT8
 e4XEigUbxCu3ueo6q+bRcA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TXHJkLxBvF9
 j+uE2LRHggbNfCD5ha80lW3pPGUpXO8cYBLC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:JxkiWaAa2XCcXaXlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3A480+tGgHax8AeuLx/Ft7SQRRnjJuXnHS6GrUMUC?=
 =?us-ascii?q?CEX9oSJDMTEG65YNrup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A0q846Q7YiJwxHaV2QokULYe6xox0+qWvJFwivaw?=
 =?us-ascii?q?mnNKmK3dIa3C0jm2oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,181,1779148800"; 
   d="scan'208";a="514625585"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 04:40:28 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 857DE1800017A;
	Fri, 24 Jul 2026 04:40:28 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 32414CBF204; Thu, 23 Jul 2026 21:40:28 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH v3 5/6] rsync: Fix CVE-2026-43617
Date: Thu, 23 Jul 2026 21:39:13 -0700
Message-Id: <20260724043914.4061351-5-asparmar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241884

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43617. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd0c0c483786ab224a36e14bf43
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-rjfm-3w2m-jf4f

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
Changes in v2:
- Clarified that the omitted upstream macOS CI hunk has no rsync source or
  runtime effect. No functional code changes.

 .../rsync/files/CVE-2026-43617.patch          | 201 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43617.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
new file mode 100644
index 0000000000..5b3190224e
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
@@ -0,0 +1,201 @@
+From d811094dc63486a8b6acf23963daccc23e9dbf43 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 31 Dec 2025 13:50:35 +1100
+Subject: [PATCH] clientserver: fix hostname ACL bypass when using daemon
+ chroot
+
+On an rsync daemon configured with "daemon chroot", the reverse-DNS
+lookup of the connecting client was performed *after* the chroot
+had been entered. If the chroot did not contain the files glibc
+needs for resolution (/etc/resolv.conf, /etc/nsswitch.conf,
+/etc/hosts, NSS service modules), the lookup failed and
+client_name() returned "UNKNOWN". Hostname-based deny rules
+("hosts deny = *.evil.example") therefore could not match, and
+an attacker controlling their PTR record could connect from a
+hostname the administrator had intended to deny. IP-based ACLs
+were unaffected.
+
+Do the reverse DNS lookup before chroot/setuid; client_name()
+caches its result, so the post-chroot call uses the cached value
+and hostname-based ACLs work even when DNS is unavailable
+post-chroot.
+
+Adds testsuite/daemon-chroot-acl.test as end-to-end regression
+coverage. The test sets up an empty chroot directory, configures
+"hosts deny = <localhost-resolved-name>" with daemon chroot, and
+asserts the connection is refused with @ERROR access denied.
+Uses unshare --user --map-root-user for non-root CAP_SYS_CHROOT;
+skips cleanly on non-Linux or when user namespaces aren't
+available.
+
+Reporter: Joshua Rogers (MegaManSec).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43617
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd0c0c483786ab224a36e14bf43]
+
+Backport Changes:
+- Omitted upstream .github/workflows/macos-build.yml because the
+  Yocto recipe does not carry upstream CI workflow files. That
+  upstream hunk only adds daemon-chroot-acl to the macOS
+  RSYNC_EXPECT_SKIPPED list and has no rsync source/runtime effect.
+
+(cherry picked from commit c38f20c5ffabacd0c0c483786ab224a36e14bf43)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ clientserver.c                   |  22 ++++++
+ testsuite/daemon-chroot-acl.test | 111 +++++++++++++++++++++++++++++++
+ 2 files changed, 133 insertions(+)
+ create mode 100644 testsuite/daemon-chroot-acl.test
+
+diff --git a/clientserver.c b/clientserver.c
+index b6eba098..3333aa96 100644
+--- a/clientserver.c
++++ b/clientserver.c
+@@ -1310,6 +1310,28 @@ int start_daemon(int f_in, int f_out)
+ 	if (lp_proxy_protocol() && !read_proxy_protocol_header(f_in))
+ 		return -1;
+ 
++	/* Do reverse DNS lookup before chroot/setuid. The result is cached,
++	 * so the later client_name() call will use this cached value. This
++	 * ensures hostname-based ACLs work even when DNS is unavailable
++	 * after chroot.
++	 *
++	 * "reverse lookup" can be set globally OR per-module, so we also
++	 * scan each module: a deployment with "reverse lookup = no" in the
++	 * global section but "reverse lookup = yes" in a specific module
++	 * still triggers a post-chroot lookup at access-check time
++	 * (rsync_module() in this file), which would also fail in the
++	 * chroot and turn hostname-based deny rules into silent bypasses. */
++	{
++		int need_reverse = lp_reverse_lookup(-1);
++		int j, num_modules = lp_num_modules();
++		for (j = 0; !need_reverse && j < num_modules; j++) {
++			if (lp_reverse_lookup(j))
++				need_reverse = 1;
++		}
++		if (need_reverse)
++			(void)client_name(client_addr(f_in));
++	}
++
+ 	p = lp_daemon_chroot();
+ 	if (*p) {
+ 		log_init(0); /* Make use we've initialized syslog before chrooting. */
+diff --git a/testsuite/daemon-chroot-acl.test b/testsuite/daemon-chroot-acl.test
+new file mode 100644
+index 00000000..9d1c1b63
+--- /dev/null
++++ b/testsuite/daemon-chroot-acl.test
+@@ -0,0 +1,111 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for GHSA-rjfm-3w2m-jf4f: a hostname-based "hosts deny"
++# rule must still match when the daemon performs a 'daemon chroot' and
++# the chroot does not contain the NSS files glibc needs for reverse DNS.
++#
++# Pre-fix, reverse DNS happened *after* the daemon chroot. With an empty
++# chroot the NSS lookup failed, client_name() returned "UNKNOWN", and a
++# deny rule referring to the connecting hostname silently failed to
++# match.
++#
++# Two scenarios are exercised so we can distinguish the case the fix
++# definitely covers from the per-module path that may still be
++# vulnerable:
++#   A. global  "reverse lookup = yes"           (covered by b6abdb4c)
++#   B. only module "reverse lookup = yes"       (gap to verify)
++
++. "$suitedir/rsync.fns"
++
++case `uname -s` in
++Linux*) ;;
++*) test_skipped "test is Linux-specific (uses chroot+unshare)" ;;
++esac
++
++# We need CAP_SYS_CHROOT. Re-exec under a user namespace if not root.
++if ! chroot / /bin/true 2>/dev/null; then
++    if [ -z "$RSYNC_UNSHARED" ] && unshare --user --map-root-user true 2>/dev/null; then
++	echo "Re-running under unshare --user --map-root-user..."
++	RSYNC_UNSHARED=1 exec unshare --user --map-root-user "$SHELL_PATH" $RUNSHFLAGS "$0"
++    fi
++    test_skipped "need CAP_SYS_CHROOT (root or unshare --user --map-root-user)"
++fi
++
++# We need 127.0.0.1 to reverse-resolve to a real hostname while NSS is
++# still working (i.e. before the daemon's chroot). The daemon will
++# look that name up itself as part of its hostname-based ACL check;
++# we then deny that name and assert the connection is rejected.
++client_hostname=`getent hosts 127.0.0.1 2>/dev/null | awk 'NR==1 {print $2}'`
++if [ -z "$client_hostname" ] || [ "$client_hostname" = "127.0.0.1" ]; then
++    test_skipped "no reverse DNS for 127.0.0.1"
++fi
++
++chrootdir="$scratchdir/chroot"
++rm -rf "$chrootdir"
++mkdir -p "$chrootdir/modroot"
++echo "from chroot" > "$chrootdir/modroot/file1"
++
++conf="$scratchdir/test-rsyncd.conf"
++logfile="$scratchdir/rsyncd.log"
++
++write_conf() {
++    cat >"$conf" <<EOF
++use chroot = no
++log file = $logfile
++daemon chroot = $chrootdir
++reverse lookup = $1
++hosts deny = $client_hostname
++max verbosity = 4
++
++[chrootmod]
++    path = /modroot
++    read only = yes
++    reverse lookup = $2
++EOF
++}
++
++# Run a transfer and return 0 if the daemon refused with @ERROR access
++# denied (the expected outcome when the deny rule matches).
++run_check() {
++    label="$1"
++
++    rm -f "$logfile"
++    rm -rf "$todir"
++    mkdir -p "$todir"
++
++    out="$scratchdir/run.out"
++
++    RSYNC_CONNECT_PROG="$RSYNC --config=$conf --daemon" \
++	$RSYNC -av localhost::chrootmod/ "$todir/" >"$out" 2>&1
++    rc=$?
++
++    echo "----- $label (rsync exit $rc):"
++    cat "$out"
++    echo "----- daemon log:"
++    [ -f "$logfile" ] && cat "$logfile"
++    echo "-----"
++
++    grep -q '@ERROR.*access denied' "$out"
++}
++
++# Scenario A: global reverse lookup. Covered by b6abdb4c.
++write_conf yes yes
++if ! run_check "Scenario A (global reverse lookup = yes)"; then
++    test_fail "Scenario A: hostname deny rule was bypassed"
++fi
++
++# Scenario B: only the per-module reverse-lookup setting is enabled.
++# The b6abdb4c fix only pre-warms client_name()'s cache when the
++# global setting is on, so the post-chroot lookup in this path may
++# still produce "UNKNOWN" and bypass the deny rule.
++write_conf no yes
++if ! run_check "Scenario B (per-module reverse lookup only)"; then
++    test_fail "Scenario B: hostname deny rule was bypassed (per-module reverse lookup with daemon chroot still has the bypass)"
++fi
++
++exit 0
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 2145d4ce7e..d0d57defe8 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p6.patch \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
+           file://CVE-2026-43617.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.35.6

