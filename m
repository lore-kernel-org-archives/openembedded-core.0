Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580A6C4453D
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 04:40:42 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13047.1784868030298413219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 21:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=a7rM3wlt;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=38693; q=dns/txt;
  s=iport01; t=1784868030; x=1786077630;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=735IZDQD7Xm49FsAER4PXKjeeg06yTOoV76ELp2SgJI=;
  b=a7rM3wltYzG4x/jmUqBFMfmjbsI+FJIAp4+aec7JkL6DL/oOI329J3h5
   Obnnas6OmguFYCNTvRSfjCjMwRu/MxoFbLJvQABed3PlQDnXtN4YwpIqJ
   nf3aObHdnxlKDZuOobjPZyNNRlNKNJF0OxMY5jHA9Iom6DVQnPFaRWONC
   nc9tqlqpGcPLeGuXNxYN7Hr3+c4O57ow2VlF50dwQ0sIPxIDPVT1nsZck
   DT8bNaZbTxOWCc/AQUIF66rpFjSHtphFNgtHrnpa2YjDVZftqJs5UuvRa
   DTOyC+M7ljNdqbbH6fV9eCH/kyN11CJL/8UH8raYrOx4BDNhCnlAwhQwR
   g==;
X-CSE-ConnectionGUID: essWRvXQQTuNpamgg2/lqw==
X-CSE-MsgGUID: 0FRDMftQRIGo0NXnFTPIJw==
X-IPAS-Result: =?us-ascii?q?A0BLAgAQ7GJq/5D/Ja1RCR4BAQsSDIIFC4JXdF9CSYRXk?=
 =?us-ascii?q?XOBFpA3jFEUgWoPAQEBD0QNBAEBhQWNYQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBHQEIBAsBGAEbEiwDAQIDAiYCLSMYC?=
 =?us-ascii?q?R+CYwGCdAIBEQbBHRo3en8zgQGDKAE/AkNQ2y4BCxQBBYEFLoU/gx0BhQJcG?=
 =?us-ascii?q?AGEfCcbG4FygRWBO4E4doEFgVwCAgEXgQANDRODdIJqBIIiehKBWAIeMpAES?=
 =?us-ascii?q?IECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0WBsHBYEdgSx5hFcjHwM5f?=
 =?us-ascii?q?4EvdUp3LWkBEheBJoNJAoE3AwsYDUgRLDcUGQQ9AW4HjWsjgXEvGQcBLAQMG?=
 =?us-ascii?q?xwHEwEHDBggAiYILxIHASoSAhUMDAQfBRECHxkDkj0jCAEBOI9lgiGBNZ9aC?=
 =?us-ascii?q?iiDdYwhj0KFeBozhASUF5JRC5h9glmLMZU0BzhdhGmBaDyBRA4HcBWDIglKG?=
 =?us-ascii?q?Q9WjTUfAwsLg2CFE4E9w2okNQIJMgEBBwIHDgMLgWiEYYsfAiYHgU8BAQ?=
IronPort-Data: A9a23:mDoao6MmxkAle3DvrR30lsFynXyQoLVcMsEvi/4bfWQNrUp00DdTm
 GIYWjqCOvvca2ajc9pxOtu+9EkH6pSHmoMyTHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gWIsbgr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/h1F34MI70hw9pqJ3lH8
 PMXcncJdw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIJslhO6yg3DlWzZZs1mS46Ew5gA/ySQsiOa2a4SIKoXiqcN9xmiii
 kfI413DIz4dbPqvzxS5ylOOmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:SmbR36p2yy6lQp85pay2T/UaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV+6faUskd1ZJhOo7G90cW7LE80lqQFg7X5Q43DYOCOggLBR+tfBODZrQEIdReTygd179
 YGT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AnKMecmumS4ZbMalfVBXTJyam6IsoaWbi9mngGna?=
 =?us-ascii?q?EFEBxQbiaRgXX/Lp7xp8=3D?=
X-Talos-MUID: 9a23:XKjYiwkj836DTohStIAHdno6Gv1ExqqyMXosvpJenfmCGxBIGhWC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,181,1779148800"; 
   d="scan'208";a="506336581"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 04:40:28 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 741FA180003D8;
	Fri, 24 Jul 2026 04:40:28 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 1C7A6CC124B; Thu, 23 Jul 2026 21:40:28 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH v3 1/6] rsync: Fix CVE-2026-29518
Date: Thu, 23 Jul 2026 21:39:09 -0700
Message-Id: <20260724043914.4061351-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 04:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241885

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch backports the upstream rsync v3.4.3 security fix train for
CVE-2026-29518. The direct CVE fixes are [3] and [4]:

- [3] enables secure_relative_open() for daemon modules running with
  "use chroot = no", closing the receiver-side basis-file TOCTOU.
- [4] routes the sender read path through secure_relative_open() from
  the trusted module root, closing the matching sender-side TOCTOU.

This patch also carries [1] and [2] from the same upstream v3.4.3
security/update train. These are supporting secure_relative_open()
changes, not standalone direct CVE fixes: [1] uses Linux
openat2(RESOLVE_BENEATH) to preserve the same confinement while allowing
legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the
equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's
rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits
before the direct CVE-2026-29518 commits.

The upstream fixed release is referenced in [5], and the public CVE
record is referenced in [6]. Individual backported commit links are
also recorded in the embedded patch headers.

[1] https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18fe2fd6cd79adef8a1
[2] https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707ec8b829524c3809a43
[3] https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569faa60216582fb6c5d
[4] https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba050337ef32092f2894c
[5] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
[6] https://www.cve.org/CVERecord?id=CVE-2026-29518

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
Changes in v2:
- No changes made; rebase only.

 .../rsync/files/CVE-2026-29518_p1.patch       | 392 ++++++++++++++++++
 .../rsync/files/CVE-2026-29518_p2.patch       |  98 +++++
 .../rsync/files/CVE-2026-29518_p3.patch       | 328 +++++++++++++++
 .../rsync/files/CVE-2026-29518_p4.patch       |  71 ++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   4 +
 5 files changed, 893 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
new file mode 100644
index 0000000000..fcb7b777fe
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
@@ -0,0 +1,392 @@
+From e7b575413b962ac042079a55530577b20c7eee44 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18fe2fd6cd79adef8a1]
+
+(cherry picked from commit 4fa7156ccdb2ad34b034d18fe2fd6cd79adef8a1)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ syscall.c                            |  62 ++++++-
+ testsuite/symlink-dirlink-basis.test | 247 +++++++++++++++++++++++++++
+ 2 files changed, 304 insertions(+), 5 deletions(-)
+ create mode 100755 testsuite/symlink-dirlink-basis.test
+
+diff --git a/syscall.c b/syscall.c
+index 34a9bba0..d66c9fdd 100644
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
+@@ -715,12 +720,49 @@ int do_open_nofollow(const char *pathname, int flags)
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
+@@ -734,6 +776,16 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
+ 		return -1;
+ 	}
+ 
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
+ #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
+ 	// really old system, all we can do is live with the risks
+ 	if (!basedir) {
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
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
new file mode 100644
index 0000000000..661f23db76
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
@@ -0,0 +1,98 @@
+From 0675997f170b6463dd20306ee97e346e79196335 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707ec8b829524c3809a43]
+
+(cherry picked from commit 7f60ec001a0be63b770707ec8b829524c3809a43)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ syscall.c | 40 +++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/syscall.c b/syscall.c
+index d66c9fdd..9033196f 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -729,9 +729,13 @@ int do_open_nofollow(const char *pathname, int flags)
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
+@@ -763,6 +767,32 @@ static int secure_relative_open_linux(const char *basedir, const char *relpath,
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
+@@ -786,6 +816,10 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
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
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch
new file mode 100644
index 0000000000..9c138b5437
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch
@@ -0,0 +1,328 @@
+From edfd5b913c9afdb0f340cf8135544399206f6e62 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 31 Dec 2025 10:01:23 +1100
+Subject: [PATCH] syscall+clientserver: am_chrooted and use_secure_symlinks for
+ daemon-no-chroot (CVE-2026-29518)
+
+CVE-2026-29518: an rsync daemon configured with "use chroot = no"
+is exposed to a TOCTOU race on parent path components. A local
+attacker with write access to a module can replace a parent
+directory component with a symlink between the receiver's check
+and its open(), redirecting reads (basis-file disclosure) and
+writes (file overwrite) outside the module. Under elevated daemon
+privilege this allows privilege escalation. Default
+"use chroot = yes" is not exposed.
+
+Add secure_relative_open() in syscall.c. It walks the parent
+components under RESOLVE_BENEATH (Linux 5.6+) /
+O_RESOLVE_BENEATH (FreeBSD 13+, macOS 15+) / per-component
+O_NOFOLLOW elsewhere, anchored at a trusted dirfd, so a parent-
+symlink swap is rejected by the kernel. Route the receiver's
+basis-file open in receiver.c through it when use_secure_symlinks
+is set in clientserver.c rsync_module().
+
+Reporters: Nullx3D (Batuhan SANCAK); Damien Neil; Michael Stapelberg.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569faa60216582fb6c5d]
+
+(cherry picked from commit f1c24ab03bc85cb2638a569faa60216582fb6c5d)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ clientserver.c |  25 +++++++++
+ options.c      |   9 ++++
+ receiver.c     |  22 ++++++--
+ syscall.c      | 139 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 192 insertions(+), 3 deletions(-)
+
+diff --git a/clientserver.c b/clientserver.c
+index 7c897abc..b6eba098 100644
+--- a/clientserver.c
++++ b/clientserver.c
+@@ -30,6 +30,7 @@ extern int list_only;
+ extern int am_sender;
+ extern int am_server;
+ extern int am_daemon;
++extern int am_chrooted;
+ extern int am_root;
+ extern int msgs2stderr;
+ extern int rsync_port;
+@@ -38,6 +39,7 @@ extern int ignore_errors;
+ extern int preserve_xattrs;
+ extern int kluge_around_eof;
+ extern int munge_symlinks;
++extern int use_secure_symlinks;
+ extern int open_noatime;
+ extern int sanitize_paths;
+ extern int numeric_ids;
+@@ -981,6 +983,7 @@ static int rsync_module(int f_in, int f_out, int i, const char *addr, const char
+ 			io_printf(f_out, "@ERROR: chroot failed\n");
+ 			return -1;
+ 		}
++		am_chrooted = 1;
+ 		module_chdir = module_dir;
+ 	}
+ 
+@@ -1003,6 +1006,15 @@ static int rsync_module(int f_in, int f_out, int i, const char *addr, const char
+ 		}
+ 	}
+ 
++	/* Enable secure symlink handling for any non-chrooted daemon module.
++	 * This prevents TOCTOU race attacks where an attacker could switch a
++	 * directory to a symlink between path validation and file open.
++	 * Match the gate used by the do_*_at() wrappers in syscall.c
++	 * (am_daemon && !am_chrooted) -- the protection has nothing to do
++	 * with symlink munging, so a module configured with
++	 * "munge symlinks = false" must still get the secure-open path. */
++	use_secure_symlinks = am_daemon && !am_chrooted;
++
+ 	if (gid_list.count) {
+ 		gid_t *gid_array = gid_list.items;
+ 		if (setgid(gid_array[0])) {
+@@ -1305,6 +1317,19 @@ int start_daemon(int f_in, int f_out)
+ 			rsyserr(FLOG, errno, "daemon chroot(\"%s\") failed", p);
+ 			return -1;
+ 		}
++		/* Deliberately do NOT set am_chrooted here.  am_chrooted
++		 * gates the per-module symlink-race defenses
++		 * (secure_relative_open() and the do_*_at() wrappers in
++		 * syscall.c) and means "the kernel is enforcing path
++		 * confinement at the module boundary".  The daemon chroot
++		 * confines path resolution to the daemon-chroot directory,
++		 * not to any individual module path -- modules sharing the
++		 * daemon chroot are still distinguishable filesystem
++		 * subtrees and a sender-controlled symlink in module A
++		 * could redirect a syscall to module B (or to other files
++		 * inside the daemon chroot) without the per-module
++		 * defenses.  Leave am_chrooted=0 here so secure_relative_open()
++		 * still fires for "use chroot = no" modules. */
+ 		if (chdir("/") < 0) {
+ 			rsyserr(FLOG, errno, "daemon chdir(\"/\") failed");
+ 			return -1;
+diff --git a/options.c b/options.c
+index 578507c6..87c91376 100644
+--- a/options.c
++++ b/options.c
+@@ -113,11 +113,20 @@ int mkpath_dest_arg = 0;
+ int allow_inc_recurse = 1;
+ int xfer_dirs = -1;
+ int am_daemon = 0;
++/* Set after a successful per-module chroot ("use chroot = yes") in
++ * clientserver.c. NOT set for the daemon-level "daemon chroot = /X"
++ * chroot: that confines path resolution to /X, but module paths
++ * /X/modA, /X/modB, etc. are not chroot boundaries, so the per-module
++ * symlink-race defenses (secure_relative_open() / do_*_at() in
++ * syscall.c, gated by `am_daemon && !am_chrooted`) must still fire
++ * even when the daemon is inside a daemon chroot. */
++int am_chrooted = 0;
+ int connect_timeout = 0;
+ int keep_partial = 0;
+ int safe_symlinks = 0;
+ int copy_unsafe_links = 0;
+ int munge_symlinks = 0;
++int use_secure_symlinks = 0;
+ int size_only = 0;
+ int daemon_bwlimit = 0;
+ int bwlimit = 0;
+diff --git a/receiver.c b/receiver.c
+index edfbb210..5a2c8c5a 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -70,6 +70,7 @@ extern int fuzzy_basis;
+ 
+ extern struct name_num_item *xfer_sum_nni;
+ extern int xfer_sum_len;
++extern int use_secure_symlinks;
+ 
+ static struct bitbag *delayed_bits = NULL;
+ static int phase = 0, redoing = 0;
+@@ -214,7 +215,12 @@ int open_tmpfile(char *fnametmp, const char *fname, struct file_struct *file)
+ 	 * access to ensure that there is no race condition.  They will be
+ 	 * correctly updated after the right owner and group info is set.
+ 	 * (Thanks to snabb@epipe.fi for pointing this out.) */
+-	fd = do_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERMS);
++	/* When use_secure_symlinks is on (non-chroot daemon with munge_symlinks),
++	 * use secure_mkstemp to prevent symlink race attacks on parent directories. */
++	if (use_secure_symlinks)
++		fd = secure_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERMS);
++	else
++		fd = do_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERMS);
+ 
+ #if 0
+ 	/* In most cases parent directories will already exist because their
+@@ -854,11 +860,21 @@ int recv_files(int f_in, int f_out, char *local_name)
+ 		/* We now check to see if we are writing the file "inplace" */
+ 		if (inplace || one_inplace)  {
+ 			fnametmp = one_inplace ? partialptr : fname;
+-			fd2 = do_open(fnametmp, O_WRONLY|O_CREAT, 0600);
++			/* When use_secure_symlinks is on (non-chroot daemon),
++			 * use secure open to prevent symlink race attacks where an
++			 * attacker could switch a directory to a symlink between
++			 * path validation and file open. */
++			if (use_secure_symlinks)
++				fd2 = secure_relative_open(NULL, fnametmp, O_WRONLY|O_CREAT, 0600);
++			else
++				fd2 = do_open(fnametmp, O_WRONLY|O_CREAT, 0600);
+ #ifdef linux
+ 			if (fd2 == -1 && errno == EACCES) {
+ 				/* Maybe the error was due to protected_regular setting? */
+-				fd2 = do_open(fname, O_WRONLY, 0600);
++				if (use_secure_symlinks)
++					fd2 = secure_relative_open(NULL, fname, O_WRONLY, 0600);
++				else
++					fd2 = do_open(fname, O_WRONLY, 0600);
+ 			}
+ #endif
+ 			if (fd2 == -1) {
+diff --git a/syscall.c b/syscall.c
+index 9033196f..dcecda1a 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -877,6 +877,145 @@ cleanup:
+ #endif // O_NOFOLLOW, O_DIRECTORY
+ }
+ 
++/* Fill buf with len random bytes.  Prefers /dev/urandom for cryptographic
++ * quality; falls back to rand() if /dev/urandom cannot be opened or read
++ * (e.g. inside a chroot or container without /dev populated). */
++static void rand_bytes(unsigned char *buf, size_t len)
++{
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++	int fd = open("/dev/urandom", O_RDONLY | O_CLOEXEC);
++	if (fd >= 0) {
++		ssize_t n = read(fd, buf, len);
++		close(fd);
++		if (n == (ssize_t)len) {
++			return;
++		}
++	}
++	for (size_t i = 0; i < len; i++) {
++		buf[i] = (unsigned char)rand();
++	}
++}
++
++/*
++  Secure version of mkstemp that prevents symlink attacks on parent directories.
++  Like secure_relative_open(), this walks the path checking each component
++  with O_NOFOLLOW to prevent TOCTOU race conditions.
++
++  The template may be relative or absolute, but must not contain ../ components.
++  Returns fd on success, -1 on error.
++*/
++int secure_mkstemp(char *template, mode_t perms)
++{
++#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
++	/* Fall back to regular mkstemp on old systems */
++	return do_mkstemp(template, perms);
++#else
++	char *lastslash;
++	int dirfd = AT_FDCWD;
++	int fd = -1;
++
++	if (!template) {
++		errno = EINVAL;
++		return -1;
++	}
++	if (strncmp(template, "../", 3) == 0 || strstr(template, "/../")) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	/* For absolute paths, start the secure walk from "/" rather than CWD. */
++	if (template[0] == '/') {
++		dirfd = open("/", O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
++		if (dirfd < 0)
++			return -1;
++	}
++
++	/* Find the last slash to separate directory from filename */
++	lastslash = strrchr(template, '/');
++	if (lastslash) {
++		char *path_copy = my_strdup(template, __FILE__, __LINE__);
++		if (!path_copy)
++			return -1;
++
++		/* Null-terminate at the last slash to get directory part */
++		path_copy[lastslash - template] = '\0';
++
++		/* Walk the directory path securely */
++		for (const char *part = strtok(path_copy, "/");
++		     part != NULL;
++		     part = strtok(NULL, "/"))
++		{
++			int next_fd = openat(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
++			if (next_fd == -1) {
++				int save_errno = errno;
++				free(path_copy);
++				if (dirfd != AT_FDCWD) close(dirfd);
++				errno = (save_errno == ELOOP) ? ELOOP : save_errno;
++				return -1;
++			}
++			if (dirfd != AT_FDCWD) close(dirfd);
++			dirfd = next_fd;
++		}
++		free(path_copy);
++	}
++
++	/* Now create the temp file in the securely-opened directory */
++	perms |= S_IWUSR;
++
++	/* Generate unique filename - we need to modify the template in place */
++	char *filename = lastslash ? lastslash + 1 : template;
++	size_t filename_len = strlen(filename);
++
++	if (filename_len < 6) {
++		if (dirfd != AT_FDCWD) close(dirfd);
++		errno = EINVAL;
++		return -1;
++	}
++	char *suffix = filename + filename_len - 6; /* Points to XXXXXX */
++	if (strcmp(suffix, "XXXXXX") != 0) {
++		if (dirfd != AT_FDCWD) close(dirfd);
++		errno = EINVAL;
++		return -1;
++	}
++
++	/* Try random suffixes until we find one that works */
++	static const char letters[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
++	for (int tries = 0; tries < 100; tries++) {
++		unsigned char rbytes[6];
++		rand_bytes(rbytes, sizeof(rbytes));
++		for (int i = 0; i < 6; i++)
++			suffix[i] = letters[rbytes[i] % (sizeof(letters) - 1)];
++
++		fd = openat(dirfd, filename, O_RDWR | O_CREAT | O_EXCL | O_NOFOLLOW, perms);
++		if (fd >= 0)
++			break;
++		if (errno != EEXIST) {
++			if (dirfd != AT_FDCWD) close(dirfd);
++			return -1;
++		}
++	}
++
++	if (fd >= 0) {
++		if (fchmod(fd, perms) != 0 && preserve_perms) {
++			int errno_save = errno;
++			close(fd);
++			unlinkat(dirfd, filename, 0);
++			if (dirfd != AT_FDCWD) close(dirfd);
++			errno = errno_save;
++			return -1;
++		}
++#if defined HAVE_SETMODE && O_BINARY
++		setmode(fd, O_BINARY);
++#endif
++	}
++
++	if (dirfd != AT_FDCWD) close(dirfd);
++	return fd;
++#endif
++}
++
+ /*
+   varient of do_open/do_open_nofollow which does do_open() if the
+   copy_links or copy_unsafe_links options are set and does
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch
new file mode 100644
index 0000000000..ba9ef808b4
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch
@@ -0,0 +1,71 @@
+From 302e3116633ed953e0c1cc2d6878d7a22b6bf9b8 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sun, 1 Mar 2026 09:28:40 +1100
+Subject: [PATCH] sender: fix read-path TOCTOU by opening from module root
+ (CVE-2026-29518)
+
+The sender's file open was vulnerable to the same TOCTOU symlink
+race as the receiver-side basis-file open. change_pathname() calls
+chdir() into subdirectories, which follows symlinks; an attacker
+could race to swap a directory for a symlink between the chdir and
+the file open, allowing reads of privileged files through the
+daemon.
+
+Reconstruct the full relative path (F_PATHNAME + fname) and open
+via secure_relative_open() from the trusted module_dir, which
+walks each path component without following symlinks. This is
+independent of CWD, so the chdir race is neutralised.
+
+CVE-2026-29518.
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba050337ef32092f2894c]
+
+(cherry picked from commit 859d44fa4f1420775e4ba050337ef32092f2894c)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ sender.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/sender.c b/sender.c
+index b1588b70..99f431fe 100644
+--- a/sender.c
++++ b/sender.c
+@@ -48,6 +48,8 @@ extern int make_backups;
+ extern int inplace;
+ extern int inplace_partial;
+ extern int batch_fd;
++extern int use_secure_symlinks;
++extern char *module_dir;
+ extern int write_batch;
+ extern int file_old_total;
+ extern BOOL want_progress_now;
+@@ -352,7 +354,25 @@ void send_files(int f_in, int f_out)
+ 			exit_cleanup(RERR_PROTOCOL);
+ 		}
+ 
+-		fd = do_open_checklinks(fname);
++		if (use_secure_symlinks) {
++			/* Open from module root to prevent TOCTOU race where
++			 * change_pathname's chdir follows a directory symlink.
++			 * Reconstruct the full path relative to module_dir
++			 * from F_PATHNAME (path) and f_name (fname). */
++			char secure_path[MAXPATHLEN];
++			int slen = snprintf(secure_path, sizeof secure_path, "%s%s%s", path, slash, fname);
++			if (slen >= (int)sizeof secure_path) {
++				io_error |= IOERR_GENERAL;
++				rprintf(FERROR_XFER, "path too long: %s%s%s\n", path, slash, fname);
++				free_sums(s);
++				if (protocol_version >= 30)
++					send_msg_int(MSG_NO_SEND, ndx);
++				continue;
++			}
++			fd = secure_relative_open(module_dir, secure_path, O_RDONLY, 0);
++		} else {
++			fd = do_open_checklinks(fname);
++		}
+ 		if (fd == -1) {
+ 			if (errno == ENOENT) {
+ 				enum logcode c = am_daemon && protocol_version < 28 ? FERROR : FWARNING;
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 509be486b8..e2fe0128d5 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -16,6 +16,10 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://CVE-2025-10158.patch \
+           file://CVE-2026-29518_p1.patch \
+           file://CVE-2026-29518_p2.patch \
+           file://CVE-2026-29518_p3.patch \
+           file://CVE-2026-29518_p4.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.35.6

