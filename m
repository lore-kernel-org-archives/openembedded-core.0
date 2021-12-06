Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C77BC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 18:15:42 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de
 [116.202.209.171])
 by mx.groups.io with SMTP id smtpd.web12.55564.1638814540400412129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 10:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu
 header.s=mail header.b=Y9IpKeTi;
 spf=pass (domain: fancydomain.eu, ip: 116.202.209.171,
 mailfrom: jasper@fancydomain.eu)
From: Jasper Orschulko <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1638814536;
	bh=Df0mAJmNXAMMVsK+6+GgMl2DHLa+b3/9Ejw/DnNUcng=;
	h=From:To:Cc:Subject;
	b=Y9IpKeTisl0bIMStyGbU0rUa1rdxksFUVsn3Yojtg+/p/SCskfobO95/hzbxOdsEb
	 TV1UjLHDACF6Nu4BOBmh6UaTkiSUtPV5UysFFZm6IlVbnyCbcntsfHX+JYyOXDXZX7
	 fvMUoYYN7G360R85dyhrpC1f9+YEFDID5HLpWJFmEai/CXipoyYUfdWDGEm1nkvKhq
	 DKxwWzdVCxHBNYMKwRtIjVICUwg1OrtWB/fPGOv8yhq22pfmZEy7OF8iO2ktXjr25r
	 1L1MiuzTfkCS28sBYJPb3O00BJXooFbedDNwl9PYxBMVCgyP42+6zJi+7YUfE/0/2Z
	 MyggqhefW+uMQ==
To: openembedded-core@lists.openembedded.org
Cc: quaresma.jose@gmail.com,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Subject: [oe-core][PATCH 1/2] repo: Use separate task for patching repo rev
Date: Mon,  6 Dec 2021 19:15:12 +0100
Message-Id: <20211206181513.6944-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 18:15:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159266

From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>

Using a task instead of a version specific patch for setting the repo
revision within the source code. This drastically decreases the
maintenance burden and easier usage of the OE update helper.

Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
---
 .../0001-Set-REPO_REV-to-v2.17.3.patch        | 35 -------------------
 meta/recipes-devtools/repo/repo_2.17.3.bb     |  9 +++--
 2 files changed, 7 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_=
REV-to-v2.17.3.patch

diff --git a/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-to-=
v2.17.3.patch b/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-=
to-v2.17.3.patch
deleted file mode 100644
index 60f1086b32..0000000000
--- a/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-to-v2.17.3=
.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bdd2a528da59c28db8ae2986834926de7cebf3ab Mon Sep 17 00:00:00 2001
-From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
-Date: Thu, 4 Nov 2021 16:55:12 +0100
-Subject: [PATCH] Set REPO_REV to v2.17.3
-
-repo is an unusual tool because it downloads all of its own Python modul=
es
-using GPG-signed git tags, and stores those files as part of the project
-that it is working with.
-
-So in order to have a reproducible repo installation within the project
-folders, we hardcode the default REPO_REV to a SHA1 that corresponds to
-the version of the recipe. REPO_REV can still be overwriten by the user,
-by specifying the REPO_REV environment variable.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
----
- repo | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/repo b/repo
-index 4cddbf1..5c3551f 100755
---- a/repo
-+++ b/repo
-@@ -144,7 +144,7 @@ if not REPO_URL:
-   REPO_URL =3D 'https://gerrit.googlesource.com/git-repo'
- REPO_REV =3D os.environ.get('REPO_REV')
- if not REPO_REV:
--  REPO_REV =3D 'stable'
-+  REPO_REV =3D '11b30b91df1f0e03b53da970ec2588e85817bacc'
- # URL to file bug reports for repo tool issues.
- BUG_URL =3D 'https://bugs.chromium.org/p/gerrit/issues/entry?template=3D=
Repo+tool+issue'
-=20
---=20
-2.34.0
diff --git a/meta/recipes-devtools/repo/repo_2.17.3.bb b/meta/recipes-dev=
tools/repo/repo_2.17.3.bb
index f7bbb22964..aeaec13dd7 100644
--- a/meta/recipes-devtools/repo/repo_2.17.3.bb
+++ b/meta/recipes-devtools/repo/repo_2.17.3.bb
@@ -12,13 +12,18 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57"
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps=
;branch=3Dmain"
 SRCREV =3D "11b30b91df1f0e03b53da970ec2588e85817bacc"
=20
-SRC_URI +=3D "file://0001-python3-shebang.patch \
-            file://0001-Set-REPO_REV-to-v2.17.3.patch"
+SRC_URI +=3D "file://0001-python3-shebang.patch"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.co=
m/GerritCodeReview/git-repo.git"
=20
 S =3D "${WORKDIR}/git"
=20
+do_set_fixed_rev() {
+    sed -Ei "s/REPO_REV\s*=3D\s*('|\")stable('|\")/REPO_REV =3D '${SRCRE=
V}'/g" ${S}/repo
+}
+
+do_patch[postfuncs] +=3D "do_set_fixed_rev"
+
 do_install() {
 	install -D ${WORKDIR}/git/repo ${D}${bindir}/repo
 }
--=20
2.34.1


