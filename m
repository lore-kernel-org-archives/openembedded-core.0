Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6D1C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 14:30:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10258.1634826609552749886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5674D6E
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:30:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FDB73F73D
	for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:30:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] strace: handle loaded test systems
Date: Thu, 21 Oct 2021 15:30:05 +0100
Message-Id: <20211021143005.803665-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 14:30:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157283

If the host is loaded when running the tests there is a good chance
that strace-T.test will fail, as it does a sleep(1) and checks that
the nanosleep() call lasted for 0.9-1.1 seconds.

As this isn't reliable when the host is loaded, disable the test.

[ YOCTO #14596 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../strace/strace/ptest-sleep.patch           | 20 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.14.bb   |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/ptest-sleep.patch

diff --git a/meta/recipes-devtools/strace/strace/ptest-sleep.patch b/meta=
/recipes-devtools/strace/strace/ptest-sleep.patch
new file mode 100644
index 0000000000..310e7140b6
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
@@ -0,0 +1,20 @@
+The strace-T test executes sleep(1) and verifies that the nanosleep() sy=
scall
+lasted between 0.9 and 1.2 seconds, which is too unreliable when the sys=
tem is
+under load.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/strace-T.test b/tests/strace-T.test
+index adca3e872..d4acfe9a2 100755
+--- a/tests/strace-T.test
++++ b/tests/strace-T.test
+@@ -9,6 +9,8 @@
+=20
+ . "${srcdir=3D.}/init.sh"
+=20
++skip_ "Test not reliable under load"
++
+ T_opt=3D"${1:--T}"
+=20
+ run_prog ../sleep 0
diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-d=
evtools/strace/strace_5.14.bb
index a81bda04ba..9ae1367337 100644
--- a/meta/recipes-devtools/strace/strace_5.14.bb
+++ b/meta/recipes-devtools/strace/strace_5.14.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
+           file://ptest-sleep.patch \
            "
 SRC_URI[sha256sum] =3D "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3=
141b7cb307b11e73"
=20
--=20
2.25.1


