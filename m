Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.1981.1632444039805707618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 17:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=AvcbsQPu;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2C01E8338C;
	Fri, 24 Sep 2021 02:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1632444036;
	bh=GYKCs2A6RRLAGzaogwa+yzTJxi8bMEC5QQyoCMCySSI=;
	h=From:To:Cc:Subject:Date:From;
	b=AvcbsQPueyBUCo9alu4kqaxWsfWlGCh2kGHOic0b0u9TguCbc3tr1YCxPdc1Jc3NJ
	 BXvSCDVYeWM997BClD0jJZOcudoccph903cy/TOYJ2cgCz3Qw+cYCVRuM1yzMV5fac
	 /tlHwoDI8hUcITjDtb+SKF3LQbhtJ7ckAhwkNo8EZn9cKz4/8I6Jddmxfwh0LsWkhn
	 rOiP7GLkVsZoXFyAOPaKao1RKHhe28NeEODZUWccKffzRWDHfuQZaIKEfcCzPKSk1q
	 NECgjgT0y1Ct4n4IFJfu+WLcz5r+iWoDNbKabRd602LgzkzYw312YgmWs3ELcemmd3
	 7uhfRQGQYCw9g==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] mtd-utils: upgrade 2.1.1 -> 2.1.2
Date: Fri, 24 Sep 2021 02:40:19 +0200
Message-Id: <20210924004020.413105-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Drop backported patch.

(cherry picked from commit e38fd1ac331d824b2db94a7ae46026b111257e83)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-utils-Fix-return-value-of-ubiformat.patch | 62 -------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  7 +--
 2 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fi=
x-return-value-of-ubiformat.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-retur=
n-value-of-ubiformat.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd=
-utils-Fix-return-value-of-ubiformat.patch
deleted file mode 100644
index d43f7e1a7a..0000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value=
-of-ubiformat.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 4d19bffcfd66e25d3ee74536ae2d2da7ad52e8e2 Mon Sep 17 00:00:00 2001
-From: Barry Grussling <barry@grussling.com>
-Date: Sun, 12 Jan 2020 12:33:32 -0800
-Subject: [PATCH] mtd-utils: Fix return value of ubiformat
-Organization: O.S. Systems Software LTDA.
-
-This changeset fixes a feature regression in ubiformat.  Older versions =
of
-ubiformat, when invoked with a flash-image, would return 0 in the case n=
o error
-was encountered.  Upon upgrading to latest, it was discovered that ubifo=
rmat
-returned 255 even without encountering an error condition.
-
-This changeset corrects the above issue and causes ubiformat, when given=
 an
-image file, to return 0 when no errors are detected.
-
-Tested by running through my loading scripts and verifying ubiformat ret=
urned
-0.
-
-Upstream-Status: Backport [2.1.2]
-
-Signed-off-by: Barry Grussling <barry@grussling.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- ubi-utils/ubiformat.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
-index a90627c..5377b12 100644
---- a/ubi-utils/ubiformat.c
-+++ b/ubi-utils/ubiformat.c
-@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_=
dev_info *mtd,
- 	struct ubi_vtbl_record *vtbl;
- 	int eb1 =3D -1, eb2 =3D -1;
- 	long long ec1 =3D -1, ec2 =3D -1;
-+	int ret =3D -1;
-=20
- 	write_size =3D UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
- 	write_size /=3D mtd->subpage_size;
-@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd=
_dev_info *mtd,
- 	if (!args.quiet && !args.verbose)
- 		printf("\n");
-=20
--	if (novtbl)
-+	if (novtbl) {
-+		ret =3D 0;
- 		goto out_free;
-+	}
-=20
- 	if (eb1 =3D=3D -1 || eb2 =3D=3D -1) {
- 		errmsg("no eraseblocks for volume table");
-@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_=
dev_info *mtd,
-=20
- out_free:
- 	free(hdr);
--	return -1;
-+	return ret;
- }
-=20
- int main(int argc, char * const argv[])
---=20
-2.27.0
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 9c05dc03dc..55f05dc8f9 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,13 +11,12 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS =3D "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests +=3D "bash"
=20
-PV =3D "2.1.1"
+PV =3D "2.1.2"
=20
-SRCREV =3D "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
+SRCREV =3D "7b986779342021bda87c04da3bf729718736d8ab"
 SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-           file://0001-mtd-utils-Fix-return-value-of-ubiformat.patch \
-"
+           "
=20
 S =3D "${WORKDIR}/git/"
=20
--=20
2.33.0

