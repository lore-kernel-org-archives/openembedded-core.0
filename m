Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F581C52D74
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:52 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.30100.1722791385231623437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mbXsEnME;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso8645871b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791384; x=1723396184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoL+DfTDYswZkzwkxokpH8ldwo19kSTpp0yFzzKEe5I=;
        b=mbXsEnMEngqJKJsgbgIPz1UFMG+SwpsDmZqWS6Y2/b7XTpfwvnOyFC1X2L6WJ5jqK9
         F6I9Yn6b4XY7DAO0So8tICRwXI2JBT5UZ/jRMyYUBcTs8OCrH3D0GK5KZrZiDi7bodZJ
         3SA4OnAc0uXd9S04JT6JiyPfn81Yu88rCnhb+zNFuiRFk4NZ65gXlIfOQU2IgW5dNurV
         A8a0bA8QQJhkE6rmuOUyp5kotKBNS4ifzjLsGWJldr5supxNdk2OF0T9NhGaDpueSRd9
         2RSByYZRc2G8wanUbop1htXfD3g612W7Jxj61D8xEco3PqWs+5bap7Ghue0vHgFiKxSi
         aUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791384; x=1723396184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoL+DfTDYswZkzwkxokpH8ldwo19kSTpp0yFzzKEe5I=;
        b=UhKy0tIqEi6r/zp4p/oXbpajcDwL+aoLdruyeBI4BoY1tlZg0jMcixnpcwR4oY2IXe
         ZUVf7bD7m2vo/c985tPC39y7oQm+lbD420UhIz7byuzDkOewN0cVtVGQ7pxeXhXJG6BJ
         vtC5X2aLCHGeL12+TZOQepQ4CWsuAVqaLjQ1p0xWgDFodNGcey+iZz5TcZ/uONk9GvjE
         +Lm2/EjhvcI/X+90gkWIhvUa0uXaGBWqcr5GMrfh4HkFZhl6dkezudRToI7LHs7vspfN
         netdc1kwh9KMe7KkvcONbJlvNpERz50w8SknUQ1QZRaSk5zPbY0lDhe3l33F7xmGEGyp
         W/zQ==
X-Gm-Message-State: AOJu0Yyhg4W8DqsKEuZPaGsxc8VHVgfMglr+/8krfgsYLr0z2tn1Od9N
	CSmylMwpWztA9VZ9q0gQCQu8xJyLn0Ao0gl5CtqDEuFRNMuBhn2kMXbJ9lKCCoRKwPjgl1rQVVV
	quXZh/w==
X-Google-Smtp-Source: AGHT+IGp6FoJYfZr2GsigFCRyPHkFKg8Oi1/fqDOBpYtYmj0CBHWWRwnKnotymmNZGjG90HpT4ceMw==
X-Received: by 2002:a05:6a00:9187:b0:70e:98e3:1c17 with SMTP id d2e1a72fcca58-7106d04606emr10509686b3a.27.1722791384450;
        Sun, 04 Aug 2024 10:09:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/18] pseudo: Update to include open symlink handling bugfix
Date: Sun,  4 Aug 2024 10:09:16 -0700
Message-Id: <97410e90f7233e5c9ce38eea0fa99b76160ffce9.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202972

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to a new revision which includes "Bugfix for Linux open(O_CREAT|O_EXCL)"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92a9710ec88c8729fa3d83baa2e63dd74d95cdf8)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5f32b3777a..7d8f71f65d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
+SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.34.1


