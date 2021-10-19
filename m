Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01543C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 11:35:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8418.1634643333361288178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA9BDED1
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:35:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 661D23F70D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:35:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gawk: reduce strictness of the time test
Date: Tue, 19 Oct 2021 12:35:29 +0100
Message-Id: <20211019113529.1612190-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019113529.1612190-1-ross.burton@arm.com>
References: <20211019113529.1612190-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 11:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157109

The time.awk test does a sleep() and verifies that the actual delay is
close to the requested time. However on a loaded system the range of
acceptable durations is quite tight and will occasionally fail.

Solve this by increasing the range of acceptable delays slightly to
between 50% and 200% of the requested delay.

[ YOCTO #14371 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gawk/gawk/test-time.patch                 | 22 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.0.bb      |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/test-time.patch

diff --git a/meta/recipes-extended/gawk/gawk/test-time.patch b/meta/recip=
es-extended/gawk/gawk/test-time.patch
new file mode 100644
index 0000000000..05a68c5faf
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/test-time.patch
@@ -0,0 +1,22 @@
+The test time.awk does a sleep() and checks that the real sleep duration=
 is
+close to the expected duration.
+
+As currently our tests can run on a heavily loaded system, increase the =
range of
+a passing duration.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/test/time.awk b/test/time.awk
+index 517377e2..ca81d92d 100644
+--- a/test/time.awk
++++ b/test/time.awk
+@@ -16,7 +16,7 @@ BEGIN {
+    printf "sleep(%s) =3D %s\n",delta,sleep(delta)
+    t1 =3D timecheck()
+    slept =3D t1-t0
+-   if ((slept < 0.9*delta) || (slept > 1.3*delta))
++   if ((slept < 0.5*delta) || (slept > 2*delta))
+       printf "Warning: tried to sleep %.2f secs, but slept for %.2f sec=
s\n",
+ 	     delta,slept
+ }
diff --git a/meta/recipes-extended/gawk/gawk_5.1.0.bb b/meta/recipes-exte=
nded/gawk/gawk_5.1.0.bb
index 3c801e8bcc..0961efa897 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.0.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mp=
fr"
 SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            file://0001-Use-cross-AR-during-compile.patch \
+           file://test-time.patch \
 "
=20
 SRC_URI[md5sum] =3D "f719bc9966df28e67fc6ebc405e7ea03"
--=20
2.25.1


