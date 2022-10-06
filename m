Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC288C4332F
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:31:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5825.1665063085258182065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25D8A1692;
	Thu,  6 Oct 2022 06:31:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75C473F67D;
	Thu,  6 Oct 2022 06:31:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] opkg: use a git clone, not a dynamic snapshot
Date: Thu,  6 Oct 2022 14:31:21 +0100
Message-Id: <20221006133122.493953-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 13:31:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171502

opkg fetches using a cgit snapshot of a tag, which is not reproducible as
the tag could move, not reliable as a future dynamic snapshot could have
a different checksum, and a waste of CPU load as these tarballs are built
on demand.

Switch opkg to use a proper git clone of the relevant SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/opkg/opkg_0.6.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devt=
ools/opkg/opkg_0.6.0.bb
index 4cd589cd29e..f9e5073ba5d 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
@@ -12,13 +12,15 @@ DEPENDS =3D "libarchive"
=20
 PE =3D "1"
=20
-SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${=
PV}.tar.gz \
+SRC_URI =3D "git://git.yoctoproject.org/opkg;protocol=3Dhttps;branch=3Dm=
aster \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-=
run.patch \
            file://run-ptest \
 "
=20
-SRC_URI[sha256sum] =3D "56844722eff237daf14aa6e681436f3245213c5590ed0cda=
37a79df637ff3a4c"
+SRCREV =3D "9007789c18f70bc9f315a566c589231ef0a2e6fa"
+
+S =3D "${WORKDIR}/git"
=20
 # This needs to be before ptest inherit, otherwise all ptest files end p=
ackaged
 # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
--=20
2.34.1


