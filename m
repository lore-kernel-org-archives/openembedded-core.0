Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.1033.1589221697102829433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 11:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cF+2ce/D;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id b8so4922203pgi.11
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tqld6TucIPM50sKNJJPfZPZKlSJkmCUNY13zfLzwsz4=;
        b=cF+2ce/DjPoBvw93AideY+fm3J7D9vaR1Y4YnPap+PfnIthSovKn9lyOMXXWbc4Ln8
         pxSGfPFd54IiDv0mucRqVf/kd+jQroERkAAqRvC7rdA3+xOeaARK+mzVMkD5Q0AIKNwC
         HYLDOnMOm2EB/sdaG4jJXqL4VOeChzzwPm5RW1SIpf40dm4zzVTYkchF1TkfSkwMLVWQ
         TE0VgZIkSUnsLs+J7Vl8KJPx+962jcOHDJSXUns5M+t8WSAjRyZVWzKg7Yt0evhSukCK
         CbQN/AAb19yNd6CPGoJYf8CO/QXYViCoZ9W4Dy1UADvb6BBQheueorGmiiw5WO4aHT1A
         AfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tqld6TucIPM50sKNJJPfZPZKlSJkmCUNY13zfLzwsz4=;
        b=TVJY/KcagA7uiYepoG2Hm+U5LZjtdUjFPUlyojeG3T/9PDwbLVw5InBIqFn1Laz+0u
         2PGCyxwZnJM5HD9teZoHgk1/AT6x3sij4v+iNl8fsKneLfRh5CFmTtUys0wJHH6B7N1h
         bIUbA4R7ogQC0aXvxoB5E0rZD60LManx57WOpUicrpiF3K4jVtSJiSL+o05UTBQnhy3a
         uam4XKyYOOcD2qliqVlWwJpq/suvchlnG8mpVuuqa0XPljGJsiAeozt9hH7I6wvajdbe
         ub9xRxqzv03fJZ2hs4IuNuQ/QzM9DwOoQTsNFALNCBn5D553zJbMbjzec0SdqNnADJjT
         7ZuQ==
X-Gm-Message-State: AGi0PuYG5SIjyTryKGJkrqUONdYmDML8ADBbuQy8dWOoNZQbHF4f4mGi
	OUZHbi7Pbwyy6jWFeI24DRozF2Ohjq8=
X-Google-Smtp-Source: APiQypKNKKXfpV0X56DD7DttKjBQc7L7o9Oip55MWZ8935vCMuaJgB1MWIvtA384IIfz1fK+MfmJJw==
X-Received: by 2002:a62:7b03:: with SMTP id w3mr17003108pfc.313.1589221695994;
        Mon, 11 May 2020 11:28:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id f30sm11044062pje.29.2020.05.11.11.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:28:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V3 2/3] gcc10: Default back to -fcommon
Date: Mon, 11 May 2020 11:28:11 -0700
Message-Id: <20200511182812.441561-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511182812.441561-1-raj.khem@gmail.com>
References: <20200511182812.441561-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For time being change back to -fcommon as default, helps us iron
out other issues, eventually this should be removed as we fix the
packages to work with -fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase only, no change
v3: Rebase only, no change

 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index a64c4caf00..6cb40fcb74 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -34,6 +34,7 @@ EXTRA_OECONF = "\
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
     --disable-install-libiberty \
+    --with-specs=%{!fno-common:%{!fcommon:-fcommon}} \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
-- 
2.26.2

