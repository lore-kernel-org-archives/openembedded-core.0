Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.45832.1624274987180165504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 04:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pDY6kx45;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id j2so29627422lfg.9
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtKx4o2lIFsp6NAaA+PzWnQu40vW4Ii3gJiuhUfUSIg=;
        b=pDY6kx45IAZx9Te2jZn4CrsjOEk5n2aUF582KjL5kh1DiKD+oJuj35YaG5y82uy6E9
         +m+1h4a07H626x1b/R888QOPGmZBs8EJFhzPGG5zYjMZ/Q6P3g7fuc9vTZoAcGGvNG9N
         mFdnv6eYIyQJvBgRUf5ol5VLrKjjQj8BkicfqyYLZBmvtwAG7/tArUoHNZNa/H7OqVwy
         5hczjJRu/GbAotmJ8JjeHqQLBZIfHtmXzTBQFpQLgYoFdmD15UudZgrzErjNl0chaOdJ
         I4hmllSwfBmikgzj6P5Gs96UVEQ+1e3faZCnxM5gHRl+Vorwwro0jOKjNstgLZt8qJD2
         ByjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtKx4o2lIFsp6NAaA+PzWnQu40vW4Ii3gJiuhUfUSIg=;
        b=m9ee+YWRMYmqezxJq5pKpegvuOAx+facY7GNWfnKWObSkYiXiowi+jQh0Fn79P/pJg
         61Ikk5XI1fBzyhsu11baoGBp7I0OT/Dpk6gPIsFRR9jysbOdSpdQppr20Gej3nwwiLau
         UqJiS/Oa+fPEMZBV0oEqld28VCCHpejaStyy0gCIe8077IxBjazrenN1iXx9hyZKWNWf
         pNMTWqbRLiavnaDK+dAzff36+a+7PPua6bHT3RC0IF6THVXpkyFQ/yQSAxqqLBSYMuUJ
         HAfR3GZBMZCBSMdRB3BwXU3OQWEi3ADS5xN8ouCjibKMRSwNmiMyDWUcihGYKZc2PCMl
         YbEw==
X-Gm-Message-State: AOAM532Kd2JS2IpA8EyJNPS6ucJ0nR1Gs26MJZhssjfnSJCvH+eCg4Tm
	8KpmRpImfitkzFGX03v6Rlu4dcbkFDg=
X-Google-Smtp-Source: ABdhPJwGcOE8v5jOf2CqeuaF8G2JEaEFJgdrO2kR/PVJfQNSir+cYY2vAPelUHWVyZy6tA7nxqGkow==
X-Received: by 2002:a05:6512:16a8:: with SMTP id bu40mr13994576lfb.170.1624274985238;
        Mon, 21 Jun 2021 04:29:45 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.198.108])
        by smtp.gmail.com with ESMTPSA id v18sm2154099ljg.114.2021.06.21.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 04:29:44 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] uboot-sign.bbclass: fix some install commands
Date: Mon, 21 Jun 2021 13:29:39 +0200
Message-Id: <20210621112939.661381-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

A "install -d" command is missing when dealing with
${UBOOT_NODTB_BINARY} in install_spl_helper function, this can lead
to invalid install error saying:

| install: cannot create .../usr/share/u-boot-nodtb-2021.04-r0.bin': No such file or directory

Let's drop all "install -d" and replace them with "install -Dm" in
install_helper/install_spl_helper functions.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 29b2edc833..9671cf76a5 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -196,10 +196,9 @@ concat_spl_dtb() {
 # signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
 install_helper() {
 	if [ -f "${UBOOT_DTB_BINARY}" ]; then
-		install -d ${D}${datadir}
 		# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
 		# need both of them.
-		install ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
+		install -Dm 0644 ${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
 		ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
 	else
 		bbwarn "${UBOOT_DTB_BINARY} not found"
@@ -209,14 +208,13 @@ install_helper() {
 # Install SPL dtb and u-boot nodtb to datadir, 
 install_spl_helper() {
 	if [ -f "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
-		install -d ${D}${datadir}
-		install ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_IMAGE}
+		install -Dm 0644 ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_IMAGE}
 		ln -sf ${SPL_DTB_IMAGE} ${D}${datadir}/${SPL_DTB_BINARY}
 	else
 		bbwarn "${SPL_DTB_BINARY} not found"
 	fi
 	if [ -f "${UBOOT_NODTB_BINARY}" ] ; then
-		install ${UBOOT_NODTB_BINARY} ${D}${datadir}/${UBOOT_NODTB_IMAGE}
+		install -Dm 0644 ${UBOOT_NODTB_BINARY} ${D}${datadir}/${UBOOT_NODTB_IMAGE}
 		ln -sf ${UBOOT_NODTB_IMAGE} ${D}${datadir}/${UBOOT_NODTB_BINARY}
 	else
 		bbwarn "${UBOOT_NODTB_BINARY} not found"
-- 
2.29.0

