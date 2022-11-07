Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7584AC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 22:09:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1053.1667858987637924886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 14:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817D41FB;
	Mon,  7 Nov 2022 14:09:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E496F3F703;
	Mon,  7 Nov 2022 14:09:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/runtime: clean up deprecated backslash expansion
Date: Mon,  7 Nov 2022 22:09:34 +0000
Message-Id: <20221107220934.199924-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 22:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172937

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/apt.py       | 4 ++--
 meta/lib/oeqa/runtime/cases/buildcpio.py | 7 +++++--
 meta/lib/oeqa/runtime/cases/systemd.py   | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/c=
ases/apt.py
index 4e09374adde..8000645843a 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -39,9 +39,9 @@ class AptRepoTest(AptTest):
         self.target.run('cd %s; echo deb [ allow-insecure=3Dyes ] %s/all=
 ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
=20
     def setup_source_config_for_package_install_signed(self):
-        apt_get_source_server =3D 'http:\/\/%s:%s' % (self.tc.target.ser=
ver_ip, self.repo_server.port)
+        apt_get_source_server =3D 'http://%s:%s' % (self.tc.target.serve=
r_ip, self.repo_server.port)
         apt_get_sourceslist_dir =3D '/etc/apt/'
-        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i=
 's/\[trusted=3Dyes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % =
(apt_get_sourceslist_dir, apt_get_source_server))
+        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i=
 's|\[trusted=3Dyes\] http://bogus_ip:bogus_port|%s|g' sources.list" % (a=
pt_get_sourceslist_dir, apt_get_source_server))
=20
     def cleanup_source_config_for_package_install(self):
         apt_get_sourceslist_dir =3D '/etc/apt/'
diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/run=
time/cases/buildcpio.py
index bd3b46d9ef0..c08de3c914d 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -29,7 +29,10 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure('--disable-maintainer-mode',
-                                   'sed -i -e "/char \*program_name/d" s=
rc/global.c;')
+        self.project.run_configure('--disable-maintainer-mode')
+        # This sed is needed until
+        # https://git.savannah.gnu.org/cgit/cpio.git/commit/src/global.c=
?id=3D641d3f489cf6238bb916368d4ba0d9325a235afb
+        # is in a release.
+        self.project._run(r'sed -i -e "/char \*program_name/d" src/globa=
l.c')
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runti=
me/cases/systemd.py
index 720b4b517ae..37f295492d3 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -154,7 +154,7 @@ class SystemdJournalTests(SystemdTest):
         """
=20
         # The expression chain that uniquely identifies the time boot me=
ssage.
-        expr_items=3D['Startup finished', 'kernel', 'userspace','\.$']
+        expr_items=3D['Startup finished', 'kernel', 'userspace', r'\.$']
         try:
             output =3D self.journalctl(args=3D'-o cat --reverse')
         except AssertionError:
--=20
2.34.1


