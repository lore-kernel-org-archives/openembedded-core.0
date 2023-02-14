Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D31C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:46:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12280.1676393181240225761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77AE01042;
	Tue, 14 Feb 2023 08:47:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F38E3F881;
	Tue, 14 Feb 2023 08:46:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] lib/buildstats: handle tasks that never finished
Date: Tue, 14 Feb 2023 16:46:14 +0000
Message-Id: <20230214164615.2793394-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177158

If a task is aborted the buildstats file isn't complete, so calculate
when the build finished and use that as a end time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/buildstats.py | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 3b76286ba57..fa94c655399 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -79,8 +79,8 @@ class BSTask(dict):
             return self['rusage']['ru_oublock']
=20
     @classmethod
-    def from_file(cls, buildstat_file):
-        """Read buildstat text file"""
+    def from_file(cls, buildstat_file, fallback_end=3D0):
+        """Read buildstat text file. fallback_end is an optional end tim=
e for tasks that are not recorded as finishing."""
         bs_task =3D cls()
         log.debug("Reading task buildstats from %s", buildstat_file)
         end_time =3D None
@@ -108,7 +108,10 @@ class BSTask(dict):
                     bs_task[ru_type][ru_key] =3D val
                 elif key =3D=3D 'Status':
                     bs_task['status'] =3D val
-        if end_time is not None and start_time is not None:
+        # If the task didn't finish, fill in the fallback end time if sp=
ecified
+        if start_time and not end_time and fallback_end:
+            end_time =3D fallback_end
+        if start_time and end_time:
             bs_task['elapsed_time'] =3D end_time - start_time
         else:
             raise BSError("{} looks like a invalid buildstats file".form=
at(buildstat_file))
@@ -226,15 +229,33 @@ class BuildStats(dict):
         epoch =3D match.group('epoch')
         return name, epoch, version, revision
=20
+    @staticmethod
+    def parse_top_build_stats(path):
+        """
+        Parse the top-level build_stats file for build-wide start and du=
ration.
+        """
+        with open(path) as fobj:
+            for line in fobj.readlines():
+                key, val =3D line.split(':', 1)
+                val =3D val.strip()
+                if key =3D=3D 'Build Started':
+                    start =3D float(val)
+                elif key =3D=3D "Elapsed time":
+                    elapsed =3D float(val.split()[0])
+        return start, elapsed
+
     @classmethod
     def from_dir(cls, path):
         """Load buildstats from a buildstats directory"""
-        if not os.path.isfile(os.path.join(path, 'build_stats')):
+        top_stats =3D os.path.join(path, 'build_stats')
+        if not os.path.isfile(top_stats):
             raise BSError("{} does not look like a buildstats directory"=
.format(path))
=20
         log.debug("Reading buildstats directory %s", path)
-
         buildstats =3D cls()
+        build_started, build_elapsed =3D buildstats.parse_top_build_stat=
s(top_stats)
+        build_end =3D build_started + build_elapsed
+
         subdirs =3D os.listdir(path)
         for dirname in subdirs:
             recipe_dir =3D os.path.join(path, dirname)
@@ -244,7 +265,7 @@ class BuildStats(dict):
             bsrecipe =3D BSRecipe(name, epoch, version, revision)
             for task in os.listdir(recipe_dir):
                 bsrecipe.tasks[task] =3D BSTask.from_file(
-                    os.path.join(recipe_dir, task))
+                    os.path.join(recipe_dir, task), build_end)
             if name in buildstats:
                 raise BSError("Cannot handle multiple versions of the sa=
me "
                               "package ({})".format(name))
--=20
2.34.1


