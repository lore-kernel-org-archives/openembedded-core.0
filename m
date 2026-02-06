Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE38EE20AC
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 14:57:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13123.1770389839525531597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 06:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B16CB339
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 06:57:12 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B55C83F778
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 06:57:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/selftests/reproducible: use the jQuery CDN instead of jquery-native
Date: Fri,  6 Feb 2026 14:57:14 +0000
Message-ID: <20260206145716.1615377-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206145716.1615377-1-ross.burton@arm.com>
References: <20260206145716.1615377-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 14:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230624

Instead of building jquery-native and then copying the file into the
expected place in the build tree, simply tell diffoscope to load jQuery
from their CDN.

In the slim chance that the diffoscope report is viewed offline, the
only regression is that sections cannot be collapsed.

The advantage to this approach is that we no longer need to maintain a
jquery-native recipe simply for the reproducible selftests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa=
/selftest/cases/reproducible.py
index bad17cc40b..7adeaacd4f 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -105,6 +105,7 @@ def run_diffoscope(a_dir, b_dir, html_dir, max_report=
_size=3D0, max_diff_block_lin
            '--max-diff-block-lines', str(max_diff_block_lines),
            '--exclude-directory-metadata', 'yes',
            '--html-dir', html_dir,
+           '--jquery', 'https://code.jquery.com/jquery-3.7.1.min.js',
            a_dir, b_dir]
     return runCmd(cmd, **kwargs)
=20
@@ -319,10 +320,9 @@ class ReproducibleTests(OESelftestTestCase):
=20
         # Build native utilities
         self.write_config('')
-        bitbake("diffoscope-native diffutils-native jquery-native -c add=
to_recipe_sysroot")
+        bitbake("diffoscope-native diffutils-native -c addto_recipe_sysr=
oot")
         diffutils_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "diffu=
tils-native")
         diffoscope_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "diff=
oscope-native")
-        jquery_sysroot =3D get_bb_var("RECIPE_SYSROOT_NATIVE", "jquery-n=
ative")
=20
         if self.save_results:
             os.makedirs(self.save_results, exist_ok=3DTrue)
@@ -398,9 +398,6 @@ class ReproducibleTests(OESelftestTestCase):
                 package_dir =3D os.path.join(save_dir, 'packages')
                 package_html_dir =3D os.path.join(package_dir, 'diff-htm=
l')
=20
-                # Copy jquery to improve the diffoscope output usability
-                self.copy_file(os.path.join(jquery_sysroot, 'usr/share/j=
avascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.=
js'))
-
                 run_diffoscope('reproducibleA', 'reproducibleB-extended'=
, package_html_dir, max_report_size=3Dself.max_report_size,
                         max_diff_block_lines_saved=3Dself.max_diff_block=
_lines_saved,
                         max_diff_block_lines=3Dself.max_diff_block_lines=
,
--=20
2.43.0


