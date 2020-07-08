Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4720.1594242490280304734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=QXqE6s92;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjN41hcz4D
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242488;
	bh=3Yf6/PC/gcQvExfr0XYWY1hJGoH+M6AFUU3k/1joEUg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QXqE6s92Z9FFoXme3M4/V+fneyhTtqWIFEwviOecXpl5cvCgYwdv3fh39g+SdTqXI
	 PKLCOTqFF3eJOVzLJ+C/l+FUt3avTKPsJw/2qL+i7e5Uo2WyYtC7i0u/i9tiaMkqk2
	 2efv7MP2TaKX2eLdMUZrOxXnZmUYsZUN+w/ypvVnY/0YeR9PXnsO90URZcrYsd6QRL
	 GqqjeQWYs00Stk4fvmZ55dgF9kJE35jBJi09uld2D5waeviouvSMZuBCmIhwNdlqLl
	 LcN+n/2WeuxbYW386RNjb8+d4Cgh5m/i2hKofZbp9dLrPkH86C4CJeV3YTYC7VcjS/
	 KoLwTFVC2AFUMY+gp31ZBLFzMwacXrNxjaf0lEU2qY2dwBmR+4X68VTKT0jedEHZef
	 ApXBMEeZNn/gs5WTLiggN1v50CuoY0fc/hl/4rnpQrGtXP1DkmTDCOzYmxFe64T0y2
	 kjy5QNFkGbjwt4aaF8MZRefiQXFc6GPv8vz1dWtRKEPuqCbg2V3+grdK+G92P+M9Jy
	 uPjIatKsc9zYElOjg/SfysU1wUi2rfhUfAtFIZHocQEzT3BQRO4RikXP5aLfsIIMly
	 3V63ll0Y9R0Bo4j68QeOGAR67+kbBMyt9nzKLJTiLS6pH+4wyziq7NYuGyb172LiAj
	 56vqReRs7ZD93Qh39U9bKXCw=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 13/19] mtd-utils: Fix return value of ubiformat
Date: Thu,  9 Jul 2020 00:07:55 +0300
Message-Id: <20200708210801.5553-13-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Otavio Salvador <otavio.salvador@gmail.com>

This changeset fixes a feature regression in ubiformat.  Older versions
of ubiformat, when invoked with a flash-image, would return 0 in the
case no error was encountered.  Upon upgrading to latest, it was
discovered that ubiformat returned 255 even without encountering an
error condition.

This changeset corrects the above issue and causes ubiformat, when given an
image file, to return 0 when no errors are detected.

Backport fix from 2.1.2

(From OE-Core rev: 3ee98b6c9ddd1dd0825245ca672236b7befb9859)

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
(cherry picked from commit 7ebacd9cbaec98fbc406e8ae99c9805a24fdadc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-utils-Fix-return-value-of-ubiformat.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
new file mode 100644
index 0000000000..d43f7e1a7a
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
@@ -0,0 +1,62 @@
+From 4d19bffcfd66e25d3ee74536ae2d2da7ad52e8e2 Mon Sep 17 00:00:00 2001
+From: Barry Grussling <barry@grussling.com>
+Date: Sun, 12 Jan 2020 12:33:32 -0800
+Subject: [PATCH] mtd-utils: Fix return value of ubiformat
+Organization: O.S. Systems Software LTDA.
+
+This changeset fixes a feature regression in ubiformat.  Older versions of
+ubiformat, when invoked with a flash-image, would return 0 in the case no error
+was encountered.  Upon upgrading to latest, it was discovered that ubiformat
+returned 255 even without encountering an error condition.
+
+This changeset corrects the above issue and causes ubiformat, when given an
+image file, to return 0 when no errors are detected.
+
+Tested by running through my loading scripts and verifying ubiformat returned
+0.
+
+Upstream-Status: Backport [2.1.2]
+
+Signed-off-by: Barry Grussling <barry@grussling.com>
+Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ ubi-utils/ubiformat.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
+index a90627c..5377b12 100644
+--- a/ubi-utils/ubiformat.c
++++ b/ubi-utils/ubiformat.c
+@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+ 	struct ubi_vtbl_record *vtbl;
+ 	int eb1 = -1, eb2 = -1;
+ 	long long ec1 = -1, ec2 = -1;
++	int ret = -1;
+ 
+ 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
+ 	write_size /= mtd->subpage_size;
+@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+ 	if (!args.quiet && !args.verbose)
+ 		printf("\n");
+ 
+-	if (novtbl)
++	if (novtbl) {
++		ret = 0;
+ 		goto out_free;
++	}
+ 
+ 	if (eb1 == -1 || eb2 == -1) {
+ 		errmsg("no eraseblocks for volume table");
+@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+ 
+ out_free:
+ 	free(hdr);
+-	return -1;
++	return ret;
+ }
+ 
+ int main(int argc, char * const argv[])
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 810fe40f4e..d1658a739b 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -15,6 +15,7 @@ PV = "2.1.1"
 SRCREV = "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+           file://0001-mtd-utils-Fix-return-value-of-ubiformat.patch \
 "
 
 S = "${WORKDIR}/git/"
-- 
2.17.1

