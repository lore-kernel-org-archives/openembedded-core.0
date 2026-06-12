Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4AACD98D9
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:15:30 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69133.1781266523300532639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hgQZwuQC;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8947; q=dns/txt;
  s=iport01; t=1781266523; x=1782476123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hKTyk8nx28g6a7/aBLMCi5ucygOWeWEnGkK2fYu0Lk=;
  b=hgQZwuQCsijDYmutfZjukiF9CBxMnFQ6VpYusbzp3oPolLtb04E1eJvz
   d+KxaL7ImzqxWkOaKNW+FiMrNzyUwolSyJwYcwBz+5wERsCLDA92Y3WkV
   Z28S1ok8G9ylMJcOMyh3viNO+x9vs1vT2RSs7xptunNbz2whwFh2XxFvW
   d9ZR65BBHm8APsCubUYv08g4BnCfCsOz258096AX1TdkXSBKHR/fkfzaK
   nf83k2jXVhsnUp5KrDi0iRijKBjLQebtWaN718STmAZa3HFdag3LVDxaE
   pMMDDTSsVTx+vEHzXQJUPgmtlqOr0+i8WsVS9jeJJYX4x9wNcXvU14Tgt
   g==;
X-CSE-ConnectionGUID: aCi8muYNT5+gYJcpolACbA==
X-CSE-MsgGUID: 1R3kziwdRau6ln4ykEz+Hg==
X-IPAS-Result: =?us-ascii?q?A0AnAADn9itq/5H/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHOJWAOeGxSBag8BAQEPRA0EAQGFBgKNQAImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvKyMIE?=
 =?us-ascii?q?AmDAgGCcwIBEbI9GjeCLIEBgygBPwJDUNssAQsUAQWBMwGFPogfWxgBRIQ4J?=
 =?us-ascii?q?xsbgXKBFYE7gi6BBYFcAgIBF4EJhwIEgiJ6EoFdHjSDIYsWSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUqBK2qBA4UNIx8DOX+BdIEoZ2kVM?=
 =?us-ascii?q?DWBAQEREgMLGA1IESw3FBsEPm4HjEIXD4FOaQcBehMBK0Y5NR0bHBcpHhGSV?=
 =?us-ascii?q?wwbJ49lgiGBNZ9aCiiDdYwhj0KFeBozhASUF5JRC5h9jgqVNIEchGiBaDyBQ?=
 =?us-ascii?q?w8HcBWDIglKGQ+OKAULC4NghRPCfCQ1AgkyAQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:KIn5wqhm8U0DT5lZAjEzXOGrX161MREKZh0ujC45NGQN5FlHY01je
 htvXmGHOfnYMGX8c4glbN61oBwO75HUnIM3SQRr+S9hQSljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeDULOZ82QsaDxMtfvZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUR0ecnBHx/0
 8BFaz88TBubgOaf67iSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgp/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9Jo3RGpUNwh/Cz
 o7A1z3DWRIINcOT8zOYrHaq2v7MsDG4eI1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:OPrpqKsLjBcsYMbaHNncZ0sR7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:GB/HpGxmh6mWtf0AA5VCBgUdMcF1d2Ds6kuNYECJK21xT7m8YlW5rfY=
X-Talos-MUID: 9a23:Mt5negjDr2s5/k57/j1q/cMpbf0z4LavF0w3mIhYv8/YJC9dKXS9g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493780412"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:15:22 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 3E4FC180001EE;
	Fri, 12 Jun 2026 12:15:22 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id D39C5CBEF8A; Fri, 12 Jun 2026 05:15:21 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 5/6] rsync: Fix CVE-2026-43617
Date: Fri, 12 Jun 2026 05:13:33 -0700
Message-ID: <20260612121514.2282121-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260612121514.2282121-1-asparmar@cisco.com>
References: <20260612121514.2282121-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238608

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream backport [1] for CVE-2026-43617 as mentioned in [2],
where hostname-based daemon ACLs could be bypassed when reverse DNS was
performed after daemon chroot.

[1] https://github.com/RsyncProject/rsync/commit/74ea276900779b95ddd1769d1d6ae78b2fd1a790
[2] https://www.cve.org/CVERecord?id=CVE-2026-43617

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43617.patch          | 197 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43617.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
new file mode 100644
index 0000000000..409e524ea8
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
@@ -0,0 +1,197 @@
+From d1b1f430b3c0ee8f7fd8ffb10ac864689a3ed024 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/74ea276900779b95ddd1769d1d6ae78b2fd1a790]
+
+(cherry picked from commit 74ea276900779b95ddd1769d1d6ae78b2fd1a790)
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
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index b1483fc6a6..a27fb0f291 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p4.patch \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
+           file://CVE-2026-43617.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.44.1


