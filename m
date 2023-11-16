Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F657C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:16 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.2238.1700120228934884552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iOB41qfc;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9e62f903e88so61448666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120227; x=1700725027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw67I7Uno0RT7duKshs37QvMUkFV0XxIrxVvORRsMDE=;
        b=iOB41qfc4NjMvP5EYptsqZapM7Lrs2lAkgo3vCoddbGuBo10AYqqUWaXYKFyQC0SoQ
         s2l8DcF2Jepu4dETOoqo7gPxD9Lyo+THyXoOWN+WyR0L4292dhDwAtOLaKDeCdTt8yoH
         IdN7hDsG0bn4yZ6Bt94RSiTLgNf+JY0UyIuyV68HDho+ahTXy8c5pwRmfn6jNW8wf71n
         xrZfHsN3hYKrMagxp/Vmk7zcAQ07Bztxd3/AYSO+JOZxa7EGtXHfqIqB4D7tzBuFch35
         EDFmpQ0j4Jl4TYm6RPE6z60ZvO6l3GsJ67ImEmcMMavd5BNm8rZA9CQKwynPe2i/Y7Zi
         BlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120227; x=1700725027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw67I7Uno0RT7duKshs37QvMUkFV0XxIrxVvORRsMDE=;
        b=Y0/YZXuBBlzf9vFN1MGdVPooKJ+lKclarbpgCrnQROseh8Er47bhOeWwWZ/EQFr8lK
         gRXHcxJ0dJBCS+qcHSnwPPTPJisahznLhQnznf1ABUXcTR8jGtDRzGajVsYJ0GP7b6ru
         z4KXNIlUotdp4PzWUrgpUvhJun9S3T7cuhPdWlIsT/FEDal5rTxzUJXQ44QkVn+CWiJl
         Rhm3COmdlF4rRJM8BRFtk/u6p/YsitzyK36qkZzthXHOwUz0UQwIpLxLNZuus7/VVvat
         De+Fxhxttx58QVK4Sq9OFVMdIejw/jEbsRgobt/PzIkdiMg1gmeCx++Pmk0JOn9+d0Xm
         OgSQ==
X-Gm-Message-State: AOJu0Ywkaz63eKA/DBnZVJdk25j9Xd4WG/q6190G3RcXDGAkyN5tzeT+
	FTjSg8S7iVYo6D0Edq0ZPAMznxOfXI8=
X-Google-Smtp-Source: AGHT+IG7ota1ERA6h/OLA/HHdkexgCltzpvfDGixw0sD8885YSKQfsTMYkUskmeV3HqH75lzKgGFpg==
X-Received: by 2002:a17:906:e4e:b0:9e3:f97b:239e with SMTP id q14-20020a1709060e4e00b009e3f97b239emr11294845eji.29.1700120227102;
        Wed, 15 Nov 2023 23:37:07 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ko14-20020a170907986e00b009dd701bb916sm7969260ejc.213.2023.11.15.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:37:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 11/11] python3-cython: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:50 +0100
Message-ID: <20231116073650.2710535-11-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190763

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/python3-cython_0.29.36.bb           | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_0.29.36.bb
index 78be2b94ed..8f971b2179 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.36.bb
@@ -20,17 +20,17 @@ do_install:append() {
 PACKAGESPLITFUNCS =+ "cython_fix_sources"
 
 cython_fix_sources () {
-	for f in ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FlowControl.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FusedNode.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Scanning.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Visitor.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Actions.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Scanners.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Runtime/refnanny.c \
-		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Tempita/_tempita.c \
+	for f in ${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Compiler/FlowControl.c \
+		${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Compiler/FusedNode.c \
+		${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Compiler/Scanning.c \
+		${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Compiler/Visitor.c \
+		${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Plex/Actions.c \
+		${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Plex/Scanners.c \
+		${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Runtime/refnanny.c \
+		${PKGD}/usr/src/debug/${PN}/${PV}/Cython/Tempita/_tempita.c \
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
 		if [ -e $f ]; then
-			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
+			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${PV}#g' $f
 		fi
 	done
 }
-- 
2.42.1


