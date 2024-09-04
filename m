Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD61CD4F38
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:30 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.62097.1725485602041485232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zBaRByTd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7cd835872ceso102539a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485601; x=1726090401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+R4jGtEBnZieA4BUDGqD7z+KuWLk9Yodljqa5gUqJSw=;
        b=zBaRByTdv3xp4HHP6rOHJrBuH5jXwSHAbUecwDJ9Il+VtuTvZnmzhvo9F3qcwY8+Ts
         XGsMD3rOCnid7gXvrYTtt91zaRJAkMTK/r/Ohkl/Gy80JhVLo8Wemhoieh9WEah3u8/U
         mZ7ZUc0Vvc7tX31l+eL8gyD7MbLfs2lclX2Kgqekyc5OEkuQtlP9bLyDD15n6MCs73ko
         K6R6n2RDguFNr1IatCAxsjYmL5lEmBJMnkfu4t4FSQ0GRPC3xXV1u3gIzvAHbk34Cm42
         CXEvhkjErK87AuT4KzpU0YGOWEDNjHVSZ8vNEfaS6W99NnL5C8g0TwxITnQh2OWPdHOw
         7m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485601; x=1726090401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R4jGtEBnZieA4BUDGqD7z+KuWLk9Yodljqa5gUqJSw=;
        b=u0vuth4jj4tUFcheS7SjeLGhq8juLQebQRYjkngcP8ZVxOpDV3MqePPiGtbWZS0Qoc
         mYmgRAOtJWu2uP8B0L6oVxFqXe21ndd9EXVKUekBlV2q1Agw9296i0IsPKQAH/RQ1Da4
         3wfB7qwiHHF9/E/ZiH3sjpWvbaQvKA6j6Sx3jjJc7RTXAAmIicpUgV5SltZVaLfvY132
         rPRbbx5+5AnGamQF7xandgJw0fTFcHGRhjDgk0Uu9Oo6NvC5+YmYR/m1HLGqnzpP3jMR
         ie4o3WgxmYMBdBgmMTV6Td8UnZO/xZwuqzrfUbSmHiy+CRB3YsVD8E/qAuSQEJnMRaMn
         ZGCA==
X-Gm-Message-State: AOJu0YyuPrmWztP9PE2gUFJ2rorHOqdRVupLuAmMiJLp8R7BYjVZZWaA
	2OWgx42akWyYB/hF+JE0Mn+zbAFj4DkQbgQcuyE/o0sUKWz4lQKX1PMubNsmpTQwHS4POMCScam
	fDes=
X-Google-Smtp-Source: AGHT+IE5sG68hzY8/A1OYvAX3dTqKghqGgsOYbEg5eYdYvRB+3Sdv0urtw4jM0HQo+3US/0UA74UmA==
X-Received: by 2002:a17:90b:300e:b0:2d8:27c3:87d7 with SMTP id 98e67ed59e1d1-2d893284ebdmr13958479a91.8.1725485601321;
        Wed, 04 Sep 2024 14:33:21 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/14] libdnf: upgrade 0.73.1 -> 0.73.2
Date: Wed,  4 Sep 2024 14:32:51 -0700
Message-Id: <20b67ad71cfa3eac35b2514067f87d79d9c3da2e.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204222

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- context: use rpmtsAddReinstallElement() when doing a reinstall
- MergedTransaction: Fix invalid memory access when dropping items
- ConfigParser: fix use-out-of-scope leaks
- Since we use rpmtsAddReinstallElement rpm also uninstalls the package
- Fix countme bucket calculation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9cf8330068503a5721640763309c4c74f293a94d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libdnf/{libdnf_0.73.1.bb => libdnf_0.73.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.1.bb => libdnf_0.73.2.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
index 3ab840b1b0..ed433d4a9f 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "0120e70747dcf05e716792e2e846c62eccd44319"
+SRCREV = "86bbb159732e43dd6dff98c96e99382843f7c63b"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


