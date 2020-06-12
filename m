Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.1419.1591998096314678978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id w90so8278285qtd.8
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 14:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=9c1Rgw+sA1b5BTy+LSRvcdYraPE2P3MyqOUQLAjuR8w=;
        b=GyNGjQdwDn90Ch1D+EjUecsLc7YHwQOlRkjRmiZAeR9TwdEuj8Sd9pP/wAlWtTuXO+
         QkD4oRZzGQHxo8wtQKrt//MQirn0QB31ztSeB297+Ls5n+N3LsDk7RONl5eLzXy70IEk
         epiHVHqnrFdoUpoSCqr1DLUSq11/Jq9QjbaAMPudHpDSk9Cb3/bMNEYcSBf0qk8E+z4z
         Qkl1sX50OdIJYRPAOL8gQtHa1xYg7Qwxf09UtcEHpUNgDaQDbsewZNNAQLgKmX+a6xDl
         B0WPVNEd35SSHa6TDKU6bqM12uk72q8qzJ6UfEJz3ztNmVjlC5mq1m/h/+faMupmLWUm
         BNsw==
X-Gm-Message-State: AOAM533EO2jDjBTnjkqZO+zLJCd94/VmFKa4/KOqiUSeuIpgHbY5zy5j
	CbsVmaqh/S/wdgPLQ2lIuug3WJ4513BRmA==
X-Google-Smtp-Source: ABdhPJyvKSoUYqpgVq6h3b0JVCIUO8blafwxwOerZRS6sXhViVOh++tHvVjfpEV99h3ULaYQKkqsnA==
X-Received: by 2002:ac8:192c:: with SMTP id t41mr4903438qtj.32.1591998095150;
        Fri, 12 Jun 2020 14:41:35 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id 124sm4822038qkn.45.2020.06.12.14.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 14:41:34 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] mtd-utils: Fix return value of ubiformat
Date: Fri, 12 Jun 2020 18:41:24 -0300
Message-Id: <20200612214124.1163233-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

This changeset fixes a feature regression in ubiformat.  Older versions
of ubiformat, when invoked with a flash-image, would return 0 in the
case no error was encountered.  Upon upgrading to latest, it was
discovered that ubiformat returned 255 even without encountering an
error condition.

This changeset corrects the above issue and causes ubiformat, when given an
image file, to return 0 when no errors are detected.

Backport fix from 2.1.2

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- fix patch file name.

 ...-utils-Fix-return-value-of-ubiformat.patch | 62 +++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/mtd-utils-Fix-return-value-of-ubiformat.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-Fix-return-value-of-ubiformat.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-Fix-return-value-of-ubiformat.patch
new file mode 100644
index 0000000000..d43f7e1a7a
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-Fix-return-value-of-ubiformat.patch
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
index 810fe40f4e..a13240d61c 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -15,6 +15,7 @@ PV = "2.1.1"
 SRCREV = "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+           file://mtd-utils-Fix-return-value-of-ubiformat.patch \
 "
 
 S = "${WORKDIR}/git/"
-- 
2.27.0

