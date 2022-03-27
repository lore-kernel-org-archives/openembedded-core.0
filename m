Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F63C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.776.1648399284855949966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lhJQihis;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id bc27so10440592pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XA9eCQP+256jCBI+irMcT6YUc11Z6ow7Aiv9kH5lN3Q=;
        b=lhJQihis/VTxbcxqm1xI9D02h409bwqetvtWWiDbNR8TYf6igxrH0Jm+XSTzHM5TdT
         P47sJbPjTAJx6TLeg2DOxmGSdOCTRNg536FP63xYfPKvReU2knfzvMy3XCVwRmNXjNQN
         tpeu3Wt36i8ZPoUVBly2KCRz9e1bzWJWaxhvCmWUZ1BY7BAyXYmTYTLdHonw9Bk0wrff
         0QMIxxIf1srwiwgTsIgn73nNWWOimVpLNe235c1fxrsthAT8P4sTD6bFY7AQFyfAiQYE
         9vRAhZ1YWei+mPjS6HcNIxtQyweX5r1NScq2gM3KIiB8Xdof0ncUvTFF9bsGHL99CrSw
         H7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XA9eCQP+256jCBI+irMcT6YUc11Z6ow7Aiv9kH5lN3Q=;
        b=7cY5gC2+EAugmpiOXJlnnYg+qnkf3O8KRFCx747WMigopKvLvYV8jYnY473iAeMUi3
         rx4zQg2fG5dCO4PAuCb4FBhNbHlK6p5nfX+T/jv+gNbdFUrc7BGkFkIRlR6t2FFnyXA+
         pGU8UP7pGC45MGtzwFR3Ng4BQoyb8HCYQ60illpBrm2OSG7mQsxhndY2iTG/D1y/CSRa
         +MK2B7sls1p0T0R0j0qbFTLNEu5NSdxix+PNmwD7H8qBXOG4w0ROCzL9VXBfSn4p7wxQ
         G6Jms7t+Ioz0M+YfPftiDfc5XXErrCulrG8HvNy+IpFskto0WOZzpwm25uLMfr2kDcYI
         AdZA==
X-Gm-Message-State: AOAM532ngwxpY7Z2QXeKmmpcsZ1IcRuW6o+1ZFIUKCsWJMxuBaKx62un
	cT0ZiMxzyORL2QBN2Xyc6UsDx8OvKUJatTxks9Y=
X-Google-Smtp-Source: 
 ABdhPJwCqe5Ah6BlMU9CbLdMHTOU7VJ+JHz376pdvkUSYpUKDKmodURbjdpi91VJUBK9MyqFy1wukA==
X-Received: by 2002:a05:6a00:1acb:b0:4fb:358f:fe87 with SMTP id
 f11-20020a056a001acb00b004fb358ffe87mr6435766pfv.75.1648399283836;
        Sun, 27 Mar 2022 09:41:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/10] ghostscript: fix CVE-2020-15900 and
 CVE-2021-45949 for -native
Date: Sun, 27 Mar 2022 06:40:55 -1000
Message-Id: 
 <da9b7b8973913c80c989aee1f5b34c98362725a8.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163671

CVE patches (and the stack limits check patch) should have been
added to SRC_URI_BASE so that they are applied for both target
and -native packages.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.52.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index ac3d0dca43..310c4f6d24 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -33,14 +33,14 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://CVE-2020-15900.patch \
+                file://check-stack-limits-after-function-evalution.patch \
+                file://CVE-2021-45949.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.21-prevent_recompiling.patch \
            file://cups-no-gcrypt.patch \
-           file://CVE-2020-15900.patch \
-           file://check-stack-limits-after-function-evalution.patch \
-           file://CVE-2021-45949.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.25.1


