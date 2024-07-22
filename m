Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC337C3DA70
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 05:35:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11725.1721626506860274273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 22:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A2A8D40CBB;
	Mon, 22 Jul 2024 05:35:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKz18C-LCrBC; Mon, 22 Jul 2024 05:35:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21B8140C56;
	Mon, 22 Jul 2024 05:35:04 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C0A0A164000;
	Mon, 22 Jul 2024 01:35:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH 2/2] gcc: unify cleanup of include-fixed, apply to cross-canadian
Date: Mon, 22 Jul 2024 01:34:59 -0400
Message-Id: <20240722053459.2462155-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240722053459.2462155-1-denis@denix.org>
References: <20240722053459.2462155-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 05:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202301

From: Denys Dmytriyenko <denys@konsulko.com>

Since target and cross variants were already doing similar cleanup
of include-fixed headers, as those aren't used, unify the code and
also apply the same to cross-canadian variant.

Some of those header files get processed with a tool that leaves
absolute buildpaths inside the file's commented section, causing
QA errors. Since those aren't used, let's remove them.

This may be a temporary solution until the tool itself gets fixed
to not embed absolute buildpaths in the header files:
https://lists.openembedded.org/g/openembedded-core/topic/107268307

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc      |  4 +++
 .../gcc/gcc-cross-canadian.inc                |  2 ++
 meta/recipes-devtools/gcc/gcc-cross.inc       |  2 +-
 meta/recipes-devtools/gcc/gcc-target.inc      | 31 +------------------
 4 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
index 507b257e1f..661f2aef5c 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -135,3 +135,7 @@ remove_sysroot_paths_from_checksum_options () {
 	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
 	sed -i 's@${1}@/host@g' ${B}/gcc/checksum-options
 }
+
+cleanup_installed_include_fixed () {
+	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not=
 -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
+}
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
index 9528b71272..39f468412a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -175,6 +175,8 @@ do_install () {
 			done
 		done
 	done
+
+	cleanup_installed_include_fixed
 }
=20
 ELFUTILS =3D "nativesdk-elfutils"
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
index f8a7730cf3..a1a52d9449 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -109,7 +109,7 @@ do_install () {
 	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/=
include/
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${B=
INV}/include/
=20
-	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not=
 -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
+	cleanup_installed_include_fixed
=20
 	# install LTO linker plugins where binutils tools can find it
 	install -d ${D}${libdir}/bfd-plugins
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
index bd7506fe3a..aba5c2848e 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -193,37 +193,8 @@ do_install () {
 	install -d ${D}${libdir}/bfd-plugins
 	ln -sf ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto_plugin.so ${D}${l=
ibdir}/bfd-plugins/liblto_plugin.so
 	chown -R root:root ${D}
-}
=20
-do_install:append () {
-        #
-        # Thefixinc.sh script, run on the gcc's compile phase, looks int=
o sysroot header
-        # files and places the modified files into
-        # {D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed folder. T=
his makes the
-        # build not deterministic. The following code prunes all those h=
eaders
-        # except those under include-fixed/linux, *limits.h and README, =
yielding
-        # the same include-fixed folders no matter what sysroot
-
-        include_fixed=3D"${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include=
-fixed"
-        for f in $(find ${include_fixed} -type f); do
-                case $f in
-                */include-fixed/linux/*)
-                    continue
-                    ;;
-                */include-fixed/*limits.h)
-                    continue
-                    ;;
-                */include-fixed/README)
-                    continue
-                    ;;
-                *)
-                    # remove file and directory if empty
-                    bbdebug 2 "Pruning $f"
-                    rm $f
-                    find $(dirname $f) -maxdepth 0 -empty -exec rmdir {}=
 \;
-                    ;;
-                esac
-        done
+	cleanup_installed_include_fixed
 }
=20
 # Installing /usr/lib/gcc/* means we'd have two copies, one from gcc-cro=
ss
--=20
2.25.1


