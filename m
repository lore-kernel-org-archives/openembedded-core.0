Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2876.1795108442320812013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 09:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=r0hvJ2ep;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C23351575
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:13:58 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 597803F673
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795108441; bh=kJad/jrp36F6vnwY4YpP1Nq3dGcc7+TFbyqVPdACM9s=;
	h=From:To:Subject:Date:From;
	b=r0hvJ2epeui5MoJuN4P/l+WwJioguB6jy9qaiVmrPfhDVOlPN8iCOl4GQfYsavYV8
	 s3LEqz2Nq/S+l99HUeWMB9Dx/BxMFh0rfFGgiDnuPeJO0W2sOWgCxwcTfGyxEPlhvN
	 Rf6Ygo4/zLRtL0ZtMO3OtFChW2wZZLEjkJq+T+Lc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: skip test_monotonic_settime() test case
Date: Thu, 19 Nov 2026 17:13:59 +0000
Message-ID: <20261119171359.3296818-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 17:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250714
Content-Type: text/plain; charset="utf-8"

This test sets the system clock back an hour for a fraction of a second,
but we also run the tests with a moderate level of parallelism (-j4).

Obviously this means that several times a year the tarfile tests run in
that microsecond window and fail because mtimes are not as expected...

Skip this test as we'd prefer the speed gains from running the tests in
parallel over the testing of clock_settime().

Also change a SKIPPED_TESTS assignment to use +=3D instead of :append.

[ YOCTO #15783 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.15.2.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipe=
s-devtools/python/python3_3.15.2.bb
index bfc783c9227..bc6c3b919d6 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -320,9 +320,12 @@ SKIPPED_TESTS +=3D " \
 # test_timerfd_ns_TFS_TIMER_ABSTIME was observed failing in Bugzilla YP =
16470.
 # There are actually several other tests in the suite that all look pron=
e to
 # load variability, so skip the whole test class.
-SKIPPED_TESTS:append =3D " \
-    --ignore TimerfdTests \
-"
+SKIPPED_TESTS +=3D "--ignore TimerfdTests"
+
+# Skip a test that changes the system time
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15783
+# https://github.com/python/cpython/issues/162280
+SKIPPED_TESTS +=3D "--ignore test.test_time.TimeTestCase.test_monotonic_=
settime"
=20
 # https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16348
 SKIPPED_TESTS:append:libc-musl =3D " \
--=20
2.43.0

