Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D7C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:42 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.1984.1667356957406808644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PrY7e9e2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d10so15190072pfh.6
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+puAHiis3abTN2Th8OEgTCfAsX4/wwR/5xxIW3+7YFQ=;
        b=PrY7e9e2JdDTXSbkiN0ToNcZO5iytvjd0xBD05GMRzsHCDganxzXl0B5DwareOeSL6
         yYt78HyuECmaIdQT0OFtbBNbYepgIhZ6dsbKj5twyu0JvE9p94OQQ8GJh7y4YXBsY38F
         i6c241FXgpX+olZnmfKDH/c+N5I9WFN5hMCHxqaszO7Smv6SGMMRq4lL9/8Z4r+LONOO
         ZSbVOYk7emopizmQEZS9Yy4G4aCKzq2dZRrH2Nj0lI+nNqJsu/LpGGT/312xHzowQo8D
         x67nD3eDnUd7ueSB7Jb7H9enbw5nqCNniJueD5TSmeSefFy0S7tw/X09Ku6Bfl5fnmC2
         Q7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+puAHiis3abTN2Th8OEgTCfAsX4/wwR/5xxIW3+7YFQ=;
        b=v6fvX31rjgZ9rDYl7K/Ah9mm5S+ws7cr1gm6f69bo7yYtaLzV7HDpKELxURNQGah0Q
         +e9M3MJ121x0se7JSwPiGAE3rhm2dz7iWqbc5ygAWfskL8yLx1wrRiQeiH9AhG+Uw6/a
         HwYm8neDYkbWWSnhoLrXJB6l0w4tH7k9v9xmztnVDvjNhpO5mtrOwjAAUe6uatlkIAPe
         WJ4rj/GIfn/h84vGjAKvZ9wemX8rAecJ5EFSh6ExlfItLr14++WowfQRWHKyqxuZHVjx
         0GN9jqtWppsddope1qEjY8xFmRWfPUsIKl0tnE7ksP86SP5jt0wL6WPjQYhTmy5aLjMk
         I7uA==
X-Gm-Message-State: ACrzQf1rlPVQ09TqYepZ2Y5gJYEqEmhNTU6jbWls9OZVp8Id6rwWFVEP
	LIk1wimyqKFcpdZpVqLmGKJqjJYKZsVqMh2g
X-Google-Smtp-Source: AMsMyM59VbID9Zv/A3J9yfVjxis9BXxH5GlgRlnKkM4LpT7Fe5vvbjXg7f2I3Sf5nSvKCmO1mUTW7w==
X-Received: by 2002:a63:6cc2:0:b0:46f:cec6:c9b2 with SMTP id h185-20020a636cc2000000b0046fcec6c9b2mr10291367pgc.167.1667356956410;
        Tue, 01 Nov 2022 19:42:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/20] tiff: fix a typo for CVE-2022-2953.patch
Date: Tue,  1 Nov 2022 16:41:56 -1000
Message-Id: <3ef84008bf729f74f1244e8b57451cdeb3a9e262.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172546

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

The CVE number in the patch is a typo. CVE-2022-2053 is not related to
libtiff. So fix it.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9f76ef859b0b4edb83ac098816b625f52c78173)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
index 98020ff92f..e673945fa3 100644
--- a/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
@@ -1,4 +1,4 @@
-CVE: CVE-2022-2053
+CVE: CVE-2022-2953
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-- 
2.25.1


