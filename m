Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674D3C5DF97
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 23:48:22 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6397.1787528896854984104
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 16:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=R91fvn2l;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 53B4E20B7166; Sun, 23 Aug 2026 16:47:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 53B4E20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787528865;
	bh=4XcWvZt2YRNWl4A3R8l+5ySiPVoy1yOMRJm1lWhqfRc=;
	h=From:To:Subject:Date:From;
	b=R91fvn2loI0zqdj76YQudCyNCCqYj6s/kQo/XHqfaVEni32+3iGdOQB144vUyYuv3
	 HjL/D3YHImmnDnqslq/SStXMjlELODZebjSunUZb+QTTuDRaVoLdWe09TCcJ/ZdpMJ
	 RzIL7N7pZ8iaPFObvejUrQ/0R0AyXCAr728SImXI=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/retain: add ability to ignore certain tasks
Date: Sun, 23 Aug 2026 16:47:42 -0700
Message-ID: <20260823234742.1170713-1-paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 23:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244043

From: Paul Eggleton <paul.eggleton@microsoft.com>

If you have retain enabled and RETAIN_DIRS_ALWAYS set, then run certain
tasks by themselves (e.g. -c clean), it can be annoying to have that
trigger retention. Add a RETAIN_IGNORE_TASKS variable that enables
specifying tasks that should be ignored by this class, and set a
reasonable default.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes-global/retain.bbclass     | 8 +++++++-
 meta/lib/oeqa/selftest/cases/retain.py | 6 ++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/retain.bbclass b/meta/classes-global/ret=
ain.bbclass
index 46e8c256cf..d81446b8a1 100644
--- a/meta/classes-global/retain.bbclass
+++ b/meta/classes-global/retain.bbclass
@@ -46,6 +46,8 @@
 #   is writing out the data that you wish to save.
 # * The tarballs have the tarball name as a top-level directory so that
 #   multiple tarballs can be extracted side-by-side easily.
+# * Some tasks shouldn't by themselves trigger retention (e.g. do_clean)=
.
+#   For that we have RETAIN_IGNORE_TASKS.
 #
 # Copyright (c) 2020, 2024 Microsoft Corporation
 #
@@ -59,6 +61,7 @@ RETAIN_DIRS_GLOBAL_FAILURE ?=3D ""
 RETAIN_DIRS_GLOBAL_ALWAYS ?=3D ""
 RETAIN_TARBALL_SUFFIX ?=3D "${DATETIME}.tar.gz"
 RETAIN_ENABLED ?=3D "1"
+RETAIN_IGNORE_TASKS ?=3D "do_clean do_cleansstate do_cleanall do_listtas=
ks do_addto_recipe_sysroot"
=20
=20
 def retain_retain_dir(desc, tarprefix, path, tarbasepath, d):
@@ -99,6 +102,10 @@ python retain_task_handler() {
     if d.getVar('RETAIN_ENABLED') !=3D '1':
         return
=20
+    taskname =3D d.getVar('BB_CURRENTTASK')
+    if 'do_' + taskname in d.getVar('RETAIN_IGNORE_TASKS').split():
+        return
+
     dirs =3D d.getVar('RETAIN_DIRS_ALWAYS')
     if isinstance(e, bb.build.TaskFailed):
         dirs +=3D ' ' + d.getVar('RETAIN_DIRS_FAILURE')
@@ -109,7 +116,6 @@ python retain_task_handler() {
         bb.utils.mkdirhier(outdir)
         dirlist_file =3D os.path.join(outdir, 'retain_dirs.list')
         pn =3D d.getVar('PN')
-        taskname =3D d.getVar('BB_CURRENTTASK')
         with open(dirlist_file, 'a') as f:
             for entry in dirs:
                 f.write('%s %s %s\n' % (pn, taskname, entry))
diff --git a/meta/lib/oeqa/selftest/cases/retain.py b/meta/lib/oeqa/selft=
est/cases/retain.py
index 892be45857..c6d0952085 100644
--- a/meta/lib/oeqa/selftest/cases/retain.py
+++ b/meta/lib/oeqa/selftest/cases/retain.py
@@ -39,10 +39,8 @@ class Retain(OESelftestTestCase):
             self.fail('RETAIN_OUTDIR value "%s" is invalid' % retain_out=
dir)
         if not oe.path.is_path_parent(tmpdir, retain_outdir):
             self.fail('RETAIN_OUTDIR (%s) is not underneath TMPDIR (%s)'=
 % (retain_outdir, tmpdir))
-        try:
-            shutil.rmtree(retain_outdir)
-        except FileNotFoundError:
-            pass
+        if os.path.exists(retain_outdir) and os.listdir(retain_outdir):
+            self.fail('RETAIN_OUTDIR should be empty after -c clean')
=20
         bitbake(test_recipe)
         if not glob.glob(os.path.join(retain_outdir, '%s_temp_*.tar.gz' =
% test_recipe)):
--=20
2.43.7


