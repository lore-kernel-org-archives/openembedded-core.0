Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C621C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 12:34:51 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.62567.1672749290638689976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 04:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oUh83M4j;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id n4so32479694plp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 04:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBaMY0D4l08wUbD5ToWm9+nIS07t0QaKUSJc9erXJ2U=;
        b=oUh83M4jvEGmGD8hhK7WF6FhQRdQ+UZ2a2nsz7QdA1GfXC3NZCQoryUneY5lfRNFZV
         YOZ/CYajhGq4OJjp4XSlAutfp9vveT7/s+sso3+IDFV3QyJZQLsfg13AChbsb31EzrRc
         0cn8/e26iKNtQsUeiOToFe/DhiaqtuYqx2hLEokBzYPXO9OMih3LLDOmdkzC+gkcn22p
         WjVshVYjhLWK3RuIs0qh2KOjViN5lmDl07Dhjqm/iidp7x5jGAiwxH+wvxmSIxS1TLRA
         EuBn/lAvt+9TxI8dDg8oyej5WEjxo5z0/baCUuDelX3L/KlgMJwB5w0CreynWHk79udb
         mFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBaMY0D4l08wUbD5ToWm9+nIS07t0QaKUSJc9erXJ2U=;
        b=i20e8I8PFhZ/2dZ3+y+LjeS0OjOcHTLqGUDwE28B0hi75BfZGdU5OGtx8q1SDerfER
         vMNa0ULanv3movJQReVcNB6r0rljT9+arDBAVwajXv0jnZR0P9hi6PhudhnBRj/WoVfi
         V2lNNcQ85yXZOLRL2s3BuqM2rPS+SIfpQ6WccdjWmZJKiQHVFaFioCVWuETRPwkMJkjF
         VnDb3t1XHkAlWwFqqO0GcyH7YK42Uu1rfP0FzNOA31BJVc9y2raDJ3osnRkR/nCrZUm2
         PVwbjwQjZlrJlHq66Tiigf2tmzAkqK4CsVOj0M0wSXWzRQu6E3Uyp0S+Q7b0RY6pyTfp
         bjsg==
X-Gm-Message-State: AFqh2krkkBiKRVRRxuItcYVhYBjALN6GckyquXmo0iaWoF++pGpiy5KU
	FWF1/7+h9xwS9Hn+EpeFsIOi2WCXrVI=
X-Google-Smtp-Source: AMrXdXuMNJShUsLARG82ZvgXxlXenvyOXlwQxxPqcKU62s1tHs4KTYynsGI+L5GIz6YdoAHPEBxNXg==
X-Received: by 2002:a17:902:e84c:b0:189:340c:20d2 with SMTP id t12-20020a170902e84c00b00189340c20d2mr71102954plg.23.1672749289724;
        Tue, 03 Jan 2023 04:34:49 -0800 (PST)
Received: from localhost.localdomain ([103.85.11.51])
        by smtp.gmail.com with ESMTPSA id y16-20020a170902b49000b001899c2a0ae0sm22196447plr.40.2023.01.03.04.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 04:34:49 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][master][langdale][kirkstone][dunfell][PATCH]  glibc-version.inc: Use https protocol for fetch task
Date: Tue,  3 Jan 2023 18:04:19 +0530
Message-Id: <20230103123419.32240-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175342

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Use https protocol instead of git as sometimes in proxy network git
protocol uses whole timeout and finally gives fatal error and then uses
mirror.

Error:
LANG=C git -c core.fsyncobjectfiles=0 fetch -f --progress "git://sourceware.org/git/glibc.git" refs/*:refs/*' in /home/builder/bs-workspace/yocto-downloads/git2/sourceware.org.git.glibc.git
fatal: unable to look up sourceware.org (port 9418) (Name or service not known)

So to avoid this delay during fetch task, we switch to use https
protocol instead of git

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index bd125ec401..40b91bfda0 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -3,6 +3,6 @@ PV = "2.36"
 SRCREV_glibc ?= "c399271c10bd00714504e8d4dfbec8aebf996dd4"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-- 
2.25.1


