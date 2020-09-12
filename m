Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.27525.1599950413795384001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 15:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=16+3pdT7;
 spf=pass (domain: emacinc.com, ip: 209.85.166.66, mailfrom: mgloff@emacinc.com)
Received: by mail-io1-f66.google.com with SMTP id d190so14875141iof.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LdSJGQmpon1OsBYagldJJNHtJXsB0SRtmDPMTp7Em/k=;
        b=16+3pdT7oHyT8hbTNxtk3PIhGK++elER1e4B5dnFKQ5I5VcrqOXqBx72kozWwdYkVB
         xfPntLK1BvYsk2Ilr6Om5iQnBGbOsYRDt8Xo5M+oUHKsMxUk/tZtSctOvXbzy9w3r2Er
         PQT8frFM1jYzCzDzkElipphZc8uDMb4qur84OYA1lNQ1+xefoEkrxUyx+tF2BsE0Vy+h
         amHCUo20YwS9zQZZiXaPfO8X52YuRgTbMLaEDSK/cRn2fMBbzPcEpRNTDR/0XI0lRS4d
         oBtb1aQ+Ldd459yH4AJudY59MGCIclA6neIDMyhIX7O32QxNrD8JxPLB8cmpLUE4xUEK
         1fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LdSJGQmpon1OsBYagldJJNHtJXsB0SRtmDPMTp7Em/k=;
        b=O3lOEzTiU4V8Aux3Y1V6E6PZttQ/0Scci8eDWkBj4koobA2GzXZ1rK/IL0VFcKBvaF
         y9IXNhogkpX756E7Wx0KnkaSLHIF4n8hEM8S3kIIQxAXKRtBH6x2hlB+aSrlKWTSSlAt
         UcQazi235eRuITliwRgohv26D8v23x5+WxZmmlPis+Vp0OvM9UodiJe2PWkve42z3HA3
         HPVhAmjV3vgz2AP/w0voMJZBdTiZxy2x4Yaz7/Q9PDuH8xn75ZXYGUAewt8u0+XqnEq7
         Sk4xqctjoiYEtLdVGE+xqCP9nwPBowKhm1xd+Er4WXMy1Cq5MUAbQoqZy7JUwDcwqtEK
         G92g==
X-Gm-Message-State: AOAM530qOI1VA0/b1EN6xVY9ZW5o6P5bygpD73hiS0wYRPHgpPgnUPcZ
	kamSKpsUwLBuKIGOXDeqBHiSeaESjyh59RFt
X-Google-Smtp-Source: ABdhPJyLUwGlHSEicHtMAQzq4GttmGty04enUZExz2IULsUZQx2QORf3WVDU6Cd8AlUhnHBVoB69JA==
X-Received: by 2002:a5d:840a:: with SMTP id i10mr6342451ion.4.1599950412928;
        Sat, 12 Sep 2020 15:40:12 -0700 (PDT)
Return-Path: <mgloff@emacinc.com>
Received: from Shuttle.mediacom.info ([2604:2d80:9f80:9700:dbc1:b947:539f:e0])
        by smtp.gmail.com with ESMTPSA id a23sm3296595ioc.54.2020.09.12.15.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 15:40:12 -0700 (PDT)
From: "Michael Gloff" <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Gloff <mgloff@emacinc.com>
Subject: [OE-core][dunfell][PATCH V2] sysvinit: Remove ${B} assignment
Date: Sat, 12 Sep 2020 17:39:58 -0500
Message-Id: <20200912223958.985123-1-mgloff@emacinc.com>
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
 meta/recipes-core/sysvinit/sysvinit_2.96.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.96.bb b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
index d2b85ed9c0..7358f02385 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.96.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
@@ -25,7 +25,6 @@ SRC_URI[md5sum] = "48cebffebf2a96ab09bec14bf9976016"
 SRC_URI[sha256sum] = "2a2e26b72aa235a23ab1c8471005f890309ce1196c83fbc9413c57b9ab62b587"
 
 S = "${WORKDIR}/sysvinit-${PV}"
-B = "${S}/src"
 
 inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
-- 
2.28.0

