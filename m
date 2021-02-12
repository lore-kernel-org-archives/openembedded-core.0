Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.6511.1613148722388922712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 08:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bwKFQINw;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id e17so2225510oow.4
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 08:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DT7zyhC2ESfkG/i5AlJgietkC1zPwocCYZ3nU84hZtQ=;
        b=bwKFQINwAbdndT2QdITZv7htn3piaQQfaSfyrZkzJFcbiIWjAoyAWeuZ50qCfJRpy1
         hNdTIsNCtThwF7IsZYn/G9KAURsABBpXkYFXcdLf1aSCbk2mltPkSrcOQ1G+SUCEVnOS
         GSk/Z9YONDApXrAnn2DwQUKO+JJVL+O4U3JySeDI02vyryjwN81+1tEThE6m5nKwLjQ6
         a9YQDh6Y9WgpR1HSw7KIzW6iVhykPMKJ8dgcrnXJ0F8+EcMNDf1a6uC3pV6KtppLzC9u
         6utV9Yg0c3oCbmkwZpQQJ1BKV4KDDmhdsXiUw9pC9F+nKMzRhnzvFNL1HK3liWfciZqw
         7KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DT7zyhC2ESfkG/i5AlJgietkC1zPwocCYZ3nU84hZtQ=;
        b=q89SrQI1xOjtDHwx3VKZndVNSQTykKEApKjKFbzRHu63W5OyzvfUKPd2uJXEp2powh
         kDQiaw13yQNm30+cd7pvnFDcZYPAiA72ISmoZzUJVRiNDBogZyGuB+Rhtxox/T5Ju/ri
         wXO2gixn3QeUeOEnLpoH48NWALr1wEnjk54+rKg55kMHUER4BEjCexDIdVtKwIB27IfA
         tbv3SNsuCWIk2nOVOlB2kwdUr1adisBXxKdQ66Itd/3AnmzxPC/FT4GQfEEsPck5QGK+
         GtcV6zpOn2U6RLvbnS0KM9j/eQ+IvBLSs0eCnPc3kP2/EPGYj5RCb+DTAcf5HAcPSgXw
         FyAg==
X-Gm-Message-State: AOAM533Z076PCdY9xUfhlCvFGQ8044IRe7ZGK64dtcKz2V/6cF72I4vd
	0L5k8eyq8kywKCzD+2F4taitewt669U=
X-Google-Smtp-Source: ABdhPJwHLtqsjuQU7F52a3yDDRdxKH37XhQZSj3Wq7mjAjGyCkwHQJhm9zUSHA5HO2EdQSYezIcKew==
X-Received: by 2002:a4a:96b3:: with SMTP id s48mr2497326ooi.11.1613148721439;
        Fri, 12 Feb 2021 08:52:01 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id k21sm1718262otl.27.2021.02.12.08.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 08:52:00 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] libomxil: Fix up commercial license flag
Date: Fri, 12 Feb 2021 10:51:57 -0600
Message-Id: <20210212165157.21896-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commercial license flag on libomxil is set because it may include
the Adaptive Multi-Rate audio codec (AMR) using FFmepg, which is patent
encumbered.

It turns out this component is disabled by default in the recipe; add a
PACKAGECONFIG to enable it and trigger the "commercial" LICENSE_FLAGS on
it. This make the default build configuration clean unless a user
specifically asks for AMR support, and prevents them from marking the
recipe with the "commerical" flag unnecessarily which could hide
potential problems later on.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 2061c280e4..82cdaf54c7 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Bellagio is an opensource implementation of the Khronos OpenMAX \
 HOMEPAGE = "http://omxil.sourceforge.net/"
 
 LICENSE = "LGPLv2.1+"
-LICENSE_FLAGS = "commercial"
+LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'amr', 'commercial', '', d)}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
 
@@ -28,6 +28,10 @@ PROVIDES += "virtual/libomxil"
 
 CFLAGS += "-fcommon"
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[amr] = "--enable-amr,,"
+
 #
 # The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
 # Make sure they get packaged in the main package.
-- 
2.30.0

