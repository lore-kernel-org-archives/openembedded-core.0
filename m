Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594EA108B918
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:27:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11414.1774009658713071333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E7E7165C
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8C983F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 05:27:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] sstate/relocatable: remove manual relocation of .pc files
Date: Fri, 20 Mar 2026 12:27:25 +0000
Message-ID: <20260320122732.1630715-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 12:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233599

There's no need to manually relocate .pc files in relocatable.bbclass
as the path remapping in sstate.bbclass can do it, if we add .pc to
SSTATE_SCAN_FILES.

This removes some hardcoded behaviour, and puts absolute sysroot paths
into the .pc files instead of paths like ${pcfiledir}/../../include,
which makes it possible for pkgconfig to normalise and strip redundant
paths.

This also has the side effect of not forcibly turning .pc symlinks into
real files, which the sed was doing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/sstate.bbclass |  2 +-
 meta/classes/relocatable.bbclass   | 15 +--------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
index 88449d19c7b..3b50985eab1 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -67,7 +67,7 @@ SSTATE_ALLOW_OVERLAP_FILES +=3D "${DEPLOY_DIR_IMAGE}/gr=
ub-efi"
 SSTATE_ALLOW_OVERLAP_FILES +=3D "${DEPLOY_DIR_IMAGE}/systemd-boot"
 SSTATE_ALLOW_OVERLAP_FILES +=3D "${DEPLOY_DIR_IMAGE}/microcode"
=20
-SSTATE_SCAN_FILES ?=3D "*.la *-config *_config postinst-*"
+SSTATE_SCAN_FILES ?=3D "*.la *-config *_config postinst-* *.pc"
 SSTATE_SCAN_CMD ??=3D 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name=
 \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
 SSTATE_SCAN_CMD_NATIVE ??=3D 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE=
_SYSROOT_NATIVE} -e ${HOSTTOOLS_DIR} ${SSTATE_BUILDDIR}'
 SSTATE_HASHEQUIV_FILEMAP ?=3D " \
diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.=
bbclass
index d0a623fb0a9..35b2d6ec474 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -6,21 +6,8 @@
=20
 inherit chrpath
=20
-SYSROOT_PREPROCESS_FUNCS +=3D "relocatable_binaries_preprocess relocatab=
le_native_pcfiles"
+SYSROOT_PREPROCESS_FUNCS +=3D "relocatable_binaries_preprocess"
=20
 python relocatable_binaries_preprocess() {
     rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
 }
-
-relocatable_native_pcfiles() {
-	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
-		files_template=3D${SYSROOT_DESTDIR}$dir/*.pc
-		# Expand to any files matching $files_template
-		files=3D$(echo $files_template)
-		# $files_template and $files will differ if any files were found
-		if [ "$files_template" !=3D "$files" ]; then
-			rel=3D$(realpath -m --relative-to=3D$dir ${base_prefix})
-			sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
-		fi
-	done
-}
--=20
2.43.0


