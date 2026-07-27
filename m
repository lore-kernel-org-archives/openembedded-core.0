Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8207C53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43795.1785192978597790976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AlmaoS2E;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b966dd74so20121375e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192977; x=1785797777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Llcd8N4eIBg0A0szl7RMNdk04OLH3nKppr+UE+F5jg=;
        b=AlmaoS2EBi63sLKmNMuASl8XfGr/KuIGLZpqjgmpF9psAjyO82pCiLAc5gX2rrKTzP
         gXtNVSBnPjm/O2mlqlB6lAAlQQbYsUuEGQZpiAMIfKciHd4Pd88GLw5nuGb1fEosBTOH
         XTSBVlULICG6A6sCFiAOFWzGvXrcm3fyOTI70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192977; x=1785797777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Llcd8N4eIBg0A0szl7RMNdk04OLH3nKppr+UE+F5jg=;
        b=m6y8/Uv6XruaA+OyXEVTevpWdfhMjRWzAdnsOmO67pyJ1Zlc55u9gjDck2ooljDL4O
         GnJOgWoXs08Ag7598mQbFHQqQVGWxgzyTc+SSDCmoeGn1A7fHixSiwSSuEIYT/9vAPuv
         F1eAChSrFideKa4PzLTDQiZiEefW6YCIrYvhLh9Z4jZvSc1sHNnNn76YVmYoIqPMbNLD
         oU9cH1wX/jLI61dGJgN+brM7kEA0YmMwhZUgiZfQ2/kBQi8HXObthMKFjbkPm7d0csjw
         JK/USYf6caNoh2WzQ8X4EMpzCf7SUC+TiZIuSZf1sl0tXCXAFmieeoi7eRAk0YlRCg5s
         VRMg==
X-Gm-Message-State: AOJu0Yxkq9Nm0+EEZe6n0205jmQShh5KUHYHO6ZP9KN6Hyc3I3WTS7mc
	V8LjTg102Yj407hCdsvTaiN7GvmqZd01V6OcUNkDT0z6Nlwqr51KqtMtvgmchUJzGtKoa6TP63u
	0fJspBsM=
X-Gm-Gg: AR+sD10mDBcVMHWxtkm3rCR0G/KbdpecOmDtHhpBYTWG+g4h7xl2mHlpXsWCSJSiuAD
	CdOHIDpMRC+5U54DVBI9tZpWoAaooPW+/CUzHRNgnTsdTaki6U1LddnYsLJvAozpzqv1b9mGGx4
	nEexI2XpSz7VPEVS/d+WhST2tbjw4ilhQtkeBljY5YIQPsUaE5/g7aJyKiOlunQDJW+HlFwttwB
	ic9UlVVKkn5XaneL7lsUMjaSIBK053c6ymX/ued44zfQ5yF4OFBuBvk8Nd7bMMqgnyO10tdKEF2
	nE/kDyXhhPSFf0dWSbOjqDK3tULI+NDR1iAnSiYAbCM24hIVFghQJG1Vc9wi5PAtcMBRtmhPzza
	fV1F5okhcl96AM1Wtt9+xUd476nWJo7jAUNOrly2P0q1olZGk6U6Sr0kVbockd2Bti0E+jIvPXm
	oU/euViDmQvDCpPRnX9Kjm8lNGjbZyn1XyoSkn2/y1kDy7Vyutd6zmAF/gHkYlcq3WP0wSXba2L
	ol20Q==
X-Received: by 2002:a05:600c:4594:b0:495:7287:293f with SMTP id 5b1f17b1804b1-496c4fe0969mr8417775e9.35.1785192976734;
        Mon, 27 Jul 2026 15:56:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/36] rsync: Fix CVE-2026-43617
Date: Tue, 28 Jul 2026 00:55:24 +0200
Message-ID: <8e83a7aa0f82ffea3e57a7025b5985b0d1a04046.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242118

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43617. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c38f20c5ffabacd0c0c483786ab224a36e14bf43
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-rjfm-3w2m-jf4f

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rsync/files/CVE-2026-43617.patch          | 201 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43617.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
new file mode 100644
index 00000000000..5b3190224ed
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
index 2145d4ce7e3..d0d57defe8d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p6.patch \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
+           file://CVE-2026-43617.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 

