Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4434EC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 20:12:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17958.1749154316527078935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 13:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 478761762
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 13:11:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 767C73F673
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 13:11:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: add test for recipe naming/class mismatches
Date: Thu,  5 Jun 2025 21:11:51 +0100
Message-ID: <20250605201151.2019194-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 20:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218082

It's not unheard of for new users to create a recipe called foo-native
that has BBCLASSEXTEND=3D"native" instead of "inherit native". This will
result in a foo-native recipe that is actually a target recipe, and a
foo-native-native recipe for native builds.

Add a test in recipe_qa to verify that recipes called -native inherit
native, and recipes called nativesdk- inherit nativesdk.

As this behaviour is expected, add the new test to the set of tests
required to pass for Yocto Project Compatible status.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 152bef8ad58..eb8591f6242 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -32,7 +32,7 @@ CHECKLAYER_REQUIRED_TESTS =3D "\
     invalid-packageconfig la \
     license-checksum license-exception license-exists license-file-missi=
ng license-format license-no-generic license-syntax \
     mime mime-xdg missing-update-alternatives multilib obsolete-license =
\
-    packages-list patch-fuzz patch-status perllocalpod perm-config perm-=
line perm-link \
+    packages-list patch-fuzz patch-status perllocalpod perm-config perm-=
line perm-link recipe-naming \
     pkgconfig pkgvarcheck pkgv-undefined pn-overrides shebang-size src-u=
ri-bad symlink-to-sysroot \
     unhandled-features-check unknown-configure-option unlisted-pkg-lics =
uppercase-pn useless-rpaths \
     var-undefined virtual-slash xorg-driver-abi"
@@ -1438,6 +1438,12 @@ python do_qa_unpack() {
 python do_recipe_qa() {
     import re
=20
+    def test_naming(pn, d):
+        if pn.endswith("-native") and not bb.data.inherits_class("native=
", d):
+            oe.qa.handle_error("recipe-naming", "Recipe %s appears nativ=
e but is not, should inherit native" % pn, d)
+        if pn.startswith("nativesdk-") and not bb.data.inherits_class("n=
ativesdk", d):
+            oe.qa.handle_error("recipe-naming", "Recipe %s appears nativ=
esdk but is not, should inherit nativesdk" % pn, d)
+
     def test_missing_metadata(pn, d):
         fn =3D d.getVar("FILE")
         srcfile =3D d.getVar('SRC_URI').split()
@@ -1482,6 +1488,7 @@ python do_recipe_qa() {
                 oe.qa.handle_error("invalid-packageconfig", error_msg, d=
)
=20
     pn =3D d.getVar('PN')
+    test_naming(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
--=20
2.43.0


