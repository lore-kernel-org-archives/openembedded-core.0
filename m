Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.275.1615226526520551285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03074D6E
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1A343F71B
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Mar 2021 10:01:55 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] insane: don't check for a warning string that is never output
Date: Mon,  8 Mar 2021 18:01:49 +0000
Message-Id: <20210308180152.3515502-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

insane has checks that the compiler isn't printing "CROSS COMPILE
Badness" during configure/compile/install, but this message hasn't been
output by GCC since 2010 (23f522e7).

The current warning is "include location [...] is unsafe for cross-
compilation" and as that is a proper GCC warning, we can make it fatal
in follow-up patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 53230fc667..fa05fc055b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1014,26 +1014,6 @@ python do_package_qa () {
     logdir =3D d.getVar('T')
     pn =3D d.getVar('PN')
=20
-    # Check the compile log for host contamination
-    compilelog =3D os.path.join(logdir,"log.do_compile")
-
-    if os.path.exists(compilelog):
-        statement =3D "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe fo=
r cross-compilation' %s > /dev/null" % compilelog
-        if subprocess.call(statement, shell=3DTrue) =3D=3D 0:
-            msg =3D "%s: The compile log indicates that host include and=
/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pn, compilel=
og)
-            package_qa_handle_error("compile-host-path", msg, d)
-
-    # Check the install log for host contamination
-    installlog =3D os.path.join(logdir,"log.do_install")
-
-    if os.path.exists(installlog):
-        statement =3D "grep -e 'CROSS COMPILE Badness:' -e 'is unsafe fo=
r cross-compilation' %s > /dev/null" % installlog
-        if subprocess.call(statement, shell=3DTrue) =3D=3D 0:
-            msg =3D "%s: The install log indicates that host include and=
/or library paths were used.\n \
-        Please check the log '%s' for more information." % (pn, installl=
og)
-            package_qa_handle_error("install-host-path", msg, d)
-
     # Scan the packages...
     pkgdest =3D d.getVar('PKGDEST')
     packages =3D set((d.getVar('PACKAGES') or '').split())
@@ -1212,7 +1192,7 @@ python do_qa_configure() {
     if bb.data.inherits_class('autotools', d) and not skip_configure_uns=
afe:
         bb.note("Checking autotools environment for common misconfigurat=
ion")
         for root, dirs, files in os.walk(workdir):
-            statement =3D "grep -q -F -e 'CROSS COMPILE Badness:' -e 'is=
 unsafe for cross-compilation' %s" % \
+            statement =3D "grep -q -F -e 'is unsafe for cross-compilatio=
n' %s" % \
                         os.path.join(root,"config.log")
             if "config.log" in files:
                 if subprocess.call(statement, shell=3DTrue) =3D=3D 0:
--=20
2.25.1

