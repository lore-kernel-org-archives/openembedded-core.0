Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DC2C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:03:52 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2011.1783487024274398689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O7oAoJ3L;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9173; q=dns/txt;
  s=iport01; t=1783487024; x=1784696624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jebe/M/qQdP3TfZUZDKmPKWtX7EEZdd+E4bzcMsB9Iw=;
  b=O7oAoJ3L99w6HBgIWJ04W/wBAmusQXb3kW+oMMEhZUvCi6wcSOF+4Usz
   DyACwiJHjx7bTUGgXjLKA2NRO2YOhnlTVj1Kq/j39MxXhkbK0R1iYvc1y
   7EBAD4TOUcKHZbezLJD1D0TYZau4dOExG1qgryFXrwvRcCwFc/j6sB7EZ
   leqGUwfR9NToDTrq0tbD7k4j3/YJsdg5/cFg6KValf/GHd7lpnD492dRF
   ZqXoWkulrh7+54BsyHxrpCi8OHllVgCxMvvbqtC795rB7J/EaiykJkRsa
   4nP1TcvWVZl5QSvqyyCUidpNhCghTjRL0E+xclo7ltCaJJRzFE//eISwQ
   A==;
X-CSE-ConnectionGUID: 64fp+ZD/ROSzbCMKteclWw==
X-CSE-MsgGUID: qGXH0pWGTfaeu/FrekBwKA==
X-IPAS-Result: =?us-ascii?q?A0AaAAAS2U1q/5T/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0X0JJA4xviVgDnhsUgWoPAQEBD0QNBAEBhQUCjU0CJjQJDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcA?=
 =?us-ascii?q?wECLysjCBAJgwIBgnMCARG3ARo3giyBAYMoAYFU2ywBCxQBBYEzAYU+iB9bG?=
 =?us-ascii?q?AFEhDgnGxuBcoEVgTuCLoEFgVwCA4EghwIEgiJ6EoFaHjKCY4F6ikpIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYFggQKEeSMfAzl/gTB1S?=
 =?us-ascii?q?nktgQIBEh4KgVKCHAMLGA1IESw3FBsEPm4HjSgXD4FOaQcBehMBK0Y5NR0bH?=
 =?us-ascii?q?BcNHB4RklcMGyePZYIhgTWfWgoog3WMIY9ChXgaM4QElBeSUQuYfY4KlTSBH?=
 =?us-ascii?q?IRogWg8gVlwFYMiCUoZD44oBQsLg2CFE8lHJDUCCQMvAQEHAgcOAwuBaJF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:HY33nql9HMSlFMluqUMgGP/o5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXG2COveKY2r2LotxPd+2oBgCvcTcyoBnSQRprig2QVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLs/3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdNE9P40M00Jz
 9sjOjomSzOfiumy/63uH4GAhux7RCXqFJkUtnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaj/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKJK4bSG5gEzh3wS
 mTu5kvJIkkCC/OjxzOI7zWCnOLMtzzYcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:6JOi1qheA42TCOQPjIL75nJVj3BQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:yqXNRWDpxk+wuaP6E3c7+lZXKOxiSFrm3n37BmykBG1td6LAHA==
X-Talos-MUID: 9a23:UeOpmguYuf1jfhphRs2nnR5SFJ9w3IuSBkkAjNIoocSHHzNTEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="492065983"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 Jul 2026 05:03:43 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 121CC1800016D;
	Wed,  8 Jul 2026 05:03:43 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id AF5A6CBF204; Tue,  7 Jul 2026 22:03:42 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH 5/6] rsync: Fix CVE-2026-43617
Date: Tue,  7 Jul 2026 22:02:23 -0700
Message-Id: <20260708050224.3660629-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260708050224.3660629-1-asparmar@cisco.com>
References: <20260708050224.3660629-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240419

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43617. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd0c0c483786ab224a36e14bf43
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-rjfm-3w2m-jf4f

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43617.patch          | 200 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43617.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
new file mode 100644
index 0000000000..dce31d3827
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
@@ -0,0 +1,200 @@
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
+  Yocto recipe does not carry upstream CI workflow files. Security
+  source changes and regression test coverage were retained.
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


