Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A34DC4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.10901.1652193613416050972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JrCPUgJE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id q4so14036634plr.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ymr6yRt7esAjjR+a7vfK5jMEh/BnA2+5RHiQG1xhNMM=;
        b=JrCPUgJEHdDeRF2FYBwZnBJjLMMA5yXcRliUKgPRauqa/8pJebofb1+bRhi+f6fqUF
         nIcLqhYKx/LcLrPxKNNJkagDa+vABiAmj4gZHXor7RrwJDNAoUdLJBus/cR/UkMGY2Jm
         SYjAvNaf8K0lrQS8uxzsrnHldsQukVYpJm2DlS7K7hx2F+uqZe8jO0p+XKm/tWYXd4ak
         r2Bu8GUdKthl2biMNzSOgh83PTcR8pbiU8zS0o0NK1HcXl9EIrtIDHotKSHl5inrIXHI
         6i2cXNg733HcBlng2LAXUF8NO0/0wi/ceWMkJWRUPALThSghVToafXBmDk5vMnVdISEg
         GuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymr6yRt7esAjjR+a7vfK5jMEh/BnA2+5RHiQG1xhNMM=;
        b=j4HKzZ/h8YBVqaOWlKtnyOAJ/UQdxAZ7YBlCWuVNoKZSTAM/IRTtR162q96sCTKyxj
         8AaCeDbivfkOy1/qYs0hsR2u3ZbYDHmrp+Tpq/C1l4Ue25lA+tHNDLdbMyNgUZE0YEz8
         eJ0kSIk/fVh5LDX02VfTzRtLqXL39X6JfoQgzdWbAoPFocIJHPM8DgUUr/dw6SqmpqDh
         izcXh2ZhSKNGXICpGcpruerJ6EjGI1UEELeiDugNTfP7T3th+3EH+gsHuYWlL+8gvjxp
         TMGAaf2nT84DUKRRo2hXP/+K+TrOCcIXoqXEycj54z2CuibM7vqIv+j6d9WxnlvV12V+
         53dQ==
X-Gm-Message-State: AOAM5330Mjf3tAQiIRAOTdSdKn12n0+skkUKndVH2N3xLDwWVoOHrxL6
	NNgaTwTxSAWRxQ1j05CIxm92PeU6QZhoOs1C
X-Google-Smtp-Source: 
 ABdhPJyXAaj2Sgjvt7KOidcZ4M7CmXWAZljScUWqeeK2fPDbeHERolV0h4+zWKeHm2/WE8me8mpnkw==
X-Received: by 2002:a17:90b:1809:b0:1dc:153e:5f66 with SMTP id
 lw9-20020a17090b180900b001dc153e5f66mr319519pjb.7.1652193612260;
        Tue, 10 May 2022 07:40:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.40.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:40:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 38/40] Revert "bitbake.conf: mark all directories
 as safe for git to read"
Date: Tue, 10 May 2022 04:37:17 -1000
Message-Id: 
 <73087e3c4bf6792c37f0a9d8d006c09856d36b13.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165455

From: Ross Burton <ross.burton@arm.com>

Turns out this doesn't actually work, as git doesn't respect the environment
when reading the safe.directory configuration variable.

This reverts commit d4a5862ce8db97d26a3c32c4cffea3197c1defec.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e28dd48ffb84c8bb4356d889b70a4b876c8bbaf3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1deba8d910..0e939aca4f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -776,18 +776,10 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
-# Git configuration
-
 # Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
 # repository when building a recipe
 export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
 
-# Treat all directories are safe, as during fakeroot tasks git will run as
-# root so recent git releases (eg 2.30.3) will refuse to work on repositories. See
-# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9 for
-# further details.
-export GIT_CONFIG_PARAMETERS="'safe.directory=*'"
-
 ###
 ### Config file processing
 ###
-- 
2.25.1


