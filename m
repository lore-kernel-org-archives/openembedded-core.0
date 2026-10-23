Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8314.1792765704205806356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 07:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=PSGsO9Jr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D7C11C00
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:28:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 478CB3F673
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792765703; bh=9qiUnHVUGGsrnQWuyuMVegV6JwYRszfAuhJlBrZLjsM=;
	h=From:To:Subject:Date:From;
	b=PSGsO9Jr0J3MkCc7jLLwhCJ1ZtoF9bxu3BeqDCYfcI8VhOkuUtaKZfleIsghSF0mu
	 khpYKRM5WtdsTFzEwsjb4QJ23Xl4Cr6EXgupKCIlPy+jdpN3fuPbNgWwipB7QHJ4YG
	 WcjPQNqH+q8CslHkDVIyOf0vVSQcWXEsmPZzKEmc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: skip test.test_readline.TestHistoryManipulation on musl
Date: Fri, 23 Oct 2026 15:28:19 +0100
Message-ID: <20261023142819.2173443-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 14:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248555
Content-Type: text/plain; charset="utf-8"

Fixes to the editline integration have sadly introduced regressions on
musl:

FAIL: test_append_limited_history (test.test_readline.TestHistoryManipula=
tion.test_append_limited_history)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.14/test/test_readline.py", line 208, in test_app=
end_limited_history
    self.assertEqual(readline.get_history_item(1), "second line")
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: '_HiStOrY_V2_' !=3D 'second line'
- _HiStOrY_V2_
+ second line

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL: test_write_read_append (test.test_readline.TestHistoryManipulation.=
test_write_read_append)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.14/test/test_readline.py", line 101, in test_wri=
te_read_append
    self.assertEqual(readline.get_current_history_length(), 3)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 4 !=3D 3

A ticket has been filed upstream so skip the tests for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.9.bb b/meta/recipe=
s-devtools/python/python3_3.14.9.bb
index 7cee04a0a19..683edea1d83 100644
--- a/meta/recipes-devtools/python/python3_3.14.9.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -368,6 +368,11 @@ SKIPPED_TESTS:append:libc-musl =3D " \
     --ignore test.test_multiprocessing_fork.test_processes.WithProcesses=
TestProcess.test_interrupt \
 "
=20
+# https://github.com/python/cpython/issues/159424
+SKIPPED_TESTS:append:libc-musl =3D " \
+    --ignore test.test_readline.TestHistoryManipulation.test_append_limi=
ted_history \
+    --ignore test.test_readline.TestHistoryManipulation.test_write_read_=
append \
+"
=20
 do_install_ptest:append () {
     sed -i -e "s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\"${SKIPPED_TESTS}\"|"=
 ${D}${PTEST_PATH}/run-ptest
--=20
2.43.0

