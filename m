Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A063C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:26:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15143.1634671586655732263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3F8ED1
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461543F694
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] strace: handle loaded test systems
Date: Tue, 19 Oct 2021 20:26:13 +0100
Message-Id: <20211019192614.153903-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019192614.153903-1-ross.burton@arm.com>
References: <20211019192614.153903-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:26:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157202

If the host is loaded when running the tests there is a good chance
that strace-T.test will fail, as it does a sleep(1) and checks that
the nanosleep() call lasted for 0.9-1.1 seconds.

Relax the test so that the test passes if the call takes less than two
seconds.

[ YOCTO #14596 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/strace/strace/ptest-sleep.patch | 7 +++++++
 meta/recipes-devtools/strace/strace_5.14.bb           | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/ptest-sleep.patch

diff --git a/meta/recipes-devtools/strace/strace/ptest-sleep.patch b/meta=
/recipes-devtools/strace/strace/ptest-sleep.patch
new file mode 100644
index 0000000000..5629dec319
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
@@ -0,0 +1,7 @@
+diff --git a/tests/strace-T.expected b/tests/strace-T.expected
+index 1ea020465..f78d3e2c8 100644
+--- a/tests/strace-T.expected
++++ b/tests/strace-T.expected
+@@ -1 +1 @@
+-nanosleep\(\{tv_sec=3D1, tv_nsec=3D0\}, NULL\) =3D 0 <(1\.[01]|0\.9)[[:=
digit:]]{5}>
++nanosleep\(\{tv_sec=3D1, tv_nsec=3D0\}, NULL\) =3D 0 <(1\.|0\.9)[[:digi=
t:]]{5}>
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


