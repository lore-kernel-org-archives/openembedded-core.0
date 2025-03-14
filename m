Return-Path: <artemiy.romanov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61E1C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 12:27:34 +0000 (UTC)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
 by mx.groups.io with SMTP id smtpd.web10.12972.1741955251493099475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 05:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=KxvypZR6;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=x9BJnKgX;
 spf=pass (domain: yadro.com, ip: 89.207.88.253, mailfrom: artemiy.romanov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com A65B2E0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1741955247; bh=isjbkvrl5FdJQ2F3Z6xiLyUeT5//qCv1wGaDq5DJZNc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=KxvypZR66jaz2TQh6zt1lMHrz4EONYZh4MuEQ4jjGq6Zxh30jIdbKGFFJIPwPa9J5
	 6hn227yT/JGNeO2f4JyNIRI3hG5yBfKHgWkwiXkI44uBYsIeAf45wBUP50vuqQtKEB
	 lcpbSCX4uv2yPTRNs/pSr2eNsG4VVEKAn2l5dxbd71xvzLIDa1I3qQMZthX8sqpJer
	 z8hedz71N3Afcokn1mODoGaMgRfPwoowMVCw2HPJ/pA0epkMHxW8Ump99BZooc7cTe
	 uKih8PIcDnzzepXSItGlF+b0hJ3fjOqYwTn6uAOy+4DLTBTTt3TPMuj4jq57LTX9vy
	 w+Mh1v3gJ41yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1741955247; bh=isjbkvrl5FdJQ2F3Z6xiLyUeT5//qCv1wGaDq5DJZNc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=x9BJnKgXszuLmq8apONIbc3d6zxkSb7eU/aSlK682/D3P39bWlO3ywVHYp6J2IZPY
	 7JRVEaLknY8Fpisr3MIqgfA8uBrDiiNS9cxqZNawGjgn1Rg1xprhjjXgoMTflObtHD
	 +pDD6HumsHcwal3epjnu+BuyfZJTJMeQHTq/+Qo9F+8CyYa6rwGIqA+CTuj4TFVrvS
	 Q3Ne4Rh2ImycVP9SGisc3KitLhG8b/OwJiyolEsnm4lg1iKHOvKOSRQFS8n6dv4BTQ
	 U5W7hG+8NvvCv/hNeUEIDxkCaVlkn1bGNlyihYjTcwsYAmQSo9HMbrYzj45lM6ZWxS
	 lpx8GpFpO+86A==
From: Artemiy Romanov <artemiy.romanov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Artemiy Romanov <artemiy.romanov@yadro.com>
Subject: [PATCH] rpm: fix redudant slash remove and add extra cmake flag
Date: Fri, 14 Mar 2025 15:27:06 +0300
Message-ID: <20250314122706.531626-1-artemiy.romanov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-09.corp.yadro.com (172.17.11.59) To
 T-EXCH-12.corp.yadro.com (172.17.11.143)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 12:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212840

do_install:append() formats paths using sed in macro files incorrectly
causing resulting paths to have format 'usr/*' instead of  '/usr/*'.

Absence of debugedit in build-time depends results in incorrect expansion
of '%__find_debuginfo' in usr/lib/rpm/macro file which looks like this:

%__find_debuginfo	__FIND_DEBUGINFO-NOTFOUND

Adding debugedit-native in DEPENDS affects performance, so better
solution is passing extra argument to cmake build call via EXTRA_OECMAKE
variable which fixes the problem:

%__find_debuginfo	/usr/bin/find-debuginfo

Signed-off-by: Artemiy Romanov <artemiy.romanov@yadro.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devto=
ols/rpm/rpm_4.20.0.bb
index 281fde1c82..cf01335799 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -57,6 +57,8 @@ EXTRA_OECMAKE:append:libc-musl =3D " -DENABLE_NLS=3DOFF=
 -DENABLE_OPENMP=3DOFF"
 EXTRA_OECMAKE:append:class-native =3D " -DCMAKE_INSTALL_SYSCONFDIR:PATH=3D=
/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/var"
 EXTRA_OECMAKE:append:class-nativesdk =3D " -DCMAKE_INSTALL_SYSCONFDIR:PA=
TH=3D/etc -DCMAKE_INSTALL_FULL_SYSCONFDIR=3D/etc"
=20
+EXTRA_OECMAKE:append =3D " -D__FIND_DEBUGINFO=3D${bindir}/find-debuginfo=
"
+
 inherit cmake gettext pkgconfig python3targetconfig
 OECMAKE_GENERATOR =3D "Unix Makefiles"
=20
@@ -131,10 +133,10 @@ do_install:append:class-nativesdk() {
 }
=20
 do_install:append () {
-	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${STAGING_DIR_NATIVE}/::g' \
+	sed -i -e 's:${HOSTTOOLS_DIR}::g' \
+            -e 's:${STAGING_DIR_NATIVE}::g' \
 	    ${D}/${libdir}/rpm/macros
-	sed -i -e 's:${RECIPE_SYSROOT}/::g' \
+	sed -i -e 's:${RECIPE_SYSROOT}::g' \
 	    ${D}/${libdir}/cmake/rpm/rpm-targets.cmake
=20
 }
--=20
2.30.2


