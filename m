Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CF1C35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:27:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52312.1742218074345734396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D26C913D5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:28:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CB933F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 06:27:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] autotools: require that a configure script exists
Date: Mon, 17 Mar 2025 13:27:49 +0000
Message-ID: <20250317132749.1778185-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317132749.1778185-1-ross.burton@arm.com>
References: <20250317132749.1778185-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213095

There's no point inheriting autotools if you're not actually going to
run a configure script, so make a missing configure script fatal.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index bffd8a7a057..948f8c183a7 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -206,11 +206,8 @@ autotools_do_configure() {
 		ACLOCAL=3D"$ACLOCAL" autoreconf -Wcross -Wno-obsolete --verbose --inst=
all --force ${EXTRA_AUTORECONF} || die "autoreconf execution failed."
 		cd $olddir
 	fi
-	if [ -e ${CONFIGURE_SCRIPT} ]; then
-		oe_runconf
-	else
-		bbnote "nothing to configure"
-	fi
+
+	oe_runconf
 }
=20
 autotools_do_compile() {
--=20
2.43.0


