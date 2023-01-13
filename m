Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69EFC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:57:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.93259.1673629026464340999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 08:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77BB5106F;
	Fri, 13 Jan 2023 08:57:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6A993F67D;
	Fri, 13 Jan 2023 08:57:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] quilt: fix intermittent failure in faildiff.test
Date: Fri, 13 Jan 2023 16:57:02 +0000
Message-Id: <20230113165702.1312882-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113165702.1312882-1-ross.burton@arm.com>
References: <20230113165702.1312882-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 16:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175841

This test assumes that if a child process writes one line to stderr and
then another line to stdout, and stderr is redirected to stdout, that
the order the lines will be read is stable.

This isn't the case and occasionally the lines will be read in a
different order.  Change the test to ignore line ordering.

[ YOCTO #14469 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 .../quilt/quilt/faildiff-order.patch          | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patc=
h

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
index b4284dcafb3..f7ff958103e 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -12,6 +12,7 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.t=
ar.gz \
         file://test.sh \
         file://0001-tests-Allow-different-output-from-mv.patch \
         file://fix-grep-3.8.patch \
+        file://faildiff-order.patch \
 "
=20
 SRC_URI:append:class-target =3D " file://gnu_patch_test_fix_target.patch=
"
diff --git a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch b/met=
a/recipes-devtools/quilt/quilt/faildiff-order.patch
new file mode 100644
index 00000000000..40f3c2636a5
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
@@ -0,0 +1,28 @@
+This test assumes that two lines that are output on different streams (s=
tdout
+and stderr) will be read in the same order, but thanks to buffering that=
 may not
+be the case.
+
+Change the expected lines to be regexs that each match both expected lin=
es, so
+the test always works no matter the actual order the lines are read in.
+
+Bug filed at https://savannah.nongnu.org/bugs/index.php?63651 to discuss=
 a
+proper solution.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/test/faildiff.test b/test/faildiff.test
+index 5afb8e3..5f32f71 100644
+--- a/test/faildiff.test
++++ b/test/faildiff.test
+@@ -28,8 +28,8 @@ What happens on binary files?
+=20
+ 	$ printf "\\003\\000\\001" > test.bin
+ 	$ quilt diff -pab --no-index
+-	>~ (Files|Binary files) a/test\.bin and b/test\.bin differ
+-	> Diff failed on file 'test.bin', aborting
++	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file =
'test.bin', aborting)
++	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file =
'test.bin', aborting)
+ 	$ echo %{?}
+ 	> 1
+=20
--=20
2.34.1


