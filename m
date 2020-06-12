Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.624.1591985301072347226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id y1so7789359qtv.12
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 11:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=5Ciw6Ys96M/meqbP20CG3LMuRS9RITVpCDESc4ZeFoY=;
        b=m+rBoiJp/Oxq3nANottJuipKFawlj3/w1bsCqUV0a+fUcgk4R3iA/LQjYcptRZ8KIh
         PBw8B9arj7rHJv469h0HRk+7uIPn3IOEH8EbyU4WecvJcmvvkyOMz33nO7S5tGDpojld
         AVAF4yWJP7KjRVZ20eQYEOSZBmE949/lFoXsR+MLDvpBJp3Juk+NnUug1hJVneGSlshb
         +wKQyqL8DJm1YGiRGyNo5wFAauoHL0WPjcQY4z09V7ZO6x18DJkf5PzwPrApotHf4EoE
         opWdb7Dv+jwk17EgKp85inUsyS3I2Lyvn1ryibqTOb0U060ema4gUcKYOFT0JAGb/uPA
         4OrA==
X-Gm-Message-State: AOAM531eIEa4nj4HnIWPPtzJ0URtXoi6FdSiZWuFrsy4CFMKaft2PtIZ
	dHC2zNKDVBXDkvOG8QsZMJGdjlo52nQ=
X-Google-Smtp-Source: ABdhPJwaUtiyTS5aFbohY2FM+hzmZEvlgWBsy8s/uHli68orWtJYzW9rnhbiwpTonKCW96DYzDj9WQ==
X-Received: by 2002:aed:2d44:: with SMTP id h62mr4490446qtd.167.1591985299741;
        Fri, 12 Jun 2020 11:08:19 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id p63sm5051023qkf.50.2020.06.12.11.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:08:19 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mtd-utils: Fix return value of ubiformat
Date: Fri, 12 Jun 2020 15:08:09 -0300
Message-Id: <20200612180809.107139-1-otavio@ossystems.com.br>
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

