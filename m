Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.1390.1592340458400304811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 13:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id n11so20639997qkn.8
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 13:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=Bh6LJLI+IRanyE2VGk48Apvru6RQSPDSy3xKOZYB15g=;
        b=DJcJXFjEcvFCTRJ1jo3sOKmwaaWCKSxYwTWOYt986LB4G+AEq7U2BhYwhIDhEDglr6
         nc+JfuVqp0HNeeMNvHafqH2HkSj6MWYqkGZLyJW4vpd2N36eqm/3sCkdywLNZ71ak/Bp
         iiTiYf31kWR81HeAmPypopP2JSIflsk5MPkaSZAV2V04xASrPr/ERXlMwsEjAauoQf89
         WmmnWWCIPy0OlzAKYsJISkxVxyTktjCT2BPqYCfio4YO3ojtzPBKqoL+KL2VQIAuPyIn
         KXLX5Tol9J3yq6pjul4y+X/N2b+7XTVTmiBkWz0i+pauXOefl2nVVvezvUTPiowf5Eti
         CbAQ==
X-Gm-Message-State: AOAM530jK2eI8HmpzHHpjGszNCObD5ZcfbR3hHO+17VO4J1BP0ejKhsM
	roHm3KGgP5yPMmioifpoT7PJPvvAH9c=
X-Google-Smtp-Source: ABdhPJx7fTCitcvS0tK1jY7DlVYdN5UTM90gD78qHiuLFp8cv9qitNC0z/J7waxH77yRKpFMWaL6Kg==
X-Received: by 2002:a05:620a:526:: with SMTP id h6mr21816132qkh.338.1592340457273;
        Tue, 16 Jun 2020 13:47:37 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id s201sm15757354qka.8.2020.06.16.13.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:47:36 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell-backport PATCH 1/3] mtd-utils: Fix return value of ubiformat
Date: Tue, 16 Jun 2020 17:47:23 -0300
Message-Id: <20200616204726.2332101-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

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
2.27.0

