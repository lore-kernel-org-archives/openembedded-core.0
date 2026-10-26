Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43217.1793021854227013479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 06:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ph5UWHNg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 594D02936
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 06:37:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30D863F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793021853; bh=xLXhgXcT4K7dHKKK3DTsCYBEAk+3g8scc8BMHPfPdF8=;
	h=From:To:Subject:Date:From;
	b=ph5UWHNgXaMw0WgZYLFhYmNJuMexSAUUqD0b543PcODG9WycMXzf4rmMkFcZ/Lh3N
	 JxMBEDkhrHxfIkYJsH3cBto3rPOcdhCnxM7OkSGH0zky5vheH8LxpkwUN0swPWj0OB
	 KhRRFMBN6F9QdCShoJlRkRqHXQPEmg41j0QYke2Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3: remove obsolete musl test skipping
Date: Mon, 26 Oct 2026 13:37:30 +0000
Message-ID: <20261026133732.1738889-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 13:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248681
Content-Type: text/plain; charset="utf-8"

Remove a number of musl-specific test skipping, these tests now skip
themselves when ran with musl:

  test_date_locale2 (test.test_strptime.StrptimeTests.test_date_locale2)
    skipped 'musl libc issue, bpo-46390'

In core-image-ptest-python3 with musl:

    =3D=3D Tests result: SUCCESS =3D=3D

    77 tests skipped:
        ...

    9 tests skipped (resource denied):
        ...

    452 tests OK.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.9.bb | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.9.bb b/meta/recipe=
s-devtools/python/python3_3.14.9.bb
index 683edea1d83..a64fa172632 100644
--- a/meta/recipes-devtools/python/python3_3.14.9.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -309,6 +309,7 @@ SKIPPED_TESTS +=3D " \
 "
=20
 # Needs IMAGE_FEATURE +=3D \"tools-sdk\"
+# Can be removed when https://github.com/python/cpython/pull/151231 is m=
erged
 SKIPPED_TESTS +=3D " \
     --ignore test_find_library_with_gcc \
     --ignore test_find_library_with_ld \
@@ -356,18 +357,6 @@ SKIPPED_TESTS +=3D " \
     --ignore test.test_asyncio.test_eager_task_factory.CEagerTaskFactory=
LoopTests.test_staggered_race_with_eager_tasks \
 "
=20
-SKIPPED_TESTS:append:libc-musl =3D " \
-    -x test__locale \
-    -x test_c_locale_coercion \
-    -x test_locale \
-    -x test_os test_re \
-    -x test__xxsubinterpreters \
-    -x test_threading \
-    --ignore test.test_strptime.StrptimeTests.test_date_locale2 \
-    --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym=
 \
-    --ignore test.test_multiprocessing_fork.test_processes.WithProcesses=
TestProcess.test_interrupt \
-"
-
 # https://github.com/python/cpython/issues/159424
 SKIPPED_TESTS:append:libc-musl =3D " \
     --ignore test.test_readline.TestHistoryManipulation.test_append_limi=
ted_history \
--=20
2.43.0

