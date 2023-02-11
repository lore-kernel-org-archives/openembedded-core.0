Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882FFC636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:07 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.19486.1676150642154878587
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qJRQaVEY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id w20-20020a17090a8a1400b00233d7314c1cso913826pjn.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gT9ig93FTXsBE6vJBa3Um+vAWRm/k86mGffauQYAWQ=;
        b=qJRQaVEYQ6abmoP2qt3O1Sfk2jVlfSrwPyG+lDFFFL009rXIJpd1Pj24MROMKiSqHj
         c96UPtGps83ZvUt2nAFbQK0IvDr8Cl+GcptnT74QNeGVag3RXtJ22IneInN7jGGfWc5H
         jEIV+hWzmEALpDd9zCbokt2S+kg9VQGqS5SOaR8mX0j5Vn/RbDpobnYC5HdIKXtDWMQY
         3Pma0NvsWXr/VpoiifjGwYC13owK6GatmaiF/pNlGtPR52tjn6DFxovUAuv0lC1MWqDu
         S1EP/D1s875frG6T51qSYWHZxTGz/2W7XDWS39E3+p5hqPGHw+YVjUHuC4kBp5V9+ZLZ
         hw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gT9ig93FTXsBE6vJBa3Um+vAWRm/k86mGffauQYAWQ=;
        b=ybSydY0oeQUp1cQ9G8iI11Kfh/fqtk6JFabjz3N9m7GE3V91TYp2OnswFJsqUak2O4
         wkHQlgAJ4WfFiUZi/qtz9QTf5JqvBtIh7xyYwflpHfuSkRSvmO/KueWR0Ad8SmPi83jp
         ukJYUL7Dz3R3Spa8FpFUnrYMiVU6+SYcOgyFvW18tfTUQVSjqhjgdc5fGoZq0SSKmyn/
         ZgLQExjJ3JRluuYVo682kBFi6LKIMft5kGWrRhHl9AGzJBkc6Ek5MOOxFZrgXlKnD05K
         8Vz3f1V2ItoGmHgASkgIlZkT5rkNZpkgb8AHV55ZicJxcSdPPsfxzu6bRRjp4O79x0fP
         gF2Q==
X-Gm-Message-State: AO0yUKXD5oXqOpqODMCf/vq5RWRFzBghV8bsHpX2UPpVnie4CEmF0GxT
	GMCha7S9lWXIXpWujUyXjymwsN9saeuJWFBgkHA=
X-Google-Smtp-Source: AK7set+iMjagFiPPZ6VxTiBo7mr8LwEQNBOiFCdOrVPGVxFPTPAq5Auc/eSZOYd0saZj8TdqTLaZxQ==
X-Received: by 2002:a05:6a20:8e0f:b0:be:c7a3:2b91 with SMTP id y15-20020a056a208e0f00b000bec7a32b91mr24882851pzj.0.1676150641238;
        Sat, 11 Feb 2023 13:24:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/28] git: upgrade to 2.37.5
Date: Sat, 11 Feb 2023 11:23:25 -1000
Message-Id: <de304c5617aee26028a4fd8474ccc2d177c85278.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177012

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2022-23521 and CVE-2022-41903

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.37.4.bb => git_2.37.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.4.bb => git_2.37.5.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.4.bb b/meta/recipes-devtools/git/git_2.37.5.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.4.bb
rename to meta/recipes-devtools/git/git_2.37.5.bb
index 8342b38313..ea53cc41e4 100644
--- a/meta/recipes-devtools/git/git_2.37.4.bb
+++ b/meta/recipes-devtools/git/git_2.37.5.bb
@@ -167,4 +167,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "a638c9bf9e45e8d48592076266adaa9b7aa272a99ee2aee2e166a649a9ba8a03"
+SRC_URI[tarball.sha256sum] = "5c11f90652afee6c77ef7ddfc672facd4bc6f2596d9627df2f1780664b058b9a"
-- 
2.34.1


