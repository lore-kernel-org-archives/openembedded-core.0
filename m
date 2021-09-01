Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.757.1630515428842215488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 09:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0610B1042
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Sep 2021 09:57:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0EED3F694
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Sep 2021 09:57:05 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest: allow the ptest-packagelists.inc warning to be disabled
Date: Wed,  1 Sep 2021 17:57:03 +0100
Message-Id: <20210901165703.803645-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ptest.bbclass has a sanity check that all recipes in oe-core which
inherit ptest are also listed in the ptest-packagelists.inc file, and
the build fails if this is not the case.

Whilst this is a laudable goal, it is over-zealous as if the recipe has
a bbappend in another layer which inherits ptest, the build will fail.

By changing the combination of anonymous Python and bb.error() to a
recipe-scope QA test, this can be handled with the other sanity checks
and bbappends can skip the test if desired.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass |  2 +-
 meta/classes/ptest.bbclass  | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b84e6035edb..20d4e4d7463 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,7 +27,7 @@ WARN_QA ?=3D " libdir xorg-driver-abi \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn pa=
tch-fuzz \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
-            missing-update-alternatives native-last \
+            missing-update-alternatives native-last missing-ptest \
             "
 ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch pkgconfig la =
\
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 200446e52b1..77614ae8609 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -118,13 +118,15 @@ python () {
     if not(d.getVar('PTEST_ENABLED') =3D=3D "1"):
         for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'd=
o_install_ptest_base']:
             bb.build.deltask(i, d)
+}
=20
+QARECIPETEST[missing-ptest] =3D "package_qa_check_missing_ptest"
+def package_qa_check_missing_ptest(pn, d, messages):
     # This checks that ptest package is actually included
     # in standard oe-core ptest images - only for oe-core recipes
     if not 'meta/recipes' in d.getVar('FILE') or not(d.getVar('PTEST_ENA=
BLED') =3D=3D "1"):
         return
=20
-    enabled_ptests =3D " ".join([d.getVar('PTESTS_FAST'),d.getVar('PTEST=
S_SLOW'), d.getVar('PTESTS_PROBLEMS')]).split()
-    if (d.getVar('PN') + "-ptest").replace(d.getVar('MLPREFIX'), '') not=
 in enabled_ptests:
-         bb.error("Recipe %s supports ptests but is not included in oe-c=
ore's conf/distro/include/ptest-packagelists.inc" % d.getVar("PN"))
-}
+    enabled_ptests =3D " ".join([d.getVar('PTESTS_FAST'), d.getVar('PTES=
TS_SLOW'), d.getVar('PTESTS_PROBLEMS')]).split()
+    if (pn + "-ptest").replace(d.getVar('MLPREFIX'), '') not in enabled_=
ptests:
+        package_qa_handle_error("missing-ptest", "supports ptests but is=
 not included in oe-core's ptest-packagelists.inc", d)
--=20
2.25.1

