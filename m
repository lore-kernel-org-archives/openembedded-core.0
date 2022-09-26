Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FA0C6FA86
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 11:16:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27238.1664190963095766623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 04:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 659AF106F;
	Mon, 26 Sep 2022 04:16:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C0943F66F;
	Mon, 26 Sep 2022 04:16:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] dnf: add dummy packages for testing
Date: Mon, 26 Sep 2022 12:15:59 +0100
Message-Id: <20220926111600.1324000-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 11:16:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171059

oeqa/runtime needs packages which are always built, but we don't want to
use packages which have large side effects (unlike the current test recip=
e,
run-postinsts).

As finding a package that is both of these things isn't easy, for now
dnf can generate its own.  Moving forward this should be generalised and
all of the package manager tests unified.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/dnf/dnf_4.14.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.14.0.bb b/meta/recipes-devto=
ols/dnf/dnf_4.14.0.bb
index 48f7e284188..62df8c4ace5 100644
--- a/meta/recipes-devtools/dnf/dnf_4.14.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.14.0.bb
@@ -88,3 +88,9 @@ SYSTEMD_SERVICE:${PN} =3D "dnf-makecache.service dnf-ma=
kecache.timer \
 SYSTEMD_AUTO_ENABLE ?=3D "disable"
=20
 SKIP_RECIPE[dnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'package_=
rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due disa=
bled rpm support in libsolv', d)}"
+
+# Packages for testing purposes
+PACKAGES +=3D "${PN}-test-main ${PN}-test-dep"
+ALLOW_EMPTY:${PN}-test-main =3D "1"
+ALLOW_EMPTY:${PN}-test-dep =3D "1"
+RRECOMMENDS:${PN}-test-main =3D "${PN}-test-dep"
--=20
2.34.1


