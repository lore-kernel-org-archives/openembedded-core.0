Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA79C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 22:09:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2363.1721167782689294396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 15:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0909240C79;
	Tue, 16 Jul 2024 22:09:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaPOBJzV1TH8; Tue, 16 Jul 2024 22:09:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E678B407DA;
	Tue, 16 Jul 2024 22:09:40 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A515E163FF0;
	Tue, 16 Jul 2024 18:09:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] nativesdk-libtool: sanitize the script, remove buildpaths
Date: Tue, 16 Jul 2024 18:09:40 -0400
Message-Id: <20240716220940.3828246-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 22:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202128

From: Denys Dmytriyenko <denys@konsulko.com>

Copy the same sed command to sanitize libtool script from target recipe
to nativesdk one. Otherwise fails with buildpaths QA error:

ERROR: nativesdk-libtool-2.5.0-r0 do_package_qa: QA Issue: File /usr/loca=
l/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/libtoo=
l in package nativesdk-libtool contains reference to TMPDIR [buildpaths]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../libtool/nativesdk-libtool_2.5.0.bb               | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb b/m=
eta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
index ddb60e717c..69de7a8e40 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
@@ -13,6 +13,18 @@ do_install () {
 	autotools_do_install
 	install -d ${D}${bindir}/
 	install -m 0755 libtool ${D}${bindir}/
+
+	sed -e 's@--sysroot=3D${STAGING_DIR_HOST}@@g' \
+	    -e "s@${DEBUG_PREFIX_MAP}@@g" \
+	    -e 's@${STAGING_DIR_HOST}@@g' \
+	    -e 's@${STAGING_DIR_NATIVE}@@g' \
+	    -e 's@^\(sys_lib_search_path_spec=3D"\).*@\1${libdir} ${base_libdir=
}"@' \
+	    -e 's@^\(compiler_lib_search_dirs=3D"\).*@\1${libdir} ${base_libdir=
}"@' \
+	    -e 's@^\(compiler_lib_search_path=3D"\).*@\1${libdir} ${base_libdir=
}"@' \
+	    -e 's@^\(predep_objects=3D"\).*@\1"@' \
+	    -e 's@^\(postdep_objects=3D"\).*@\1"@' \
+	    -e "s@${HOSTTOOLS_DIR}/@@g" \
+	    -i ${D}${bindir}/libtool
 }
=20
 SYSROOT_PREPROCESS_FUNCS +=3D "libtoolnativesdk_sysroot_preprocess"
--=20
2.25.1


