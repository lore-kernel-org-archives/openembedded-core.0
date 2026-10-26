Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42912.1793021854786926105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 06:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YnfgIU+L;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED02C293B
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 06:37:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4D4F3F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793021854; bh=sSswxuhwKY3HYUK5qFVsuVItZM2fNLgNQ4G6DWqwGY0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YnfgIU+LkkXzBiGnyzTRJaj+VYXmeiHPduKFrfzbExCDZogYZfrTWxUPdgQlm2iRM
	 S01VUzddb75CuJJbyNDLzJ8eQL2fZOt6lf/Ws2+cY+Bu5gG8GtIoHkgg/z2PCvxMwS
	 Q+8nDZAvRmjdekHmHZCkRLJxmBKFOtAa0QrMaIOA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3: remove obsolete SKIPPED_TESTS
Date: Mon, 26 Oct 2026 13:37:31 +0000
Message-ID: <20261026133732.1738889-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026133732.1738889-1-ross.burton@arm.com>
References: <20261026133732.1738889-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 13:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248682
Content-Type: text/plain; charset="utf-8"

We were skipping a number of tests that upon retesting with 3.14.9 do
not appear to be skipped anymore.  Test with both musl and glibc:

musl:
  Total tests: run=3D48,010 (filtered) skipped=3D2,290
  Total test files: run=3D529/538 (filtered) skipped=3D77 resource_denied=
=3D9

glibc:
  Total tests: run=3D48,024 (filtered) skipped=3D2,520
  Total test files: run=3D529/538 (filtered) skipped=3D76 resource_denied=
=3D9

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3_3.14.9.bb | 38 -------------------
 1 file changed, 38 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.9.bb b/meta/recipe=
s-devtools/python/python3_3.14.9.bb
index a64fa172632..d5e882fdb8d 100644
--- a/meta/recipes-devtools/python/python3_3.14.9.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -276,38 +276,6 @@ SKIPPED_TESTS =3D " \
     --ignore test_write_read_append \
 "
=20
-# We build Python3 with editline support by default, which has tab compl=
etion
-# but not bang completion. test_bang_completion_without_do_shell() passe=
s if
-# building with readline, but we don't want to change the default, so sk=
ip the
-# test.
-# https://github.com/python/cpython/issues/150922
-SKIPPED_TESTS +=3D " \
-    --ignore test_bang_completion_without_do_shell \
-"
-
-# Also fails with editline instead of readline. See:
-# https://github.com/python/cpython/issues/123018
-SKIPPED_TESTS +=3D " \
-    --ignore test_write_read_limited_history \
-"
-
-# In 3.14+ PyREPL's uses terminfo instead of curses. ICH1, is not in the
-# resulting terminal capabilities, in an "optimization" occurring from P=
yREPL's
-# side that causes test_cursor_back_write() to fail. Specifically, the t=
est
-# tests the following writes in sequence:
-#
-# 1. b"1"
-# 2. TERM_CAPABILITIES["cub"] + b":1"
-# 3. ANY, b"2"
-#
-# The first two writes are read correctly, but the result for the third
-# write is seeing the equivalent of:
-#
-# ANY, b"21"
-SKIPPED_TESTS +=3D " \
-    --ignore test_cursor_back_write \
-"
-
 # Needs IMAGE_FEATURE +=3D \"tools-sdk\"
 # Can be removed when https://github.com/python/cpython/pull/151231 is m=
erged
 SKIPPED_TESTS +=3D " \
@@ -320,12 +288,6 @@ SKIPPED_TESTS +=3D " \
     --ignore test_sysconfigdata_json \
 "
=20
-# Fails with segfault
-# Bugzilla YP 16182 (test_tracemalloc_track_race)
-SKIPPED_TESTS +=3D " \
-    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race =
\
-"
-
 # Intermittent failure under load - the remote pdb attach test is timing
 # sensitive and fails on loaded autobuilder hosts (CPython #130363)
 # Bugzilla YP 16201, 16412
--=20
2.43.0

