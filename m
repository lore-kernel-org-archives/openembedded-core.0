Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.27515.1599950366253216467
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 15:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=y0v4fBIE;
 spf=pass (domain: emacinc.com, ip: 209.85.166.67, mailfrom: mgloff@emacinc.com)
Received: by mail-io1-f67.google.com with SMTP id r9so14875906ioa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Y2+Bt0k5V1LJtqE10Q8RpFuXsc9VHm78sabe2DzM7c=;
        b=y0v4fBIExRlVEIbEhIBdvPeJxcTf2eSjo7qGwTry3q4HCX7EEGQUeYbH82aZE357Tz
         7LBwgm3fXtcLYyr4VzTyA9xDW8y/0GIywbB7EkcBmNYkufJKXANeapjE2xt8xTwJDEU8
         nKYwRkrKWL2su6VSxhZ6n5nnD/LA9kCoDfpwG+eMPEW7pit4pOShByihp7bOTNU4BCUg
         unTOeYSxnCreyTa2/xKIS4eO86rBf3kTyOY7/3y+uTg+Bra0LdrSaJ2sgt8Z2+jrJP0k
         yE8a2UX965o7S4HCfdWMdDL6kppoPljh3DPAZy9+AlmtvIzT9Gu9ZubqGqyGA+Y9ArPf
         5XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Y2+Bt0k5V1LJtqE10Q8RpFuXsc9VHm78sabe2DzM7c=;
        b=RtREO8Num8CbB0Hd/HlPK2GDcyK8FEEwiqavnUHJGdSqu7JVTie2LBdOB3jLXpjlHm
         0/aPMO7FdV5fAztLymVhEgPlyco/OAa7yyIfi4NbN9M5Da2jADCkpycMNosQhCiESRDN
         Amtz7Ym5zlD8mFO9iDut1Xk2S5VJ2cF1hv69mJtCeNbJt17qXMRWiIOjclAnsbu/atz5
         iyHU3zcxvStowCggb9N6aNqV+klNMJLcvx7y4oHYiFKOody7ZYJLpRApmZj8DUmwRKS+
         m/uTYSQICoxSePF1L8DSvxlwpaTrw6rXOUBMOECIVwkd5QJnonKzi/lYv/o6YilkWWej
         UQZw==
X-Gm-Message-State: AOAM530F3ZbJX16dJ4g+h26OH8+73D9irgj+vN9asMZb73eY1bvT2Jr8
	roZzGIFGxTtdi5b590i9YOEanX8cad7s4Z1m
X-Google-Smtp-Source: ABdhPJysqjLH6aV688NL9QkXlxgzCQAqgFYobUtkkE/RwMgxP34eHPHu9et9m11Mj//7OAvXJ2X0rQ==
X-Received: by 2002:a02:665d:: with SMTP id l29mr7431371jaf.97.1599950365231;
        Sat, 12 Sep 2020 15:39:25 -0700 (PDT)
Return-Path: <mgloff@emacinc.com>
Received: from Shuttle.mediacom.info ([2604:2d80:9f80:9700:dbc1:b947:539f:e0])
        by smtp.gmail.com with ESMTPSA id q191sm3357131iod.30.2020.09.12.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 15:39:24 -0700 (PDT)
From: "Michael Gloff" <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Gloff <mgloff@emacinc.com>
Subject: [OE-core][PATCH V2] sysvinit: Remove ${B} assignment
Date: Sat, 12 Sep 2020 17:39:17 -0500
Message-Id: <20200912223917.985044-1-mgloff@emacinc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VERSION variable is not set unless the
top level Makefile is used as the version is
derived from the Changelog.
If VERSION is not set, none of the binaries built
in the sysvinit recipe will have a valid version
output.
Before:
INIT: version  booting
After:
INIT: version 2.96 booting

Using the top level Makefile does not cause any
additional builds to occur.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.97.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
index 80ab9d70e7..98916f7f19 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
@@ -24,7 +24,6 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
 SRC_URI[sha256sum] = "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
 
 S = "${WORKDIR}/sysvinit-${PV}"
-B = "${S}/src"
 
 inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
-- 
2.28.0

