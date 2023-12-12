Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D24C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:12 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.2923.1702391285105558196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZH8S4pOR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6cec976b197so3053402b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391284; x=1702996084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xffAPz2OozXl3+7yOkwDtD9y5Ad56Bs8p2aMUCBmbSE=;
        b=ZH8S4pOREXqLzn24Zw/EFzSlF1ytRkE0lJuH9sz35czbsXlDGlxY7s44zvLqtzrNo+
         aw6DcrxiSfy7F6AYW0L/rcrwoYCCrn2cJ525MdjGSd8rdmbiY4Sp0qjQ9zrF9EPUEpr4
         jS2RoBsQvFwUT9WFmb91EBk1iQqtH45FlMEps0rrtNeWBArQWv3BygpQGLzFRsp212h1
         ailn+D99W+aPeDN+qroPLNehCezqRguFfmj9WRaPc1FlQQ+DY5YGBHd6QpWctS+k5dSm
         bp785/8NaVxBJb2G7e9aFhm5PWZB5dr1No+HgOQ5oZDkUUOG6cW3eGLqDhR9f2Rah7Cn
         y7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391284; x=1702996084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xffAPz2OozXl3+7yOkwDtD9y5Ad56Bs8p2aMUCBmbSE=;
        b=FMBFWKRtuNJRksgs81xvDjser3IEStUBVXlBX2uE99c5lphL73LECVYruDqSVCzEY9
         qIGhHsnsBavw2BHJmAKO8wfS9SGL+5YKIlZzUWmzGwaEA/Iy+1kluMHJt+NZZZx18tu2
         gmnQxsEihgYil/tJv22O7D+q41Vid8+y6i9zJm7mjVQiE8aZbkQQe0oT4pGy+mcecND8
         bGaMpc6dU/uShPqLjB0kt5aekOLOnCKo6uAhuzz5cIcAqKoQt3XjUpNjuUFhU8l6XURl
         9DQeTDjDeL3UW7BB1HHObdOEpRcGUhlb4J8dSQ6/H/QLu9yvPYpvWwfcVAUDUMcjM/R1
         s7xA==
X-Gm-Message-State: AOJu0YzfEcSMC4ATgxcDeybS8p5EAru4yKgcq992K/35trfocCYrKpvm
	EkK4WJO+qrziEjnRr3vMXzm4zff8zYztW0UA3Ew=
X-Google-Smtp-Source: AGHT+IGEMhevIDn+L+CbUoRSY1uDLfFDVQ4JdXsijugdCwqg82t0XERqtEWKOgLaAZZYdw8O4W8oRQ==
X-Received: by 2002:a05:6a00:a1d:b0:6ce:3efd:3951 with SMTP id p29-20020a056a000a1d00b006ce3efd3951mr3645219pfh.30.1702391283718;
        Tue, 12 Dec 2023 06:28:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/29] kern-tools: make lower context patches reproducible
Date: Tue, 12 Dec 2023 04:27:17 -1000
Message-Id: <7412f49779896cac68da25455c26c9e16c3460d2.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192215

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It could be argued that it should be an error to have a
reduced context patch now that we've had many years to
ensure that our kernel path queues are clean.

But there are still some supported scenarios where a
patch is on multiple branches and reduced context makes
sense.

Applying the following patch to make sure these are
reproducible like the primary mode of application.

   kgit-s2q: use additional git-am options with reduced context as well

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a76a31419e8f3c612699bc45dfc7637d6d542c08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 3fcfe4b4c3..e109cd7454 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "6645d3897cc2eeb1237ee0e2ff5342bd73ee0875"
+SRCREV = "270f9ccc5e2998cd1f3ed1e32d02e356793e4680"
 PV = "0.3+git"
 
 inherit native
-- 
2.34.1


