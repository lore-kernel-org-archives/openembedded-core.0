Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.407.1592848827626807778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1cd8QDmE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 64so2878282oti.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xUxnC8KmH8ArlCCIXCgATly5A7+5+RkJmcLkXgk1IM8=;
        b=1cd8QDmEOCBtMuRjywJZdhrMVJlIRdDD6PEFR+x+e/Q/jXdEvFo9Pnng0uZCEYar5a
         B5gizLwLE4G1ZPS/Cn3D3gLCJWr4PE20+skiYBhL0yC0JDDdAr/Pg0BeSj8Fvhn/ovwb
         MndWoLNrkvpH4eJkgkxkB1mf/itSpl22O6pX3V5qybTJRDPXanDIK8oTA/KwvQjIjwG7
         8TipdNT8iWhed04hIEV/WH0MpXl2Sgamo+8dyDc4vxfSijrRbmQmkmWc4WBELKcDl7NH
         KaTmdRh4CwrFKh+AHLPivB39HnjCqVUXEjb0N/6p2dXQ/qtvn8+eylw1d4oLiitci6IH
         ButQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xUxnC8KmH8ArlCCIXCgATly5A7+5+RkJmcLkXgk1IM8=;
        b=Jg2OA53KFBcjV6utI5TVma00O7mWNS3wqTqMYBan3yyolhFW8hTsC3vqO/mxsgLrp0
         B0nWCmqulRRsQkkRHVpQH9p+0Qzz6dzjjOQyJikwRTgEGMg45wcUsUSkrb3QLm/MrzJf
         j1hs3xTRZaLITjIOL7vra+8T/A5ECB2+/2xXrSDtDBpfzb7MkL3umBUWRclJ/6GALdOZ
         6rjXkfPw4nioJhSVU0jnhrjaQDgezXBsUqK9ALLWEeKF9HiSgomhzLwbtGycHoxL2t+y
         WfWg2mWxpjrkecUhQFjuq65gCB9gA2JcvaO8HbwrCTFWFqWzO+EmHBeT4exA9sKnMqe8
         WgFA==
X-Gm-Message-State: AOAM532i8ytZnVqzEnfSCUegaYb7HcP000MB4FgvVGpv5XdMpLihlhYs
	DEZRMhJyFSneXYSKmNJRaUYwKMvIuWAvAA==
X-Google-Smtp-Source: ABdhPJyAz++kkf4edoepi9DqYZPyolNS4heMjimyq9UnhbjX5zxLpLscFSMrgNLvAgZ7ja96Mzq/vQ==
X-Received: by 2002:a4a:e9b4:: with SMTP id t20mr15329293ood.3.1592848826460;
        Mon, 22 Jun 2020 11:00:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/33] mtd-utils: Fix return value of ubiformat
Date: Mon, 22 Jun 2020 07:58:07 -1000
Message-Id: <3ee98b6c9ddd1dd0825245ca672236b7befb9859.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Otavio Salvador <otavio.salvador@gmail.com>

This changeset fixes a feature regression in ubiformat.  Older versions
of ubiformat, when invoked with a flash-image, would return 0 in the
case no error was encountered.  Upon upgrading to latest, it was
discovered that ubiformat returned 255 even without encountering an
error condition.

This changeset corrects the above issue and causes ubiformat, when given an
image file, to return 0 when no errors are detected.

Backport fix from 2.1.2

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ebacd9cbaec98fbc406e8ae99c9805a24fdadc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

