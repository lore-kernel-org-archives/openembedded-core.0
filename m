Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9836.1602674783668242680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 04:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78D611FB
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 04:26:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 235E73F66B
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 04:26:22 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] waf: explicitly run waf under Python 3
Date: Wed, 14 Oct 2020 12:26:20 +0100
Message-Id: <20201014112620.2244199-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We don't assume Python 2 is on the host and don't expose an unversioned
python in HOSTTOOLS, but waf uses the unversion python binary.

Typically this is solved by patching waf (see the glmark2 recipe) but
this can be solved centrally by invoking python3 directly.  All wscripts
that needed Python 2 would have been fixed by now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/waf.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 309f625a40..df6d4d53e8 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -42,7 +42,7 @@ python waf_preconfigure() {
     subsrcdir =3D d.getVar('S')
     wafbin =3D os.path.join(subsrcdir, 'waf')
     try:
-        result =3D subprocess.check_output([wafbin, '--version'], cwd=3D=
subsrcdir, stderr=3Dsubprocess.STDOUT)
+        result =3D subprocess.check_output(['python3', wafbin, '--versio=
n'], cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
         version =3D result.decode('utf-8').split()[1]
         if StrictVersion(version) >=3D StrictVersion("1.8.7"):
             d.setVar("WAF_EXTRA_CONF", "--bindir=3D${bindir} --libdir=3D=
${libdir}")
@@ -55,16 +55,16 @@ python waf_preconfigure() {
 do_configure[prefuncs] +=3D "waf_preconfigure"
=20
 waf_do_configure() {
-	(cd ${S} && ./waf configure -o ${B} --prefix=3D${prefix} ${WAF_EXTRA_CO=
NF} ${EXTRA_OECONF})
+	(cd ${S} && python3 ./waf configure -o ${B} --prefix=3D${prefix} ${WAF_=
EXTRA_CONF} ${EXTRA_OECONF})
 }
=20
 do_compile[progress] =3D "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', l=
imit=3D64)} ${EXTRA_OEWAF_BUILD})
+	(cd ${S} && python3 ./waf build ${@oe.utils.parallel_make_argument(d, '=
-j%d', limit=3D64)} ${EXTRA_OEWAF_BUILD})
 }
=20
 waf_do_install() {
-	(cd ${S} && ./waf install --destdir=3D${D} ${EXTRA_OEWAF_INSTALL})
+	(cd ${S} && python3 ./waf install --destdir=3D${D} ${EXTRA_OEWAF_INSTAL=
L})
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
--=20
2.25.1

