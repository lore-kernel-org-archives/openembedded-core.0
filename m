Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.2346.1619642295713294247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 13:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RtPoTFt/;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso9760166pjs.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 13:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1eYbW6WeZzA7XkW8gCf71RkOYO768rVDPgALNEEEpgg=;
        b=RtPoTFt/qJXbe7KewlJ9s/bXM4TzRFXb8zGcqtugPZ508tiOkiK2UKKbkDkuFLWUNN
         SCPeZ9tU+aL1PiT3rG4LAZH3U6jXZWnHGJ9xlLLuvvEy01WB+FrNmC/FN7Ja5WlzvoaM
         VepN7GaFmLKnD2uIdp3hb3eC2QDQXLqLV5X0cyg8osdwQnI19pDmlmwDXM8XCC5lFP5P
         vyDNoPDvUqBJQKz3+xNrv/6vHgJm8Tpns6PzQMIBs4KJRJgNB1YC/ShXe+/oG9p/xH/S
         pIrpJfWwngLahtIUfFZcoqEnqUCF9ms5ZYDaMRNFdP52LeF6TMezlHUmpbZkqP2zA5zX
         xGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1eYbW6WeZzA7XkW8gCf71RkOYO768rVDPgALNEEEpgg=;
        b=js3JjVJv23GtapTS6gEvmTUq0DWrz2t7MdHqvfIC+MDpfokFGNiMzRXtw4fVmC8qzM
         uZ4PdiCVypUc7SiadR6kKBSuTc0exT5em2Q7ZKejwSsCh1h9nZcjWzXuQj+mCqYpzham
         7z8/I7AWuOZLjtJ3Icsk0reypMaJJrfAt79rvvV85XJu9dD0XgoQZw8vaB5IFvJ33Ukq
         M30ZNV+/6vgSqGeFKOv2lrsm8WZppsFlxt4KK9lpjWSaRNkvqaniCCAYVzxG31gjmXaq
         z2SAikUS2KyJIIt5hbD3SpSArRdmRVkaDoe2cawhi2lSclaJrPJjzSxIC0CBtm0Ehz4O
         cP2Q==
X-Gm-Message-State: AOAM532xS910nJ9JVqGt2ZoFZ74OmJeNlBH7E8BnaeKEYOVR2g9R3ZYd
	X6fP+zuW3xsWuppTka/4B6fuGfr0OAjZOw==
X-Google-Smtp-Source: ABdhPJzJag6GzgUR0RBif/Fx2pjGuvumB3qGEtSmrcEcxcFVh+0fFWBTruAp4hU9/lSCZ1pj7djiww==
X-Received: by 2002:a17:90b:3887:: with SMTP id mu7mr5696840pjb.65.1619642294913;
        Wed, 28 Apr 2021 13:38:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id f5sm495685pfd.62.2021.04.28.13.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:38:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] reproducible_build.bbclass: Enable -Wdate-time
Date: Wed, 28 Apr 2021 13:38:13 -0700
Message-Id: <20210428203813.1903442-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will help identifying packages using __TIME__, __DATE__ and
__TIMESTAMP__ macros in code, its a warning from the compiler and the
packages which use -Werror will break the build with this and where they
don't we will atleast have a warning in the build logs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index f2d9324440..ea643f2860 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -41,6 +41,9 @@ SDE_DIR = "${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
 SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 
+# Enable compiler warning when the __TIME__, __DATE__ and __TIMESTAMP__ macros are used.
+TARGET_CC_ARCH_append_class-target = " -Wdate-time"
+
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
 export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 
-- 
2.31.1

