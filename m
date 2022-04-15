Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B179EC71129
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.6304.1650022684649106255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RrUW3oz8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso4883947wmz.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EP3o6AW4OFbw3BfqiUvkLUiA/7qg5Pz7vOvXgfdMRUc=;
        b=RrUW3oz8I2MMcGDuD/97Ot51OlsNdX9+eCIscdIjJbMVd4Oyb32kBa2vwvBlgtH6Fs
         fzTE/JljyHT015x16p3AWCdgD1zd9gsvUhCyGsK5JrYRaaawyI2GesLmq1W+typJOqdD
         uw/+oHkCdyPpyfv82APHCMsEdmAXPgS1DBqsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EP3o6AW4OFbw3BfqiUvkLUiA/7qg5Pz7vOvXgfdMRUc=;
        b=WAUDY3IHV2R84cbf5a7fvGbFZTvd4edCQ/Ld50521vHWmvRxZp3xGIE3+TbKmWOPXi
         aiCtVvKK3GAmIDSJkGbX+viwMTReXf4Ee07HgQ9sRa+1X+nogYPfA4nNv5Tgy2ah2k/p
         STOelo0zt9iCh70d/vX05Xob3TZjVJh2CFeN6c4UrtPGbFpOTZCdSb5zRbQtx3ylnjWN
         Q3slikq2akqGK09jsy37j/S98QLqpi9jjyPNyD3j1e+vYcOhHap84ZA38cciZnSZZBX/
         9XIPwiG/MCxKe/PI3RhrYUYeFhAA1NHQjfJy9DSFVW3RQbCwXazJVbUHA+MiQCYI6iyE
         ED7g==
X-Gm-Message-State: AOAM531c3P9OcrN80QKsdrjlkhcT5T9MJlbzbER4HRGnohb0xLpHKr8W
	7sPCH+yDePKc+06H/OufZIlrmvNfKXK8AA==
X-Google-Smtp-Source: 
 ABdhPJxN9aDsA6+ztqA6GuDWOZVzOiNlBhCtZkLDv3HS6DiktxPmHbHlhQaEW62a9lN07NKzLpyKjg==
X-Received: by 2002:a05:600c:1e8b:b0:38e:f8d9:f697 with SMTP id
 be11-20020a05600c1e8b00b0038ef8d9f697mr3020129wmb.180.1650022682690;
        Fri, 15 Apr 2022 04:38:02 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a0560001acd00b002078e242847sm3776574wry.97.2022.04.15.04.38.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:38:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] bitbake.conf: Correct BB_SIGNATURE_EXCLUDE_FLAGS
Date: Fri, 15 Apr 2022 12:37:57 +0100
Message-Id: <20220415113758.2290861-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220415113758.2290861-1-richard.purdie@linuxfoundation.org>
References: <20220415113758.2290861-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164425

Some of the flags listed here do change the output and hence do need to
be included in task checksums.

This means we start including the following flags in function/task/variable
checksums:

type, func, export, unexport, noexec, dirs, cleandirs

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3fa2bee053c..0e939aca4f9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -950,8 +950,8 @@ BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
     BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
-    lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
-    file-checksums python func task export unexport noexec nostamp dirs cleandirs \
+    lockfiles vardepsexclude vardeps vardepvalue vardepvalueexclude \
+    file-checksums python task nostamp \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
     progress mcdepends number_threads"
-- 
2.32.0


