Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F0BC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.308.1652841068897348562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=B9bbfIbV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id k16so842522pff.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hwoyfI3DAbt9x7uBL0BG6fXRWVRo7oOG7PQkdEgsYHk=;
        b=B9bbfIbVUVjUvCrBNQa20TSThgJsTCfh8njvLrTSWM3nQTQ1GtQ3rrC+fLvhBiX27R
         OMqEWgGcIuxF++OCgjnPLFLueDjw5wjsqzjiuPHb5eg4jNhJVDtmGeb2dC3ldEwG/5oK
         7p3uNnJmcVuEAd9Xs4U/04euOckk6v6DsVj6h+XcrCB8hYMktTW1bmjGciOW+UzoopSi
         z5z3azFfDDyXpbz+rVPrv9jdYkhD8ybWpU4lQuL1i+T6bzXM8u9e3dnPOTc6meh9IyMP
         2gJHkhIEeMBvHQEXcQXYh88EPE3b9tHRfL+Y+LC8b2ybhT650accwaKplrYjDuazg/Dk
         /hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hwoyfI3DAbt9x7uBL0BG6fXRWVRo7oOG7PQkdEgsYHk=;
        b=S6r2dSk7er6MXdvz2D8NWczcUQFj9zQqljViC2rbpNkQMfO8Y+5xI6iyHX8ZGEJrh/
         hdX71f7dqW0GpCldQgdeczoS3AL6zI3Pti2YRO6tzHx2G0G6dSP8x/4uoGroyTOb8qq+
         n1lc8DGphRtbnEvY+9U5A043fcdwxC/XagFM2b/pyaslhJZ+BoTHQwcu/D2dVJj+WQ8u
         ZGLfNmZRNwipjvS8mptLqVUxrukGIYawELS+YTOhJrTBZEmI2dsL+/vRBAh/nntPt9WA
         hpzk59n62p8iyazWIknOFnDxgZm4PA7pekcptmhCSoUao3a71lURUbytKrxKwDTrkgEy
         VVFA==
X-Gm-Message-State: AOAM531dihUq4mWuxJM4xzl97zoIYp/RPVheN+mXZbh2ddg5UBaBdJmn
	QMwrhzPM8YVEy1m9Uh6ZxZ8svoJxigA+nNjb
X-Google-Smtp-Source: 
 ABdhPJwzppr10nWsmsnwKVrtA71G1K5/z0yCviP6Loc0H8ir1LE7B1FJ52FWdict0bbBNrxE/BMuAw==
X-Received: by 2002:aa7:8dd8:0:b0:518:11:18db with SMTP id
 j24-20020aa78dd8000000b00518001118dbmr5112001pfr.29.1652841067721;
        Tue, 17 May 2022 19:31:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.31.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:31:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] openssl: Minor security upgrade 1.1.1n to
 1.1.1o
Date: Tue, 17 May 2022 16:30:34 -1000
Message-Id: 
 <de0cafc01804a8d43b4b97e22fdc9a6b0adb8a48.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165788

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

This security upgrade fixes CVE-2022-1292 as per below link
Link: https://www.openssl.org/news/cl111.txt

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
index 8538bd5a18..c9cfc759c9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
+SRC_URI[sha256sum] = "9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


