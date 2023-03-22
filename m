Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F9CC761AF
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.44316.1679494929022518742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LU4TkZw4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so23763170pjt.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKbgRaQ2zbQBqGsmDt8pD1R5I216IR6A8av4jwZICJs=;
        b=LU4TkZw4/e0ZPxPbTUPILkcQtxfTZvsnm8OZ4vK+bWe4UOBfoBzz/j0NRy4xOO3kUu
         nBBzr4totwJMzVP99cv1Hs0gc7hojGpGjOT2VHAP6rLAxnA1pyUHfWsffXWkO/bwKw7z
         iiJVvZC5yYoG/ZqVDHDhn2fN9Ej4Q7rL0YdwJzhoDJaihrKTo6LVKC3bqQ+/TtboJ8oJ
         Iw+3IRFY6hmsTaZEPOYfbRfwEpON0SXmRKovWOXYldxxpFuWm6ePHrvwlz37bgWK6Fyq
         e8z6igfI8u4McC5zoovc1tnKZEwcZzakQ0kb6FC25NvpgBlY0DgMqELQEe4P0UQpvJ2J
         kR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKbgRaQ2zbQBqGsmDt8pD1R5I216IR6A8av4jwZICJs=;
        b=K6dH9RzvtOl5Dv0MS5Oll7nrakzfllEY7wlXHk5IQhmp2AYNsFdfCuwJ34myrrAq2C
         E3Ny0YJ3i3OhVA9nGP5EDTR7vuaoRaEst371ai2TIPQ1t71DeJSEhsL27DtvsZ/U66rh
         Wwo+omN6DaMnQobKnwGjogCI/g3Z7jJj3wdiQ7wJyC0QMQPFwmMfKe7BQsfnHnonAzzz
         kyReYIJL7h1AAXVQrbotsuEpz46USN242pKMI0nqf/K9ZWVQbqQTvcgxaQiY2GxLUBaX
         Momf06ls52JBjidPOrYoZ59UvWqyK0s/7s2WbtYGjB/2V8eA6U1NWN0waHn9eFHjEp0H
         +sVg==
X-Gm-Message-State: AO0yUKXWPRx1Vcl7Ou74DQpjAok0ZUrktwuX+KJofs3ApsDF2HE3uPZY
	UzeZd3vq2L39qXgz4gHZ0T4pr5cq3+iiHR5P+bY=
X-Google-Smtp-Source: AK7set/UrCNOZDoC4KBHJ4cGWm1SSx8iU3D6MbuB6f4UvCPxsQz5BdsozoMfdthULziAoHpRzacRBA==
X-Received: by 2002:a05:6a20:bf1e:b0:db:52da:367a with SMTP id gc30-20020a056a20bf1e00b000db52da367amr2025135pzb.33.1679494928158;
        Wed, 22 Mar 2023 07:22:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/21] timezone: use 'tz' subdir instead of ${WORKDIR} directly
Date: Wed, 22 Mar 2023 04:21:30 -1000
Message-Id: <28b0d58d95242d7c67e18f984f84806aef4bbf85.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178936

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


