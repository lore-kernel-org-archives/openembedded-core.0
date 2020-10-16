Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11617.1602840087040130182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9A2630E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:21:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F0DC3F719
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:21:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] waf: don't assume the waf intepretter is good
Date: Fri, 16 Oct 2020 10:21:21 +0100
Message-Id: <20201016092122.2002294-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Waf typically uses `python` as the intepretter but inside a task this
does not exist.  Typically this is solved by patching waf (see the
glmark2 recipe) but not all versionf of Waf support Python 3 so we can't
assume a specific interpretter.

Instead, create a new variable WAF_PYTHON for the correct interpretter,
and default this to `python3`.  If the user has a recipe that needs
Python 2 then this can be changed in the recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/waf.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 309f625a40..8fa5063645 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,6 +1,10 @@
 # avoids build breaks when using no-static-libs.inc
 DISABLE_STATIC =3D ""
=20
+# What Python interpretter to use.  Defaults to Python 3 but can be
+# overridden if required.
+WAF_PYTHON ?=3D "python3"
+
 B =3D "${WORKDIR}/build"
=20
 EXTRA_OECONF_append =3D " ${PACKAGECONFIG_CONFARGS}"
@@ -40,9 +44,10 @@ python waf_preconfigure() {
     import subprocess
     from distutils.version import StrictVersion
     subsrcdir =3D d.getVar('S')
+    python =3D d.getVar('WAF_PYTHON')
     wafbin =3D os.path.join(subsrcdir, 'waf')
     try:
-        result =3D subprocess.check_output([wafbin, '--version'], cwd=3D=
subsrcdir, stderr=3Dsubprocess.STDOUT)
+        result =3D subprocess.check_output([python, wafbin, '--version']=
, cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
         version =3D result.decode('utf-8').split()[1]
         if StrictVersion(version) >=3D StrictVersion("1.8.7"):
             d.setVar("WAF_EXTRA_CONF", "--bindir=3D${bindir} --libdir=3D=
${libdir}")
@@ -55,16 +60,16 @@ python waf_preconfigure() {
 do_configure[prefuncs] +=3D "waf_preconfigure"
=20
 waf_do_configure() {
-	(cd ${S} && ./waf configure -o ${B} --prefix=3D${prefix} ${WAF_EXTRA_CO=
NF} ${EXTRA_OECONF})
+	(cd ${S} && ${WAF_PYTHON} ./waf configure -o ${B} --prefix=3D${prefix} =
${WAF_EXTRA_CONF} ${EXTRA_OECONF})
 }
=20
 do_compile[progress] =3D "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', l=
imit=3D64)} ${EXTRA_OEWAF_BUILD})
+	(cd ${S} && ${WAF_PYTHON} ./waf build ${@oe.utils.parallel_make_argumen=
t(d, '-j%d', limit=3D64)} ${EXTRA_OEWAF_BUILD})
 }
=20
 waf_do_install() {
-	(cd ${S} && ./waf install --destdir=3D${D} ${EXTRA_OEWAF_INSTALL})
+	(cd ${S} && ${WAF_PYTHON} ./waf install --destdir=3D${D} ${EXTRA_OEWAF_=
INSTALL})
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
--=20
2.25.1

