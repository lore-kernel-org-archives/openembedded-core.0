Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A25FE7718D
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:12:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.129766.1734617516659195757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 487C11762
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:12:24 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF8743F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:11:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] subversion: refactor do_configure
Date: Thu, 19 Dec 2024 14:11:47 +0000
Message-ID: <20241219141151.2592031-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219141151.2592031-1-ross.burton@arm.com>
References: <20241219141151.2592031-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208912

Upstream has an autogen.sh which constructs a hand-written aclocal.m4
and manually copies libtool into place. Instead of working around the
bad interaction between these expectations and our autotools class we
can just disable the execution of aclocal in autoreconf and copy files
as autogen.sh does.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../subversion/subversion_1.14.5.bb                 | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/r=
ecipes-devtools/subversion/subversion_1.14.5.bb
index b1347906204..56ef1019fc4 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -35,18 +35,19 @@ EXTRA_OECONF =3D " \
     ac_cv_path_RUBY=3Dnone \
 "
=20
+# Upstream puts the .pc in $datadir
 EXTRA_OEMAKE +=3D "pkgconfig_dir=3D${libdir}/pkgconfig"
=20
-acpaths =3D "-I build/ -I build/ac-macros/"
-
 CPPFLAGS +=3D "-P"
 BUILD_CPPFLAGS +=3D "-P"
=20
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
+
 do_configure:prepend () {
-	rm -f ${S}/libtool
-	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 =
${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
-	rm -f ${S}/aclocal.m4
-	sed -i -e 's:with_sasl=3D"/usr/local":with_sasl=3D"${STAGING_DIR}":' ${S}=
/build/ac-macros/sasl.m4
+    # autogen.sh manually puts things in the right place, and libtoolize d=
oesn't
+    # work as they don't use aclocal
+    cp -f ${S}/aclocal.m4.in ${S}/aclocal.m4
+    cp -f ${STAGING_DATADIR}/aclocal/libtool.m4 ${STAGING_DATADIR}/aclocal=
/lt*.m4 ${S}/build/
 }
=20
 #| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuil=
der/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/sub=
version-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.=
la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86=
_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion=
-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not b=
een installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa=
-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: can=
not find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-l=
ibtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8=
.9-r0/build/subversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been insta=
lled in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotat=
e/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: ins=
tall: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-l=
ogrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build=
/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `=
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/b=
uild/tmp/sysroots/x86_64-linux/usr/lib'
--=20
2.43.0


