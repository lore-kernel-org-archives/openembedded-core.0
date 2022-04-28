Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1C4C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:56:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9800.1651150563227017107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 05:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48F031474;
	Thu, 28 Apr 2022 05:56:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97013F73B;
	Thu, 28 Apr 2022 05:56:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] distro/poky-tiny: don't put translations into images
Date: Thu, 28 Apr 2022 13:55:58 +0100
Message-Id: <20220428125559.2994529-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 12:56:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164945

IMAGE_LINGUAS has a default value, "en-us en-gb" in
default-distrovars.inc and "de-de fr-fr en-gb" in image.bbclass. However,
poky-tiny sets USE_NLS=3Dno so IMAGE_LINGUAS can't really be used in a ti=
ny
context, and previously musl hasn't supported locales so this hasn't
been a problem.

However, now that musl-locales exists, poky-tiny images will try to pull
in translations.  As we've disabled NLS these simply take up disk space
and cannot be used, and currently musl-locales fails to build if
USE_NLS=3Dno.

Set IMAGE_LINGUAS to "" in poky-tiny.conf so that images don't have
locales added.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro=
/poky-tiny.conf
index 9c9f6f192f..2fe0d478ff 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -63,6 +63,8 @@ ENABLE_WIDEC:class-native =3D "true"
 # Drop native language support. This removes the
 # eglibc->bash->gettext->libc-posix-clang-wchar dependency.
 USE_NLS=3D"no"
+# As we don't have native language support, don't install locales into i=
mages
+IMAGE_LINGUAS =3D ""
=20
 # Comment out any of the lines below to disable them in the build
 # DISTRO_FEATURES options:
--=20
2.25.1


