Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EEFEE49AA
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 17:00:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1530.1692723651239758833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 10:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B460E11FB;
	Tue, 22 Aug 2023 10:01:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEDB33F762;
	Tue, 22 Aug 2023 10:00:48 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/5] perf: split scripting PACKAGECONFIG into perl and python
Date: Tue, 22 Aug 2023 18:00:17 +0100
Message-Id: <20230822170018.315470-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822170018.315470-1-ross.burton@arm.com>
References: <20230822170018.315470-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186516

From: Ross Burton <ross.burton@arm.com>

There's no reason for Python and Perl support to be tied together, so
split the PACKAGECONFIG into two.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 327934b72a7..f89ab20ca41 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -11,9 +11,10 @@ LICENSE =3D "GPL-2.0-only"
=20
 PR =3D "r9"
=20
-PACKAGECONFIG ??=3D "scripting tui libunwind libtraceevent"
+PACKAGECONFIG ??=3D "perl python tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] =3D ",NO_DWARF=3D1"
-PACKAGECONFIG[scripting] =3D ",NO_LIBPERL=3D1 NO_LIBPYTHON=3D1,perl pyth=
on3 python3-setuptools-native"
+PACKAGECONFIG[perl] =3D ",NO_LIBPERL=3D1,perl"
+PACKAGECONFIG[python] =3D ",NO_LIBPYTHON=3D1,python3 python3-setuptools-=
native"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
@@ -51,7 +52,7 @@ PROVIDES =3D "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
=20
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targe=
tconfig', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetco=
nfig', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
=20
@@ -61,7 +62,7 @@ export WERROR =3D "0"
 do_populate_lic[depends] +=3D "virtual/kernel:do_shared_workdir"
=20
 # needed for building the tools/perf Perl binding
-include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.in=
c', '', d)}
+include ${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perf-perl.inc', '=
', d)}
=20
 inherit kernelsrc
=20
@@ -107,7 +108,7 @@ EXTRA_OEMAKE +=3D "\
     'sharedir=3D${@os.path.relpath(datadir, prefix)}' \
     'mandir=3D${@os.path.relpath(mandir, prefix)}' \
     'infodir=3D${@os.path.relpath(infodir, prefix)}' \
-    ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'PYTHON=3Dpython3=
 PYTHON_CONFIG=3Dpython3-config', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'PYTHON=3Dpython3 PY=
THON_CONFIG=3Dpython3-config', '', d)} \
 "
=20
 # During do_configure, we might run a 'make clean'. That often breaks
@@ -152,7 +153,7 @@ do_install() {
 	unset CFLAGS
 	oe_runmake install
 	# we are checking for this make target to be compatible with older perf=
 versions
-	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', =
d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}=
 && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
 	    oe_runmake DESTDIR=3D${D} install-python_ext
 	    if [ -e ${D}${libdir}/python*/site-packages/perf-*/SOURCES.txt ]; t=
hen
 		sed -i -e 's#${WORKDIR}##g' ${D}${libdir}/python*/site-packages/perf-*=
/SOURCES.txt
@@ -370,9 +371,10 @@ RDEPENDS:${PN}-python =3D+ "bash python3 python3-mod=
ules ${@bb.utils.contains('PAC
 RDEPENDS:${PN}-perl =3D+ "bash perl perl-modules"
 RDEPENDS:${PN}-tests =3D+ "python3 bash"
=20
-RSUGGESTS_SCRIPTING =3D "${@bb.utils.contains('PACKAGECONFIG', 'scriptin=
g', '${PN}-perl ${PN}-python', '',d)}"
-RSUGGESTS:${PN} +=3D "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
-
+RSUGGESTS:${PN} +=3D "${PN}-archive ${PN}-tests \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}=
-perl', '', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'python', '${P=
N}-python', '', d)} \
+                    "
 FILES_SOLIBSDEV =3D ""
 FILES:${PN} +=3D "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-co=
re ${libdir}/traceevent* ${libdir}/libperf-jvmti.so"
 FILES:${PN}-archive =3D "${libdir}/perf/perf-core/perf-archive"
--=20
2.34.1


