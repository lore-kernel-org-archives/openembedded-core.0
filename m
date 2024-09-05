Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6ACDCD5BC0
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:41:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.8286.1725540076128852638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=11gO9D5e;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-206e614953aso1416745ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725540075; x=1726144875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PV+swu2KClsWqEifwO7xBeW9n/9LeVxK597hSoEpFO8=;
        b=11gO9D5esuCy7WRbj080JmIZAGqFgR3SbbKonPCpf1sQ94geejmFapt4VEMFVf9PDu
         kdAo2dwFzeo2wzSDE48z2jtYQcXwfjEjjIuxnehIU4g4VjtvVBB0nfxkAxBSkadL09ua
         16UC/PkHBdBa32Vz38lEi8dMCBSC1rCBVgFb71zVbcublT6GyN7k31EkTwwTeatAh2Z5
         u9LgcZsv12ycgraBj2in4EIaByfNa6Qtnhj9xNJusuGzh1bTCupamWp5/gIEUs3tpRR1
         pJ2bNrzGG8xXhKyO8XXuGN3usqSrfzjxXXyOyX/szhraNzCqvqMoIboiChYmAaCb3LGH
         BlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540075; x=1726144875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PV+swu2KClsWqEifwO7xBeW9n/9LeVxK597hSoEpFO8=;
        b=bdzCHZxO993exLL/49t5lenZ/zP3mqwyLYxjXHe9Xafv9Jy6ArwAF/37wVIHLPGMt6
         YBQX04vV9WpcXX0VPYHj4zJjJiw1aghVba8ZE7zo1rPgnk/yEEgqOuHb6Q1leJ/wJhwM
         W+U2MByN4tPkxbV0D0ggMuNshhx4x8YWc9zKZOMK7taMoyJqGlS9njvSJI5/nSxHc4mr
         aQuyJSTf6JLhp3/kqA93aIUfwZHq0xkFrLEEtIIjPczDKZwC43wfv5iI8jgJLTNNDfVu
         v0tyyYVtIDdvaVatLxQZkLAJMEkl5WD5hWRsLBK4ZtEuBYxHSprNnfjOZCMoCEGFIrNk
         uPlw==
X-Gm-Message-State: AOJu0YzUPGLGbqMtOgTzLpBfJULoaWCQDBh56mRHoLqQb/SblnIcJGcO
	tduzLb9HbAsZz/8/LHKjRGx5lG663/B6bezqWIBvQRGV2059w1UQLnvsPmMtXaALKUXZSFYCwPN
	ekPI=
X-Google-Smtp-Source: AGHT+IEP+1ZYbBWwRahmpAFOxWmP6oQ4LYpkawm8t2hGeIeQSrTVB7Oi4f4lIY/ZnZhe0Bz6mJCgDA==
X-Received: by 2002:a17:902:ecd2:b0:205:608d:2475 with SMTP id d9443c01a7336-205608d2657mr160560255ad.44.1725540075271;
        Thu, 05 Sep 2024 05:41:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c31sm28107265ad.151.2024.09.05.05.41.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:41:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] sqlite3: Rename patch for CVE-2022-35737
Date: Thu,  5 Sep 2024 05:40:59 -0700
Message-Id: <9a875873e566a6673a65a8264fd0868c568e2a2c.1725539924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725539924.git.steve@sakoman.com>
References: <cover.1725539924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 12:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204234

From: Vrushti Dabhi <vrushti.dabhi@einfochips.com>

The patch "0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch"
fixes CVE-2022-35737.

Signed-off-by: Vrushti Dabhi <vrushti.dabhi@einfochips.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-in-the-printf-implementation.patch => CVE-2022-35737.patch} | 0
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/files/{0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch => CVE-2022-35737.patch} (100%)

diff --git a/meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch b/meta/recipes-support/sqlite/files/CVE-2022-35737.patch
similarity index 100%
rename from meta/recipes-support/sqlite/files/0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch
rename to meta/recipes-support/sqlite/files/CVE-2022-35737.patch
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index b3d5029365..0a7a136c53 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
+           file://CVE-2022-35737.patch \
            file://CVE-2022-46908.patch \
            file://CVE-2023-36191.patch \
            file://CVE-2023-7104.patch \
-- 
2.34.1


