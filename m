Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E339C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:17:00 +0000 (UTC)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
 by mx.groups.io with SMTP id smtpd.web11.10189.1741857386300543722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 02:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=aV7l7J9/;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=ppWP8P5R;
 spf=pass (domain: yadro.com, ip: 89.207.88.253, mailfrom: artemiy.romanov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com BA4D0E0006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1741857379; bh=/aNA0CQpVaUBwPGa16MCGRfNg00tfnqBrsrE9oA4mB4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=aV7l7J9/loUDs9NJv/lOAP6lSi0xoAFJDwATMUFvZoSFy9qYpPRe3s41jwyXkWVwH
	 nEh7Iysyuk0398gPrbV6RxVXrbfiSbnhhoSG//BehpzzrJY17EUVQ87R19Q7P3TUQk
	 u58DrIjnNVoU4VfIRqgHTyKVMYanB+XlN35x7NTH6gCZ00x7vUVD0ExNW0wrMHYju5
	 D+P6GoY+zgdfVCJv7JAKVTXRCeOGgjenUrFWznvC1i76w4iXVG2X/AetlaCEJHnwT9
	 +gIOK02kQOBHIENfrfUy0tT2zhn8jBn3aFmn6ZkkGzFKFoa6103622dszqPSgmzKvt
	 iIGG/LAZVzCsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1741857379; bh=/aNA0CQpVaUBwPGa16MCGRfNg00tfnqBrsrE9oA4mB4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ppWP8P5REtDA2yPP+F9z4H/YkrArXnGfFaOu+suEPMh4U/GtvzqCKhwYNoDPCswMo
	 iGMibhWc3OlT+nWNd+ekdfUlfx+03pXhBGlxk3+zN6dI05/piVM4mYN7ILb5WeF9sg
	 WYlXkVPd0pzVCdGvhbGMAAUgdVoN2B8rv+6+WBW0ZAI3QeFdzB9wOxzn28+W8f3hBF
	 2jnukJ6Iej5pZf2zp2bAdIuIAzqDrwbTOwMf5aU278E+Z80NLTTM9RKuAbSJvTXZac
	 ccXFFhT2KZYu163iWyLV/HdUmkEzFeu4SpAdnHsqliO5KzgFa5z5rK83ROiJxkTxdF
	 fSe0cc0hrLSxA==
From: Artemiy Romanov <artemiy.romanov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Artemiy Romanov <artemiy.romanov@yadro.com>
Subject: [PATCH] rpm: fix redudant slash remove and add lacking dependency
Date: Thu, 13 Mar 2025 12:15:57 +0300
Message-ID: <20250313091557.4153150-1-artemiy.romanov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 T-EXCH-12.corp.yadro.com (172.17.11.143)
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212765

do_install:append() formats paths using sed in macro files incorrectly
causing resulting paths to have format 'usr/*' instead of  '/usr/*'.

Absence of debugedit-native recipe in DEPEDS variable results in
incorrect expansion of '%__find_debuginfo' in usr/lib/rpm/macro file
which looks like this:

%__find_debuginfo	__FIND_DEBUGINFO-NOTFOUND

Adding debugedit-native in DEPENDS:append:class-native is not fixing
the problem while adding it in DEPENDS fixes that:

%__find_debuginfo	/usr/bin/find-debuginfo

Signed-off-by: Artemiy Romanov <artemiy.romanov@yadro.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devto=
ols/rpm/rpm_4.20.0.bb
index 281fde1c82..004c847fb8 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -46,7 +46,7 @@ SRCREV =3D "b3323786668cf99bc9aed7e60ccdab0bc25e19da"
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 z=
std"
+DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 z=
std debugedit-native"
 DEPENDS:append:class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
=20
 EXTRA_OECMAKE:append =3D " -D__CURL:FILEPATH=3Dcurl"
@@ -131,10 +131,10 @@ do_install:append:class-nativesdk() {
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


