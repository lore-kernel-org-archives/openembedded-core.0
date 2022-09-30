Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FA1C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 03:20:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1718.1664508046975542625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 20:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1072840D6A;
	Fri, 30 Sep 2022 03:20:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjtXjV7prgMS; Fri, 30 Sep 2022 03:20:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E7B7440D68;
	Fri, 30 Sep 2022 03:20:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D69C9174A18;
	Thu, 29 Sep 2022 23:20:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] glibc-locale: explicitly remove empty dirs in
 ${libdir}
Date: Fri, 30 Sep 2022 03:20:44 +0000
Message-Id: <20220930032044.748224-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 03:20:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171202

glibc-locale defaults to ENABLE_BINARY_LOCALE_GENERATION ?=3D "0", but ge=
ts
changed to "1" in the default-distrovars.inc

When it is explicitly set back to "0", it fails with this error:

ERROR: glibc-locale-2.35-r0 do_package: QA Issue: glibc-locale: Files/dir=
ectories were installed but not shipped in any package:
  /usr/lib/locale
Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
glibc-locale: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: glibc-locale-2.35-r0 do_package: Fatal QA errors were found, faili=
ng task.

There's a code to remove empty dirs in ${libdir}, but it's keyed off of
PACKAGE_NO_GCONV to clean up $[libdir]/gconv, just extend it to also cove=
r
other empty dirs, including ${libdir}/locale.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-locale.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core=
/glibc/glibc-locale.inc
index b8de7d3192..7c14abfe99 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -87,10 +87,9 @@ do_install() {
 	if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
 		copy_locale_files ${libdir}/gconv 0755
 		copy_locale_files ${datadir}/i18n 0644
-	else
-		# Remove the libdir if it is empty when gconv is not copied
-		find ${D}${libdir} -type d -empty -delete
 	fi
+	# Remove empty dirs in libdir when gconv or locales are not copied
+	find ${D}${libdir} -type d -empty -delete
 	copy_locale_files ${datadir}/locale 0644
 	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
 }
--=20
2.25.1


