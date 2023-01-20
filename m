Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F08CC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 12:53:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.73261.1674219204432524102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 04:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E44614BF;
	Fri, 20 Jan 2023 04:54:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 755AF3F71A;
	Fri, 20 Jan 2023 04:53:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] quilt: use upstreamed faildiff.test fix
Date: Fri, 20 Jan 2023 12:53:13 +0000
Message-Id: <20230120125313.1045537-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 12:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176186

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../quilt/quilt/faildiff-order.patch          | 47 ++++++++++++-------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch b/met=
a/recipes-devtools/quilt/quilt/faildiff-order.patch
index 40f3c2636a5..f22065a2507 100644
--- a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
+++ b/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
@@ -1,28 +1,41 @@
-This test assumes that two lines that are output on different streams (s=
tdout
-and stderr) will be read in the same order, but thanks to buffering that=
 may not
-be the case.
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
-Change the expected lines to be regexs that each match both expected lin=
es, so
-the test always works no matter the actual order the lines are read in.
+From 4dfe7f9e702c85243a71e4de267a13e434b6d6c2 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Fri, 20 Jan 2023 12:56:08 +0100
+Subject: [PATCH] test: Fix a race condition
=20
-Bug filed at https://savannah.nongnu.org/bugs/index.php?63651 to discuss=
 a
-proper solution.
+The test suite does not differentiate between stdout and stderr. When
+messages are printed to both, the order in which they will reach us
+is apparently not guaranteed. Ideally this would be deterministic, but
+until then, explicitly test stdout and stderr separately in the test
+case itself. Otherwise the test suite fails randomly, which is a pain
+for distribution package maintainers.
=20
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
+This fixes bug #63651 reported by Ross Burton:
+https://savannah.nongnu.org/bugs/index.php?63651
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+---
+ test/faildiff.test | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/test/faildiff.test b/test/faildiff.test
-index 5afb8e3..5f32f71 100644
+index 5afb8e3..0444c15 100644
 --- a/test/faildiff.test
 +++ b/test/faildiff.test
-@@ -28,8 +28,8 @@ What happens on binary files?
+@@ -27,8 +27,9 @@ What happens on binary files?
+ 	> File test.bin added to patch %{P}test.diff
 =20
  	$ printf "\\003\\000\\001" > test.bin
- 	$ quilt diff -pab --no-index
--	>~ (Files|Binary files) a/test\.bin and b/test\.bin differ
--	> Diff failed on file 'test.bin', aborting
-+	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file =
'test.bin', aborting)
-+	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file =
'test.bin', aborting)
+-	$ quilt diff -pab --no-index
++	$ quilt diff -pab --no-index 2>/dev/null
+ 	>~ (Files|Binary files) a/test\.bin and b/test\.bin differ
++	$ quilt diff -pab --no-index >/dev/null
+ 	> Diff failed on file 'test.bin', aborting
  	$ echo %{?}
  	> 1
-=20
+--=20
+2.34.1
+
--=20
2.37.3


