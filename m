Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E44DC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.7190.1667530927001650130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wGagDgTK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id b21so3711744plc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl66SfF/cusOOkVDLRMtzjsJYtFh0mbZVVr2mJE2QZo=;
        b=wGagDgTKQ8p0bQ7yD5NsVCk6Gjq25DkQPedjFJV3s3YumPE0AXlb7YMhJ5vfp7MSHz
         0ArM5fHv4VztbZ2On3An9GfFvPVSPG1HrFXB8Q4+j7S9L+KKphVD8xq848HUJoYF8v8x
         O5ZBEUrQ0ftYUjhjRb0xrYlO8I/+Cb3X/QmVz5w5Y2/Z8Dmqdo5W6J5dnEIDQGCrved1
         kXXZWjVLoKEoWoYivJ5pdJjtx7Ep773weXsC8IYhMl6HYglWEx2LRq2D9xdfpt0Vy6x/
         O/unW9rDKxApi7JK/j2FGBzMsOxAAt1C5dSd6L65jfZk58Q3OH8Apnpb2SkYOa5uyZ9i
         4BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yl66SfF/cusOOkVDLRMtzjsJYtFh0mbZVVr2mJE2QZo=;
        b=01q4UmkRqGWi1JgwAx+EAmpnOKaXfOVBfqeUvXjrBtOp0gMRKmZatQmszFw9l6UZ+M
         +7++BQJ9c40L3X+7eORGBdkIhaivHVCjJHNE3XYC2nrgbSa/gMjIf3hJMjqpEZrXDVk0
         4tLO7f+ocfbYLLwBVKu08f7u49jKqj3MsxoNki/boBLfCM5diJiVX7cT3sgHQ1cHvvB4
         dITmg0pQS1GeBts4wAXyp9pJ2WvwM+N7tVx0tARvJS2ECcPPAZLqT4b3T5NBtuSVCVZB
         ThPV0kTqMwZwSVtTODqEfuGaPJakIg0cbYiDZgfsWbe5Tq57qXlYSxQVGsSCrGJ+0rKY
         yVkQ==
X-Gm-Message-State: ACrzQf3ZF0NnggxIgG36a+uW7vTKcf3BzR86jZaKLAYCB3pMHkf2dxlW
	ANCXkIK3CtBCOcYDPOUzoOCB9iNnYidICSJJ
X-Google-Smtp-Source: AMsMyM4j278p6Sdo4ErZiPJLdd+nCqLLsSWCoX/tqDJAxS6+R0CKnrg3AAiVNmrNMOuF1I6MKY/LNQ==
X-Received: by 2002:a17:90b:384e:b0:213:7c41:1018 with SMTP id nl14-20020a17090b384e00b002137c411018mr35121716pjb.63.1667530926041;
        Thu, 03 Nov 2022 20:02:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/31] buildtools-tarball: export certificates to python and curl
Date: Thu,  3 Nov 2022 17:00:59 -1000
Message-Id: <8785d335b1964909c139f1085d34bb19ed7666f7.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172685

From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>

The custom path of the ca-certificates.crt within the buildtools-tarball requires more
environment variables to be exported. Namely REQUESTS_CA_BUNDLE for the python requests library
and CURL_CA_BUNDLE for curl.

Signed-off-by: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 5c249db9de8ad8cfe0996ff4fee4c575a5ff1e34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 6b59e4934d..de399173ba 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -72,6 +72,8 @@ create_sdk_files:append () {
 	if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt" ]; then
 		echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 		echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+		echo 'export REQUESTS_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+		echo 'export CURL_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	fi
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
-- 
2.25.1


