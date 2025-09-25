Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7E3CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 15:26:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.90.1758814016112978266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 08:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 918C51692
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:26:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49DF23F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:26:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: do builds in a clean build tree
Date: Thu, 25 Sep 2025 16:26:51 +0100
Message-ID: <20250925152651.3059868-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 15:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224043

Set B to WORKDIR/build and clean that on configure so we ensure that the
build tree is clean.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index 3b9e52fdb84..00b869e8b18 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -69,6 +69,8 @@ include ${@bb.utils.contains('PACKAGECONFIG', 'perl', '=
perf-perl.inc', '', d)}
 inherit kernelsrc
=20
 S =3D "${UNPACKDIR}/${BP}"
+B =3D "${WORKDIR}/build"
+do_configure[cleandirs] +=3D "${B}"
=20
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
@@ -424,7 +426,7 @@ perf_fix_sources () {
 			util/pmu-flex.h util/expr-flex.h util/expr-flex.c; do
 		f=3D${PKGD}${TARGET_DBGSRC_DIR}/$f
 		if [ -e $f ]; then
-			sed -i -e 's#${S}/##g' $f
+			sed -i -e 's#${B}/##g' $f
 		fi
 	done
 }
--=20
2.43.0


