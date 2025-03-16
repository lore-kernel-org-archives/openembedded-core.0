Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C74EC35FF6
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.31786.1742141551500013523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YNZrM+P4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43948021a45so13856125e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141549; x=1742746349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9IVUR8b5Qx0lQi50xOOop/ADvBYR+1yQsE1Cu8pm+A=;
        b=YNZrM+P4w4hyIzkvruPEFVcHLpR0M78uRGqF0oyRfbzXdFVDIfb8okC0DYc2ZAqmhK
         nCl5I2M320/HjqHCZV02dl4A9Kcic/x8OBZMwDhcWyMigGE10Ie624Dcgi8IJCXuXdL4
         HG8lc9m6m/stNuN3/YO4Lm936+eRETR6e8zwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141549; x=1742746349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9IVUR8b5Qx0lQi50xOOop/ADvBYR+1yQsE1Cu8pm+A=;
        b=fvfPnSBGi9RBYuAyxgFmBiQuvWow0EvdEWd9B+UwIqQiV30wMroO8yvZw98sN5LX2y
         vl8VpZlCoHcdNlfFiykbiqwcR3KLiI1zyw3ij6MfjVPMr5rqGV9k2h+dcEyh73ghgC0W
         +lq8ChGDO1sXIYOWvSqkiQbcrq0ybfmzblWD9FuT0om88Sf2U8fogDyCFeMVQEHmWOpc
         so6bvrQxPnA4grsVb8agG/IdWHxSXFNkZpqd2BjlR5NnG1zbcIL+WJU3Yoedc5MpnuXA
         lSAoGsNaD9G1G+E8sKjTYy8766oCX1fPNQ/MtIBzwWwpfbObXsFa3vLV5TxxromhKFge
         JeHw==
X-Gm-Message-State: AOJu0Yxl1BPLeCV6twuQk2hpybsqwIfkAdh/zVwR6KAl7ZgBm8nVzIXF
	JFc3c66xduAQ/hnvhdInP9Cf5+gYA1i2D4aqfnp7+oLyo3onr2CuotwPBe5twHKCgC6nAZcPIU+
	T
X-Gm-Gg: ASbGncuYQlAFghIYBYrhWev0RsTFqb4f9q0DsfV3egS0J0A3ET08LyQybSfXBToQmjm
	GFth1IXZ7vVXNkwBeuS0zCsVzb4U4QPzVyCOH2yu6AsUkdLG2jX8m58t+iT4mKFrJ1zMzTkgE9b
	JvqqvIAr5bRue5kRnyP9vzYyFqnjM9yGa3G26Awvd5VDVOd9Idk6JcXJN/Iv/ixost+e3eswQBj
	i5EwsccFkVfZxpPMsRnC58I86XNPHCrXKhiJKgEpH4R/ydiR95CdNf5M5KUyDmjW9jf2s9OmyZX
	s0lbr0JGRxQariajbuSVVZfG4D72deOpHbcD2Ryx3yOc9C8ERwP8NG6JbUR4qgutX3NWi4QmKvS
	OuxLhSJ/S
X-Google-Smtp-Source: AGHT+IER1ToU1kz/8n3U2aUvi+vyPRq32/cCsT95ziU9WxQq7EA6rKA3K6OB0SwbPuNm+8/zSicAnA==
X-Received: by 2002:a05:600c:190e:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43d1ec808ebmr108045545e9.13.1742141549571;
        Sun, 16 Mar 2025 09:12:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/43] mmc-utils: upgrade to latest revision
Date: Sun, 16 Mar 2025 16:11:40 +0000
Message-ID: <20250316161209.3629986-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213017

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 9f9cc967c0d..a5e9d53deb8 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "67b9be6429d7b01e9e6057ead013e7049e34b273"
+SRCREV = "2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa"
 
 PV = "0.1+git"
 

