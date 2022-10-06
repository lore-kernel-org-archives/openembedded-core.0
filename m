Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC25BC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 13:31:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5737.1665063085877797803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 06:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E46169C;
	Thu,  6 Oct 2022 06:31:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23E3C3F67D;
	Thu,  6 Oct 2022 06:31:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] opkg-utils: use a git clone, not a dynamic snapshot
Date: Thu,  6 Oct 2022 14:31:22 +0100
Message-Id: <20221006133122.493953-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006133122.493953-1-ross.burton@arm.com>
References: <20221006133122.493953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 13:31:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171503

opkg-utils fetches using a cgit snapshot of a tag, which is not
reproducible as the tag could move, not reliable as a future dynamic
snapshot could have a different checksum, and a waste of CPU load as
these tarballs are built on demand.

Switch opkg-utils to use a proper git clone of the relevant SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb b/meta/=
recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
index e72c171b927..b27e3ded33b 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f \
                     file://opkg.py;beginline=3D2;endline=3D18;md5=3Dffa1=
1ff3c15eb31c6a7ceaa00cc9f986"
 PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'update-alternative=
s', 'virtual/update-alternatives', '', d)}"
=20
-SRC_URI =3D "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/$=
{BPN}-${PV}.tar.gz \
+SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;bran=
ch=3Dmaster \
            file://0001-update-alternatives-correctly-match-priority.patc=
h \
            "
-UPSTREAM_CHECK_URI =3D "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-u=
tils/refs/"
+SRCREV =3D "9239541f14a2529b9d01c0a253ab11afa2822dab"
=20
-SRC_URI[sha256sum] =3D "55733c0f8ffde2bb4f9593cfd66a1f68e6a2f814e8e62f6f=
d78472911c818c32"
+S =3D "${WORKDIR}/git"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
--=20
2.34.1


