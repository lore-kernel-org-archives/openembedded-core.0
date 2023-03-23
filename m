Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E1DC7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:12 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.85699.1679605504716075067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vgHPb3Bb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so3350302pjl.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKbgRaQ2zbQBqGsmDt8pD1R5I216IR6A8av4jwZICJs=;
        b=vgHPb3BbEBxpLSNxRABHKja0iwbFEhtFL9YEkeX924FuraFgrcv+dDZTLXjRqHtkXN
         grWMc3VzitrW+hZV15eV8OQBa/quLYFxMPIpOTSCTvWVqrfn6iIJuNVk6NKfXhP/nB0Y
         nCqQAlau8837ZR8UD/d4SuN2MoxBBns9Eco7I/RABQEojKdPuZPjC03+EFdzhUO2xbtQ
         BTRnrKEt9eVXYCW0sz2kZXCfRsJmaujNbEIfvS1JixqAOaKFQRb2L+Rg9orb0a8jazsV
         GWYwwcgxLw6NpkiN2YPKVYQxIgteKPt3JD5rdeoieO8rjvJJJ9ZVJaYKzEA4Sz6wLWD6
         la5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKbgRaQ2zbQBqGsmDt8pD1R5I216IR6A8av4jwZICJs=;
        b=L0qhGOmbwFjjPYc6AggA/jW6QBd0gV6kiKOVECAByjck8G46CESAKz5i/j4JqFlA0b
         uYpUG+R2xXZs5wpEyX5FdbvlPrOfG4XfnrE5R9Twxdip4hREdS5eq5vgf5eE+EHFKXVt
         Vz733SogGCq/+ghu+hbzUjOuAWhyb/jV+pRVvXyXwAbzpvOV4uaczq2MaIbsRcV6a0e4
         QtbgDjDcMay/oXF0iFkRW1yblZkWi9BWtJqDc8DvFypw20MkcYNgqdaZtlCO/0bNb/0L
         wAqLIOCVeMPYrVag6RaW3V6dQPYcaADsly5zsGogkLlXYqe2wyTF4M9aw1E9/7OgH/Ka
         erfA==
X-Gm-Message-State: AAQBX9eEFEHCnFugR1tIugAns/S2kkW4Lw9wKqay4g0tMMGkakKnUwDs
	x8N9D5CIEENVJeYpCh0IqfXrNFYCDg698yGHhAo=
X-Google-Smtp-Source: AKy350aoi6zvHPdBEmyClZeu/VbW82wWveqQZYb2trlZJJNcHI4pOoyhvo/sk4wEZVtuwY7gDMOOag==
X-Received: by 2002:a17:90b:3b44:b0:23d:39d5:f81e with SMTP id ot4-20020a17090b3b4400b0023d39d5f81emr431763pjb.11.1679605509613;
        Thu, 23 Mar 2023 14:05:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/14] timezone: use 'tz' subdir instead of ${WORKDIR} directly
Date: Thu, 23 Mar 2023 11:04:37 -1000
Message-Id: <8e047570ca28be2f3761d0944eaa17b64142262b.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179003

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc53ccaf82c57826acac5f9c2557e403ec367807)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc     | 6 ++++--
 meta/recipes-extended/timezone/tzcode-native.bb | 3 ---
 meta/recipes-extended/timezone/tzdata.bb        | 2 --
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1834665a1e..eec7177228 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -8,10 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2022g"
 
-SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
-           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
+SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
+           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
            "
 
+S = "${WORKDIR}/tz"
+
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
 SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
index e3582ba674..d0b23a9d80 100644
--- a/meta/recipes-extended/timezone/tzcode-native.bb
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -1,10 +1,7 @@
 require timezone.inc
 
-#
 SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
-S = "${WORKDIR}"
-
 inherit native
 
 EXTRA_OEMAKE += "cc='${CC}'"
diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 7f4322d867..ce725008c0 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -4,8 +4,6 @@ DEPENDS = "tzcode-native"
 
 inherit allarch
 
-S = "${WORKDIR}"
-
 DEFAULT_TIMEZONE ?= "Universal"
 INSTALL_TIMEZONE_FILE ?= "1"
 
-- 
2.34.1


