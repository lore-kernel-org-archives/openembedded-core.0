Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB659CD13D8
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 13:01:27 +0000 (UTC)
Received: from tulikuusama2.dnainternet.net (tulikuusama2.dnainternet.net [83.102.40.151])
 by mx.groups.io with SMTP id smtpd.web10.4968.1725109280959315164
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 06:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.151, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 4D1A620AAF;
	Sat, 31 Aug 2024 16:01:18 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id odhSk0pZnVWm; Sat, 31 Aug 2024 16:01:17 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id EACBB2081E;
	Sat, 31 Aug 2024 16:01:17 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id AEA473FF7;
	Sat, 31 Aug 2024 16:01:15 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] icu: Fix 'buildpaths' QA error
Date: Sat, 31 Aug 2024 16:01:13 +0300
Message-Id: <20240831130113.34867-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 13:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203976

Add stripping of STAGING_DIR_NATIVE during target/nativesdk specific
do_install, which mitigates following BitBake failure:

  ERROR: icu-75-1-r0 do_package_qa: QA Issue: File /usr/lib/icu/75.1/pkgd=
ata.inc in package icu-dev contains reference to TMPDIR [buildpaths]
  ERROR: icu-75-1-r0 do_package_qa: Fatal QA errors were found, failing t=
ask.

While doing so, we also drop HOSTTOOLS_DIR stripping, as it's value
does not appear in the content of either file that are manipulated
here.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-support/icu/icu_75-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/=
icu/icu_75-1.bb
index 8f7f5e6cc7..9922469672 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -60,7 +60,7 @@ remove_build_host_references() {
 	sed -i  \
 	    -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${STAGING_DIR_NATIVE}::g' \
 	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
 	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
 }
--=20
2.39.2


