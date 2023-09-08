Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8058EE8005
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.39469.1694180842416303027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JKACI9U9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68c576d35feso1950620b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180841; x=1694785641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4sQ9pGC2uTx9IJNrwWYpbcdjT/9zqJBQ3Nf+R9w0D4=;
        b=JKACI9U9ircz6psGeLK5hFSc1wn7AAiR9Y5qZunFEIdL3bmWkzydvGmcG2ciSlo10d
         mPV3DnuffP/3LgOeyLqMaquIuvmqc0hU5PSTM8qToFgBGY1ahdzlf0HXSOXXDO/vSpsB
         OzwHy4hNunFInm31WvDAjbbC9qRmWj479B8ZZIvXtrOLZOiECNGD1sgjDLVWNIHESZ4B
         q5WZ3VUGjhx2jol2irFc5NoET5w+rMMCpCOxLbahQW9PfbICCzpEEeKwWQzUZ/KtXFY1
         eANa4mVtmdP9o5khGIhNxdU2+r9s/NyD14YBi91120ypi8DLc0fUJFIY+BcauYdCmof8
         7E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180841; x=1694785641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4sQ9pGC2uTx9IJNrwWYpbcdjT/9zqJBQ3Nf+R9w0D4=;
        b=RpflrVdv1J4xxoM6RppIsvVN9Mx46rN8rWvV/WbAkreKyBpwqLWV+o/jwWiW/0M9ir
         xoUiMz11EZY32qCRove+ax9NeOV0I2lN8eVNz1Bo3d4LcdyJYTJ7awa7PYFpO4bPOZWC
         NzTGsES6ZV598jywxFj5wAy+txnPQhxZ93LOlfAPS/in3v/wxXAb+OKaEVGk6MKndD3B
         +8sf9loQkvfO243T1qWwj/3v9ZUKvWh5c+JPEOlP74ovFZ2G9rbHBqvxRtZ1JNtRW0s7
         CZH1Jeh6tFH72+S+1rjFDYdySakfZ/NSio2i9EVfsBdut5aLwQC6UF/gudtVweOiOSxh
         zgtQ==
X-Gm-Message-State: AOJu0YzaQv7C9FeionquUqkSBD1ngL4XbrZFbsyk5uRwgOLL85FH6RUr
	fbpHYHeQU55ocL6YTjRjNrP3XVcqnZhAXr9uxpc=
X-Google-Smtp-Source: AGHT+IFgcNXBaV+R2vOOIiig2+0MPZTwiNJloavgJTBhZYub3+b4lTMAUlw6+GTPS7gHZLG9Oq0ZyA==
X-Received: by 2002:a05:6a20:7fa2:b0:154:6480:8588 with SMTP id d34-20020a056a207fa200b0015464808588mr1983033pzj.0.1694180841582;
        Fri, 08 Sep 2023 06:47:21 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 7/9] python3: update to 3.11.5
Date: Fri,  8 Sep 2023 03:46:58 -1000
Message-Id: <4a3e3042a0cef3a215d286b0f32be293c3948d1e.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187429

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2023-40217

Release notes:
https://docs.python.org/3/whatsnew/changelog.html#python-3-11-5-final

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.11.4.bb => python3_3.11.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.11.4.bb => python3_3.11.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.11.4.bb
rename to meta/recipes-devtools/python/python3_3.11.5.bb
index 41b27094c7..b1ab307804 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6"
+SRC_URI[sha256sum] = "85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636defa3f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


