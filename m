Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13.1618327114970121229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 08:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C03B106F
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 08:18:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E3B3F694
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 08:18:24 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: clean up some more warning messages
Date: Tue, 13 Apr 2021 16:18:22 +0100
Message-Id: <20210413151822.3324564-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fa05fc055b2..763d5f1da2c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -176,7 +176,7 @@ def package_qa_check_useless_rpaths(file, name, d, el=
f, messages):
             if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
                 # The dynamic linker searches both these places anyway. =
 There is no point in
                 # looking there again.
-                package_qa_add_message(messages, "useless-rpaths", "%s: =
%s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(f=
ile, d), rpath))
+                package_qa_add_message(messages, "useless-rpaths", "%s: =
%s contains probably-redundant RPATH %s" % (name, package_qa_clean_path(f=
ile, d, name), rpath))
=20
 QAPATHTEST[dev-so] =3D "package_qa_check_dev"
 def package_qa_check_dev(path, name, d, elf, messages):
@@ -185,8 +185,8 @@ def package_qa_check_dev(path, name, d, elf, messages=
):
     """
=20
     if not name.endswith("-dev") and not name.endswith("-dbg") and not n=
ame.endswith("-ptest") and not name.startswith("nativesdk-") and path.end=
swith(".so") and os.path.islink(path):
-        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/native=
sdk- package contains symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-so", "non -dev/-dbg/native=
sdk- package %s contains symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
=20
 QAPATHTEST[dev-elf] =3D "package_qa_check_dev_elf"
 def package_qa_check_dev_elf(path, name, d, elf, messages):
@@ -196,8 +196,8 @@ def package_qa_check_dev_elf(path, name, d, elf, mess=
ages):
     install link-time .so files that are linker scripts.
     """
     if name.endswith("-dev") and path.endswith(".so") and not os.path.is=
link(path) and elf:
-        package_qa_add_message(messages, "dev-elf", "-dev package contai=
ns non-symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "dev-elf", "-dev package %s con=
tains non-symlink .so '%s'" % \
+                 (name, package_qa_clean_path(path, d, name)))
=20
 QAPATHTEST[staticdev] =3D "package_qa_check_staticdev"
 def package_qa_check_staticdev(path, name, d, elf, messages):
@@ -210,7 +210,7 @@ def package_qa_check_staticdev(path, name, d, elf, me=
ssages):
=20
     if not name.endswith("-pic") and not name.endswith("-staticdev") and=
 not name.endswith("-ptest") and path.endswith(".a") and not path.endswit=
h("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.deb=
ug-static/' in path:
         package_qa_add_message(messages, "staticdev", "non -staticdev pa=
ckage contains static .a library: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d)))
+                 (name, package_qa_clean_path(path,d, name)))
=20
 QAPATHTEST[mime] =3D "package_qa_check_mime"
 def package_qa_check_mime(path, name, d, elf, messages):
--=20
2.25.1

