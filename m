Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D0ECD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:15:30 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69073.1781266525082939688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SKolFxee;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=133376; q=dns/txt;
  s=iport01; t=1781266525; x=1782476125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pRNQ/DfPY7hCCKJG9BPvUwSumYsZpdMf6iiyEQy3eeI=;
  b=SKolFxeeNudDgGxcPerGjwdJFa41uAeHgMauGmF/4HGeXzgr3lhjjV4F
   3pWbizE5dOpzZhRv97fs2WQ8RSFI2rSL9S2w1lwSokex+Son0NbM+BRNU
   1qAWo+gN5xNhO7GxK7NNUH83uNWcUTAFfwbX5lY68snqJa16gV9yS6c2T
   VE2KFSH4G4xDFiZLLBFcj8S8Jpzch/PuzG4y9yZ0nhluQTNKDB/ha0ygF
   YSsK7PpUDNfU69s3nb7Xrjs/YQTbUGTCcyLi7rSavRddL51KEziTorp2F
   9O/Dyb0vzKF8f/qvwae+tUdjKyf0p7IYdPbbWbyaneYP6el9zwykKCJNG
   g==;
X-CSE-ConnectionGUID: i4wuTzm1T+KMMorm2hugVA==
X-CSE-MsgGUID: BVimmvsHRfSX0hxhOwcUng==
X-IPAS-Result: =?us-ascii?q?A0AIAADf9ytq/4r/Ja1RCRoBAQEBAQEBAQEBAwEBAQESA?=
 =?us-ascii?q?QEBAQICAQEBAYF+AwEBAQELAYJWdF8ZKUkDhFSRdAOBE5A3hjaBPIIAgl8Ug?=
 =?us-ascii?q?WoPAQEBD0QJBAQBAYISgnQCjUACJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGFQgyDYZaAQIBAxoBCAQLARgBLRAcAwECAwImAgIrIwgQC?=
 =?us-ascii?q?R+CYwGCcwIBEbJGGjd6fzOBAYMoAT8CQ1DbLAELFAEFgQUuAYU+gxwBhQJbG?=
 =?us-ascii?q?AGCSYIzJxsbgXKBFAGBFySBOHaBBYFcAgIBF4EACRESAQU6gzWCagSCInoSg?=
 =?us-ascii?q?VoDHjQeTIE3gX2KGUiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbB?=
 =?us-ascii?q?wWBSoEraoEDhQ0jHwM5f4F0gShnaRUwNYEBARESAwsYDUgRLDcUGwQ9AW4Hj?=
 =?us-ascii?q?CkZFw+BbwwjDgsCBAEBDR8EDBscBwkBCQEHAwkYGgYCJAIILwYMBwEWBR0DA?=
 =?us-ascii?q?QIhBQYBBB8BBBECCQYCDggPAgOSPQYdBwEBARMlj2WCIYE1njmBIQoog3WMI?=
 =?us-ascii?q?Y9ChXgaM4QEgVeSQJE6gRcLmH2CWYsxlTQHLWgrhD2BbwcugVlwFTuCZwlKG?=
 =?us-ascii?q?Q9XijWCfx8DCwuDYIJWgj2BPcFBJDUCCQMvAQEHAgcOAwuBaJAAAiYEA25gA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:t/AV2a34mQHivf4WtvbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzZTx
 jMbXTiBOquOajf2fIh3aoqwphwHusPRz98yGgU53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AtaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDR0pILEK/79LQkJr0
 PsCLWoNcx+9rrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+OS8bICLIoXQGa25mG6ym
 GPD+nriIisUD+zHySqF1W2nu+nAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:8dkRuaHUvqK1MLQapLqENseALOsnbusQ8zAXPo5KJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAdGSS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jcjpy1iZNNXN77V1TLu
 vm2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3AYTFhE2u59cxlILZAnhiwHcHe6IskLmLA8GXVenP?=
 =?us-ascii?q?7KkNMT6eQE1+N951Nxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxlevNg29J7COWbfboUs39ZIR8zUjyZqvDUUTirU?=
 =?us-ascii?q?8tfK0bSxgOxCChwmxTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="494260124"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:15:22 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id DCD48180001C5;
	Fri, 12 Jun 2026 12:15:21 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 5B633CBF202; Fri, 12 Jun 2026 05:15:21 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/6] rsync: Fix CVE-2026-43619
Date: Fri, 12 Jun 2026 05:13:30 -0700
Message-ID: <20260612121514.2282121-2-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260612121514.2282121-1-asparmar@cisco.com>
References: <20260612121514.2282121-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238610

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream backport [1] for CVE-2026-43619 as mentioned in [8],
where receiver-side chmod could follow symlink-race path escapes.

Also include the upstream dependency fixes needed by the CVE fix:
- CVE-2026-43619-dependent_p1.patch [2] adds
  openat2(RESOLVE_BENEATH) based secure path resolution on Linux.
- CVE-2026-43619-dependent_p2.patch [3] adds O_RESOLVE_BENEATH based
  secure path resolution on FreeBSD and macOS.
- CVE-2026-43619-dependent_p3.patch [4] skips the regression test on
  platforms without an equivalent beneath resolver.
- CVE-2026-43619_p2.patch [5] secures change_dir() against
  symlink-race chdir escapes.
- CVE-2026-43619_p3.patch [6] adds symlink-race-safe do_*_at()
  wrappers.
- CVE-2026-43619_p4.patch [7] secures copy_file source and
  destination opens.

[1] https://github.com/RsyncProject/rsync/commit/24852cda3db38e2f2cd78a13703373c77f75f4d5
[2] https://github.com/RsyncProject/rsync/commit/72d1cf1c288e5c526e906db2edafbf3d55762668
[3] https://github.com/RsyncProject/rsync/commit/61d987c54a472d88855c5fbef3a4c7b51696f93a
[4] https://github.com/RsyncProject/rsync/commit/2b3f8aacc7eca828574a304a0f2b88fbcdaa04e3
[5] https://github.com/RsyncProject/rsync/commit/d22b6bc7d1b1d7be9df1c0c6db1599cb7d5fd82c
[6] https://github.com/RsyncProject/rsync/commit/39b3074a1ab18705cd685fe0659fc958c8cd3db5
[7] https://github.com/RsyncProject/rsync/commit/a277a06b1017b4cf6bb0fe33d5823869ed02dfd9
[8] https://www.cve.org/CVERecord?id=CVE-2026-43619

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../files/CVE-2026-43619-dependent_p1.patch   |  396 ++++
 .../files/CVE-2026-43619-dependent_p2.patch   |  100 +
 .../files/CVE-2026-43619-dependent_p3.patch   |   54 +
 .../rsync/files/CVE-2026-43619_p1.patch       |  471 +++++
 .../rsync/files/CVE-2026-43619_p2.patch       |  207 ++
 .../rsync/files/CVE-2026-43619_p3.patch       | 1784 +++++++++++++++++
 .../rsync/files/CVE-2026-43619_p4.patch       |  570 ++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |    7 +
 8 files changed, 3589 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p1.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p3.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p1.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p1.patch
new file mode 100644
index 0000000000..882a0ebbbe
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p1.patch
@@ -0,0 +1,396 @@
+From e3ee2484239b004c852f71fdb57ca9f91e254689 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 30 Apr 2026 08:39:22 +1000
+Subject: [PATCH] syscall: use openat2(RESOLVE_BENEATH) on Linux for
+ secure_relative_open
+
+The CVE fix in commit c35e283 made secure_relative_open() walk every
+component of relpath with O_NOFOLLOW. That blocks every symlink in the
+path, which is stricter than the threat model required: legitimate
+directory symlinks within the destination tree (e.g. when using -K /
+--copy-dirlinks) are also rejected, breaking delta transfers with
+"failed verification -- update discarded".  See issue #715.
+
+On Linux 5.6+, openat2(RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS) gives
+us exactly what we want: the kernel rejects any resolution that would
+escape the starting directory (via "..", absolute paths, or symlinks
+pointing outside dirfd) while still following symlinks that resolve
+within it. /proc magic-links are blocked too.
+
+Use openat2 first; fall back to the existing per-component O_NOFOLLOW
+walk on ENOSYS (kernel < 5.6). The lexical "../" checks at the head
+of the function are kept as defense in depth. The Linux gate is
+plain #ifdef __linux__: the runtime ENOSYS fallback covers the only
+case that actually matters (header present + old kernel), and any
+Linux build environment without linux/openat2.h will fail with a
+clear "no such file" error rather than silently disabling the
+protection.
+
+Verified manually that openat2(RESOLVE_BENEATH) blocks all four
+escape patterns (absolute symlink, ../ symlink, lexical .., absolute
+path) while allowing direct and within-tree symlinks. The new
+testsuite/symlink-dirlink-basis.test (taken from PR #864 by Samuel
+Henrique) exercises the issue #715 regression and passes; full
+make check passes 47/47.
+
+Test: testsuite/symlink-dirlink-basis.test (8 scenarios)
+Fixes: https://github.com/RsyncProject/rsync/issues/715
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/72d1cf1c288e5c526e906db2edafbf3d55762668]
+
+(cherry picked from commit 72d1cf1c288e5c526e906db2edafbf3d55762668)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ syscall.c                            |  64 ++++++-
+ testsuite/symlink-dirlink-basis.test | 247 +++++++++++++++++++++++++++
+ 2 files changed, 305 insertions(+), 6 deletions(-)
+ create mode 100755 testsuite/symlink-dirlink-basis.test
+
+diff --git a/syscall.c b/syscall.c
+index 2a4d1f83..7fbfe334 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -33,6 +33,11 @@
+ #include <sys/syscall.h>
+ #endif
+ 
++#ifdef __linux__
++#include <sys/syscall.h>
++#include <linux/openat2.h>
++#endif
++
+ #include "ifuncs.h"
+ 
+ extern int dry_run;
+@@ -720,12 +725,49 @@ int do_open_nofollow(const char *pathname, int flags)
+ /*
+   open a file relative to a base directory. The basedir can be NULL,
+   in which case the current working directory is used. The relpath
+-  must be a relative path, and the relpath must not contain any
+-  elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
+-  applies to all path components, not just the last component)
+-
+-  The relpath must also not contain any ../ elements in the path
++  must be a relative path. The kernel must guarantee that resolution
++  cannot escape basedir (or the cwd, when basedir is NULL): no ".."
++  jumps above the start, no symlinks pointing outside, no absolute
++  paths, no /proc magic-link tricks.
++
++  Symlinks *within* basedir are followed normally — earlier rsync
++  versions rejected every symlink with O_NOFOLLOW on each component,
++  which broke legitimate directory symlinks on the receiver side
++  (https://github.com/RsyncProject/rsync/issues/715). The escape
++  prevention is handled by the kernel via openat2(RESOLVE_BENEATH)
++  on Linux 5.6+; older systems fall back to the per-component
++  O_NOFOLLOW walk below.
++
++  The relpath must also not contain any ../ elements in the path.
+ */
++
++#ifdef __linux__
++static int secure_relative_open_linux(const char *basedir, const char *relpath, int flags, mode_t mode)
++{
++	struct open_how how;
++	int dirfd, retfd;
++
++	memset(&how, 0, sizeof how);
++	how.flags = flags;
++	how.mode = mode;
++	how.resolve = RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;
++
++	if (basedir == NULL) {
++		dirfd = AT_FDCWD;
++	} else {
++		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
++		if (dirfd == -1)
++			return -1;
++	}
++
++	retfd = syscall(SYS_openat2, dirfd, relpath, &how, sizeof how);
++
++	if (dirfd != AT_FDCWD)
++		close(dirfd);
++	return retfd;
++}
++#endif
++
+ int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
+ {
+ 	if (!relpath || relpath[0] == '/') {
+@@ -739,7 +781,17 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
+ 		return -1;
+ 	}
+ 
+-#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY)
++#ifdef __linux__
++	{
++		int fd = secure_relative_open_linux(basedir, relpath, flags, mode);
++		/* ENOSYS = kernel < 5.6 doesn't have the syscall even though
++		 * glibc/kernel-headers do; fall through to the portable path. */
++		if (fd != -1 || errno != ENOSYS)
++			return fd;
++	}
++#endif
++
++#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
+ 	// really old system, all we can do is live with the risks
+ 	if (!basedir) {
+ 		return open(relpath, flags, mode);
+diff --git a/testsuite/symlink-dirlink-basis.test b/testsuite/symlink-dirlink-basis.test
+new file mode 100755
+index 00000000..9065dd81
+--- /dev/null
++++ b/testsuite/symlink-dirlink-basis.test
+@@ -0,0 +1,247 @@
++#!/bin/sh
++
++# Test that updating a file through a directory symlink works when using
++# -K (--copy-dirlinks). This is a regression test for:
++#   https://github.com/RsyncProject/rsync/issues/715
++#
++# The CVE fix in commit c35e283 introduced secure_relative_open() which
++# uses O_NOFOLLOW on all path components, breaking legitimate directory
++# symlinks on the receiver side. The fix splits the path into basedir
++# (dirname, symlinks followed) and basename (O_NOFOLLOW) so that
++# directory symlinks are traversed while the final file component is
++# still protected.
++#
++# The regression only manifests when delta matching is triggered (i.e.,
++# the sender finds matching blocks in the old file). Small files with
++# completely different content are transferred in full and don't trigger
++# the bug. We use a large file with a small modification to ensure
++# delta transfer is used.
++#
++# In addition to the original regression, this test covers edge cases
++# in the fix itself:
++#   - --backup with directory symlinks (finish_transfer pointer identity)
++#   - --partial-dir with protocol < 29 (fnamecmp != partialptr guard)
++#   - --inplace with directory symlinks (updating_basis_or_equiv check)
++#   - Files without a dirname (top-level files, no split needed)
++
++. "$suitedir/rsync.fns"
++
++RSYNC_RSH="$scratchdir/src/support/lsh.sh"
++export RSYNC_RSH
++
++# $HOME is set to $scratchdir by rsync.fns
++# localhost: destination will cd to $HOME (i.e., $scratchdir)
++
++# Helper: create a large file suitable for delta transfers.
++# ~32KB is large enough for rsync's block matching to find matches.
++make_testfile() {
++    dd if=/dev/urandom of="$1" bs=1024 count=32 2>/dev/null \
++	|| test_fail "failed to create test file $1"
++}
++
++# Set up source tree
++srcbase="$tmpdir/src"
++
++######################################################################
++# Test 1: Basic directory symlink update (the original issue #715)
++######################################################################
++
++mkdir -p "$HOME/real-dir"
++ln -s real-dir "$HOME/dir"
++
++mkdir -p "$srcbase/dir"
++make_testfile "$srcbase/dir/file"
++
++# First transfer (initial): should create the file through the symlink
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 1: initial transfer failed"
++
++if [ ! -f "$HOME/real-dir/file" ]; then
++    test_fail "test 1: initial transfer did not create file through symlink"
++fi
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 1: initial transfer content mismatch"
++
++# Small modification to trigger delta transfer
++echo "appended update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++# Second transfer (update): was failing with "failed verification"
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 1: update through directory symlink failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 1: update transfer content mismatch"
++
++######################################################################
++# Test 2: Compression (-z) as in the original reproducer
++######################################################################
++
++echo "another line" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptzv --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 2: compressed update through directory symlink failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 2: compressed update content mismatch"
++
++######################################################################
++# Test 3: Nested directory symlinks (nested/sub/data.txt where
++#          "nested" is a symlink to "nested_real")
++######################################################################
++
++mkdir -p "$HOME/nested_real/sub"
++ln -s nested_real "$HOME/nested"
++
++mkdir -p "$srcbase/nested/sub"
++make_testfile "$srcbase/nested/sub/data.txt"
++
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path="$RSYNC" nested/sub/data.txt localhost:) \
++    || test_fail "test 3: initial nested transfer failed"
++
++echo "appended nested" >> "$srcbase/nested/sub/data.txt"
++sleep 1
++touch "$srcbase/nested/sub/data.txt"
++
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path="$RSYNC" nested/sub/data.txt localhost:) \
++    || test_fail "test 3: update through nested directory symlink failed"
++
++diff "$srcbase/nested/sub/data.txt" "$HOME/nested_real/sub/data.txt" >/dev/null \
++    || test_fail "test 3: nested update content mismatch"
++
++######################################################################
++# Test 4: --backup with directory symlinks
++#
++# Exercises the finish_transfer() "fnamecmp == fname" pointer
++# comparison that determines whether to update fnamecmp to the
++# backup name. If broken, --backup would reference a renamed file
++# for xattr handling.
++######################################################################
++
++# Reset destination
++rm -f "$HOME/real-dir/file" "$HOME/real-dir/file~"
++
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 4: initial transfer for backup test failed"
++
++echo "backup update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --backup --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 4: update with --backup through directory symlink failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 4: backup update content mismatch"
++
++if [ ! -f "$HOME/real-dir/file~" ]; then
++    test_fail "test 4: backup file was not created"
++fi
++
++######################################################################
++# Test 5: --inplace with directory symlinks
++#
++# Exercises the updating_basis_or_equiv check which uses
++# "fnamecmp == fname". With --inplace, rsync writes directly to
++# the destination file instead of a temp file.
++######################################################################
++
++rm -f "$HOME/real-dir/file" "$HOME/real-dir/file~"
++
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --inplace --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 5: initial inplace transfer failed"
++
++echo "inplace update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --inplace --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 5: inplace update through directory symlink failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 5: inplace update content mismatch"
++
++######################################################################
++# Test 6: Top-level file (no dirname, no split needed)
++#
++# Ensures the dirname/basename split is not attempted for files
++# at the top level (file->dirname is NULL).
++######################################################################
++
++make_testfile "$srcbase/topfile"
++mkdir -p "$HOME"
++
++(cd "$srcbase" && $RSYNC -Rlptv --rsync-path="$RSYNC" topfile localhost:) \
++    || test_fail "test 6: initial top-level transfer failed"
++
++echo "toplevel update" >> "$srcbase/topfile"
++sleep 1
++touch "$srcbase/topfile"
++
++(cd "$srcbase" && $RSYNC -Rlptv --rsync-path="$RSYNC" topfile localhost:) \
++    || test_fail "test 6: top-level update failed"
++
++diff "$srcbase/topfile" "$HOME/topfile" >/dev/null \
++    || test_fail "test 6: top-level update content mismatch"
++
++######################################################################
++# Test 7: --partial-dir with protocol < 29
++#
++# For protocol < 29, fnamecmp_type stays FNAMECMP_FNAME even when
++# fnamecmp is set to partialptr. The dirname/basename split must
++# NOT trigger in this case (guarded by "fnamecmp == fname").
++######################################################################
++
++rm -f "$HOME/real-dir/file"
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=28 --partial-dir=.rsync-partial \
++    --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 7: initial proto28 partial-dir transfer failed"
++
++echo "partial-dir update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=28 --partial-dir=.rsync-partial \
++    --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 7: proto28 partial-dir update through dirlink failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 7: proto28 partial-dir update content mismatch"
++
++######################################################################
++# Test 8: Protocol < 29 basic directory symlink update
++#
++# Exercises the protocol < 29 code path and its fallback logic
++# (clearing basedir on retry).
++######################################################################
++
++rm -f "$HOME/real-dir/file"
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=28 \
++    --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 8: initial proto28 transfer failed"
++
++echo "proto28 update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=28 \
++    --rsync-path="$RSYNC" dir/file localhost:) \
++    || test_fail "test 8: proto28 update through directory symlink failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 8: proto28 update content mismatch"
++
++# The script would have aborted on error, so getting here means we've won.
++exit 0
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p2.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p2.patch
new file mode 100644
index 0000000000..5fdf9ff3ba
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p2.patch
@@ -0,0 +1,100 @@
+From 6a39840c5b45f6c5d303e7e0ddf4ed1c5bbf30fd Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 30 Apr 2026 08:44:11 +1000
+Subject: [PATCH] syscall: also use O_RESOLVE_BENEATH on FreeBSD and MacOS
+
+FreeBSD and MacOS have O_RESOLVE_BENEATH as an openat() flag with the same
+"must not escape dirfd" semantics as Linux's RESOLVE_BENEATH. The
+kernel rejects ".." escapes, absolute symlinks, and symlinks whose
+target lies outside dirfd, while still following symlinks that
+resolve within it -- the same trade-off that fixes issue #715 on
+Linux.
+
+Add a parallel BSD path in secure_relative_open(), gated on
+declared. Unlike Linux, BSD doesn't have the header/runtime split
+where the symbol can exist without kernel support, so no runtime
+fallback is needed: if the flag compiles in, the kernel honours it.
+
+OpenBSD and NetBSD have no equivalent kernel primitive and continue
+to use the existing per-component O_NOFOLLOW walk; issue #715
+remains visible on those platforms (a userland resolver or
+unveil(2)-based fence would be follow-up work).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/61d987c54a472d88855c5fbef3a4c7b51696f93a]
+
+(cherry picked from commit 61d987c54a472d88855c5fbef3a4c7b51696f93a)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ syscall.c | 40 +++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/syscall.c b/syscall.c
+index 7fbfe334..8aab2cc0 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -734,9 +734,13 @@ int do_open_nofollow(const char *pathname, int flags)
+   versions rejected every symlink with O_NOFOLLOW on each component,
+   which broke legitimate directory symlinks on the receiver side
+   (https://github.com/RsyncProject/rsync/issues/715). The escape
+-  prevention is handled by the kernel via openat2(RESOLVE_BENEATH)
+-  on Linux 5.6+; older systems fall back to the per-component
+-  O_NOFOLLOW walk below.
++  prevention is handled by:
++    Linux 5.6+:                openat2(RESOLVE_BENEATH)
++    FreeBSD 13+:               openat() with O_RESOLVE_BENEATH
++    macOS 15+ / iOS 18+:       openat() with O_RESOLVE_BENEATH (same
++                               flag name, picked up by the same #ifdef;
++                               flag value differs from FreeBSD)
++  Other systems fall back to the per-component O_NOFOLLOW walk below.
+ 
+   The relpath must also not contain any ../ elements in the path.
+ */
+@@ -768,6 +772,32 @@ static int secure_relative_open_linux(const char *basedir, const char *relpath,
+ }
+ #endif
+ 
++#ifdef O_RESOLVE_BENEATH
++/* FreeBSD 13+ and macOS 15+ (Sequoia) / iOS 18+: O_RESOLVE_BENEATH is
++ * an openat() flag with the same "must not escape dirfd" semantics as
++ * Linux's RESOLVE_BENEATH. The kernel rejects ".." escapes, absolute
++ * symlinks, and symlinks whose target lies outside dirfd. (FreeBSD and
++ * Apple use different flag bit values, but the same symbolic name.) */
++static int secure_relative_open_resolve_beneath(const char *basedir, const char *relpath, int flags, mode_t mode)
++{
++	int dirfd, retfd;
++
++	if (basedir == NULL) {
++		dirfd = AT_FDCWD;
++	} else {
++		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
++		if (dirfd == -1)
++			return -1;
++	}
++
++	retfd = openat(dirfd, relpath, flags | O_RESOLVE_BENEATH, mode);
++
++	if (dirfd != AT_FDCWD)
++		close(dirfd);
++	return retfd;
++}
++#endif
++
+ int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
+ {
+ 	if (!relpath || relpath[0] == '/') {
+@@ -791,6 +821,10 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
+ 	}
+ #endif
+ 
++#ifdef O_RESOLVE_BENEATH
++	return secure_relative_open_resolve_beneath(basedir, relpath, flags, mode);
++#endif
++
+ #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
+ 	// really old system, all we can do is live with the risks
+ 	if (!basedir) {
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p3.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p3.patch
new file mode 100644
index 0000000000..c42c80ce3d
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619-dependent_p3.patch
@@ -0,0 +1,54 @@
+From 8464e4322012b0a9e418d8172a710e2717b8ec6e Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 30 Apr 2026 09:00:09 +1000
+Subject: [PATCH] testsuite: skip symlink-dirlink-basis on platforms without
+ RESOLVE_BENEATH
+
+secure_relative_open() has a kernel-enforced "stay below dirfd" path
+on Linux 5.6+ (openat2 RESOLVE_BENEATH) and FreeBSD 13+ (openat
+O_RESOLVE_BENEATH). On Solaris, OpenBSD, NetBSD, and Cygwin the code
+falls back to the per-component O_NOFOLLOW walk, which by design
+rejects every directory symlink in the path -- the very case this
+test exercises. Mark the test skipped there rather than have it
+fail with a known regression that's tracked separately.
+
+macOS is intentionally not in the skip list: although it does not
+have O_RESOLVE_BENEATH either, the test passes there in practice;
+investigation of the underlying reason is left as follow-up.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/2b3f8aacc7eca828574a304a0f2b88fbcdaa04e3]
+
+(cherry picked from commit 2b3f8aacc7eca828574a304a0f2b88fbcdaa04e3)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ testsuite/symlink-dirlink-basis.test | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/testsuite/symlink-dirlink-basis.test b/testsuite/symlink-dirlink-basis.test
+index 9065dd81..a14eb5cf 100755
+--- a/testsuite/symlink-dirlink-basis.test
++++ b/testsuite/symlink-dirlink-basis.test
+@@ -26,6 +26,18 @@
+ 
+ . "$suitedir/rsync.fns"
+ 
++# secure_relative_open() uses kernel-enforced "stay below dirfd" via
++# openat2(RESOLVE_BENEATH) on Linux 5.6+ and openat(O_RESOLVE_BENEATH)
++# on FreeBSD 13+. Other platforms fall back to a per-component
++# O_NOFOLLOW walk that rejects every symlink including legitimate
++# directory symlinks -- the very case this test exercises. Skip on
++# those rather than report a known failure.
++case "$(uname -s)" in
++    SunOS|OpenBSD|NetBSD|CYGWIN*)
++	test_skipped "secure_relative_open lacks RESOLVE_BENEATH equivalent on $(uname -s); issue #715 still affects this platform"
++	;;
++esac
++
+ RSYNC_RSH="$scratchdir/src/support/lsh.sh"
+ export RSYNC_RSH
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch
new file mode 100644
index 0000000000..c667134918
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch
@@ -0,0 +1,471 @@
+From 7902b4968bb181d0bfd90d0c2ee5349bcff92286 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Mon, 4 May 2026 21:53:14 +1000
+Subject: [PATCH] syscall+receiver: secure receiver-side do_chmod against
+ symlink-race TOCTOU
+
+CVE-2026-29518's fix routed the receiver's open() through
+secure_relative_open(), but every other path-based syscall the
+receiver runs on sender-controllable paths is vulnerable to the
+same TOCTOU primitive. This commit closes the chmod variant.
+
+Add do_chmod_at() that opens the parent of fname under
+secure_relative_open() and uses fchmodat() against the resulting
+dirfd. Gate the secure path on am_daemon && !am_chrooted (the same
+gate use_secure_symlinks already uses for the receiver basis-file
+open), so non-daemon callers and chrooted daemons keep the original
+do_chmod() fast path.
+
+Migrate the receiver-side do_chmod() call sites in delete.c,
+generator.c, rsync.c, and xattrs.c.
+
+Adds testsuite/chmod-symlink-race.test (with t_chmod_secure helper)
+as regression coverage.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/24852cda3db38e2f2cd78a13703373c77f75f4d5]
+
+Backport Changes:
+- Adapted Makefile.in test-helper context for rsync 3.2.7, which does not
+  have the upstream simdtest target. No security source change was omitted.
+
+(cherry picked from commit 24852cda3db38e2f2cd78a13703373c77f75f4d5)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Makefile.in                       |  10 ++-
+ delete.c                          |   4 +-
+ generator.c                       |   4 +-
+ rsync.c                           |   2 +-
+ syscall.c                         |  80 ++++++++++++++++++++
+ t_chmod_secure.c                  | 117 ++++++++++++++++++++++++++++++
+ t_stub.c                          |   2 +
+ testsuite/chmod-symlink-race.test |  68 +++++++++++++++++
+ xattrs.c                          |   6 +-
+ 9 files changed, 282 insertions(+), 11 deletions(-)
+ create mode 100644 t_chmod_secure.c
+ create mode 100755 testsuite/chmod-symlink-race.test
+
+diff --git a/Makefile.in b/Makefile.in
+index 7c80ba66..bc020b1b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -62,12 +62,13 @@ TLS_OBJ = tls.o syscall.o util2.o t_stub.o lib/compat.o lib/snprintf.o lib/perms
+ 
+ # Programs we must have to run the test cases
+ CHECK_PROGS = rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(EXEEXT) \
+-	testrun$(EXEEXT) trimslash$(EXEEXT) t_unsafe$(EXEEXT) wildtest$(EXEEXT)
++	testrun$(EXEEXT) trimslash$(EXEEXT) t_unsafe$(EXEEXT) t_chmod_secure$(EXEEXT) \
++	wildtest$(EXEEXT)
+ 
+ CHECK_SYMLINKS = testsuite/chown-fake.test testsuite/devices-fake.test testsuite/xattrs-hlink.test
+ 
+ # Objects for CHECK_PROGS to clean
+-CHECK_OBJS=tls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o trimslash.o wildtest.o
++CHECK_OBJS=tls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t_chmod_secure.o trimslash.o wildtest.o
+ 
+ # note that the -I. is needed to handle config.h when using VPATH
+ .c.o:
+@@ -184,6 +184,10 @@ T_UNSAFE_OBJ = t_unsafe.o syscall.o util1.o util2.o t_stub.o lib/compat.o lib/sn
+ t_unsafe$(EXEEXT): $(T_UNSAFE_OBJ)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_UNSAFE_OBJ) $(LIBS)
+ 
++T_CHMOD_SECURE_OBJ = t_chmod_secure.o syscall.o util1.o util2.o t_stub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o
++t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_CHMOD_SECURE_OBJ) $(LIBS)
++
+ .PHONY: conf
+ conf: configure.sh config.h.in
+ 
+diff --git a/delete.c b/delete.c
+index 4a294853..3a625610 100644
+--- a/delete.c
++++ b/delete.c
+@@ -98,7 +98,7 @@ static enum delret delete_dir_contents(char *fname, uint16 flags)
+ 
+ 		strlcpy(p, fp->basename, remainder);
+ 		if (!(fp->mode & S_IWUSR) && !am_root && fp->flags & FLAG_OWNED_BY_US)
+-			do_chmod(fname, fp->mode | S_IWUSR);
++			do_chmod_at(fname, fp->mode | S_IWUSR);
+ 		/* Save stack by recursing to ourself directly. */
+ 		if (S_ISDIR(fp->mode)) {
+ 			if (delete_dir_contents(fname, flags | DEL_RECURSE) != DR_SUCCESS)
+@@ -139,7 +139,7 @@ enum delret delete_item(char *fbuf, uint16 mode, uint16 flags)
+ 	}
+ 
+ 	if (flags & DEL_NO_UID_WRITE)
+-		do_chmod(fbuf, mode | S_IWUSR);
++		do_chmod_at(fbuf, mode | S_IWUSR);
+ 
+ 	if (S_ISDIR(mode) && !(flags & DEL_DIR_IS_EMPTY)) {
+ 		/* This only happens on the first call to delete_item() since
+diff --git a/generator.c b/generator.c
+index a890a43e..c3ace1c2 100644
+--- a/generator.c
++++ b/generator.c
+@@ -1499,7 +1499,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+ #ifdef HAVE_CHMOD
+ 		if (!am_root && (file->mode & S_IRWXU) != S_IRWXU && dir_tweaking) {
+ 			mode_t mode = file->mode | S_IRWXU;
+-			if (do_chmod(fname, mode) < 0) {
++			if (do_chmod_at(fname, mode) < 0) {
+ 				rsyserr(FERROR_XFER, errno,
+ 					"failed to modify permissions on %s",
+ 					full_fname(fname));
+@@ -2107,7 +2107,7 @@ static void touch_up_dirs(struct file_list *flist, int ndx)
+ 			continue;
+ 		fname = f_name(file, NULL);
+ 		if (fix_dir_perms)
+-			do_chmod(fname, file->mode);
++			do_chmod_at(fname, file->mode);
+ 		if (need_retouch_dir_times) {
+ 			STRUCT_STAT st;
+ 			if (link_stat(fname, &st, 0) == 0 && mtime_differs(&st, file)) {
+diff --git a/rsync.c b/rsync.c
+index b130aba5..cc46a2f9 100644
+--- a/rsync.c
++++ b/rsync.c
+@@ -657,7 +657,7 @@ int set_file_attrs(const char *fname, struct file_struct *file, stat_x *sxp,
+ 
+ #ifdef HAVE_CHMOD
+ 	if (!BITS_EQUAL(sxp->st.st_mode, new_mode, CHMOD_BITS)) {
+-		int ret = am_root < 0 ? 0 : do_chmod(fname, new_mode);
++		int ret = am_root < 0 ? 0 : do_chmod_at(fname, new_mode);
+ 		if (ret < 0) {
+ 			rsyserr(FERROR_XFER, errno,
+ 				"failed to set permissions on %s",
+diff --git a/syscall.c b/syscall.c
+index 8b39a6e2..bc883b4b 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -281,6 +281,86 @@ int do_chmod(const char *path, mode_t mode)
+ 		return code;
+ 	return 0;
+ }
++
++/*
++  Symlink-race-safe variant of do_chmod() for receiver-side use.
++
++  Threat model: on a daemon running with "use chroot = no" (the prerequisite
++  for CVE-2026-29518), a local attacker can race a symlink swap of one of
++  the parent directory components of a path the receiver is about to chmod.
++  Because chmod() resolves symlinks at every component, the swap redirects
++  the chmod outside the receiver's confinement.
++
++  Defence: open the *parent* directory of fname under secure_relative_open()
++  (which uses openat2(RESOLVE_BENEATH) on Linux 5.6+, openat() with
++  O_RESOLVE_BENEATH on FreeBSD 13+ and macOS 15+ (Sequoia), or a per-component
++  O_NOFOLLOW walk elsewhere) and do fchmodat() against that dirfd. A symlink
++  substituted into one of the parent components is then either followed
++  within the tree (legitimate dir-symlinks still work) or rejected by the
++  kernel (escape attempts fail).
++
++  Final-component handling matches do_chmod(): fchmodat() with flag 0
++  follows a symlink at the final component, which is the same behaviour as
++  chmod() and matches every current call site (the file being chmod'd is
++  one the receiver itself just created or transferred). For the rare case
++  where the caller wants to chmod a symlink-as-an-object (S_ISLNK in the
++  mode bits), we fall through to do_chmod() which has portability code for
++  that case.
++
++  Falls back to do_chmod() for absolute paths and for paths with no parent
++  component, where there is nothing to protect against.
++*/
++int do_chmod_at(const char *fname, mode_t mode)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	/* Only the daemon-without-chroot case is exposed to the symlink-
++	 * race attack: a chroot already confines the receiver, and a
++	 * non-daemon rsync runs with the user's own authority so a
++	 * symlink they planted can only redirect to files they could
++	 * already access.  Everywhere else, fall through to plain
++	 * do_chmod() to avoid the dirfd-open overhead on every call. */
++	if (!am_daemon || am_chrooted)
++		return do_chmod(fname, mode);
++
++	if (!fname || !*fname || *fname == '/' || S_ISLNK(mode))
++		return do_chmod(fname, mode);
++
++	slash = strrchr(fname, '/');
++	if (!slash)
++		return do_chmod(fname, mode);
++
++	dlen = slash - fname;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, fname, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = fchmodat(dfd, bname, mode, 0);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_chmod(fname, mode);
++#endif
++}
+ #endif
+ 
+ int do_rename(const char *old_path, const char *new_path)
+diff --git a/t_chmod_secure.c b/t_chmod_secure.c
+new file mode 100644
+index 00000000..114dfb2d
+--- /dev/null
++++ b/t_chmod_secure.c
+@@ -0,0 +1,117 @@
++/*
++ * Test harness for do_chmod_at(). Confirms the symlink-TOCTOU
++ * primitive used by CVE-2026-29518 (and its incomplete-fix follow-up
++ * for chmod) is closed by do_chmod_at(): a parent directory component
++ * being a symlink that escapes the receiver's confinement must be
++ * rejected, while a parent symlink that resolves *within* the tree
++ * must still work (so legitimate dir-symlinks are not regressed).
++ *
++ * Not linked into rsync itself.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include "rsync.h"
++
++#include <sys/stat.h>
++
++int dry_run = 0;
++int am_root = 0;
++int am_sender = 0;
++int read_only = 0;
++int list_only = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
++extern int am_daemon, am_chrooted;
++
++short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
++
++static int errs = 0;
++
++static void check(const char *label, int actual_rc, int expect_ok,
++		  const char *path, mode_t expected_mode)
++{
++	struct stat st;
++	int got_ok = (actual_rc == 0);
++	if (got_ok != expect_ok) {
++		fprintf(stderr, "FAIL [%s]: rc=%d errno=%d (%s), expected %s\n",
++			label, actual_rc, errno, strerror(errno),
++			expect_ok ? "success" : "rejection");
++		errs++;
++		return;
++	}
++	if (path && stat(path, &st) < 0) {
++		fprintf(stderr, "FAIL [%s]: stat(%s) failed: %s\n",
++			label, path, strerror(errno));
++		errs++;
++		return;
++	}
++	if (path && (st.st_mode & 07777) != expected_mode) {
++		fprintf(stderr,
++			"FAIL [%s]: %s mode is 0%o, expected 0%o\n",
++			label, path, st.st_mode & 07777, expected_mode);
++		errs++;
++		return;
++	}
++	fprintf(stderr, "OK   [%s]\n", label);
++}
++
++int main(int argc, char **argv)
++{
++	if (argc != 2) {
++		fprintf(stderr, "usage: %s <module-dir>\n", argv[0]);
++		return 2;
++	}
++	if (chdir(argv[1]) < 0) {
++		perror("chdir");
++		return 2;
++	}
++
++	/* Simulate the daemon-without-chroot deployment that do_chmod_at()
++	 * defends. With am_daemon=0 or am_chrooted=1 the wrapper falls
++	 * through to plain do_chmod() and the symlink-race test would be
++	 * meaningless. */
++	am_daemon = 1;
++	am_chrooted = 0;
++
++	/* Test layout (all inside the directory we just chdir'd to):
++	 *
++	 *     ./realdir/sentinel        -- regular target file
++	 *     ./inside_link -> realdir  -- legitimate dir-symlink within the tree
++	 *     ./escape_link -> ../trap  -- attacker swap, target outside tree
++	 *     ../trap/sentinel          -- the file the attacker wants to alter
++	 *
++	 * The shell wrapper that calls this helper has set both sentinel
++	 * files to mode 0600 so we have a clean baseline to compare.
++	 */
++
++	/* Scenario A: legitimate parent dir-symlink, chmod must succeed. */
++	int rc = do_chmod_at("inside_link/sentinel", 0640);
++	check("A: legit dir-symlink within tree",
++	      rc, 1, "realdir/sentinel", 0640);
++
++	/* Scenario B: parent symlink escapes the tree -- chmod must be
++	 * rejected and the outside file's mode must be unchanged. */
++	rc = do_chmod_at("escape_link/sentinel", 0666);
++	check("B: parent symlink escapes tree (the attack)",
++	      rc, 0, "../trap/sentinel", 0600);
++
++	/* Scenario C: plain relative path with no symlink components,
++	 * regression check that the safe wrapper doesn't break the
++	 * normal case. */
++	rc = do_chmod_at("realdir/sentinel", 0644);
++	check("C: plain relative path (regression check)",
++	      rc, 1, "realdir/sentinel", 0644);
++
++	/* Scenario D: top-level file, no parent directory component.
++	 * Falls back to do_chmod(); should succeed. */
++	rc = do_chmod_at("topfile", 0640);
++	check("D: top-level file, no parent component",
++	      rc, 1, "topfile", 0640);
++
++	if (errs)
++		fprintf(stderr, "%d failure(s)\n", errs);
++	return errs ? 1 : 0;
++}
+diff --git a/t_stub.c b/t_stub.c
+index 085378a8..904dac99 100644
+--- a/t_stub.c
++++ b/t_stub.c
+@@ -23,6 +23,8 @@
+ 
+ int do_fsync = 0;
+ int inplace = 0;
++int am_daemon = 0;
++int am_chrooted = 0;
+ int modify_window = 0;
+ int preallocate_files = 0;
+ int protect_args = 0;
+diff --git a/testsuite/chmod-symlink-race.test b/testsuite/chmod-symlink-race.test
+new file mode 100755
+index 00000000..48bbfbb4
+--- /dev/null
++++ b/testsuite/chmod-symlink-race.test
+@@ -0,0 +1,68 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for the symlink-TOCTOU class of bug applied to
++# chmod() on the receiver side. The CVE-2026-29518 fix used
++# secure_relative_open() for the basis-file open, but every other
++# path-based syscall the receiver runs on sender-controllable paths
++# is vulnerable to the same primitive: a local attacker swaps a
++# symlink into one of the parent directory components between the
++# receiver's check and its act, and the syscall escapes the module.
++#
++# This test exercises the new do_chmod_at() wrapper via the
++# t_chmod_secure helper. The helper sets up two scenarios:
++#   - a parent dir-symlink that resolves WITHIN the module tree
++#     (legitimate -K-style use, must continue to work)
++#   - a parent dir-symlink that escapes the module tree (the
++#     attack, must be rejected)
++# plus two regression scenarios (plain relative path, top-level
++# file) that just confirm the safe wrapper doesn't break the
++# normal case.
++#
++# The kernel-enforced "stay below dirfd" path resolution is
++# only available on Linux 5.6+, FreeBSD 13+, and macOS 15+.
++# Skip on platforms that fall back to per-component O_NOFOLLOW
++# (Solaris, OpenBSD, NetBSD, Cygwin); the per-component fallback
++# would also reject the attack but the legitimate dir-symlink
++# scenario would fail there.
++
++. "$suitedir/rsync.fns"
++
++case "$(uname -s)" in
++    SunOS|OpenBSD|NetBSD|CYGWIN*)
++	test_skipped "do_chmod_at relies on RESOLVE_BENEATH-equivalent kernel support not available on $(uname -s)"
++	;;
++esac
++
++mod="$scratchdir/module"
++trap_outside="$scratchdir/trap"
++rm -rf "$mod" "$trap_outside"
++mkdir -p "$mod/realdir" "$trap_outside"
++
++# Set up the four file-system objects the helper expects:
++echo bystander > "$mod/realdir/sentinel"
++chmod 0600 "$mod/realdir/sentinel"
++echo target > "$trap_outside/sentinel"
++chmod 0600 "$trap_outside/sentinel"
++ln -s realdir "$mod/inside_link"
++ln -s ../trap "$mod/escape_link"
++echo top > "$mod/topfile"
++chmod 0600 "$mod/topfile"
++
++"$TOOLDIR/t_chmod_secure" "$mod" || \
++    test_fail "t_chmod_secure reported failures (see stderr above)"
++
++# Sanity-check from the shell side too: the outside file's mode must
++# still be 0600 -- the helper checked this, but a second look from
++# the shell guards against a helper-internal stat() bug.
++mode=$(stat -c '%a' "$trap_outside/sentinel" 2>/dev/null \
++       || stat -f '%Lp' "$trap_outside/sentinel" 2>/dev/null)
++if [ "$mode" != "600" ]; then
++    test_fail "outside sentinel mode changed from 600 to $mode -- chmod escaped the module"
++fi
++
++exit 0
+diff --git a/xattrs.c b/xattrs.c
+index 65166eed..e5d0dd43 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -1086,7 +1086,7 @@ int set_xattr(const char *fname, const struct file_struct *file, const char *fna
+ 	 && !S_ISLNK(sxp->st.st_mode)
+ #endif
+ 	 && access(fname, W_OK) < 0
+-	 && do_chmod(fname, (sxp->st.st_mode & CHMOD_BITS) | S_IWUSR) == 0)
++	 && do_chmod_at(fname, (sxp->st.st_mode & CHMOD_BITS) | S_IWUSR) == 0)
+ 		added_write_perm = 1;
+ 
+ 	ndx = F_XATTR(file);
+@@ -1094,7 +1094,7 @@ int set_xattr(const char *fname, const struct file_struct *file, const char *fna
+ 	lst = &glst->xa_items;
+ 	int return_value = rsync_xal_set(fname, lst, fnamecmp, sxp);
+ 	if (added_write_perm) /* remove the temporary write permission */
+-		do_chmod(fname, sxp->st.st_mode);
++		do_chmod_at(fname, sxp->st.st_mode);
+ 	return return_value;
+ }
+ 
+@@ -1211,7 +1211,7 @@ int set_stat_xattr(const char *fname, struct file_struct *file, mode_t new_mode)
+ 	mode = (fst.st_mode & _S_IFMT) | (fmode & ACCESSPERMS)
+ 	     | (S_ISDIR(fst.st_mode) ? 0700 : 0600);
+ 	if (fst.st_mode != mode)
+-		do_chmod(fname, mode);
++		do_chmod_at(fname, mode);
+ 	if (!IS_DEVICE(fst.st_mode))
+ 		fst.st_rdev = 0; /* just in case */
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch
new file mode 100644
index 0000000000..44f966702e
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch
@@ -0,0 +1,207 @@
+From 7e54bf145c3aeebaaa8f049ab48fb4f77e000a02 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 5 May 2026 14:34:33 +1000
+Subject: [PATCH] util1: secure change_dir() against symlink-race chdir-escape
+
+The receiver's chdir(2) into a destination subdirectory followed
+attacker-planted symlinks at every path component. Once CWD
+escaped the module, every subsequent path-relative syscall (open,
+chmod, lchown, ...) inherited the escape -- defeating
+secure_relative_open's RESOLVE_BENEATH anchor against AT_FDCWD,
+since the anchor itself was now outside the module.
+
+Route change_dir's relative target through secure_relative_open()
+and fchdir() to the resulting dirfd in am_daemon && !am_chrooted
+mode, so the chdir step itself can no longer follow a parent-
+symlink. Same treatment applied to the CD_SKIP_CHDIR /
+set_path_only path so it also can't follow attacker symlinks
+during path tracking.
+
+Adds testsuite/sender-flist-symlink-leak.test covering the
+sender-side flist resolution variant of the same primitive.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/d22b6bc7d1b1d7be9df1c0c6db1599cb7d5fd82c]
+
+(cherry picked from commit d22b6bc7d1b1d7be9df1c0c6db1599cb7d5fd82c)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ testsuite/sender-flist-symlink-leak.test | 90 ++++++++++++++++++++++++
+ util1.c                                  | 56 +++++++++++++--
+ 2 files changed, 142 insertions(+), 4 deletions(-)
+ create mode 100755 testsuite/sender-flist-symlink-leak.test
+
+diff --git a/testsuite/sender-flist-symlink-leak.test b/testsuite/sender-flist-symlink-leak.test
+new file mode 100755
+index 00000000..011d93d0
+--- /dev/null
++++ b/testsuite/sender-flist-symlink-leak.test
+@@ -0,0 +1,90 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex re-check finding: the sender-side file-
++# list generator can still follow an attacker-planted symlink out of
++# the module via change_pathname() -> change_dir(...,CD_SKIP_CHDIR)
++# followed by change_dir(...,CD_NORMAL). The CD_SKIP_CHDIR sets
++# skipped_chdir=1, and the next CD_NORMAL call's secure-branch in
++# util1.c is gated on `!skipped_chdir`, so the secure path is
++# bypassed and a raw chdir(curr_dir) follows attacker-controlled
++# symlinks during flist generation.
++#
++# Reach: rsync daemon module with `use chroot = no`. A local
++# attacker plants module/cd -> /outside. A client (innocent or
++# malicious) pulls rsync://<daemon>/<module>/cd/. The daemon, as
++# sender, enumerates files in /outside and ships their metadata
++# (names, sizes, modes, mtimes) to the client. The actual content
++# transfer fails later at the secure_relative_open step with EXDEV,
++# but by then the metadata has already leaked.
++#
++# We detect by running a dry-run pull of the symlinked subdir and
++# checking whether the client's --list-only output mentions any
++# file from /outside. With the bug, /outside/secret.txt appears in
++# the list with its size; with the fix, the daemon's chdir into
++# the symlinked subdir is rejected and no /outside file is listed.
++
++. "$suitedir/rsync.fns"
++
++case "$(uname -s)" in
++    SunOS|OpenBSD|NetBSD|CYGWIN*)
++        test_skipped "secure change_dir relies on RESOLVE_BENEATH-equivalent kernel support not available on $(uname -s)"
++        ;;
++esac
++
++mod="$scratchdir/module"
++outside="$scratchdir/outside"
++listfile="$scratchdir/listed.txt"
++conf="$scratchdir/test-rsyncd.conf"
++
++rm -rf "$mod" "$outside"
++mkdir -p "$mod" "$outside"
++
++# Outside-the-module file the daemon should NOT enumerate to clients.
++# A distinctive name + non-trivial size makes the leak easy to spot.
++echo "OUTSIDE_PROTECTED_FILE_USED_AS_LEAK_DETECTOR" > "$outside/leak_marker.txt"
++chmod 0644 "$outside/leak_marker.txt"
++
++# The symlink trap planted by the local attacker.
++ln -s "$outside" "$mod/cd"
++
++my_uid=`get_testuid`
++root_uid=`get_rootuid`
++root_gid=`get_rootgid`
++uid_setting="uid = $root_uid"
++gid_setting="gid = $root_gid"
++if test x"$my_uid" != x"$root_uid"; then
++    uid_setting="#$uid_setting"
++    gid_setting="#$gid_setting"
++fi
++
++cat > "$conf" <<EOF
++use chroot = no
++$uid_setting
++$gid_setting
++log file = $scratchdir/rsyncd.log
++[upload]
++    path = $mod
++    use chroot = no
++    read only = no
++EOF
++
++# Pull recursively into the symlinked subdir with dry-run + verbose,
++# capturing the daemon's flist (file list) on stdout. If the daemon
++# enumerates /outside, leak_marker.txt will appear in the listing.
++RSYNC_CONNECT_PROG="$RSYNC --config=$conf --daemon" \
++    $RSYNC -nrv rsync://localhost/upload/cd/ "$scratchdir/dst/" \
++    > "$listfile" 2>&1 || true
++
++if grep -q "leak_marker\.txt" "$listfile"; then
++    echo "----- leaked listing follows" >&2
++    sed 's/^/    /' "$listfile" >&2
++    echo "----- leaked listing ends" >&2
++    test_fail "sender flist leak: outside/leak_marker.txt was enumerated to the client (daemon's chdir followed the cd symlink during flist generation)"
++fi
++
++exit 0
+diff --git a/util1.c b/util1.c
+index d84bc414..6e457d4f 100644
+--- a/util1.c
++++ b/util1.c
+@@ -1112,6 +1112,7 @@ char *sanitize_path(char *dest, const char *p, const char *rootdir, int depth, i
+  * Also cleans the path using the clean_fname() function. */
+ int change_dir(const char *dir, int set_path_only)
+ {
++	extern int am_daemon, am_chrooted;
+ 	static int initialised, skipped_chdir;
+ 	unsigned int len;
+ 
+@@ -1150,10 +1151,57 @@ int change_dir(const char *dir, int set_path_only)
+ 			curr_dir[curr_dir_len++] = '/';
+ 		memcpy(curr_dir + curr_dir_len, dir, len + 1);
+ 
+-		if (!set_path_only && chdir(curr_dir)) {
+-			curr_dir_len = save_dir_len;
+-			curr_dir[curr_dir_len] = '\0';
+-			return 0;
++		if (!set_path_only) {
++			int chdir_failed;
++			/* In the daemon-without-chroot deployment we must not
++			 * follow a symlink in any component of the chdir
++			 * target -- otherwise CWD escapes the module and
++			 * every subsequent path-relative syscall (open,
++			 * chmod, lchown, ...) inherits the escape, which
++			 * defeats secure_relative_open's RESOLVE_BENEATH
++			 * anchor and re-opens the CVE-2026-29518 class of
++			 * symlink TOCTOU attacks. Use the secure resolver
++			 * to get a confined dirfd, then fchdir() to it.
++			 *
++			 * If skipped_chdir is set, a previous CD_SKIP_CHDIR
++			 * call buffered an absolute prefix in curr_dir
++			 * (e.g. change_pathname's CD_SKIP_CHDIR to orig_dir)
++			 * without syncing the kernel's CWD. Resolve `dir`
++			 * relative to that prefix as basedir so the secure
++			 * branch still anchors at the operator-trusted
++			 * directory rather than wherever the kernel CWD
++			 * happens to be. */
++			if (am_daemon && !am_chrooted) {
++				const char *basedir = NULL;
++				char prefix[MAXPATHLEN];
++				int dfd;
++				if (skipped_chdir) {
++					if (save_dir_len >= sizeof prefix) {
++						errno = ENAMETOOLONG;
++						chdir_failed = 1;
++						goto chdir_cleanup;
++					}
++					memcpy(prefix, curr_dir, save_dir_len);
++					prefix[save_dir_len] = '\0';
++					basedir = prefix;
++				}
++				dfd = secure_relative_open(basedir, dir,
++					O_RDONLY | O_DIRECTORY, 0);
++				if (dfd < 0) {
++					chdir_failed = 1;
++				} else {
++					chdir_failed = fchdir(dfd) != 0;
++					close(dfd);
++				}
++			} else {
++				chdir_failed = chdir(curr_dir) != 0;
++			}
++		chdir_cleanup:
++			if (chdir_failed) {
++				curr_dir_len = save_dir_len;
++				curr_dir[curr_dir_len] = '\0';
++				return 0;
++			}
+ 		}
+ 		skipped_chdir = set_path_only;
+ 	}
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch
new file mode 100644
index 0000000000..2514bb6186
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch
@@ -0,0 +1,1784 @@
+From 6071a56075810cef61f3d576ea7fcf055ca4e95c Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 5 May 2026 15:02:48 +1000
+Subject: [PATCH] syscall: add symlink-race-safe do_*_at() wrappers and harden
+ secure_relative_open
+
+Add the rest of the path-based syscall wrappers and migrate every
+receiver-side caller:
+  - do_lchown_at, do_rename_at, do_mkdir_at, do_symlink_at,
+    do_mknod_at, do_link_at, do_unlink_at, do_rmdir_at,
+    do_utimensat_at, do_stat_at, do_lstat_at
+
+Same shape as do_chmod_at: open each parent under
+secure_relative_open(), call the *at() variant against the dirfd,
+fall through to the bare path-based syscall in non-daemon /
+chrooted / absolute-path / no-parent cases. macOS's
+setattrlist-based set_times tier is also routed through the
+utimensat_at path on daemon-no-chroot.
+
+Hardenings to secure_relative_open() itself:
+  - confine basedir resolution under the same kernel mechanism
+    used for relpath (basedirs from --copy-dest / --link-dest are
+    sender-controllable in daemon mode)
+  - reject any '..' component (bare '..', 'foo/..', 'subdir/..')
+    so the per-component O_NOFOLLOW fallback can't escape
+  - return the dirfd we built up from the per-component fallback
+    when the caller passed O_DIRECTORY (otherwise every do_*_at
+    failed with EINVAL on platforms without RESOLVE_BENEATH)
+
+Adds testsuite/alt-dest-symlink-race.test and
+testsuite/secure-relpath-validation.test (with t_secure_relpath
+helper) as regression coverage for the new hardenings.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/39b3074a1ab18705cd685fe0659fc958c8cd3db5]
+
+Backport Changes:
+- Adapted Makefile.in test-helper context for rsync 3.2.7, which does not
+  have the upstream simdtest target. No security source change was omitted.
+
+(cherry picked from commit 39b3074a1ab18705cd685fe0659fc958c8cd3db5)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Makefile.in                              |   8 +-
+ backup.c                                 |  14 +-
+ cleanup.c                                |   2 +-
+ delete.c                                 |   2 +-
+ generator.c                              |  28 +-
+ hlink.c                                  |   2 +-
+ receiver.c                               |   8 +-
+ rsync.c                                  |   6 +-
+ syscall.c                                | 841 ++++++++++++++++++++++-
+ t_secure_relpath.c                       | 151 ++++
+ testsuite/alt-dest-symlink-race.test     |  96 +++
+ testsuite/secure-relpath-validation.test |  34 +
+ util1.c                                  |  20 +-
+ xattrs.c                                 |   9 +-
+ 14 files changed, 1169 insertions(+), 52 deletions(-)
+ create mode 100644 t_secure_relpath.c
+ create mode 100755 testsuite/alt-dest-symlink-race.test
+ create mode 100755 testsuite/secure-relpath-validation.test
+
+diff --git a/Makefile.in b/Makefile.in
+index bc020b1b..437aab08 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -63,12 +63,12 @@ TLS_OBJ = tls.o syscall.o util2.o t_stub.o lib/compat.o lib/snprintf.o lib/perms
+ # Programs we must have to run the test cases
+ CHECK_PROGS = rsync$(EXEEXT) tls$(EXEEXT) getgroups$(EXEEXT) getfsdev$(EXEEXT) \
+ 	testrun$(EXEEXT) trimslash$(EXEEXT) t_unsafe$(EXEEXT) t_chmod_secure$(EXEEXT) \
+-	wildtest$(EXEEXT)
++	t_secure_relpath$(EXEEXT) wildtest$(EXEEXT)
+ 
+ CHECK_SYMLINKS = testsuite/chown-fake.test testsuite/devices-fake.test testsuite/xattrs-hlink.test
+ 
+ # Objects for CHECK_PROGS to clean
+-CHECK_OBJS=tls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t_chmod_secure.o trimslash.o wildtest.o
++CHECK_OBJS=tls.o testrun.o getgroups.o getfsdev.o t_stub.o t_unsafe.o t_chmod_secure.o t_secure_relpath.o trimslash.o wildtest.o
+ 
+ # note that the -I. is needed to handle config.h when using VPATH
+ .c.o:
+@@ -188,6 +188,10 @@ T_CHMOD_SECURE_OBJ = t_chmod_secure.o syscall.o util1.o util2.o t_stub.o lib/com
+ t_chmod_secure$(EXEEXT): $(T_CHMOD_SECURE_OBJ)
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_CHMOD_SECURE_OBJ) $(LIBS)
+ 
++T_SECURE_RELPATH_OBJ = t_secure_relpath.o syscall.o util1.o util2.o t_stub.o lib/compat.o lib/snprintf.o lib/wildmatch.o lib/permstring.o
++t_secure_relpath$(EXEEXT): $(T_SECURE_RELPATH_OBJ)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(T_SECURE_RELPATH_OBJ) $(LIBS)
++
+ .PHONY: conf
+ conf: configure.sh config.h.in
+ 
+diff --git a/backup.c b/backup.c
+index 686cb297..ae8cb49e 100644
+--- a/backup.c
++++ b/backup.c
+@@ -39,7 +39,7 @@ static int validate_backup_dir(void)
+ {
+ 	STRUCT_STAT st;
+ 
+-	if (do_lstat(backup_dir_buf, &st) < 0) {
++	if (do_lstat_at(backup_dir_buf, &st) < 0) {
+ 		if (errno == ENOENT)
+ 			return 0;
+ 		rsyserr(FERROR, errno, "backup lstat %s failed", backup_dir_buf);
+@@ -98,7 +98,7 @@ static BOOL copy_valid_path(const char *fname)
+ 	for ( ; b; name = b + 1, b = strchr(name, '/')) {
+ 		*b = '\0';
+ 
+-		while (do_mkdir(backup_dir_buf, ACCESSPERMS) < 0) {
++		while (do_mkdir_at(backup_dir_buf, ACCESSPERMS) < 0) {
+ 			if (errno == EEXIST) {
+ 				val = validate_backup_dir();
+ 				if (val > 0)
+@@ -197,7 +197,7 @@ static inline int link_or_rename(const char *from, const char *to,
+ 		if (IS_SPECIAL(stp->st_mode) || IS_DEVICE(stp->st_mode))
+ 			return 0; /* Use copy code. */
+ #endif
+-		if (do_link(from, to) == 0) {
++		if (do_link_at(from, to) == 0) {
+ 			if (DEBUG_GTE(BACKUP, 1))
+ 				rprintf(FINFO, "make_backup: HLINK %s successful.\n", from);
+ 			return 2;
+@@ -207,7 +207,7 @@ static inline int link_or_rename(const char *from, const char *to,
+ 			return 0;
+ 	}
+ #endif
+-	if (do_rename(from, to) == 0) {
++	if (do_rename_at(from, to) == 0) {
+ 		if (stp->st_nlink > 1 && !S_ISDIR(stp->st_mode)) {
+ 			/* If someone has hard-linked the file into the backup
+ 			 * dir, rename() might return success but do nothing! */
+@@ -246,7 +246,7 @@ int make_backup(const char *fname, BOOL prefer_rename)
+ 		goto success;
+ 	if (errno == EEXIST || errno == EISDIR) {
+ 		STRUCT_STAT bakst;
+-		if (do_lstat(buf, &bakst) == 0) {
++		if (do_lstat_at(buf, &bakst) == 0) {
+ 			int flags = get_del_for_flag(bakst.st_mode) | DEL_FOR_BACKUP | DEL_RECURSE;
+ 			if (delete_item(buf, bakst.st_mode, flags) != 0)
+ 				return 0;
+@@ -277,7 +277,7 @@ int make_backup(const char *fname, BOOL prefer_rename)
+ 	/* Check to see if this is a device file, or link */
+ 	if ((am_root && preserve_devices && IS_DEVICE(file->mode))
+ 	 || (preserve_specials && IS_SPECIAL(file->mode))) {
+-		if (do_mknod(buf, file->mode, sx.st.st_rdev) < 0)
++		if (do_mknod_at(buf, file->mode, sx.st.st_rdev) < 0)
+ 			rsyserr(FERROR, errno, "mknod %s failed", full_fname(buf));
+ 		else if (DEBUG_GTE(BACKUP, 1))
+ 			rprintf(FINFO, "make_backup: DEVICE %s successful.\n", fname);
+@@ -294,7 +294,7 @@ int make_backup(const char *fname, BOOL prefer_rename)
+ 			}
+ 			ret = 2;
+ 		} else {
+-			if (do_symlink(sl, buf) < 0)
++			if (do_symlink_at(sl, buf) < 0)
+ 				rsyserr(FERROR, errno, "link %s -> \"%s\"", full_fname(buf), sl);
+ 			else if (DEBUG_GTE(BACKUP, 1))
+ 				rprintf(FINFO, "make_backup: SYMLINK %s successful.\n", fname);
+diff --git a/cleanup.c b/cleanup.c
+index 40d26baa..0493fbbb 100644
+--- a/cleanup.c
++++ b/cleanup.c
+@@ -198,7 +198,7 @@ NORETURN void _exit_cleanup(int code, const char *file, int line)
+ 		switch_step++;
+ 
+ 		if (cleanup_fname)
+-			do_unlink(cleanup_fname);
++			do_unlink_at(cleanup_fname);
+ 		if (exit_code)
+ 			kill_all(SIGUSR1);
+ 		if (cleanup_pid && cleanup_pid == getpid()) {
+diff --git a/delete.c b/delete.c
+index 3a625610..3a82bc4c 100644
+--- a/delete.c
++++ b/delete.c
+@@ -160,7 +160,7 @@ enum delret delete_item(char *fbuf, uint16 mode, uint16 flags)
+ 
+ 	if (S_ISDIR(mode)) {
+ 		what = "rmdir";
+-		ok = do_rmdir(fbuf) == 0;
++		ok = do_rmdir_at(fbuf) == 0;
+ 	} else {
+ 		if (make_backups > 0 && !(flags & DEL_FOR_BACKUP) && (backup_dir || !is_backup_file(fbuf))) {
+ 			what = "make_backup";
+diff --git a/generator.c b/generator.c
+index c3ace1c2..a6bce20b 100644
+--- a/generator.c
++++ b/generator.c
+@@ -984,7 +984,7 @@ static int try_dests_reg(struct file_struct *file, char *fname, int ndx,
+ 		if (find_exact_for_existing) {
+ 			if (alt_dest_type == LINK_DEST && real_st.st_dev == sxp->st.st_dev && real_st.st_ino == sxp->st.st_ino)
+ 				return -1;
+-			if (do_unlink(fname) < 0 && errno != ENOENT)
++			if (do_unlink_at(fname) < 0 && errno != ENOENT)
+ 				goto got_nothing_for_ya;
+ 		}
+ #ifdef SUPPORT_HARD_LINKS
+@@ -1112,7 +1112,7 @@ static int try_dests_non(struct file_struct *file, char *fname, int ndx,
+ 		 && !IS_SPECIAL(file->mode) && !IS_DEVICE(file->mode)
+ #endif
+ 		 && !S_ISDIR(file->mode)) {
+-			if (do_link(cmpbuf, fname) < 0) {
++			if (do_link_at(cmpbuf, fname) < 0) {
+ 				rsyserr(FERROR_XFER, errno,
+ 					"failed to hard-link %s with %s",
+ 					cmpbuf, fname);
+@@ -1315,7 +1315,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+ 				}
+ 			}
+ 			if (relative_paths && !implied_dirs && file->mode != 0
+-			 && do_stat(dn, &sx.st) < 0) {
++			 && do_stat_at(dn, &sx.st) < 0) {
+ 				if (dry_run)
+ 					goto parent_is_dry_missing;
+ 				if (make_path(fname, MKP_DROP_NAME | MKP_SKIP_SLASH) < 0) {
+@@ -1427,7 +1427,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+ 			 && (stype == FT_DIR
+ 			  || delete_item(fname, sx.st.st_mode, del_opts | DEL_FOR_DIR) != 0))
+ 				goto cleanup; /* Any errors get reported later. */
+-			if (do_mkdir(fname, (file->mode|added_perms) & 0700) == 0)
++			if (do_mkdir_at(fname, (file->mode|added_perms) & 0700) == 0)
+ 				file->flags |= FLAG_DIR_CREATED;
+ 			goto cleanup;
+ 		}
+@@ -1469,10 +1469,10 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+ 			itemize(fnamecmp, file, ndx, statret, &sx,
+ 				statret ? ITEM_LOCAL_CHANGE : 0, 0, NULL);
+ 		}
+-		if (real_ret != 0 && do_mkdir(fname,file->mode|added_perms) < 0 && errno != EEXIST) {
++		if (real_ret != 0 && do_mkdir_at(fname,file->mode|added_perms) < 0 && errno != EEXIST) {
+ 			if (!relative_paths || errno != ENOENT
+ 			 || make_path(fname, MKP_DROP_NAME | MKP_SKIP_SLASH) < 0
+-			 || (do_mkdir(fname, file->mode|added_perms) < 0 && errno != EEXIST)) {
++			 || (do_mkdir_at(fname, file->mode|added_perms) < 0 && errno != EEXIST)) {
+ 				rsyserr(FERROR_XFER, errno,
+ 					"recv_generator: mkdir %s failed",
+ 					full_fname(fname));
+@@ -1808,7 +1808,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+ 		;
+ 	else if (quick_check_ok(FT_REG, fnamecmp, file, &sx.st)) {
+ 		if (partialptr) {
+-			do_unlink(partialptr);
++			do_unlink_at(partialptr);
+ 			handle_partial_dir(partialptr, PDIR_DELETE);
+ 		}
+ 		set_file_attrs(fname, file, &sx, NULL, maybe_ATTRS_REPORT | maybe_ATTRS_ACCURATE_TIME);
+@@ -2016,7 +2016,7 @@ int atomic_create(struct file_struct *file, char *fname, const char *slnk, const
+ 
+ 	if (slnk) {
+ #ifdef SUPPORT_LINKS
+-		if (do_symlink(slnk, create_name) < 0) {
++		if (do_symlink_at(slnk, create_name) < 0) {
+ 			rsyserr(FERROR_XFER, errno, "symlink %s -> \"%s\" failed",
+ 				full_fname(create_name), slnk);
+ 			return 0;
+@@ -2032,7 +2032,7 @@ int atomic_create(struct file_struct *file, char *fname, const char *slnk, const
+ 		return 0;
+ #endif
+ 	} else {
+-		if (do_mknod(create_name, file->mode, rdev) < 0) {
++		if (do_mknod_at(create_name, file->mode, rdev) < 0) {
+ 			rsyserr(FERROR_XFER, errno, "mknod %s failed",
+ 				full_fname(create_name));
+ 			return 0;
+@@ -2040,10 +2040,14 @@ int atomic_create(struct file_struct *file, char *fname, const char *slnk, const
+ 	}
+ 
+ 	if (!skip_atomic) {
+-		if (do_rename(tmpname, fname) < 0) {
++		if (do_rename_at(tmpname, fname) < 0) {
++			char *full_tmpname = strdup(full_fname(tmpname));
++			if (full_tmpname == NULL)
++				out_of_memory("atomic_create");
+ 			rsyserr(FERROR_XFER, errno, "rename %s -> \"%s\" failed",
+-				full_fname(tmpname), full_fname(fname));
+-			do_unlink(tmpname);
++				full_tmpname, full_fname(fname));
++			free(full_tmpname);
++			do_unlink_at(tmpname);
+ 			return 0;
+ 		}
+ 	}
+diff --git a/hlink.c b/hlink.c
+index 5c26a6b6..f8b9f899 100644
+--- a/hlink.c
++++ b/hlink.c
+@@ -453,7 +453,7 @@ int hard_link_check(struct file_struct *file, int ndx, char *fname,
+ int hard_link_one(struct file_struct *file, const char *fname,
+ 		  const char *oldname, int terse)
+ {
+-	if (do_link(oldname, fname) < 0) {
++	if (do_link_at(oldname, fname) < 0) {
+ 		enum logcode code;
+ 		if (terse) {
+ 			if (!INFO_GTE(NAME, 1))
+diff --git a/receiver.c b/receiver.c
+index cbe18196..8f5b51dd 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -442,7 +442,7 @@ static void handle_delayed_updates(char *local_name)
+ 			}
+ 			/* We don't use robust_rename() here because the
+ 			 * partial-dir must be on the same drive. */
+-			if (do_rename(partialptr, fname) < 0) {
++			if (do_rename_at(partialptr, fname) < 0) {
+ 				rsyserr(FERROR_XFER, errno,
+ 					"rename failed for %s (from %s)",
+ 					full_fname(fname), partialptr);
+@@ -926,7 +926,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+ 				recv_ok = -1;
+ 			else if (fnamecmp == partialptr) {
+ 				if (!one_inplace)
+-					do_unlink(partialptr);
++					do_unlink_at(partialptr);
+ 				handle_partial_dir(partialptr, PDIR_DELETE);
+ 			}
+ 		} else if (keep_partial && partialptr && (!one_inplace || delay_updates)) {
+@@ -935,7 +935,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+ 					"Unable to create partial-dir for %s -- discarding %s.\n",
+ 					local_name ? local_name : f_name(file, NULL),
+ 					recv_ok ? "completed file" : "partial file");
+-				do_unlink(fnametmp);
++				do_unlink_at(fnametmp);
+ 				recv_ok = -1;
+ 			} else if (!finish_transfer(partialptr, fnametmp, fnamecmp, NULL,
+ 						    file, recv_ok, !partial_dir))
+@@ -946,7 +946,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+ 			} else
+ 				partialptr = NULL;
+ 		} else if (!one_inplace)
+-			do_unlink(fnametmp);
++			do_unlink_at(fnametmp);
+ 
+ 		cleanup_disable();
+ 
+diff --git a/rsync.c b/rsync.c
+index cc46a2f9..1d2ae82a 100644
+--- a/rsync.c
++++ b/rsync.c
+@@ -547,7 +547,7 @@ int set_file_attrs(const char *fname, struct file_struct *file, stat_x *sxp,
+ 		if (am_root >= 0) {
+ 			uid_t uid = change_uid ? (uid_t)F_OWNER(file) : sxp->st.st_uid;
+ 			gid_t gid = change_gid ? (gid_t)F_GROUP(file) : sxp->st.st_gid;
+-			if (do_lchown(fname, uid, gid) != 0) {
++			if (do_lchown_at(fname, uid, gid) != 0) {
+ 				/* We shouldn't have attempted to change uid
+ 				 * or gid unless have the privilege. */
+ 				rsyserr(FERROR_XFER, errno, "%s %s failed",
+@@ -758,7 +758,7 @@ int finish_transfer(const char *fname, const char *fnametmp,
+ 			full_fname(fnametmp), fname);
+ 		if (!partialptr || (ret == -2 && temp_copy_name)
+ 		 || robust_rename(fnametmp, partialptr, NULL, file->mode) < 0)
+-			do_unlink(fnametmp);
++			do_unlink_at(fnametmp);
+ 		return 0;
+ 	}
+ 	if (ret == 0) {
+@@ -774,7 +774,7 @@ int finish_transfer(const char *fname, const char *fnametmp,
+ 		       ok_to_set_time ? ATTRS_ACCURATE_TIME : ATTRS_SKIP_MTIME | ATTRS_SKIP_ATIME | ATTRS_SKIP_CRTIME);
+ 
+ 	if (temp_copy_name) {
+-		if (do_rename(fnametmp, fname) < 0) {
++		if (do_rename_at(fnametmp, fname) < 0) {
+ 			rsyserr(FERROR_XFER, errno, "rename %s -> \"%s\"",
+ 				full_fname(fnametmp), fname);
+ 			return 0;
+diff --git a/syscall.c b/syscall.c
+index bc883b4b..759e2460 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -93,6 +93,63 @@ int do_unlink(const char *path)
+ 	return unlink(path);
+ }
+ 
++/*
++  Symlink-race-safe variant of do_unlink() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. unlink() resolves
++  parent components, so a parent-symlink swap can delete an outside
++  file under the daemon's authority. Defence: open the parent of path
++  under secure_relative_open() and use unlinkat() (flags=0) against
++  that dirfd.
++
++  Falls through to do_unlink() for the same dry-run / non-daemon /
++  chrooted / no-parent / absolute-path cases as the other wrappers.
++*/
++int do_unlink_at(const char *path)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return unlink(path);
++
++	if (!path || !*path || *path == '/')
++		return unlink(path);
++
++	slash = strrchr(path, '/');
++	if (!slash)
++		return unlink(path);
++
++	dlen = slash - path;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, path, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = unlinkat(dfd, bname, 0);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_unlink(path);
++#endif
++}
++
+ #ifdef SUPPORT_LINKS
+ int do_symlink(const char *lnk, const char *path)
+ {
+@@ -117,6 +174,70 @@ int do_symlink(const char *lnk, const char *path)
+ 	return symlink(lnk, path);
+ }
+ 
++/*
++  Symlink-race-safe variant of do_symlink() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. Only the parent
++  directory of `path` needs protection -- symlinkat() does not resolve
++  the final component (it creates it). Defence: open parent of `path`
++  under secure_relative_open() and call symlinkat() against that
++  dirfd. The link target string `lnk` is stored verbatim and not
++  resolved at creation time, so it doesn't need scrutiny here.
++
++  Falls through to do_symlink() for the --fake-super (am_root < 0)
++  path -- that code path opens `path` with do_open() which has its
++  own (separate) symlink-race exposure tracked elsewhere.
++*/
++int do_symlink_at(const char *lnk, const char *path)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return do_symlink(lnk, path);
++
++#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
++	if (am_root < 0)
++		return do_symlink(lnk, path);
++#endif
++
++	if (!path || !*path || *path == '/')
++		return do_symlink(lnk, path);
++
++	slash = strrchr(path, '/');
++	if (!slash)
++		return do_symlink(lnk, path);
++
++	dlen = slash - path;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, path, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = symlinkat(lnk, dfd, bname);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_symlink(lnk, path);
++#endif
++}
++
+ #if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
+ ssize_t do_readlink(const char *path, char *buf, size_t bufsiz)
+ {
+@@ -153,6 +274,106 @@ int do_link(const char *old_path, const char *new_path)
+ 	return link(old_path, new_path);
+ #endif
+ }
++
++/*
++  Symlink-race-safe variant of do_link() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. link() resolves
++  parent components of *both* old_path and new_path, so a parent-
++  symlink swap on either side can plant the new hard link outside
++  the module, or hard-link an outside file into the module (read
++  disclosure).
++
++  Defence: open each parent under secure_relative_open() and use
++  linkat() between the two dirfds, reusing one when the parents
++  match. flags=0 matches the existing do_link() (don't follow a
++  symbolic-link old_path). Only available on systems with linkat();
++  pre-AT_FDCWD systems fall through to do_link().
++*/
++int do_link_at(const char *old_path, const char *new_path)
++{
++#if defined AT_FDCWD && defined HAVE_LINKAT
++	extern int am_daemon, am_chrooted;
++	char old_dirpath[MAXPATHLEN], new_dirpath[MAXPATHLEN];
++	const char *old_bname, *new_bname;
++	const char *old_slash, *new_slash;
++	int old_dfd = AT_FDCWD, new_dfd = AT_FDCWD;
++	BOOL old_owns = False, new_owns = False;
++	int ret, e;
++	size_t old_dlen = 0, new_dlen = 0;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return do_link(old_path, new_path);
++
++	if (!old_path || !*old_path || *old_path == '/'
++	 || !new_path || !*new_path || *new_path == '/')
++		return do_link(old_path, new_path);
++
++	old_slash = strrchr(old_path, '/');
++	new_slash = strrchr(new_path, '/');
++
++	/* Resolve each path's parent dir independently. A path without a
++	 * slash lives in CWD (AT_FDCWD), no parent open required. A path
++	 * with a slash needs secure_relative_open to confine its parent
++	 * resolution -- otherwise a parent symlink (e.g. --link-dest=cd
++	 * where cd -> /outside) lets the kernel-level linkat(AT_FDCWD,
++	 * "cd/target.txt", ...) escape the module. */
++	if (old_slash) {
++		old_dlen = old_slash - old_path;
++		if (old_dlen >= sizeof old_dirpath) { errno = ENAMETOOLONG; return -1; }
++		memcpy(old_dirpath, old_path, old_dlen);
++		old_dirpath[old_dlen] = '\0';
++		old_bname = old_slash + 1;
++		old_dfd = secure_relative_open(NULL, old_dirpath, O_RDONLY | O_DIRECTORY, 0);
++		if (old_dfd < 0)
++			return -1;
++		old_owns = True;
++	} else {
++		old_bname = old_path;
++	}
++
++	if (new_slash) {
++		new_dlen = new_slash - new_path;
++		if (new_dlen >= sizeof new_dirpath) {
++			e = ENAMETOOLONG;
++			if (old_owns) close(old_dfd);
++			errno = e;
++			return -1;
++		}
++		memcpy(new_dirpath, new_path, new_dlen);
++		new_dirpath[new_dlen] = '\0';
++		new_bname = new_slash + 1;
++		if (old_owns && old_dlen == new_dlen
++		 && memcmp(old_dirpath, new_dirpath, old_dlen) == 0) {
++			new_dfd = old_dfd;
++		} else {
++			new_dfd = secure_relative_open(NULL, new_dirpath, O_RDONLY | O_DIRECTORY, 0);
++			if (new_dfd < 0) {
++				e = errno;
++				if (old_owns) close(old_dfd);
++				errno = e;
++				return -1;
++			}
++			new_owns = True;
++		}
++	} else {
++		new_bname = new_path;
++	}
++
++	ret = linkat(old_dfd, old_bname, new_dfd, new_bname, 0);
++	e = errno;
++	if (new_owns)
++		close(new_dfd);
++	if (old_owns)
++		close(old_dfd);
++	errno = e;
++	return ret;
++#else
++	return do_link(old_path, new_path);
++#endif
++}
+ #endif
+ 
+ int do_lchown(const char *path, uid_t owner, gid_t group)
+@@ -165,6 +386,66 @@ int do_lchown(const char *path, uid_t owner, gid_t group)
+ 	return lchown(path, owner, group);
+ }
+ 
++/*
++  Symlink-race-safe variant of do_lchown() for receiver-side use. See the
++  comment on do_chmod_at() for the threat model and design rationale.
++
++  Resolves the parent directory under secure_relative_open() and invokes
++  fchownat(..., AT_SYMLINK_NOFOLLOW) against that dirfd, so that an
++  attacker who substitutes a symlink into one of the parent components
++  cannot redirect the chown outside the receiver's confinement. The
++  AT_SYMLINK_NOFOLLOW flag matches lchown()'s "do not follow a final-
++  component symlink" semantics.
++
++  Falls through to do_lchown() in the dry-run / non-daemon / chrooted /
++  absolute-path / no-parent cases, identical to do_chmod_at().
++*/
++int do_lchown_at(const char *fname, uid_t owner, gid_t group)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return do_lchown(fname, owner, group);
++
++	if (!fname || !*fname || *fname == '/')
++		return do_lchown(fname, owner, group);
++
++	slash = strrchr(fname, '/');
++	if (!slash)
++		return do_lchown(fname, owner, group);
++
++	dlen = slash - fname;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, fname, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = fchownat(dfd, bname, owner, group, AT_SYMLINK_NOFOLLOW);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_lchown(fname, owner, group);
++#endif
++}
++
+ int do_mknod(const char *pathname, mode_t mode, dev_t dev)
+ {
+ 	if (dry_run) return 0;
+@@ -215,6 +496,76 @@ int do_mknod(const char *pathname, mode_t mode, dev_t dev)
+ #endif
+ }
+ 
++/*
++  Symlink-race-safe variant of do_mknod() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. Defence: open
++  the parent of pathname under secure_relative_open() and use
++  mknodat() against that dirfd. mknodat() covers both regular-file
++  (S_IFREG with dev=0) and FIFO (S_IFIFO) and device-node creation.
++
++  Falls through to do_mknod() for fake-super (am_root < 0) and for
++  sockets, both of which use auxiliary path-based syscalls that
++  don't have an *at() variant in any portable form.
++*/
++int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return do_mknod(pathname, mode, dev);
++
++	if (am_root < 0)
++		return do_mknod(pathname, mode, dev);
++
++#if !defined MKNOD_CREATES_SOCKETS && defined HAVE_SYS_UN_H
++	if (S_ISSOCK(mode))
++		return do_mknod(pathname, mode, dev);
++#endif
++
++	if (!pathname || !*pathname || *pathname == '/')
++		return do_mknod(pathname, mode, dev);
++
++	slash = strrchr(pathname, '/');
++	if (!slash)
++		return do_mknod(pathname, mode, dev);
++
++	dlen = slash - pathname;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, pathname, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++#if !defined MKNOD_CREATES_FIFOS && defined HAVE_MKFIFO
++	if (S_ISFIFO(mode))
++		ret = mkfifoat(dfd, bname, mode);
++	else
++#endif
++		ret = mknodat(dfd, bname, mode, dev);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_mknod(pathname, mode, dev);
++#endif
++}
++
+ int do_rmdir(const char *pathname)
+ {
+ 	if (dry_run) return 0;
+@@ -222,6 +573,57 @@ int do_rmdir(const char *pathname)
+ 	return rmdir(pathname);
+ }
+ 
++/*
++  Symlink-race-safe variant of do_rmdir(). See do_unlink_at() above;
++  same shape but with AT_REMOVEDIR set to require the target be a
++  directory.
++*/
++int do_rmdir_at(const char *pathname)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return rmdir(pathname);
++
++	if (!pathname || !*pathname || *pathname == '/')
++		return rmdir(pathname);
++
++	slash = strrchr(pathname, '/');
++	if (!slash)
++		return rmdir(pathname);
++
++	dlen = slash - pathname;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, pathname, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = unlinkat(dfd, bname, AT_REMOVEDIR);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_rmdir(pathname);
++#endif
++}
++
+ int do_open(const char *pathname, int flags, mode_t mode)
+ {
+ 	if (flags != O_RDONLY) {
+@@ -370,6 +772,89 @@ int do_rename(const char *old_path, const char *new_path)
+ 	return rename(old_path, new_path);
+ }
+ 
++/*
++  Symlink-race-safe variant of do_rename() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model and design rationale.
++
++  rename() is the central tmp -> final operation in rsync; if either the
++  source or the destination has an attacker-substituted symlink in one
++  of its parent components, the rename can publish or vanish files
++  outside the module. Defence: open the parent of *each* path under
++  secure_relative_open() and use renameat() against the resulting
++  dirfds. When old_path and new_path share the same parent (the common
++  case -- tmp file living next to its final name), we reuse the same
++  dirfd for both sides.
++
++  Falls through to do_rename() in dry-run, non-daemon, chrooted, no-
++  parent and absolute-path cases, identical to the other do_*_at()
++  wrappers.
++*/
++int do_rename_at(const char *old_path, const char *new_path)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char old_dirpath[MAXPATHLEN], new_dirpath[MAXPATHLEN];
++	const char *old_bname, *new_bname;
++	const char *old_slash, *new_slash;
++	int old_dfd = -1, new_dfd = -1, ret = -1, e;
++	size_t old_dlen, new_dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return do_rename(old_path, new_path);
++
++	if (!old_path || !*old_path || *old_path == '/'
++	 || !new_path || !*new_path || *new_path == '/')
++		return do_rename(old_path, new_path);
++
++	old_slash = strrchr(old_path, '/');
++	new_slash = strrchr(new_path, '/');
++	if (!old_slash || !new_slash)
++		return do_rename(old_path, new_path);
++
++	old_dlen = old_slash - old_path;
++	new_dlen = new_slash - new_path;
++	if (old_dlen >= sizeof old_dirpath || new_dlen >= sizeof new_dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(old_dirpath, old_path, old_dlen);
++	old_dirpath[old_dlen] = '\0';
++	memcpy(new_dirpath, new_path, new_dlen);
++	new_dirpath[new_dlen] = '\0';
++	old_bname = old_slash + 1;
++	new_bname = new_slash + 1;
++
++	old_dfd = secure_relative_open(NULL, old_dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (old_dfd < 0)
++		return -1;
++
++	if (old_dlen == new_dlen && memcmp(old_dirpath, new_dirpath, old_dlen) == 0) {
++		new_dfd = old_dfd;
++	} else {
++		new_dfd = secure_relative_open(NULL, new_dirpath, O_RDONLY | O_DIRECTORY, 0);
++		if (new_dfd < 0) {
++			e = errno;
++			close(old_dfd);
++			errno = e;
++			return -1;
++		}
++	}
++
++	ret = renameat(old_dfd, old_bname, new_dfd, new_bname);
++	e = errno;
++	if (new_dfd != old_dfd)
++		close(new_dfd);
++	close(old_dfd);
++	errno = e;
++	return ret;
++#else
++	return do_rename(old_path, new_path);
++#endif
++}
++
+ #ifdef HAVE_FTRUNCATE
+ int do_ftruncate(int fd, OFF_T size)
+ {
+@@ -412,6 +897,66 @@ int do_mkdir(char *path, mode_t mode)
+ 	return mkdir(path, mode);
+ }
+ 
++/*
++  Symlink-race-safe variant of do_mkdir() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model and design rationale.
++
++  mkdir() resolves parent symlinks at every component, so a parent-
++  component swap can place an attacker-named directory outside the
++  module. Defence: open the parent of fname under secure_relative_open()
++  and call mkdirat() against that dirfd.
++
++  Mutates path in place to trim trailing slashes (matches do_mkdir()).
++  Falls through to do_mkdir() in dry-run, non-daemon, chrooted, no-
++  parent and absolute-path cases.
++*/
++int do_mkdir_at(char *path, mode_t mode)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++	trim_trailing_slashes(path);
++
++	if (!am_daemon || am_chrooted)
++		return mkdir(path, mode);
++
++	if (!path || !*path || *path == '/')
++		return mkdir(path, mode);
++
++	slash = strrchr(path, '/');
++	if (!slash)
++		return mkdir(path, mode);
++
++	dlen = slash - path;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, path, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = mkdirat(dfd, bname, mode);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_mkdir(path, mode);
++#endif
++}
++
+ /* like mkstemp but forces permissions */
+ int do_mkstemp(char *template, mode_t perms)
+ {
+@@ -465,6 +1010,76 @@ int do_lstat(const char *path, STRUCT_STAT *st)
+ #endif
+ }
+ 
++/*
++  Symlink-race-safe variants of do_stat() / do_lstat() for receiver-
++  side use. See the comment on do_chmod_at() for the threat model.
++  stat() and lstat() resolve parent components, so a parent-symlink
++  swap can make the receiver's stat see attributes of a victim file
++  outside the module -- which then drives later behaviour (e.g.
++  "this isn't a directory, delete it" -> attacker-controlled unlink
++  on something outside the module).
++
++  Defence: open the parent under secure_relative_open() and use
++  fstatat() with AT_SYMLINK_NOFOLLOW (lstat) or 0 (stat) against
++  that dirfd. Same fall-through gating as the other wrappers.
++*/
++static int do_xstat_at(const char *path, STRUCT_STAT *st, int at_flags, int (*fallback)(const char *, STRUCT_STAT *))
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (!am_daemon || am_chrooted)
++		return fallback(path, st);
++
++	if (!path || !*path || *path == '/')
++		return fallback(path, st);
++
++	slash = strrchr(path, '/');
++	if (!slash)
++		return fallback(path, st);
++
++	dlen = slash - path;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, path, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = fstatat(dfd, bname, st, at_flags);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return fallback(path, st);
++#endif
++}
++
++int do_stat_at(const char *path, STRUCT_STAT *st)
++{
++	return do_xstat_at(path, st, 0, do_stat);
++}
++
++int do_lstat_at(const char *path, STRUCT_STAT *st)
++{
++#ifdef SUPPORT_LINKS
++	return do_xstat_at(path, st, AT_SYMLINK_NOFOLLOW, do_lstat);
++#else
++	return do_xstat_at(path, st, 0, do_stat);
++#endif
++}
++
+ int do_fstat(int fd, STRUCT_STAT *st)
+ {
+ #ifdef USE_STAT64_FUNCS
+@@ -491,12 +1106,26 @@ OFF_T do_lseek(int fd, OFF_T offset, int whence)
+ #ifdef HAVE_SETATTRLIST
+ int do_setattrlist_times(const char *path, STRUCT_STAT *stp)
+ {
++	extern int am_daemon, am_chrooted;
+ 	struct attrlist attrList;
+ 	struct timespec ts[2];
+ 
+ 	if (dry_run) return 0;
+ 	RETURN_ERROR_IF_RO_OR_LO;
+ 
++	/* setattrlist() takes a raw path and follows parent symlinks
++	 * (FSOPT_NOFOLLOW only blocks the final component). On a
++	 * daemon-no-chroot deployment, return ENOSYS so set_times()'
++	 * tier walk falls through to do_utimensat_at(), which routes
++	 * the timestamp update through a secure parent dirfd. The
++	 * macOS-specific attribute set this function would have used
++	 * (ATTR_CMN_MODTIME / ATTR_CMN_ACCTIME) is the same set
++	 * utimensat() handles, so no functionality is lost. */
++	if (am_daemon && !am_chrooted) {
++		errno = ENOSYS;
++		return -1;
++	}
++
+ 	/* Yes, this is in the opposite order of utime and similar. */
+ 	ts[0].tv_sec = stp->st_mtime;
+ 	ts[0].tv_nsec = stp->ST_MTIME_NSEC;
+@@ -513,12 +1142,25 @@ int do_setattrlist_times(const char *path, STRUCT_STAT *stp)
+ #ifdef SUPPORT_CRTIMES
+ int do_setattrlist_crtime(const char *path, time_t crtime)
+ {
++	extern int am_daemon, am_chrooted;
+ 	struct attrlist attrList;
+ 	struct timespec ts;
+ 
+ 	if (dry_run) return 0;
+ 	RETURN_ERROR_IF_RO_OR_LO;
+ 
++	/* Same path-follows-parent-symlinks concern as
++	 * do_setattrlist_times. There is no portable at-aware variant
++	 * of setattrlist that targets ATTR_CMN_CRTIME, so on a
++	 * daemon-no-chroot deployment we return -1 and accept that
++	 * crtime preservation is silently dropped for that file (the
++	 * caller treats this as "crtime not updated"). The transfer
++	 * itself continues normally. */
++	if (am_daemon && !am_chrooted) {
++		errno = ENOSYS;
++		return -1;
++	}
++
+ 	ts.tv_sec = crtime;
+ 	ts.tv_nsec = 0;
+ 
+@@ -534,10 +1176,19 @@ int do_setattrlist_crtime(const char *path, time_t crtime)
+ time_t get_create_time(const char *path, STRUCT_STAT *stp)
+ {
+ #ifdef HAVE_GETATTRLIST
++	extern int am_daemon, am_chrooted;
+ 	static struct create_time attrBuf;
+ 	struct attrlist attrList;
+ 
+ 	(void)stp;
++	/* getattrlist() is also path-based and follows parent
++	 * symlinks. In daemon-no-chroot, refuse rather than read the
++	 * crtime of a file the parent-symlink chain might point at
++	 * outside the module. The caller's "no crtime available"
++	 * path returns 0; the file gets a fresh crtime instead of
++	 * preserving the source's. */
++	if (am_daemon && !am_chrooted)
++		return 0;
+ 	memset(&attrList, 0, sizeof attrList);
+ 	attrList.bitmapcount = ATTR_BIT_MAP_COUNT;
+ 	attrList.commonattr = ATTR_CMN_CRTIME;
+@@ -603,6 +1254,81 @@ int do_utimensat(const char *path, STRUCT_STAT *stp)
+ #endif
+ 	return utimensat(AT_FDCWD, path, t, AT_SYMLINK_NOFOLLOW);
+ }
++
++/*
++  Symlink-race-safe variant of do_utimensat() for receiver-side use.
++  See the comment on do_chmod_at() for the threat model. utimes()
++  resolves parent components and follows a final-component symlink;
++  lutimes() doesn't follow the final component but still resolves
++  parents. Either way, a parent-symlink swap can redirect the
++  timestamp update outside the module. Defence: open the parent of
++  path under secure_relative_open() and call utimensat() with
++  AT_SYMLINK_NOFOLLOW against that dirfd.
++
++  Falls through to do_utimensat() in the same dry-run / non-daemon /
++  chrooted / no-parent / absolute-path cases as the other wrappers.
++  Returns -1 with errno=ENOSYS on systems without utimensat()
++  (caller is expected to fall back to the legacy tier walk).
++*/
++int do_utimensat_at(const char *path, STRUCT_STAT *stp)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	struct timespec t[2];
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (dry_run) return 0;
++	RETURN_ERROR_IF_RO_OR_LO;
++
++	if (!am_daemon || am_chrooted)
++		return do_utimensat(path, stp);
++
++	if (!path || !*path || *path == '/')
++		return do_utimensat(path, stp);
++
++	slash = strrchr(path, '/');
++	if (!slash)
++		return do_utimensat(path, stp);
++
++	dlen = slash - path;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, path, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	t[0].tv_sec = stp->st_atime;
++#ifdef ST_ATIME_NSEC
++	t[0].tv_nsec = stp->ST_ATIME_NSEC;
++#else
++	t[0].tv_nsec = 0;
++#endif
++	t[1].tv_sec = stp->st_mtime;
++#ifdef ST_MTIME_NSEC
++	t[1].tv_nsec = stp->ST_MTIME_NSEC;
++#else
++	t[1].tv_nsec = 0;
++#endif
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++	ret = utimensat(dfd, bname, t, AT_SYMLINK_NOFOLLOW);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_utimensat(path, stp);
++#endif
++}
+ #endif
+ 
+ #ifdef HAVE_LUTIMES
+@@ -825,6 +1551,30 @@ int do_open_nofollow(const char *pathname, int flags)
+   The relpath must also not contain any ../ elements in the path.
+ */
+ 
++/* Returns 1 if path has any "/"-separated component that is exactly
++ * "..", 0 otherwise. Used by secure_relative_open's front-door
++ * validation to reject inputs that the per-component walk fallback
++ * would otherwise resolve through ".." -- e.g. bare "..", "foo/..",
++ * "subdir/.." -- which RESOLVE_BENEATH-equivalent kernels reject in
++ * the kernel but the per-component fallback (NetBSD/OpenBSD/Solaris/
++ * Cygwin/pre-5.6 Linux) does not. */
++static int path_has_dotdot_component(const char *path)
++{
++	const char *p = path;
++
++	while (*p) {
++		const char *q;
++		if (*p == '/') { p++; continue; }
++		q = p;
++		while (*q && *q != '/')
++			q++;
++		if (q - p == 2 && p[0] == '.' && p[1] == '.')
++			return 1;
++		p = q;
++	}
++	return 0;
++}
++
+ #ifdef __linux__
+ static int secure_relative_open_linux(const char *basedir, const char *relpath, int flags, mode_t mode)
+ {
+@@ -838,10 +1588,25 @@ static int secure_relative_open_linux(const char *basedir, const char *relpath,
+ 
+ 	if (basedir == NULL) {
+ 		dirfd = AT_FDCWD;
+-	} else {
++	} else if (basedir[0] == '/') {
++		/* Absolute basedir: operator-trusted (module_dir and the
++		 * like). Plain openat. */
+ 		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
+ 		if (dirfd == -1)
+ 			return -1;
++	} else {
++		/* Relative basedir: may be wire-influenced via
++		 * --link-dest / --copy-dest / --compare-dest. Resolve it
++		 * under the same RESOLVE_BENEATH guarantee as relpath, so
++		 * a parent symlink on basedir cannot redirect the dirfd
++		 * outside the CWD anchor. */
++		struct open_how bhow;
++		memset(&bhow, 0, sizeof bhow);
++		bhow.flags = O_RDONLY | O_DIRECTORY;
++		bhow.resolve = RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;
++		dirfd = syscall(SYS_openat2, AT_FDCWD, basedir, &bhow, sizeof bhow);
++		if (dirfd == -1)
++			return -1;
+ 	}
+ 
+ 	retfd = syscall(SYS_openat2, dirfd, relpath, &how, sizeof how);
+@@ -864,10 +1629,17 @@ static int secure_relative_open_resolve_beneath(const char *basedir, const char
+ 
+ 	if (basedir == NULL) {
+ 		dirfd = AT_FDCWD;
+-	} else {
++	} else if (basedir[0] == '/') {
++		/* Absolute basedir: operator-trusted, plain openat. */
+ 		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
+ 		if (dirfd == -1)
+ 			return -1;
++	} else {
++		/* Relative basedir: confine its resolution beneath CWD
++		 * (see secure_relative_open_linux for the rationale). */
++		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY | O_RESOLVE_BENEATH);
++		if (dirfd == -1)
++			return -1;
+ 	}
+ 
+ 	retfd = openat(dirfd, relpath, flags | O_RESOLVE_BENEATH, mode);
+@@ -885,8 +1657,20 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
+ 		errno = EINVAL;
+ 		return -1;
+ 	}
+-	if (strncmp(relpath, "../", 3) == 0 || strstr(relpath, "/../")) {
+-		// no ../ elements allowed in the relpath
++	/* Reject any path with a literal ".." component (bare "..",
++	 * "../foo", "foo/..", "foo/../bar", "subdir/.."). The previous
++	 * substring-based check caught only "../" prefix and "/../"
++	 * substring; bare ".." and trailing "/.." escape on the per-
++	 * component walk fallback used by NetBSD/OpenBSD/Solaris/Cygwin
++	 * and pre-5.6 Linux. RESOLVE_BENEATH on Linux/FreeBSD/macOS
++	 * catches some of these in-kernel with EXDEV, but the front
++	 * door must reject them consistently with EINVAL across all
++	 * platforms so callers can rely on the validation. */
++	if (path_has_dotdot_component(relpath)) {
++		errno = EINVAL;
++		return -1;
++	}
++	if (basedir && basedir[0] != '/' && path_has_dotdot_component(basedir)) {
+ 		errno = EINVAL;
+ 		return -1;
+ 	}
+@@ -916,15 +1700,47 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
+ #else
+ 	int dirfd = AT_FDCWD;
+ 	if (basedir != NULL) {
+-		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
+-		if (dirfd == -1) {
+-			return -1;
++		if (basedir[0] == '/') {
++			/* Absolute basedir: operator-trusted, plain openat. */
++			dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
++			if (dirfd == -1) {
++				return -1;
++			}
++		} else {
++			/* Relative basedir: walk it component-by-component
++			 * with O_NOFOLLOW. This is the per-component
++			 * RESOLVE_BENEATH equivalent for platforms without
++			 * kernel-supported confinement, and matches the
++			 * relpath walk below. Symlinks in basedir are
++			 * rejected outright on this fallback path; the
++			 * Linux openat2 / O_RESOLVE_BENEATH paths above
++			 * still allow within-tree symlinks. */
++			char *bcopy = my_strdup(basedir, __FILE__, __LINE__);
++			if (!bcopy)
++				return -1;
++			for (const char *part = strtok(bcopy, "/");
++			     part != NULL;
++			     part = strtok(NULL, "/"))
++			{
++				int next_fd = openat(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
++				if (next_fd == -1) {
++					int save_errno = errno;
++					if (dirfd != AT_FDCWD) close(dirfd);
++					free(bcopy);
++					errno = save_errno;
++					return -1;
++				}
++				if (dirfd != AT_FDCWD) close(dirfd);
++				dirfd = next_fd;
++			}
++			free(bcopy);
+ 		}
+ 	}
+ 	int retfd = -1;
+ 
+ 	char *path_copy = my_strdup(relpath, __FILE__, __LINE__);
+ 	if (!path_copy) {
++		if (dirfd != AT_FDCWD) close(dirfd);
+ 		return -1;
+ 	}
+ 
+@@ -950,8 +1766,15 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
+ 		dirfd = next_fd;
+ 	}
+ 
+-	// the path must be a directory
+-	errno = EINVAL;
++	/* All components walked as directories. If the caller asked for
++	 * O_DIRECTORY, return the dirfd we built up; otherwise the path
++	 * resolved to a directory but the caller wanted a regular file. */
++	if ((flags & O_DIRECTORY) && dirfd != AT_FDCWD) {
++		retfd = dirfd;
++		dirfd = AT_FDCWD;
++		goto cleanup;
++	}
++	errno = EISDIR;
+ 
+ cleanup:
+ 	free(path_copy);
+diff --git a/t_secure_relpath.c b/t_secure_relpath.c
+new file mode 100644
+index 00000000..a0fdf0d2
+--- /dev/null
++++ b/t_secure_relpath.c
+@@ -0,0 +1,151 @@
++/*
++ * Test harness for secure_relative_open()'s front-door input
++ * validation. Codex audit Finding 5 noted that the existing check
++ *
++ *     if (strncmp(relpath, "../", 3) == 0 || strstr(relpath, "/../"))
++ *
++ * catches "../foo" and "foo/../bar" but misses bare ".." (an actual
++ * one-level escape on platforms that fall back to the per-component
++ * walk), as well as "a/..", "foo/..", and any other form that
++ * decomposes to a ".." component when split on "/". The kernel-
++ * enforced RESOLVE_BENEATH (Linux 5.6+) and O_RESOLVE_BENEATH
++ * (FreeBSD 13+, macOS 15+) reject these in-kernel; the per-
++ * component fallback used on NetBSD, OpenBSD, Solaris, Cygwin and
++ * pre-5.6 Linux does not, so the validation must happen at the
++ * front door.
++ *
++ * This helper invokes secure_relative_open() with each suspect
++ * input and checks both the failure (rc < 0) and the errno
++ * (EINVAL means "rejected at the front door"). Pre-fix, the kernel
++ * may reject with a different errno (EXDEV from RESOLVE_BENEATH);
++ * post-fix, the front-door check catches every variant up front
++ * with a consistent EINVAL across platforms.
++ *
++ * Not linked into rsync itself.
++ */
++
++#include "rsync.h"
++
++#include <sys/stat.h>
++
++int dry_run = 0;
++int am_root = 0;
++int am_sender = 0;
++int read_only = 0;
++int list_only = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
++extern int am_daemon, am_chrooted;
++
++short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
++
++static int errs = 0;
++
++static void check_relpath(const char *relpath)
++{
++	int fd;
++	int saved_errno;
++
++	errno = 0;
++	fd = secure_relative_open(NULL, relpath, O_RDONLY | O_DIRECTORY, 0);
++	saved_errno = errno;
++
++	if (fd >= 0) {
++		fprintf(stderr,
++			"FAIL [relpath=%-12s]: returned valid fd %d (escape) -- expected -1 EINVAL\n",
++			relpath, fd);
++		close(fd);
++		errs++;
++		return;
++	}
++
++	if (saved_errno != EINVAL) {
++		fprintf(stderr,
++			"FAIL [relpath=%-12s]: rejected but errno=%d (%s), expected EINVAL\n",
++			relpath, saved_errno, strerror(saved_errno));
++		errs++;
++		return;
++	}
++
++	fprintf(stderr, "OK   [relpath=%-12s]: rejected with EINVAL\n", relpath);
++}
++
++static void check_basedir(const char *basedir)
++{
++	int fd;
++	int saved_errno;
++
++	errno = 0;
++	fd = secure_relative_open(basedir, "ok", O_RDONLY | O_DIRECTORY, 0);
++	saved_errno = errno;
++
++	if (fd >= 0) {
++		fprintf(stderr,
++			"FAIL [basedir=%-12s]: returned valid fd %d -- expected -1 EINVAL\n",
++			basedir, fd);
++		close(fd);
++		errs++;
++		return;
++	}
++
++	if (saved_errno != EINVAL) {
++		fprintf(stderr,
++			"FAIL [basedir=%-12s]: rejected but errno=%d (%s), expected EINVAL\n",
++			basedir, saved_errno, strerror(saved_errno));
++		errs++;
++		return;
++	}
++
++	fprintf(stderr, "OK   [basedir=%-12s]: rejected with EINVAL\n", basedir);
++}
++
++int main(int argc, char **argv)
++{
++	if (argc != 2) {
++		fprintf(stderr, "usage: %s <test-dir>\n", argv[0]);
++		return 2;
++	}
++	if (chdir(argv[1]) < 0) {
++		perror("chdir");
++		return 2;
++	}
++
++	/* secure_relative_open's daemon-only confinement protections only
++	 * fire when am_daemon && !am_chrooted (the threat model is the
++	 * daemon-no-chroot deployment), but the front-door input
++	 * validation runs unconditionally. We set am_daemon anyway so the
++	 * helper exercises the same code shape the receiver does. */
++	am_daemon = 1;
++	am_chrooted = 0;
++
++	mkdir("subdir", 0755);
++
++	/* Each of these relpaths must be rejected with EINVAL at the
++	 * secure_relative_open() front door. ".." is the actual one-level
++	 * escape; the others ("subdir/..", "subdir/../subdir") resolve
++	 * back to the start dir on systems that allow them, but we still
++	 * reject them as defence-in-depth: a path containing a ".." token
++	 * is suspicious and the caller should normalise before passing
++	 * it in. The "../foo" / "foo/../bar" / "/foo" / "/" cases are
++	 * regression checks for the existing checks. */
++	check_relpath("..");
++	check_relpath("../foo");
++	check_relpath("subdir/..");
++	check_relpath("subdir/../subdir");
++	check_relpath("foo/../bar");
++	check_relpath("/foo");
++	check_relpath("/");
++
++	/* Same checks against basedir (which the codex Finding 2 fix
++	 * routes through the same RESOLVE_BENEATH-equivalent). Absolute
++	 * basedirs are operator-trusted and intentionally not validated
++	 * here. */
++	check_basedir("..");
++	check_basedir("../subdir");
++	check_basedir("subdir/..");
++	check_basedir("foo/../bar");
++
++	if (errs)
++		fprintf(stderr, "\n%d failure(s)\n", errs);
++	return errs ? 1 : 0;
++}
+diff --git a/testsuite/alt-dest-symlink-race.test b/testsuite/alt-dest-symlink-race.test
+new file mode 100755
+index 00000000..2256f2f2
+--- /dev/null
++++ b/testsuite/alt-dest-symlink-race.test
+@@ -0,0 +1,96 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for the basedir-confinement gap in
++# secure_relative_open(). The function opens basedir with a plain
++# openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY), without
++# RESOLVE_BENEATH or a per-component O_NOFOLLOW walk, so a parent
++# symlink ON basedir is followed unrestrictedly. RESOLVE_BENEATH is
++# then applied only to relpath, anchored at the wrong directory.
++#
++# The receiver's basis-file lookup at receiver.c passes
++# basis_dir[fnamecmp_type] (from --copy-dest / --link-dest /
++# --compare-dest -- all sender-controllable in daemon mode) as
++# basedir. A daemon-module attacker with write access can plant a
++# symlink at module/cd -> /outside, then run --link-dest=cd to
++# make the daemon's basis-file lookup resolve into /outside,
++# leaking the contents of daemon-readable files via the rsync
++# delta-rolling read-disclosure primitive.
++#
++# We detect the escape by leveraging --link-dest: when basis
++# matches source exactly (content + mtime + mode), --link-dest
++# hard-links the destination to the basis file. With the bug, the
++# destination ends up as a hard link to the outside-the-module
++# file (same inode). With the fix, no basis is found and the
++# destination is a fresh copy (different inode).
++#
++# The vulnerable code path is the same on every platform
++# (including the per-component fallback on systems without
++# RESOLVE_BENEATH), so this test is not platform-gated.
++
++. "$suitedir/rsync.fns"
++
++mod="$scratchdir/module"
++outside="$scratchdir/outside"
++src="$scratchdir/src"
++conf="$scratchdir/test-rsyncd.conf"
++
++rm -rf "$mod" "$outside" "$src"
++mkdir -p "$mod" "$outside" "$src"
++
++# Portable inode-number helper (GNU coreutils stat -c, BSD stat -f).
++file_inode() {
++    stat -c %i "$1" 2>/dev/null || stat -f %i "$1"
++}
++
++# Outside-the-module file an attacker would like the daemon to
++# treat as a basis.
++echo "OUTSIDE_SECRET_DATA" > "$outside/target.txt"
++chmod 0644 "$outside/target.txt"
++
++# The symlink trap planted in the module by the local attacker.
++ln -s "$outside" "$mod/cd"
++
++# Source file matches outside/target.txt exactly (content + mtime
++# + mode) so --link-dest will hard-link the destination to the
++# basis file iff the daemon's basedir lookup reaches outside/.
++echo "OUTSIDE_SECRET_DATA" > "$src/target.txt"
++touch -r "$outside/target.txt" "$src/target.txt"
++chmod 0644 "$src/target.txt"
++
++cat > "$conf" <<EOF
++use chroot = no
++log file = $scratchdir/rsyncd.log
++[upload]
++    path = $mod
++    use chroot = no
++    read only = no
++EOF
++
++# Recursive --link-dest push directly into the module root. We
++# avoid pushing into a destination subdir because the receiver
++# would chdir into it before resolving --link-dest, making the
++# relative basedir "cd" resolve in the wrong CWD and masking the
++# bug. The realistic attack pushes into the module root (or the
++# attacker uses a basedir path that resolves correctly from
++# whichever subdir the receiver chdirs into).
++RSYNC_CONNECT_PROG="$RSYNC --config=$conf --daemon" \
++    $RSYNC -rtp --link-dest=cd "$src/" rsync://localhost/upload/ \
++    >/dev/null 2>&1 || true
++
++if [ ! -f "$mod/target.txt" ]; then
++    test_fail "destination file was not created -- daemon transfer failed before the test could observe the basedir behaviour"
++fi
++
++outside_inode=$(file_inode "$outside/target.txt")
++dst_inode=$(file_inode "$mod/target.txt")
++
++if [ "$outside_inode" = "$dst_inode" ]; then
++    test_fail "basedir-escape: --link-dest hard-linked module/target.txt to outside/target.txt (inode $outside_inode); daemon's basis-file lookup followed the parent symlink on the basedir"
++fi
++
++exit 0
+diff --git a/testsuite/secure-relpath-validation.test b/testsuite/secure-relpath-validation.test
+new file mode 100755
+index 00000000..5b77f7cc
+--- /dev/null
++++ b/testsuite/secure-relpath-validation.test
+@@ -0,0 +1,34 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex audit Finding 5: secure_relative_open()'s
++# front-door input check rejects "../foo" and "foo/../bar" but
++# misses bare "..", "subdir/..", and other variants whose "/"-split
++# components contain a literal "..". The kernel-enforced
++# RESOLVE_BENEATH (Linux 5.6+) and O_RESOLVE_BENEATH
++# (FreeBSD 13+, macOS 15+) reject these in-kernel; the per-component
++# walk fallback used on NetBSD, OpenBSD, Solaris, Cygwin and pre-5.6
++# Linux does not -- so the validation must happen at the front door.
++#
++# This test invokes the t_secure_relpath helper, which calls
++# secure_relative_open() with each suspect input and verifies the
++# return value is -1 with errno == EINVAL. EINVAL is the marker
++# that the front-door rejected the input, not the kernel; pre-fix
++# the kernel returns -1 with EXDEV (or, on the per-component
++# fallback, may return a valid fd at all -- "escape").
++
++. "$suitedir/rsync.fns"
++
++testdir="$scratchdir/relpath-test"
++rm -rf "$testdir"
++mkdir -p "$testdir"
++
++if ! "$TOOLDIR/t_secure_relpath" "$testdir"; then
++    test_fail "t_secure_relpath rejected one or more inputs incorrectly (see stderr above for the specific case)"
++fi
++
++exit 0
+diff --git a/util1.c b/util1.c
+index 6e457d4f..8850019f 100644
+--- a/util1.c
++++ b/util1.c
+@@ -141,7 +141,7 @@ int set_times(const char *fname, STRUCT_STAT *stp)
+ 
+ #ifdef HAVE_UTIMENSAT
+ #include "case_N.h"
+-		if (do_utimensat(fname, stp) == 0)
++		if (do_utimensat_at(fname, stp) == 0)
+ 			break;
+ 		if (errno != ENOSYS)
+ 			return -1;
+@@ -479,13 +479,13 @@ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t mode)
+ int robust_unlink(const char *fname)
+ {
+ #ifndef ETXTBSY
+-	return do_unlink(fname);
++	return do_unlink_at(fname);
+ #else
+ 	static int counter = 1;
+ 	int rc, pos, start;
+ 	char path[MAXPATHLEN];
+ 
+-	rc = do_unlink(fname);
++	rc = do_unlink_at(fname);
+ 	if (rc == 0 || errno != ETXTBSY)
+ 		return rc;
+ 
+@@ -515,7 +515,7 @@ int robust_unlink(const char *fname)
+ 	}
+ 
+ 	/* maybe we should return rename()'s exit status? Nah. */
+-	if (do_rename(fname, path) != 0) {
++	if (do_rename_at(fname, path) != 0) {
+ 		errno = ETXTBSY;
+ 		return -1;
+ 	}
+@@ -538,7 +538,7 @@ int robust_rename(const char *from, const char *to, const char *partialptr,
+ 		return 0;
+ 
+ 	while (tries--) {
+-		if (do_rename(from, to) == 0)
++		if (do_rename_at(from, to) == 0)
+ 			return 0;
+ 
+ 		switch (errno) {
+@@ -559,7 +559,7 @@ int robust_rename(const char *from, const char *to, const char *partialptr,
+ 			}
+ 			if (copy_file(from, to, -1, mode) != 0)
+ 				return -2;
+-			do_unlink(from);
++			do_unlink_at(from);
+ 			return 1;
+ 		default:
+ 			return -1;
+@@ -1329,20 +1329,20 @@ int handle_partial_dir(const char *fname, int create)
+ 	dir = partial_fname;
+ 	if (create) {
+ 		STRUCT_STAT st;
+-		int statret = do_lstat(dir, &st);
++		int statret = do_lstat_at(dir, &st);
+ 		if (statret == 0 && !S_ISDIR(st.st_mode)) {
+-			if (do_unlink(dir) < 0) {
++			if (do_unlink_at(dir) < 0) {
+ 				*fn = '/';
+ 				return 0;
+ 			}
+ 			statret = -1;
+ 		}
+-		if (statret < 0 && do_mkdir(dir, 0700) < 0) {
++		if (statret < 0 && do_mkdir_at(dir, 0700) < 0) {
+ 			*fn = '/';
+ 			return 0;
+ 		}
+ 	} else
+-		do_rmdir(dir);
++		do_rmdir_at(dir);
+ 	*fn = '/';
+ 
+ 	return 1;
+diff --git a/xattrs.c b/xattrs.c
+index e5d0dd43..5f740bb5 100644
+--- a/xattrs.c
++++ b/xattrs.c
+@@ -1249,7 +1249,12 @@ int set_stat_xattr(const char *fname, struct file_struct *file, mode_t new_mode)
+ 
+ int x_stat(const char *fname, STRUCT_STAT *fst, STRUCT_STAT *xst)
+ {
+-	int ret = do_stat(fname, fst);
++	/* Use the *_at variants so that on a daemon-no-chroot deployment
++	 * the metadata read goes through a secure parent dirfd instead
++	 * of bare path resolution. The *_at wrappers fall through to
++	 * plain do_stat outside the daemon-no-chroot context, so this
++	 * change is transparent for non-daemon use. */
++	int ret = do_stat_at(fname, fst);
+ 	if ((ret < 0 || get_stat_xattr(fname, -1, fst, xst) < 0) && xst)
+ 		xst->st_mode = 0;
+ 	return ret;
+@@ -1257,7 +1262,7 @@ int x_stat(const char *fname, STRUCT_STAT *fst, STRUCT_STAT *xst)
+ 
+ int x_lstat(const char *fname, STRUCT_STAT *fst, STRUCT_STAT *xst)
+ {
+-	int ret = do_lstat(fname, fst);
++	int ret = do_lstat_at(fname, fst);
+ 	if ((ret < 0 || get_stat_xattr(fname, -1, fst, xst) < 0) && xst)
+ 		xst->st_mode = 0;
+ 	return ret;
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch
new file mode 100644
index 0000000000..204a94bffb
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch
@@ -0,0 +1,570 @@
+From fd3986353f170f40d611fae9815640d8038cca3c Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 6 May 2026 09:45:30 +1000
+Subject: [PATCH] util1+syscall: secure copy_file source/dest opens; bare-path
+ defence-in-depth
+
+Three related codex audit findings:
+
+  Finding 3a: copy_file()'s source open in util1.c used
+  do_open_nofollow(), which only rejects a final-component
+  symlink. A parent-component symlink (e.g. --copy-dest=cd where
+  cd -> /outside) follows freely and reads outside the module.
+  Route through secure_relative_open() with O_NOFOLLOW.
+
+  Finding 3b: generator.c's in-place backup-file create still
+  used a bare do_open with O_CREAT, leaving a tiny but reachable
+  parent-symlink window between the secure unlink (already
+  through do_unlink_at) and the create. Add do_open_at() that
+  goes through a secure parent dirfd, and route the call site
+  through it.
+
+  Finding 3c: copy_file()'s destination open in
+  unlink_and_reopen() had the same bare-do_open pattern; route
+  through do_open_at as well.
+
+Adds testsuite/copy-dest-source-symlink.test and
+testsuite/bare-do-open-symlink-race.test as regression coverage
+for both attack shapes.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43619
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/a277a06b1017b4cf6bb0fe33d5823869ed02dfd9]
+
+(cherry picked from commit a277a06b1017b4cf6bb0fe33d5823869ed02dfd9)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ generator.c                              |   2 +-
+ syscall.c                                | 138 +++++++++++++++--
+ testsuite/bare-do-open-symlink-race.test | 186 +++++++++++++++++++++++
+ testsuite/copy-dest-source-symlink.test  |  83 ++++++++++
+ util1.c                                  |  21 ++-
+ 5 files changed, 416 insertions(+), 14 deletions(-)
+ create mode 100755 testsuite/bare-do-open-symlink-race.test
+ create mode 100755 testsuite/copy-dest-source-symlink.test
+
+diff --git a/generator.c b/generator.c
+index a6bce20b..b80eb2e3 100644
+--- a/generator.c
++++ b/generator.c
+@@ -1896,7 +1896,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+ 			back_file = NULL;
+ 			goto cleanup;
+ 		}
+-		if ((f_copy = do_open(backupptr, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL, 0600)) < 0) {
++		if ((f_copy = do_open_at(backupptr, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL, 0600)) < 0) {
+ 			rsyserr(FERROR_XFER, errno, "open %s", full_fname(backupptr));
+ 			unmake_file(back_file);
+ 			back_file = NULL;
+diff --git a/syscall.c b/syscall.c
+index 759e2460..98902274 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -203,11 +203,6 @@ int do_symlink_at(const char *lnk, const char *path)
+ 	if (!am_daemon || am_chrooted)
+ 		return do_symlink(lnk, path);
+ 
+-#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
+-	if (am_root < 0)
+-		return do_symlink(lnk, path);
+-#endif
+-
+ 	if (!path || !*path || *path == '/')
+ 		return do_symlink(lnk, path);
+ 
+@@ -228,6 +223,34 @@ int do_symlink_at(const char *lnk, const char *path)
+ 	if (dfd < 0)
+ 		return -1;
+ 
++#if defined NO_SYMLINK_XATTRS || defined NO_SYMLINK_USER_XATTRS
++	/* For --fake-super, do_symlink writes the link target into a
++	 * regular file rather than creating a real symlink. Do that
++	 * here against the secure dirfd, with O_NOFOLLOW so a pre-
++	 * planted symlink at the basename can't redirect the file
++	 * creation. (Previously the fake-super branch fell through to
++	 * the bare-path do_symlink at the top of the function.) */
++	if (am_root < 0) {
++		int len = strlen(lnk);
++		int fd = openat(dfd, bname,
++				O_WRONLY | O_CREAT | O_TRUNC | O_NOFOLLOW,
++				S_IWUSR | S_IRUSR);
++		if (fd < 0) {
++			e = errno;
++			close(dfd);
++			errno = e;
++			return -1;
++		}
++		ret = (write(fd, lnk, len) == len) ? 0 : -1;
++		if (close(fd) < 0)
++			ret = -1;
++		e = errno;
++		close(dfd);
++		errno = e;
++		return ret;
++	}
++#endif
++
+ 	ret = symlinkat(lnk, dfd, bname);
+ 	e = errno;
+ 	close(dfd);
+@@ -503,9 +526,12 @@ int do_mknod(const char *pathname, mode_t mode, dev_t dev)
+   mknodat() against that dirfd. mknodat() covers both regular-file
+   (S_IFREG with dev=0) and FIFO (S_IFIFO) and device-node creation.
+ 
+-  Falls through to do_mknod() for fake-super (am_root < 0) and for
+-  sockets, both of which use auxiliary path-based syscalls that
+-  don't have an *at() variant in any portable form.
++  Fake-super (am_root < 0) is handled inline against the secure
++  parent dirfd: it creates a regular empty file (the same file-as-
++  metadata-placeholder pattern do_mknod uses) via openat() with
++  O_NOFOLLOW. Sockets fall through to do_mknod() because their
++  bind(2) takes a path argument with no portable bindat() variant;
++  this is documented as a residual.
+ */
+ int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)
+ {
+@@ -523,9 +549,6 @@ int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)
+ 	if (!am_daemon || am_chrooted)
+ 		return do_mknod(pathname, mode, dev);
+ 
+-	if (am_root < 0)
+-		return do_mknod(pathname, mode, dev);
+-
+ #if !defined MKNOD_CREATES_SOCKETS && defined HAVE_SYS_UN_H
+ 	if (S_ISSOCK(mode))
+ 		return do_mknod(pathname, mode, dev);
+@@ -551,6 +574,29 @@ int do_mknod_at(const char *pathname, mode_t mode, dev_t dev)
+ 	if (dfd < 0)
+ 		return -1;
+ 
++	if (am_root < 0) {
++		/* For --fake-super, do_mknod creates a regular empty
++		 * file as a placeholder for the special-file metadata
++		 * (which is stored in xattrs elsewhere). Do that against
++		 * the secure dirfd, with O_NOFOLLOW so a pre-planted
++		 * symlink at the basename can't redirect the file
++		 * creation. */
++		int fd = openat(dfd, bname,
++				O_WRONLY | O_CREAT | O_TRUNC | O_NOFOLLOW,
++				S_IWUSR | S_IRUSR);
++		if (fd < 0) {
++			e = errno;
++			close(dfd);
++			errno = e;
++			return -1;
++		}
++		ret = (close(fd) < 0) ? -1 : 0;
++		e = errno;
++		close(dfd);
++		errno = e;
++		return ret;
++	}
++
+ #if !defined MKNOD_CREATES_FIFOS && defined HAVE_MKFIFO
+ 	if (S_ISFIFO(mode))
+ 		ret = mkfifoat(dfd, bname, mode);
+@@ -639,6 +685,76 @@ int do_open(const char *pathname, int flags, mode_t mode)
+ 	return open(pathname, flags | O_BINARY, mode);
+ }
+ 
++/*
++  Symlink-race-safe variant of do_open() for receiver-side use. See
++  the comment on do_chmod_at() for the threat model. open() resolves
++  parent components, so a parent-symlink swap can redirect the open
++  to a file outside the module. This wrapper is defence-in-depth for
++  bare-path do_open() sites that callers know are otherwise
++  protected by secure parent-syscalls (e.g. generator.c's in-place
++  backup creation, where robust_unlink() rejects the symlinked
++  parent before this open is reached): if any of those upstream
++  protections is later removed or regresses, the open here still
++  refuses to escape the module.
++
++  Defence: open the parent of pathname under secure_relative_open()
++  and call openat() against the resulting dirfd with O_NOFOLLOW
++  (so the basename itself isn't followed if it happens to be a
++  pre-planted symlink, which is what we want for O_CREAT|O_EXCL).
++*/
++int do_open_at(const char *pathname, int flags, mode_t mode)
++{
++#ifdef AT_FDCWD
++	extern int am_daemon, am_chrooted;
++	char dirpath[MAXPATHLEN];
++	const char *bname;
++	const char *slash;
++	int dfd, ret, e;
++	size_t dlen;
++
++	if (flags != O_RDONLY) {
++		RETURN_ERROR_IF(dry_run, 0);
++		RETURN_ERROR_IF_RO_OR_LO;
++	}
++
++	if (!am_daemon || am_chrooted)
++		return do_open(pathname, flags, mode);
++
++	if (!pathname || !*pathname || *pathname == '/')
++		return do_open(pathname, flags, mode);
++
++	slash = strrchr(pathname, '/');
++	if (!slash)
++		return do_open(pathname, flags, mode);
++
++	dlen = slash - pathname;
++	if (dlen >= sizeof dirpath) {
++		errno = ENAMETOOLONG;
++		return -1;
++	}
++	memcpy(dirpath, pathname, dlen);
++	dirpath[dlen] = '\0';
++	bname = slash + 1;
++
++	dfd = secure_relative_open(NULL, dirpath, O_RDONLY | O_DIRECTORY, 0);
++	if (dfd < 0)
++		return -1;
++
++#ifdef O_NOATIME
++	if (open_noatime)
++		flags |= O_NOATIME;
++#endif
++
++	ret = openat(dfd, bname, flags | O_NOFOLLOW | O_BINARY, mode);
++	e = errno;
++	close(dfd);
++	errno = e;
++	return ret;
++#else
++	return do_open(pathname, flags, mode);
++#endif
++}
++
+ #ifdef HAVE_CHMOD
+ int do_chmod(const char *path, mode_t mode)
+ {
+diff --git a/testsuite/bare-do-open-symlink-race.test b/testsuite/bare-do-open-symlink-race.test
+new file mode 100755
+index 00000000..b8c51bbe
+--- /dev/null
++++ b/testsuite/bare-do-open-symlink-race.test
+@@ -0,0 +1,186 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex audit Findings 3b and 3c:
++#
++#   3b: generator.c:1905 -- the in-place backup creation opens
++#       backupptr via bare do_open(O_WRONLY|O_CREAT|O_TRUNC|O_EXCL).
++#       With --backup-dir set to an attacker-planted parent symlink,
++#       the backup file is written outside the module under the
++#       daemon's authority.
++#
++#   3c-symlink: syscall.c:207 -- do_symlink_at falls through to bare
++#       do_symlink for am_root < 0 (fake-super), which then opens
++#       the destination path with bare open() (final-component
++#       fake-super file). A parent symlink on the destination path
++#       redirects the file creation outside the module.
++#
++#   3c-mknod: syscall.c:506 -- do_mknod_at falls through to bare
++#       do_mknod for am_root < 0, same path-based open(). For
++#       FIFOs/sockets/devices the bare path is also used.
++#
++# Each scenario plants a "secret" file outside the module at a
++# location the symlink trap points to. The check is that the
++# outside file's content and mode are unchanged after the attack
++# attempt.
++
++. "$suitedir/rsync.fns"
++
++# All three scenarios depend on receiver-side daemon code paths
++# that are only secured on platforms with a working
++# secure_relative_open. The chdir/chmod tests already skip the
++# same set; mirror that.
++case "$(uname -s)" in
++    SunOS|OpenBSD|NetBSD|CYGWIN*)
++        test_skipped "secure_relative_open relies on RESOLVE_BENEATH-equivalent kernel support not available on $(uname -s)"
++        ;;
++esac
++
++mod="$scratchdir/module"
++outside="$scratchdir/outside"
++src="$scratchdir/src"
++conf="$scratchdir/test-rsyncd.conf"
++
++# Portable inode-and-mode helpers.
++file_mode() {
++    stat -c %a "$1" 2>/dev/null || stat -f %Lp "$1"
++}
++
++setup() {
++    rm -rf "$mod" "$outside" "$src"
++    mkdir -p "$mod" "$outside" "$src"
++
++    echo "OUTSIDE_PROTECTED_DATA" > "$outside/target.txt"
++    chmod 0644 "$outside/target.txt"
++    outside_pristine="$scratchdir/outside-pristine.txt"
++    cp -p "$outside/target.txt" "$outside_pristine"
++
++    ln -s "$outside" "$mod/cd"
++}
++
++verify_outside_unchanged() {
++    label="$1"
++    mode=$(file_mode "$outside/target.txt")
++    case "$mode" in
++        644|0644) ;;
++        *) test_fail "$label: outside/target.txt mode changed from 644 to $mode" ;;
++    esac
++    if ! cmp -s "$outside/target.txt" "$outside_pristine"; then
++        test_fail "$label: outside/target.txt content changed -- daemon followed the cd symlink"
++    fi
++}
++
++verify_outside_unchanged_or_absent() {
++    label="$1"
++    target="$2"  # specific file under outside/ to check absence of
++    if [ -e "$outside/$target" ]; then
++        test_fail "$label: outside/$target was created -- daemon followed the cd symlink"
++    fi
++}
++
++
++############################################################
++# Scenario 3b: --inplace --backup --backup-dir=cd
++#
++# Pre-create module/target.txt so the receiver enters the in-place
++# update path; a backup of the existing content must be made
++# before the update. With --backup-dir=cd, backupptr resolves to
++# "cd/target.txt"; with the bug, robust_unlink and the bare
++# do_open at generator.c:1905 both follow the cd symlink, the
++# unlink deletes outside/target.txt and the create writes the
++# pre-existing module/target.txt content there.
++############################################################
++
++setup
++echo "EXISTING_MODULE_DATA" > "$mod/target.txt"
++chmod 0666 "$mod/target.txt"
++echo "NEW_DATA_FROM_SENDER" > "$src/target.txt"
++chmod 0644 "$src/target.txt"
++
++cat > "$conf" <<EOF
++use chroot = no
++log file = $scratchdir/rsyncd.log
++[upload]
++    path = $mod
++    use chroot = no
++    read only = no
++EOF
++
++RSYNC_CONNECT_PROG="$RSYNC --config=$conf --daemon" \
++    $RSYNC --inplace --backup --backup-dir=cd "$src/target.txt" \
++    rsync://localhost/upload/target.txt >/dev/null 2>&1 || true
++
++verify_outside_unchanged "3b inplace+backup-dir=cd"
++
++
++############################################################
++# Scenario 3c-symlink: fake-super symlink push to a path with a
++# symlinked parent
++#
++# With "fake super = yes" set on the module, the receiver
++# represents symlinks as fake-super files (regular files with the
++# link target written to them). The path-based open() in
++# do_symlink's fake-super branch follows parent symlinks. We push
++# a single symlink to the destination path "cd/sym" so the
++# receiver's create-file call lands at "cd/sym" relative to the
++# module root, where cd is the symlink trap.
++############################################################
++
++setup
++
++mkdir -p "$src/cd"
++ln -s /etc/passwd "$src/cd/sym"
++
++cat > "$conf" <<EOF
++use chroot = no
++log file = $scratchdir/rsyncd.log
++[upload_fake]
++    path = $mod
++    use chroot = no
++    read only = no
++    fake super = yes
++EOF
++
++RSYNC_CONNECT_PROG="$RSYNC --config=$conf --daemon" \
++    $RSYNC -rl "$src/" rsync://localhost/upload_fake/ >/dev/null 2>&1 || true
++
++verify_outside_unchanged_or_absent "3c-symlink fake-super symlink push" "sym"
++
++
++############################################################
++# Scenario 3c-mknod: fake-super FIFO push to a path with a
++# symlinked parent
++#
++# Similar to 3c-symlink but for special files. mkfifo works
++# without root; we push a FIFO and verify the receiver doesn't
++# create a fake-super file at outside/fifo.
++############################################################
++
++setup
++
++mkdir -p "$src/cd"
++mkfifo "$src/cd/fifo" 2>/dev/null
++if [ ! -p "$src/cd/fifo" ]; then
++    test_skipped "mkfifo unavailable; cannot exercise 3c-mknod"
++fi
++
++cat > "$conf" <<EOF
++use chroot = no
++log file = $scratchdir/rsyncd.log
++[upload_fake]
++    path = $mod
++    use chroot = no
++    read only = no
++    fake super = yes
++EOF
++
++RSYNC_CONNECT_PROG="$RSYNC --config=$conf --daemon" \
++    $RSYNC -rD "$src/" rsync://localhost/upload_fake/ >/dev/null 2>&1 || true
++
++verify_outside_unchanged_or_absent "3c-mknod fake-super FIFO push" "fifo"
++
++exit 0
+diff --git a/testsuite/copy-dest-source-symlink.test b/testsuite/copy-dest-source-symlink.test
+new file mode 100755
+index 00000000..2d20fab4
+--- /dev/null
++++ b/testsuite/copy-dest-source-symlink.test
+@@ -0,0 +1,83 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for codex audit Finding 3a: copy_file()'s source
++# open in copy_altdest_file() is via do_open_nofollow(), which only
++# refuses a final-component symlink. Parent components are still
++# resolved with normal symlink-following. A daemon module attacker
++# who plants a parent symlink at module/cd -> /outside, then runs
++# --copy-dest=cd against a source file matching the size+mtime of
++# /outside/target.txt, drives the receiver to:
++#
++#   1. Find a match-level >= 2 basis at "cd/target.txt"
++#   2. Call copy_altdest_file -> copy_file(src="cd/target.txt", ...)
++#   3. do_open_nofollow follows the "cd" parent symlink and reads
++#      the contents of /outside/target.txt under the daemon's
++#      authority
++#   4. Copy that content into the module destination
++#
++# Result: outside/target.txt content lands at module/target.txt,
++# accessible to the attacker on a subsequent pull.
++#
++# We detect by content: src/target.txt and outside/target.txt have
++# identical metadata (size + mtime + mode) but different content.
++# After the transfer, module/target.txt should match src (no
++# basedir escape) -- if it matches outside, the bug copied across
++# the symlink boundary.
++
++. "$suitedir/rsync.fns"
++
++mod="$scratchdir/module"
++outside="$scratchdir/outside"
++src="$scratchdir/src"
++conf="$scratchdir/test-rsyncd.conf"
++
++rm -rf "$mod" "$outside" "$src"
++mkdir -p "$mod" "$outside" "$src"
++
++# Outside-the-module file the daemon should not read on the
++# attacker's behalf.
++echo "OUTSIDE_LEAKED_DATA!" > "$outside/target.txt"
++chmod 0644 "$outside/target.txt"
++
++# The symlink trap.
++ln -s "$outside" "$mod/cd"
++
++# Source: same size, same mtime, same mode as outside -- so the
++# generator's link_stat + quick_check_ok finds a match-level >= 2
++# basis and calls copy_altdest_file.
++echo "ATTACKER_KNOWN_DATA!" > "$src/target.txt"
++touch -r "$outside/target.txt" "$src/target.txt"
++chmod 0644 "$src/target.txt"
++
++cat > "$conf" <<EOF
++use chroot = no
++log file = $scratchdir/rsyncd.log
++[upload]
++    path = $mod
++    use chroot = no
++    read only = no
++EOF
++
++# --copy-dest push to module root.
++RSYNC_CONNECT_PROG="$RSYNC --config=$conf --daemon" \
++    $RSYNC -rtp --copy-dest=cd "$src/" rsync://localhost/upload/ \
++    >/dev/null 2>&1 || true
++
++if [ ! -f "$mod/target.txt" ]; then
++    test_fail "destination file was not created -- daemon transfer failed before the test could observe the basedir behaviour"
++fi
++
++if cmp -s "$mod/target.txt" "$outside/target.txt"; then
++    test_fail "basedir-escape via copy_file source: module/target.txt now contains the contents of outside/target.txt -- daemon read /outside via the cd symlink and copied it into the module"
++fi
++
++if ! cmp -s "$mod/target.txt" "$src/target.txt"; then
++    test_fail "destination doesn't match source content (and isn't outside content either): unexpected state"
++fi
++
++exit 0
+diff --git a/util1.c b/util1.c
+index 8850019f..d28a8e02 100644
+--- a/util1.c
++++ b/util1.c
+@@ -336,7 +336,13 @@ static int unlink_and_reopen(const char *dest, mode_t mode)
+ 		mode |= S_IWUSR;
+ #endif
+ 	mode &= INITACCESSPERMS;
+-	if ((ofd = do_open(dest, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL, mode)) < 0) {
++	/* Use do_open_at so the create/truncate goes through a secure
++	 * parent dirfd in the daemon-no-chroot deployment. Otherwise
++	 * an attacker could swap a parent component with a symlink in
++	 * the window between robust_unlink (which uses do_unlink_at,
++	 * already secure) and the create here, and redirect the new
++	 * file outside the module. */
++	if ((ofd = do_open_at(dest, O_WRONLY | O_CREAT | O_TRUNC | O_EXCL, mode)) < 0) {
+ 		int save_errno = errno;
+ 		rsyserr(FERROR_XFER, save_errno, "open %s", full_fname(dest));
+ 		errno = save_errno;
+@@ -360,12 +366,23 @@ static int unlink_and_reopen(const char *dest, mode_t mode)
+  * --copy-dest options. */
+ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t mode)
+ {
++	extern int am_daemon, am_chrooted;
+ 	int ifd, ofd;
+ 	char buf[1024 * 8];
+ 	int len;   /* Number of bytes read into `buf'. */
+ 	OFF_T prealloc_len = 0, offset = 0;
+ 
+-	if ((ifd = do_open_nofollow(source, O_RDONLY)) < 0) {
++	/* On a daemon without chroot, route the source open through
++	 * secure_relative_open so a parent-symlink on the source path
++	 * (e.g. --copy-dest=cd where cd is a symlink to an outside
++	 * directory) cannot redirect the read to a file the daemon can
++	 * see but the attacker should not. Plain do_open_nofollow only
++	 * refuses a final-component symlink; parents are still followed. */
++	if (am_daemon && !am_chrooted && source && *source && source[0] != '/')
++		ifd = secure_relative_open(NULL, source, O_RDONLY | O_NOFOLLOW, 0);
++	else
++		ifd = do_open_nofollow(source, O_RDONLY);
++	if (ifd < 0) {
+ 		int save_errno = errno;
+ 		rsyserr(FERROR_XFER, errno, "open %s", full_fname(source));
+ 		errno = save_errno;
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index fdbee387e3..7dd4f7c471 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -31,6 +31,13 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-41035.patch \
            file://CVE-2026-29518_p1.patch \
            file://CVE-2026-29518_p2.patch \
+           file://CVE-2026-43619-dependent_p1.patch \
+           file://CVE-2026-43619-dependent_p2.patch \
+           file://CVE-2026-43619-dependent_p3.patch \
+           file://CVE-2026-43619_p1.patch \
+           file://CVE-2026-43619_p2.patch \
+           file://CVE-2026-43619_p3.patch \
+           file://CVE-2026-43619_p4.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.44.1


