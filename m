Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B160C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 02:09:55 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.33416.1656641391240321853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 19:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=mYFrp9l2;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2777520CDF9A;
	Thu, 30 Jun 2022 19:09:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2777520CDF9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1656641390;
	bh=I/NU+6Wq7zo2nEAZ4HsavNU8C3U7XLbJkmcy+rS8mBg=;
	h=From:To:Cc:Subject:Date:From;
	b=mYFrp9l2o7kiWkVjGyZtwmm71PEwtKgL3JCaUBBcD+1//Vg29/ulB3Grd19VQ8X5i
	 wgw8u7iO2BX1vCjtYgNJK8TNJ0WW/8W7+2TQJGPJ5PmEFd9BvJc9kIcQ3lYFD84HFN
	 bZr6x1wFfw57eLsXoeqOdapPhtmh266hh8TyL/rs=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] package.bbclass: Fix base directory for debugsource files
 when using externalsrc
Date: Thu, 30 Jun 2022 20:09:39 -0600
Message-Id: <20220701020939.62295-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 02:09:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167448

While executing do_package, bitbake checks for a list of
debug source files and uses a pattern to match the ones
to be included in copydebugsources.

Previously when externalsrc was in use either directly or by
using devtool, the source location changed and this pattern
no longer matched, hence debug source files failed to be
included in the corresponding package.

Check when the source directory isnt the default (based on
WORKDIR), and change the pattern used to match debug source
files if that is the case, allowing us to perform do_package
properly.

Workaround debugsource.list containing paths from the host by
moving debug source files away from the host directory
structure  to avoid host contamination (this seems to happen
when packages use $TMPDIR/work-shared and externalsrc is
in use).

Test matrix included using:
- devtool to use externalsrc automatically
- externalsrc with a non-devtool based source directory
- No externalsrc at all
Tested the following packages to be working:
- glibc ($TMPDIR/work-shared based)
- libxcrypt ($TMPDIR/work based)

[YOCTO 8015]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 meta/classes/package.bbclass | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 62050a18b8..4850134022 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, d):
         strip =3D d.getVar("STRIP")
         objcopy =3D d.getVar("OBJCOPY")
         workdir =3D d.getVar("WORKDIR")
+        sdir =3D d.getVar("S")
+        sparentdir =3D os.path.dirname(os.path.dirname(sdir))
+        sbasedir =3D os.path.basename(os.path.dirname(sdir)) + "/" + os.=
path.basename(sdir)
         workparentdir =3D os.path.dirname(os.path.dirname(workdir))
         workbasedir =3D os.path.basename(os.path.dirname(workdir)) + "/"=
 + os.path.basename(workdir)
=20
+        # If S isnt based on WORKDIR we can infer our sources are locate=
d elsewhere,
+        # e.g. using externalsrc; use S as base for our dirs
+        if workdir in sdir:
+            basedir =3D workbasedir
+            parentdir =3D workparentdir
+        else:
+            basedir =3D sbasedir
+            parentdir =3D sparentdir
+
         # If build path exists in sourcefile, it means toolchain did not=
 use
         # -fdebug-prefix-map to compile
         if checkbuildpath(sourcefile, d):
-            localsrc_prefix =3D workparentdir + "/"
+            localsrc_prefix =3D parentdir + "/"
         else:
             localsrc_prefix =3D "/usr/src/debug/"
=20
@@ -581,7 +593,7 @@ def copydebugsources(debugsrcdir, sources, d):
         processdebugsrc +=3D "sed 's#%s##g' | "
         processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-owne=
r '%s%s' 2>/dev/null)"
=20
-        cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc_pre=
fix, workparentdir, dvar, debugsrcdir)
+        cmd =3D processdebugsrc % (sourcefile, basedir, localsrc_prefix,=
 parentdir, dvar, debugsrcdir)
         try:
             subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubproce=
ss.STDOUT)
         except subprocess.CalledProcessError:
@@ -591,9 +603,22 @@ def copydebugsources(debugsrcdir, sources, d):
         # cpio seems to have a bug with -lL together and symbolic links =
are just copied, not dereferenced.
         # Work around this by manually finding and copying any symbolic =
links that made it through.
         cmd =3D "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (c=
d '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
-                (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dv=
ar, debugsrcdir)
+                (dvar, debugsrcdir, dvar, debugsrcdir, parentdir, dvar, =
debugsrcdir)
         subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)
=20
+
+        # debugsources.list may be polluted from the host if we used ext=
ernalsrc,
+        # cpio uses copy-pass and may have just created a directory stru=
cture
+        # matching the one from the host, if thats the case move those f=
iles to
+        # debugsrcdir to avoid host contamination.
+        # Empty dir structure will be deleted in the next step.
+
+        # Same check as above for externalsrc
+        if workdir not in sdir:
+            if os.path.exists(dvar + debugsrcdir + sdir):
+                cmd =3D "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, d=
var,debugsrcdir)
+                subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubp=
rocess.STDOUT)
+
         # The copy by cpio may have resulted in some empty directories! =
 Remove these
         cmd =3D "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
         subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)
--=20
2.25.1


