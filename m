Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A75C3ABAA
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:07 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.8205.1745981646880824098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kUK5RJ1W;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301c4850194so5522754a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981646; x=1746586446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWd2+eBXOvObDiHCCbmyD1T/y0Lj9m3J5GIrrPp37PM=;
        b=kUK5RJ1WkFZQEzBT5QeZAlsF6r1UIJ2tPi0wkcl/TcdBqwyDZzHD2yeKVgCCnWdSUc
         +drXziIPRNep94Bdy4zdsy3vlmWS6FA5Wh2VAaN6krUYdYHYYodzObMh2OpOJ1qrRG0v
         /jqhWZFOG9AuTZuToAQTQWbnf05G07+yCaLi+lGy9Tt8Lp2tgPb+gyIZ0GOhCm4PAeNg
         QBi50qXgB3WOeRxEijPet3CAFmjvzxcdKeUcHiaSFIra5LoPrCoya1arfVZdHfTEkZaZ
         cp1Fy88o+z03ImSysaUxUjqcRjVF3nvgPT4HuluyholHUlkYBHPVgdtvZVR45lizcH+o
         qk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981646; x=1746586446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWd2+eBXOvObDiHCCbmyD1T/y0Lj9m3J5GIrrPp37PM=;
        b=VkO8NCgBdlr4KhYwJMVl8j637v0E/nvtWTfnR0x7GH7XiXRGyeZi8PNAg5DY5iU3z6
         cddZB6co/zDCm4dmNOGENZY2VS56bGDCuYqSLqJ7DMk1ZHijWBOyQeyE13HWeHKb71Hm
         dZMN1Pvd12qFJKGJ54/+5QknEgiXVl6Am3hsXNySx/H+u291y/A8oGCyaJW0t92fGK8Y
         5jc6z40Oz0p4TePy7qfiO9yFEixmo+LQnizBvd37LjIGp5uvbuaXm6WvyxfQMb1toSL4
         Co2sKD5Gx3+EoJwczLQzvm+3REH2Vd7L4M7ND3dBN1Uc1is94ElHvCK630ggTVUPed1O
         cKIQ==
X-Gm-Message-State: AOJu0YztF7TUx3mEKgx3FPE9YUOD6f2UzNLgSulzRmvvIwbJUvnc87vo
	nhaKJQZe0cSbhqN9eXGgfN1l4q71NmyetmaqaxrgVRqGxR+T0HngTsq9tLZVBKcnFmBR7/mK9/F
	t
X-Gm-Gg: ASbGncsPysRwaCAZtxdRH0oDibrcdYQtMgGiGR+fPLjLM7Ti14zdWInkdlp+1e2GAIk
	wzMgLt9g/1pvftk2hpvo5GotDB6g60+X9arVXFbxN+Xj0GuR4iCPCQHrZyVxZB5GG9WazV3P2Mf
	1SKF8Bj2qgY5tx6t+DuoLZs86p5xbVutODdoSSyzoqwCN9W1JAWwwaICpTOgZqyCzrserpNPOXj
	ybh/HLu/om7wHOoejMrYANqPo8/sKHgS4R/Ybaz3MsYH8EO1zYW7xGL2FD7UW6I19MtPhF/GpkV
	FOqtHoUbUdCyW5F1bKc8Pq6i+TkToLM=
X-Google-Smtp-Source: AGHT+IG4yTEGQk4RHA2xiOXebzbnd7QLsOpEELeB9wMnOL4fVh/mXDBEBEx6xdLQSDaThk/1vfFzIA==
X-Received: by 2002:a17:90b:1804:b0:301:1d03:93cf with SMTP id 98e67ed59e1d1-30a3447ef20mr1287012a91.30.1745981646132;
        Tue, 29 Apr 2025 19:54:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/14] libarchive: ignore CVE-2024-48615
Date: Tue, 29 Apr 2025 19:53:30 -0700
Message-ID: <60390a3a28242efba32360426b0a3be6af5fb54b.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215695

From: Peter Marko <peter.marko@siemens.com>

Fix for this CVE [1] is patchong code introduced by [2] in v3.7.5.
So v3.6.2 is not affected yet and the CVE can be safely ignored.
Also Debian tracker [3] contains this statement.

[1] https://github.com/libarchive/libarchive/commit/565b5aea491671ae33df1ca63697c10d54c00165
[2] https://github.com/libarchive/libarchive/commit/2d8a5760c5ec553283a95a1aaca746f6eb472d0f
[3] https://security-tracker.debian.org/tracker/CVE-2024-48615

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index f7e576b688..87d3794ab7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -46,6 +46,8 @@ CVE_CHECK_IGNORE += "CVE-2023-30571"
 CVE_CHECK_IGNORE += "CVE-2024-37407"
 # cpe-incorrect: bsdtar was introduced in v3.7.0, so 3.6.2 is not affected yet
 CVE_CHECK_IGNORE += "CVE-2025-1632"
+# cpe-incorrect: vulnerable code introduced in v3.7.5, so 3.6.2 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2024-48615"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.43.0


