Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13543.1626107278978070521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 09:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0161131B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 09:27:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F4B93F774
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 09:27:57 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 9/9] tcl: fix race in interp.test
Date: Mon, 12 Jul 2021 17:27:45 +0100
Message-Id: <20210712162745.1302840-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712162745.1302840-1-ross.burton@arm.com>
References: <20210712162745.1302840-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's a timeout race in interp which is exposed when running under load=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/tcltk/tcl/interp.patch | 32 ++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/interp.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch b/meta/recipes-=
devtools/tcltk/tcl/interp.patch
new file mode 100644
index 0000000000..95d6318f64
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/interp.patch
@@ -0,0 +1,32 @@
+The interp-36.7 patch has race conditions and is missing cleanup.  This =
patch by
+a Tcl maintainer should improve matters.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/interp.test b/tests/interp.test
+index d7424847f..fc90990f3 100644
+--- a/tests/interp.test
++++ b/tests/interp.test
+@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handle=
r of child [1999035]} -setup {
+         variable result
+         set result [lindex $args 0]
+     }
++    set tout [after 5000 {set result timeout}]
+ } -body {
+     child eval {
+         variable done {}
+         after 0 error foo
+-        after 10 [list ::set [namespace which -variable done] {}]
+-        vwait [namespace which -variable done]
+     }
++    vwait result
+     set result
+ } -cleanup {
++    after cancel $tout
+     variable result {}
+-    unset -nocomplain result
++    unset -nocomplain result tout
+     interp delete child
+ } -result foo
+=20
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

