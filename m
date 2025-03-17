Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647E6C35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 17:09:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58357.1742231335278749923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 10:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C20B71688
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:09:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F8053F694
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:08:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/5] libcap: fix licensing fields
Date: Mon, 17 Mar 2025 17:08:46 +0000
Message-ID: <20250317170848.4153724-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317170848.4153724-1-ross.burton@arm.com>
References: <20250317170848.4153724-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 17:09:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213114

The recipe LICENSE field should reflect the license of all of the sources=
,
so include the PAM module licenses too.

Don't use conditionals in LIC_FILES_CHKSUM so that the configuration
does not cause differing checksums to be used.

Explicitly set the license on libcap and libcap-dev to reflect the
contents:
- libcap is BSD|GPLv2, and also BSD|LGPLv2+ if PAM is enabled.
- libcap-dev is just the library, so BSD|GPLv2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libcap/libcap_2.74.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.74.bb b/meta/recipes-su=
pport/libcap/libcap_2.74.bb
index a1da8311b27..ca6eccd9d86 100644
--- a/meta/recipes-support/libcap/libcap_2.74.bb
+++ b/meta/recipes-support/libcap/libcap_2.74.bb
@@ -3,11 +3,11 @@ DESCRIPTION =3D "A library providing the API to access =
POSIX capabilities. \
 These allow giving various kinds of specific privileges to individual \
 users, without giving them full root permissions."
 HOMEPAGE =3D "http://sites.google.com/site/fullycapable/"
-# no specific GPL version required
-LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM_PAM =3D "file://pam_cap/License;md5=3D905326f41d3d1f8df=
21943f9a4ed6b50"
+
+# The library is BSD | GPLv2, the PAM module is BSD | LGPLv2+
+LICENSE =3D "(BSD-3-Clause | GPL-2.0-only) & (BSD-3-Clause | LGPL-2.0-or=
-later)"
 LIC_FILES_CHKSUM =3D "file://License;md5=3D2965a646645b72ecee859b43c592d=
caa \
-                    ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_=
FILES_CHKSUM_PAM}', '', d)} \
+                    file://pam_cap/License;md5=3D905326f41d3d1f8df21943f=
9a4ed6b50 \
                     "
=20
 DEPENDS =3D "hostperl-runtime-native gperf-native"
@@ -63,4 +63,8 @@ do_install:append() {
 # pam files
 FILES:${PN} +=3D "${base_libdir}/security/*.so"
=20
+# The license of the main package depends on whether PAM is enabled or n=
ot
+LICENSE:${PN} =3D "(BSD-3-Clause | GPL-2.0-only)${@bb.utils.contains('PA=
CKAGECONFIG', 'pam', ' & (BSD-3-Clause | LGPL-2.0-or-later)', '', d)}"
+LICENSE:${PN}-dev =3D "(BSD-3-Clause | GPL-2.0-only)"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


