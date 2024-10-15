Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1290D1F9A5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.4787.1729018271970418122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cbCvqZSx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e5b2814f6so2324154b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018271; x=1729623071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGnf6rUJ6bJ1lZO3FXmCE5kwzSinMpUe+zuzQ3oghJQ=;
        b=cbCvqZSxCIr4u+txi5tz30Vi93/2yPeCx3G10UmxbIt3vJhdbeDXtnaCbCVjlYxcwK
         wfPaSTRm9ZTpVdiFYQ9ClS4qD3RLasur71GzQoIrMM0oYWp7r5bxJPWMhSKuC23uQkPa
         mY3+w1fPcsVg2Dh6ZANoUFKjvYmgXzadAurdpvAF7gcDx/NCYLUYUEClXX2P6RgBhiK3
         yaIK/Jun0tyuRIk/pDTTLZ5sdtoRcDTDH6Jb+dC/PiH4mNMl5ZMDKuqVCfPfkMbUPbEc
         NTgJdSruqFz5Kam+F9uoQDbzmeGXpsaX7iYw5BXyRJaS2my72DPdoZwWCz7BuZsXbzWk
         kS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018271; x=1729623071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGnf6rUJ6bJ1lZO3FXmCE5kwzSinMpUe+zuzQ3oghJQ=;
        b=Uj99svUehJUOwipt5Z1inoAegLwMeL493HAtBxDH+HGPVuNos8UQWFRQp2mdwU0ZOv
         lki8HEWuBdrjGAL5nD/QCW4ZmRzxljYu68E4HZHxea24n59ZM2L6EKjKXwqP3O/6+V+d
         rzrtYPqJQLOY4ZcwpeqTrS5cBp9M9jGya43Op83NvE7GHz8ngbs/IrKl6q0MasbfmHzM
         mmpRfRxYG+81bEa8/TB4S8vx89bVYy5XUJ+GcaNBFXrOH2qEB3kq4Nx0rwWvTQ5iKI7S
         /3mBaaN5rqU+bS/pMr9j3Kn4b6z8vMqOxU/0gLvwhwypOd3/rrbcbRYPxa2uO55S27sK
         zDxQ==
X-Gm-Message-State: AOJu0YwmHd9IbS3ciK1zQDc0c064gikULe8QrLujAAQ+QnOQcCJka6fg
	xfqHJLhgkz/S8c+OjF93cFejC2F1R064uRxcMlsu8ovUrh6uC9pjZ1LB6HAY9EgFA5y6vnlM4lN
	h
X-Google-Smtp-Source: AGHT+IFODOBTPYwwbMUUVeZS53urPtfU4mPmcOZD+YQ/exluQVBmFlIHyg3WxeXTjNWOjdLIFr1WyA==
X-Received: by 2002:a05:6a00:1817:b0:71e:8049:4730 with SMTP id d2e1a72fcca58-71e80494912mr275305b3a.3.1729018271225;
        Tue, 15 Oct 2024 11:51:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/18] ptest-runner: Update 2.4.4 -> 2.4.5
Date: Tue, 15 Oct 2024 11:50:42 -0700
Message-Id: <edb7968fe272e6afd89b01471f7949ccf730f295.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205929

From: Jörg Sommer <joerg.sommer@navimatix.de>

Changelog:

aea9f42 ptest_list_remove: Fix pointer adjustment of prev and next

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f70ec9bcd379b5fc4c85d7479d42789c2e22f4a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{ptest-runner_2.4.4.bb => ptest-runner_2.4.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.4.bb => ptest-runner_2.4.5.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
index 2263e07280..d28ae7ca91 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "95f528cff0bc52903b98c292d4a322fcffa74471"
+SRCREV = "aea9f42f87f2a78a973ae22cade8e45259f754e1"
 PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


