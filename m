Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2315FD74945
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9473.1766114575976938984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IgAOQ3Ne;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0fe77d141so14179255ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114575; x=1766719375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjQQTmCfAOsMPk/jbRXGjSp/WpCMJatjuwdiwgr4h0Y=;
        b=IgAOQ3NeH90XCY8zzXY6Za3o56/zGCiqNJG24Zea24lQi+/A8agycVYUBbkH9Tt1rq
         YxKv7sEI+IuqzNxYpMrL01NreCgH3VjO9u1jrzfXW9K6BmcOQifdV42YH3p2r1GNEsIR
         plaf+0ybV9NPeGWFj9SDufoBATYvrABmGPm5cm8viA6/Fodb63VgPWwVZzRQtSNewu0m
         u5+W+uLOMml/z30eKUJiCNSuXZ4gDQd88HjOFa5uoGNHXKck2Ys72rFBnwifmt5uS3sx
         aMWBMD7s+GEMlHOioSTPWMFAaA/+hkFkdfBcr2NnmhlYEc/ZPSoIgK05LJmZAvz8IJ9v
         a+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114575; x=1766719375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjQQTmCfAOsMPk/jbRXGjSp/WpCMJatjuwdiwgr4h0Y=;
        b=EX94SB6wSHrPG3XEJOsksjPiUsgkJfYCtmfbevbq8qduS3r6NABhmSsEFLwvP6TDzi
         uLceCnGMQc1cPhF/hAEupI6eOCmyMz8LR9f3v9WWmgzfa8O8KDzLtc3FcfB6X+Pz+rY9
         6kliAQjY8rDPik1kb7VeqGx5bPJA7SYiW+zgReVnm2budbYclQ7oaZLx6kphJ5aholuT
         p5fN9Yuuyat5k8BttfYsfsbCV+5vSdzf1N9cs5OHpVrcYAdD9SlPJnouhNcNtkbdnnq9
         Romk1/98k8rkzNJx1YhMfv2YnOmDcVy5Lg9Z4DlkNnFBZRU4jsN9O+c8tq9KCH+z/DeO
         SjqQ==
X-Gm-Message-State: AOJu0YwnjXkt1yR/6m6TogwKUC/ZiiKWLfQN+oCmWvTsctV9DoNG55cp
	e5z5PbgTeKjeJ57ZNsxeBSFI3o+Be+sAqa8kJ5FQqRQKekvXNd4Vfeeq8dmZGQ==
X-Gm-Gg: AY/fxX4yBK78XFssmvjXmkTKAhVWYdwwaN4DO/dAZnF4iS2z17USNGpJ2nefpfxngqH
	r4HavNA4J6Bxq8u5ckuYHO3NAcUaRkqykNuPxXQfDwJd2S4rTwjvkbyecIjqX3WsRcDgotFwYP8
	+JSQM3MB/OoQFkF5aIYPBhJTGa8uytQeC1NJ/zhGqiwKRVxaeiWjVnB4fcYrpP6fkVogkvKY9jZ
	PllfMKVPdL/8th4J+VhFzPPQlPiVcntOOmr4B5tDNBFkHbiQJU001xaiTLVfn6/kCzxa8pR8my7
	C5tit2NQ2rnDkj0vkr56RwClW9Ph7CDqbH7k3N3RqoSv1b/fNG5X8zKZ+fycTNQMjCB6DVtFn7e
	1tQdy3mTS2/3tP3Miigd7F8FLe/fenIeg3inIPZu2++GN7VodBd2frC1QEA0M/KTShfC8ueX365
	RgXWT0X4lVa1eYLxcwRqLlyLOe
X-Google-Smtp-Source: AGHT+IG4seFjtRddREXrbgXQ1e21TguDwrzzZl9mxMfQI61hSccmNsOqSxl4TDHMfW/ynS6GuFHi5g==
X-Received: by 2002:a17:903:40cb:b0:29e:facd:7c02 with SMTP id d9443c01a7336-2a2f2830ff4mr13336585ad.28.1766114575168;
        Thu, 18 Dec 2025 19:22:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:54 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 15/29] gstreamer1.0: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:54 +0530
Message-ID: <20251219032209.960840-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228183

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 985ac9fcbe526617265a9e61d529c492a0400e24)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
index 4c800c22d4..444165a869 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "0a7edb0e7b42dbe6b575fce61a4808a3f6b20e085a1eaecbc025d0ec21f1e774"
+SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \

