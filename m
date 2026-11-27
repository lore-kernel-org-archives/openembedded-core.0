Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15357.1795783629602028162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 04:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=LxToeQ03;
 spf=pass (domain: geanix.com, ip: 185.70.43.170, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795783624; x=1796042824;
	bh=psZjcTsx5znABmsNWbD7cdMXDMgGLiDhH3kXZa4NczQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LxToeQ03zEJJyVk8piq8+05h2Fvgv+0OmhPNuLoC3A1lL84DeN3/KxyAzFJgAogLn
	 8ba2xfRq6V6hPzPG3gMXEM1xv6pjz+4oqTyGRSJ5ym2ELH1UKcaceCPQiNLTFp06OP
	 pPPL3iG0HS+SbeTI0g4hkqc+WFlPGhMXZaCJSuHBHjVW7SllRVQksyC2QgAGAcdSIk
	 MdtOQpTGHeyI3mDozWMIyfYltNekiz5XHWZNc/2LxiyVW/dp5ZKefYQ7pSKlJoYLbP
	 lOqhoX3+Qbc2nYJCIu20jY/Ljdsv4HQPeeGJmPg0+VjaKq2+dzXPaCSpR+rDwQ0a9l
	 g3baDzvGV207w==
X-Pm-Submission-Id: 4jbY8R1CvLz1DFF6
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH 1/2] rm_work: also remove work directories for do_populate_sdk
Date: Fri, 27 Nov 2026 13:46:40 +0100
Message-ID: <20261127124657.769093-2-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127124657.769093-1-sean@geanix.com>
References: <20261127124657.769093-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251385
Content-Type: text/plain; charset="utf-8"

do_rm_work_all only runs before do_build, so "bitbake <image> -c
populate_sdk" leaves the work directories of all recipes the SDK
depends on behind.

Add do_rm_work_populate_sdk before do_populate_sdk to run do_rm_work
for those recipes, without building the image itself. Keep it out of
the do_populate_sdk signature, and don't let extend_recipe_sysroot
stage the sysroots of the recipes the do_rm_work tasks depend on.

[YOCTO #15824]

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/classes-global/staging.bbclass |  3 +++
 meta/classes/rm_work.bbclass        | 14 ++++++++++++++
 meta/lib/oe/sstatesig.py            |  5 +++++
 3 files changed, 22 insertions(+)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
index 20340a16e1..558d808243 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -338,6 +338,9 @@ python extend_recipe_sysroot() {
             start.add(dep2)
         start.remove(dep)
=20
+    # Don't stage the sysroots of the recipes the do_rm_work tasks depen=
d on
+    start =3D set(dep for dep in start if not setscenedeps[dep][1].start=
swith("do_rm_work"))
+
     #bb.note(" start3 is %s" % str(start))
=20
     # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 7cb8a325b2..12cb70d55d 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -131,6 +131,20 @@ do_rm_work_all[recrdeptask] =3D "do_rm_work"
 do_rm_work_all[noexec] =3D "1"
 addtask rm_work_all before do_build
=20
+# Remove the work directories of the recipes do_populate_sdk depends on.
+# Only the dependencies on other recipes are copied, so the image isn't =
built.
+do_rm_work_populate_sdk () {
+    :
+}
+do_rm_work_populate_sdk[recrdeptask] =3D "do_rm_work"
+do_rm_work_populate_sdk[depends] =3D "${@d.getVarFlag('do_populate_sdk',=
 'depends') or ''}"
+do_rm_work_populate_sdk[rdepends] =3D "${@d.getVarFlag('do_populate_sdk'=
, 'rdepends') or ''}"
+do_rm_work_populate_sdk[noexec] =3D "1"
+python () {
+    if d.getVarFlag('do_populate_sdk', 'task'):
+        bb.build.addtask('do_rm_work_populate_sdk', 'do_populate_sdk', '=
', d)
+}
+
 do_populate_sdk[postfuncs] +=3D "rm_work_populatesdk"
 rm_work_populatesdk () {
     :
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index c0e581d0c8..cbe210215e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -39,6 +39,11 @@ def sstate_rundepfilter(siggen, fn, recipename, task, =
dep, depname, dataCaches):
     if task =3D=3D "do_rm_work":
         return False
=20
+    # Skip the do_rm_work_populate_sdk task signature, it only removes w=
ork
+    # directories and must not change the do_populate_sdk signature
+    if deptaskname =3D=3D "do_rm_work_populate_sdk":
+        return False
+
     # (Almost) always include our own inter-task dependencies (unless it=
 comes
     # from a mcdepends). The exception is the special
     # do_kernel_configme->do_unpack_and_patch dependency from archiver.b=
bclass.
--=20
2.56.0

