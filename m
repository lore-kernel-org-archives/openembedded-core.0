Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9622.1793707270684889292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 04:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=U0ovXHTz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E872D1576
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 04:01:06 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A194B3F632
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 04:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793707270; bh=/SoDn7pVQq1Nbxj5ZSnuPj4u4PA5BbX6EqrIQJrcNCg=;
	h=From:To:Subject:Date:From;
	b=U0ovXHTzkK/q1U+6JVVSJpngCql0GF9AyCzlL5u+knMBUgeeO0A1x71l/qY/uGMs/
	 hBO0Vd06+MUpxxqGcAJfjvD0iFTK100JW47sHK7QbLaLvvk2Va3HRMvHLvlnW3GLny
	 mDbOXk9veHN6I9zAhSoVpKrEd08q0DainEZI7g54=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: backport an upstream fix for the eager_task_factory Tests
Date: Tue,  3 Nov 2026 12:01:05 +0000
Message-ID: <20261103120105.1473386-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 12:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249277
Content-Type: text/plain; charset="utf-8"

Backport a fix from upstream to make these tests reliable, and drop the
test skips.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ake-test_staggered_race_with_eager_t.patch | 67 +++++++++++++++++++
 .../python/python3_3.14.10.bb                 | 15 +----
 2 files changed, 68 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-3.14-gh-158=
097-Make-test_staggered_race_with_eager_t.patch

diff --git a/meta/recipes-devtools/python/python3/0001-3.14-gh-158097-Mak=
e-test_staggered_race_with_eager_t.patch b/meta/recipes-devtools/python/p=
ython3/0001-3.14-gh-158097-Make-test_staggered_race_with_eager_t.patch
new file mode 100644
index 00000000000..8c2dc554c88
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-3.14-gh-158097-Make-test_=
staggered_race_with_eager_t.patch
@@ -0,0 +1,67 @@
+From b6e398e6a1884a176e78f94f32112529888d5d45 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 2 Nov 2026 15:46:37 -0800
+Subject: [PATCH] [3.14] gh-158097: Make test_staggered_race_with_eager_t=
asks
+ deterministic (GH-158469) (#161224)
+X-ARM-No-Footer: NoDisclaimer
+
+gh-158097: Make test_staggered_race_with_eager_tasks deterministic (GH-1=
58469)
+
+* gh-158097: Make test_staggered_race_with_eager_tasks deterministic
+
+staggered_race() awaits the coroutines it is given inline, so the
+"await asyncio.sleep(0)" in the test's fail() helper suspended the
+run_one_coro() task running it and left a scheduled resumption behind.
+If the asyncio.sleep(1) winner (started 0.25s late by the stagger delay)
+completes before that resumption runs, the winner's cancel() sets
+_must_cancel and the resumption throws CancelledError into fail(), so
+excs[2] reports a CancelledError instead of a ValueError.
+
+Pending timers are only moved onto the ready queue at the top of
+BaseEventLoop._run_once() and are appended after the handles already
+queued, so the t=3D0.50s stagger timer and the t=3D1.25s sleep(1) timer =
run
+in due-time order.  When both are due in the same _run_once() - which is
+what a busy CI machine causes - the stagger timer starts fail(), which
+immediately suspends again, and the very next handle is the winner.
+
+Raise straight away instead, so the ValueError is stored in excs[2] in
+the same step that starts the coroutine and there is no longer a
+scheduled resumption for a cancellation to overtake.  The outcome no
+longer depends on the event loop getting another iteration.
+
+* Update Lib/test/test_asyncio/test_eager_task_factory.py
+
+* Delete Misc/NEWS.d/next/Tests/2026-09-30-00-00-00.gh-issue-158097.pcB3=
mO.rst
+
+---------
+(cherry picked from commit 3945eaf2fcd9cbc3f3061275bd29751c8b2e7d3b)
+
+Co-authored-by: Abhinav <alpha9coder@gmail.com>
+Co-authored-by: abhinav-phi <abhinav-phi@users.noreply.github.com>
+Co-authored-by: Andrew Svetlov <andrew.svetlov@gmail.com>
+
+Upstream-Status: Backport [b6e398e6a1884a176e78f94f32112529888d5d45]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Lib/test/test_asyncio/test_eager_task_factory.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_asyncio/test_eager_task_factory.py b/Lib/test=
/test_asyncio/test_eager_task_factory.py
+index 0561b54a3f1..72bceb8c314 100644
+--- a/Lib/test/test_asyncio/test_eager_task_factory.py
++++ b/Lib/test/test_asyncio/test_eager_task_factory.py
+@@ -217,7 +217,9 @@ def test_staggered_race_with_eager_tasks(self):
+         # See https://github.com/python/cpython/issues/124309
+=20
+         async def fail():
+-            await asyncio.sleep(0)
++            # Raise without suspending: staggered_race() cancels unfini=
shed
++            # coroutines once another one wins, so yielding first could=
 turn
++            # this into a CancelledError when the event loop is busy.
+             raise ValueError("no good")
+=20
+         async def blocked():
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index c50c4d4babc..8f35801699d 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
            file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.pa=
tch \
            file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_g=
ot_eof.patch \
+           file://0001-3.14-gh-158097-Make-test_staggered_race_with_eage=
r_t.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
@@ -303,20 +304,6 @@ SKIPPED_TESTS +=3D " \
     --ignore test.test_asyncio.test_taskgroups.TestTaskGroup.test_taskgr=
oup_23 \
 "
=20
-# Intermittent failure under load - this asyncio staggered_race test sta=
rts
-# candidate coroutines 0.25s apart and expects the third one to raise
-# ValueError after an "await asyncio.sleep(0)". On loaded autobuilder ho=
sts
-# under QEMU emulation the winning coroutine finishes and staggered_race
-# cancels the losers before the third coroutine resumes to raise, so its
-# recorded exception is CancelledError instead of ValueError. Upstream t=
est
-# is timing-sensitive (CPython #124309). Skip both the pure-Python and
-# C-accelerated eager task factory variants.
-# Bugzilla YP 16435
-SKIPPED_TESTS +=3D " \
-    --ignore test.test_asyncio.test_eager_task_factory.PyEagerTaskFactor=
yLoopTests.test_staggered_race_with_eager_tasks \
-    --ignore test.test_asyncio.test_eager_task_factory.CEagerTaskFactory=
LoopTests.test_staggered_race_with_eager_tasks \
-"
-
 # Intermittent failure under load - this concurrent.futures ProcessPool =
test
 # starts a worker and expects it to be stranded within a 30s thread-join
 # timeout. On loaded autobuilder hosts under QEMU emulation (seen on
--=20
2.43.0

