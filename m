Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.15617.1631124104517001365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZaT6b9YG;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id q26so4532937wrc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bdnnmLsi25v+gG+KgO/9B5g879XCom3yK/xCf0C8WNE=;
        b=ZaT6b9YGvNTv0UdWNMixtivio0ZLuEj7eBp+k0/FmbwJIVeoXm9CzpZpWsYu/JP3MY
         gcp+JQ8JINPRZ5DmNN3I0paBY/KG5ENG0CkTEynnBN1MeyCNW+NdWDFxosXihnvIVVeY
         1KzuhQHshCx912qkny0LPiTKHWrdTWxlUrHxocjybouMB/IVoG4R1PB47Mqbqr53TqmL
         ii4vhX40k6rF/5qM69JmomEnXFjEWj/ACHeTDLIOrpYMgVP+730+z4gDWRn+mF9IvDWQ
         v9QULz5LySVHPg1nuS3ZYgaGQ4b0TMl7kg05ubRdmEJ9l1iX5TqYXQl2E4+AdnkKhhLk
         e28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bdnnmLsi25v+gG+KgO/9B5g879XCom3yK/xCf0C8WNE=;
        b=UgV+WVL2ZtbosnHwkRWMRn+iLWswWkMRc74Yvb6lfUY9fGQICpWJqQP+pP5VlDrDGZ
         UgyrSktUoVWTDu6ihYK7e+Qe9S55mzcaLN24+LykwGBel1fS8LFTNulsw1eeWS1h721o
         Mco+XW4/GIx2/bHTQWSi6hDEhts4NNASxT63FUNOv+FGw0zcCNdKxlUVRHvODQx2hr0t
         76oynmGfBJeDqCpWOpqaaiIj7irlTGZlcGVk9mdq8LzKQoLa5XcbTahKqIBQC66xBexL
         bwstVuianF2IqhanJ9j9500QyKN5+sFdFr52Ig35LjuD0efR1Y+eSzU9f++ZaXPo2nm0
         nzAA==
X-Gm-Message-State: AOAM531NNewcBbJj2t5X1Kd+Mp77Uz6nRuEIPOkEujsn6vRe5wm3Wwa8
	RJwcGXx/4dTvzNGFyXo39E6uMk8jMfY=
X-Google-Smtp-Source: ABdhPJzGwwWGm9A30sX0pdGloTCSxfcLK92NxDLBwSbag4IvDSXosPoMJmsrgyS/E6V+Ph5sLMbuyQ==
X-Received: by 2002:a05:6000:1081:: with SMTP id y1mr5457854wrw.415.1631124103125;
        Wed, 08 Sep 2021 11:01:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/26] lsof: update 4.91 -> 4.94.0
Date: Wed,  8 Sep 2021 20:01:20 +0200
Message-Id: <20210908180125.103473-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Drop all custom sourcedir handling as the source is now a standard
git checkout.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/lsof-remove-host-information.patch  | 17 +++++------
 .../lsof/{lsof_4.91.bb => lsof_4.94.0.bb}     | 28 +++----------------
 2 files changed, 13 insertions(+), 32 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.91.bb => lsof_4.94.0.bb} (53%)

diff --git a/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch b/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
index b7d2323dc9..70155f9a1d 100644
--- a/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
@@ -1,25 +1,29 @@
-Remove host information from version.h
+From 95b8a13c1ea4274f58304bf5c4f7ca3d036b10f3 Mon Sep 17 00:00:00 2001
+From: Li Wang <li.wang@windriver.com>
+Date: Wed, 30 Aug 2017 15:05:16 +0800
+Subject: [PATCH] Remove host information from version.h
 
 make lsof not include host information
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Li Wang <li.wang@windriver.com>
+
 ---
- dialects/linux/Makefile |   50 +++++++++--------------------------------------
+ dialects/linux/Makefile | 50 ++++++++---------------------------------
  1 file changed, 9 insertions(+), 41 deletions(-)
 
 diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
-index 2bea108..792142b 100644
+index 61e8643..5458a0a 100644
 --- a/dialects/linux/Makefile
 +++ b/dialects/linux/Makefile
-@@ -76,48 +76,16 @@ version.h:	FRC
+@@ -95,48 +95,16 @@ version.h:	FRC
  	@echo Constructing version.h
  	@rm -f version.h
  	@echo '#define	LSOF_BLDCMT	"${LSOF_BLDCMT}"' > version.h;
 -	@echo '#define	LSOF_CC		"${CC}"' >> version.h
 -	@echo '#define	LSOF_CCV	"${CCV}"' >> version.h
--	@echo '#define	LSOF_CCDATE	"'`date`'"' >> version.h
+-	@echo '#define	LSOF_CCDATE	"$(BUILD_DATE)"' >> version.h
 -	@echo '#define	LSOF_CCFLAGS	"'`echo ${CFLAGS} | sed 's/\\\\(/\\(/g' | sed 's/\\\\)/\\)/g' | sed 's/"/\\\\"/g'`'"' >> version.h
 +	@echo '#define	LSOF_CC		""' >> version.h
 +	@echo '#define	LSOF_CCV	""' >> version.h
@@ -71,6 +75,3 @@ index 2bea108..792142b 100644
  	@sed '/VN/s/.ds VN \(.*\)/#define	LSOF_VERSION	"\1"/' < version >> version.h
  
  FRC:
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-extended/lsof/lsof_4.94.0.bb
similarity index 53%
rename from meta/recipes-extended/lsof/lsof_4.91.bb
rename to meta/recipes-extended/lsof/lsof_4.94.0.bb
index d7428ea2c4..9659fa8246 100644
--- a/meta/recipes-extended/lsof/lsof_4.91.bb
+++ b/meta/recipes-extended/lsof/lsof_4.94.0.bb
@@ -11,33 +11,13 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
 # https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
 # the most commonly used alternative.
 
-SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
+SRC_URI = "git://github.com/lsof-org/lsof \
            file://lsof-remove-host-information.patch \
           "
 
-SRC_URI[md5sum] = "148ed410cb52e08c2adc0c60f480f11f"
-SRC_URI[sha256sum] = "c9da946a525fbf82ff80090b6d1879c38df090556f3fe0e6d782cb44172450a3"
+SRCREV = "005e014e1abdadb2493d8b3ce87b37a2c0a2351d"
 
-UPSTREAM_CHECK_URI = "https://github.com/lsof-org/lsof/releases/"
-UPSTREAM_CHECK_REGEX = "lsof_(?P<pver>.*)\.linux\.tar"
-
-LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
-
-S = "${WORKDIR}/lsof_${PV}_src"
-
-python do_unpack () {
-    if not bb.data.inherits_class('externalsrc', d) or not d.getVar('EXTERNALSRC'):
-        # temporarily change S for unpack of lsof_${PV}
-        s = d.getVar('S', False)
-        d.setVar('S', '${WORKDIR}/lsof_${PV}')
-        bb.build.exec_func('base_do_unpack', d)
-        # temporarily change SRC_URI for unpack of lsof_${PV}_src
-        src_uri = d.getVar('SRC_URI', False)
-        d.setVar('SRC_URI', '${LOCALSRC}')
-        d.setVar('S', s)
-        bb.build.exec_func('base_do_unpack', d)
-        d.setVar('SRC_URI', src_uri)
-}
+S = "${WORKDIR}/git"
 
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
@@ -62,5 +42,5 @@ do_compile () {
 do_install () {
 	install -d ${D}${sbindir} ${D}${mandir}/man8
 	install -m 0755 lsof ${D}${sbindir}/lsof
-	install -m 0644 lsof.8 ${D}${mandir}/man8/lsof.8
+	install -m 0644 Lsof.8 ${D}${mandir}/man8/lsof.8
 }
-- 
2.31.1

