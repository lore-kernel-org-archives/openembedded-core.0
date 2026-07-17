Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52569C4451D
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:21:07 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7272.1784265662627799325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RioW7hAw;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9234; q=dns/txt;
  s=iport01; t=1784265662; x=1785475262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yilYtwXRq+K32txmEagO/7HjwKQi1MTUS4j80Glu5Ac=;
  b=RioW7hAwKBDvjaOLiNtk5IuLEj0qV9sVLAS+KrGrlgOYSq0oq3vhhjCN
   DYVpE/DkowXeulRORnk28ko9v6BP+b9Q6gzkTsXQAABT8MrQeVbdYEsbv
   xbwzAuNSnYvpY7FlKAUTmZ5LS7I2+nLTUtROb5Os5EcZkR19SSbGDRl5e
   uTr1MrLvYpE4fJUhaFNLM28tPmv4ei3XCdayGGA6oUokfX1U8ynccQlNS
   0b8VbTbWa+gxWC4pMDLANp5wrVy+Xq3pFJXKyITjUFZJNNiDEo5TQSliw
   xtxh6BlL22FoHR19W+hA3Vh6/TLYHARGaY80ChbcDscvoXML/GilEH5xF
   g==;
X-CSE-ConnectionGUID: 80uezZ8uTjitonbssVj8Jg==
X-CSE-MsgGUID: O6Sb4MX8SIGwoDGfP/dJsw==
X-IPAS-Result: =?us-ascii?q?A0AnAAByt1lq/4v/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJA4xviVgDnhsUgWoPAQEBD0QNBAEBhQUCjVICJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLysjC?=
 =?us-ascii?q?BAJgwIBgnQCARG8eho3giyBAYMoAYFU2y4BCxQBgTgBhT6IIFwYAUSEOCcbG?=
 =?us-ascii?q?4FygRWBO4IugQWBXAIDgSCHAgSCInoSgVoeMoFKfYF6iw5IgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6gQCEdiMfAzl/gS91SnctaQESF?=
 =?us-ascii?q?4FOghSBPgMLGA1IESw3FBsEPm4HjUgjgU9pBwF6EwErRjk1HRscFw0cHhGSV?=
 =?us-ascii?q?wwbJ49lgiGBNZ9aCiiDdYwhj0KFeBozhASUF5JRC5h9jgqVNIEchGmBaDyBW?=
 =?us-ascii?q?XAVO4JnCUoZD44oBQsLg2CFE8lFJDUCCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:sA8i5azy4EdlvhxuiLh6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 TNKW26OO/jYYGP0et9zOY62/RhSvMPXnNdgSwBpr1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYrazxMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBFuIIAKyLZqPWNP6
 fseIisWUBLTpe3jldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCwaICFK4zaGJg9ckCwg
 Tz99TjcMkEhFfOAzhaq/Erris3UgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:/7Rzb6vbhiJtTM1FKfDfoT5n7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AESlijmjxRo1JfXacAzyfD32T6zJuIiXAwWXic1K?=
 =?us-ascii?q?EC2d1T7ufUkSu+vNGnJ87?=
X-Talos-MUID: 9a23:fRl72AnwMDeFq08IOZupdnpFavxiv4GeWHssvooBl+aKDWt8GSyC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="502898855"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:21:01 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 73C5818000237;
	Fri, 17 Jul 2026 05:21:01 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id C2AD0CBEF8A; Thu, 16 Jul 2026 22:21:00 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashishkumar Parmar <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 5/6] rsync: Fix CVE-2026-43617
Date: Thu, 16 Jul 2026 22:20:58 -0700
Message-Id: <20260717052059.773645-6-asparmar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241119

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43617. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd0c0c483786ab224a36e14bf43
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-rjfm-3w2m-jf4f

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
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

