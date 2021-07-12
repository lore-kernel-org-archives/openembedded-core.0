Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11243.1626097928152241718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B73856D
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 621063F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] tcl: increase timeouts in interp.test
Date: Mon, 12 Jul 2021 14:51:59 +0100
Message-Id: <20210712135159.2131269-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135159.2131269-1-ross.burton@arm.com>
References: <20210712135159.2131269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/interp.patch | 23 ++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb    |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/interp.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch b/meta/recipes-=
devtools/tcltk/tcl/interp.patch
new file mode 100644
index 0000000000..f33dbb21ac
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/interp.patch
@@ -0,0 +1,23 @@
+Sometimes this test fails, and it appears as if this is because if the s=
ystem is
+loaded then the 'after 0' and 'after 10' blocks happen in the same itera=
tion of
+the interpretter and are executed in the wrong order.
+
+Increase the timeout on the 10ms interval to 1000ms to be a little more =
forgiving
+of system load.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/interp.test b/tests/interp.test
+index 385d3e2ab..3b07ce30c 100644
+--- a/tests/interp.test
++++ b/tests/interp.test
+@@ -3599,7 +3599,7 @@ test interp-36.7 {ChildBgerror sets error handler =
of child [1999035]} -setup {
+     child eval {
+         variable done {}
+         after 0 error foo
+-        after 10 [list ::set [namespace which -variable done] {}]
++        after 1000 [list ::set [namespace which -variable done] {}]
+         vwait [namespace which -variable done]
+     }
+     set result
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-dev=
tools/tcltk/tcl_8.6.11.bb
index 0d7c2e4ac3..57a86e4c64 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "${BASE_SRC_URI} \
            file://fix_issue_with_old_distro_glibc.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
+           file://interp.patch \
            file://run-ptest \
 "
 SRC_URI[sha256sum] =3D "cfb49aab82bd179651e23eeeb69606f51b0ddc575ca55c3d=
35e2457469024cfa"
--=20
2.25.1

