Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web12.1401.1631642652995162820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 11:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1cEflBRE;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id w19so336592oik.10
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 11:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8JNbPyrS+vPUxoDt6nMFGvLnCBhtbNn65aooqrlo3w=;
        b=1cEflBREFDTcpDZC9cT+xUsyV83QtyaTa7oJ8UkSrBHHf0TPe1znd4JlP5GLIvkXAB
         rPWE1w2rFGGlTeq27ht6+IhymBHiaDhLGUvOrJ/bt8fzImMktR/MRiJnyvbud4mDFu83
         tjgbXwu0cMpvLFJAcnkixmh58JNkjjPyi4GmUSGEv4/CMAVxq4+QBE3IaD/dXrtilQ6N
         mT5b2OZFemW/dy6vq7Vb7u6GaG5LvAq18/FXzTUZjjuFEO6cUTiI6d2JRWoANP55otgs
         uQkHG4xgnYOeSuHTNykJqR35546yKY09vG71a0bmCCVk5jLhAP+5DxngJr0t331Q1UaV
         ++ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8JNbPyrS+vPUxoDt6nMFGvLnCBhtbNn65aooqrlo3w=;
        b=ZHANrbtVtjn923lRTVE0+cAEoH/pqo0eg76ZVBzCHds3yXcsqoF6Nh+kHO1cYo5e6A
         bJvqCzorX8sw5ecMzh1IdnnhmeT5ZUo/ML8/psvDTrB5vnjCtigI0lUJnLhsCFw7Ydaf
         QSNVEaH9txN51T+kauIfG97N4iG0+jhSBDwNxem1W/NZArtaDFD6c5pHVVbiDI111QBf
         q3gAGqrHxS3q3EUbbrVneqMch7rIMkSPjHcCBu5Fbfu2Wtijs1GnOqDF6sOjjkGHz1km
         +r5OiVbPAtjpk8ASvGEF6gEHnAsslAVqKyJCsUR4Ys22nHxPAawY+B4KKtrpXSfFmooc
         Ry8g==
X-Gm-Message-State: AOAM532OXj8V+dRsCxFkvlNWDJ5LWtZwFzzJjJj/t7znZS7fsHBE5I2e
	dbxksXObg/8/EAcpB61xD2QMl615McDx+bZ4
X-Google-Smtp-Source: ABdhPJwFCEDKvAr6avnVo+ONbyz4M9qq7bd/H4o+nr4XL2KkGSjvQwnOulurhSYYrvD95I7EM7tqjQ==
X-Received: by 2002:aca:3049:: with SMTP id w70mr2447133oiw.114.1631642651338;
        Tue, 14 Sep 2021 11:04:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id y24sm2884911oto.40.2021.09.14.11.04.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 11:04:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [master] [dunfell] [hardknott] Revert "db: update CVE_PRODUCT"
Date: Tue, 14 Sep 2021 08:03:45 -1000
Message-Id: <20210914180345.163507-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE database correctly reports CVEs for oracle_berkley_db and
berkley_db.  We use the oracle_berkley_db source tree and therefore
should only check for oracle_berkely_db CVEs. Otherwise the scanner
falsely reports CVEs that are fixed in oracle_berkley_db

This reverts commit ad799b109716ccd2f44dcf7a6a4cfcbd622ea661.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index d5b788a3d7..5e9305ab06 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
 LICENSE = "Sleepycat"
 RCONFLICTS:${PN} = "db3"
 
-CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
+CVE_PRODUCT = "oracle_berkeley_db"
 CVE_VERSION = "11.2.${PV}"
 
 PR = "r1"
-- 
2.25.1

