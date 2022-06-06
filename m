Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1D9C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:11:15 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.32480.1654524672645243256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DupZzI63;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x5so13913410edi.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oUFLdfFnaqfopu88w3tDHcgU2330y5FcQfb8cDewCLc=;
        b=DupZzI63rKmDoMBcRsDu9+n6uF2Xai5snoTMw/2467Tt86Qpgj6BCnA/acjsLUIovs
         AOXYUMnChOxY9f/qqYvQGvgbRY1eaIvWpohDyoPsWMsHnh0bLBpviLHiAFNQPsU56YyA
         rnmBz8ktH8WM2WBRVQEgAIlB0mCrqmW+/QKZmY8aY9oQPO7NF3UT94gzlk9DZFeKDcAH
         pHd1ROLKttdYfWBKwNVrE2fCaYtOYSJIOckIQa3vUh/r5dFN+/DCFPjDF2Sz6bADjdja
         RN5NMx2UAeA3sCphzowuxOjbz6KiPW8uRKQE/HZxPGkvxtn8MyQLmquTl+l18Fy6XbzS
         Yx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oUFLdfFnaqfopu88w3tDHcgU2330y5FcQfb8cDewCLc=;
        b=ws9WSkj24N/1SvM+t50AD2cpDwTaO0uSzQuaFUe2mnt7MvfvMqrWWMvhh+3rDFSsSa
         SuYY22ueMl/fOE+hRVIXSj/8/wq1W3e4Agj3TvCUPqDBQZb+tgeZ6/L6i0oLfTi77dk2
         lRU0DK8ybsIIKiT+ImtEScke+XUKo8TkV0S2kVDQcSGvyA9gkLcBoE2Tsw0XpkhmkHqX
         RZPz5rOK++DAIxUBvW1D9glnKsdK2RBZ/onMKo+EyWTEU3GORiL2NxeYS3/A7Ogs9rZ0
         laj0wRbSoVr9m1WO7fMnjBOmklL4d723Nt0vG8etQBX5pbWkCxs6/fEdzTgBdF/uIquZ
         O69Q==
X-Gm-Message-State: AOAM533pBVBQEEWr0Ei9SiTR7nN1K2U6HSxwFutH0+cJAY78JNWTQlaR
	oEFAd585olP/hqc+5XZlLImGiYj+KRaEHw==
X-Google-Smtp-Source: 
 ABdhPJyiph+fD+TXz0U/wMWojxB+n7uqPvUkxBoD05ze27AgSb5uIPO1L4bDyzj6OxSMaaJprGVT+w==
X-Received: by 2002:a05:6402:2752:b0:41c:b898:19a6 with SMTP id
 z18-20020a056402275200b0041cb89819a6mr27249890edd.30.1654524670609;
        Mon, 06 Jun 2022 07:11:10 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id
 ge16-20020a170907909000b00709e786c7b2sm5470482ejb.213.2022.06.06.07.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:11:10 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] zstd: added compression and decompression as packageconfig
Date: Mon,  6 Jun 2022 16:10:56 +0200
Message-Id: <20220606141056.2054477-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:11:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166632

The default is the same as before.
So both target and native can do compression and decompression.

Native will probably always needed both.  E.g. to create rpm packages.
Target could have enough with decompression only.  E.g. for OTA systems.

The difference between default and decompression only:
  packages/cortexa72-poky-linux/zstd/libzstd: PKGSIZE changed from 661912 to 210776 (-68%)
  packages/cortexa72-poky-linux/zstd/zstd: PKGSIZE changed from 1430839 to 785007 (-45%)

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/recipes-extended/zstd/zstd_1.5.2.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
index 3887f31ecf..924e7db7f7 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -18,22 +18,31 @@ CVE_PRODUCT = "zstandard"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG:class-native ??= "compression decompression pzstd"
+PACKAGECONFIG:class-target ??= "compression decompression pzstd"
+PACKAGECONFIG[compression] = "ZSTD_LIB_COMPRESSION=1,ZSTD_LIB_COMPRESSION=0"
+PACKAGECONFIG[decompression] = "ZSTD_LIB_DECOMPRESSION=1,ZSTD_LIB_DECOMPRESSION=0"
 PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
 PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
+PACKAGECONFIG[pzstd] = ""
 PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
 
+
 # See programs/README.md for how to use this
 ZSTD_LEGACY_SUPPORT ??= "4"
 
 do_compile () {
     oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
-    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
+    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false', d)}; then
+        oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT} -C contrib/pzstd
+    fi
 }
 
 do_install () {
     oe_runmake install 'DESTDIR=${D}'
-    oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
+    if ${@bb.utils.contains('PACKAGECONFIG', 'pzstd', 'true', 'false', d)}; then
+        oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
+    fi
 }
 
 PACKAGE_BEFORE_PN = "libzstd"
-- 
2.25.1


