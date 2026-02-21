Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC239C61DBC
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14949.1771650637481475970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DR3s7d1G;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362507f396so2682465f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650635; x=1772255435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qp++TM/PJWS1Amcuamd4PKGqYeNWD7u0wOhol/5Jgk=;
        b=DR3s7d1G8jW/bnKthPvqkYecsJDX4iDHLrBay0eYgcy8YqcFS0xh/19R/RC6kEBL6T
         1a9W33bg4/C+VlTT9J1IwalRlNwe4CgYXeZ3B+9+UkG5AUMuxmCrf2fSbKeLXtlcjzRq
         KQ6ugz0j+9fzJ0WXAqhUkjcM5ZeOQGUBtqiVzNR5Cf6trNhY1Gitd1b+vAdMhKm32nQu
         aMgMeI+nFGxzQpN4JXl3xFxYq7kpW3v0r3IG3vNDhjS4Kot2fQ6lGJnZgf9gd/vbkNq1
         bLojU2wfUl59P91uXgr62WM/SoYpp5d6Xun/XujJcTzBLYIbXRADare9RPWtR+Coys5y
         IRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650635; x=1772255435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Qp++TM/PJWS1Amcuamd4PKGqYeNWD7u0wOhol/5Jgk=;
        b=rMo8zUcLLME26l+51SNhEW/6NqeIABG4qVvV3OUtAEQjVnDINoWFmIJWCmgy7+STBV
         sZzpx51xdje5jR0vmITnMPfWJ4kKk6yKkejhvSgYKFdyMOdj/IFT5yYusRBOevYrYIzF
         yt0Qc1GTwYk+gdUC9fKS2ajyKJpHRBU6SoebxPKZUvJjK+zYrbbxW0UN2dRaPK4xpdDw
         4kSbKnLUdeLh6dGwjHxqpM9b16x5JxVujTuPn0FvwrnExcCO8WpW4Hylpy409Bur87eB
         OC5Cn/Zt01lSrlwiNWz86KfS11kEGszjPY8HgSKWDbCjU0qRyWM2Tqi4SjC1NJQJYdB1
         iO+A==
X-Gm-Message-State: AOJu0Yy4lximbBnASV+/VuMI6ZYjeDGkxjoqZELiGkCKnHo//PrWpuD7
	Gzugf/geFQlBfT67Hz9Uk9o/mEiueujVsMvqYmbRZlBr4FNBHuXkPIAvVnOjxA==
X-Gm-Gg: AZuq6aKofX5LpyRUzt8BCezdbe9BiwEG5m6ILtpHd8txxBssKqwC8qJcjvbKOeNz1FC
	Tr5V9UFa8eKgNPKcWUhqc35yZWK3NO/A05nDLSWwy0yrnaSUrvL/dK2/t6W4r7eiohq85FzrBT5
	zilPhEtmFh9KR3TMbif28GSQ3+AKwjUDuvsMQw0wQ1jP7UTN1BSzHyHDd2l69Iihx8/uZCG729T
	ToLGfBt1zTVYgOhmG5qG5c0xxgGOkIuUQA0F+97FzaYSFXahLpxMpyzvyK26ieYrOk/qKfj//x7
	3U34DQ/NirYFGjBIsigq3kSlEOJNhrylgoOvKqzyclX9iW0zGNoMvMZx050OK3Bon0j13BumkUQ
	P32MrUKW87dXfzOz+YzoHDy5OuKUk/VYvdIcimmvwU6bvLd/CCu/9BiQcFKJe/YGcIZ/o3Sc7k3
	ZpoWDUjUyx0waZszUhejGWNoWgXZdIArm3cr4=
X-Received: by 2002:a05:6000:288e:b0:437:6b73:ffc8 with SMTP id ffacd0b85a97d-4396f1544f4mr3807016f8f.2.1771650635468;
        Fri, 20 Feb 2026 21:10:35 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:34 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 15/18] spdx-common: Declare SPDX_FORCE_*_SCOPE override variables
Date: Sat, 21 Feb 2026 06:10:03 +0100
Message-ID: <20260221051006.335141-16-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231595

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add bbclass variable declarations for SPDX_FORCE_BUILD_SCOPE,
SPDX_FORCE_TEST_SCOPE, and SPDX_FORCE_RUNTIME_SCOPE. These optional
variables allow recipes to override the automatic lifecycle scope
classification for dependency relationships.

The scope classification code in spdx30_tasks.py already handles these
variables gracefully when unset. These declarations provide discoverability
and documentation for users who need to correct edge cases in automatic
scope detection.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 81c61e10dc..99f0704caf 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -52,6 +52,19 @@ SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
     Example: SPDX_CONCLUDED_LICENSE = 'MIT & Apache-2.0' or \
     SPDX_CONCLUDED_LICENSE:${PN} = 'MIT & Apache-2.0'"
 
+# Lifecycle scope override variables for dependency classification
+SPDX_FORCE_BUILD_SCOPE ??= ""
+SPDX_FORCE_BUILD_SCOPE[doc] = "Space-separated list of recipe names to force \
+    into build scope, overriding automatic dependency classification."
+
+SPDX_FORCE_TEST_SCOPE ??= ""
+SPDX_FORCE_TEST_SCOPE[doc] = "Space-separated list of recipe names to force \
+    into test scope. By default, test dependencies are classified as build."
+
+SPDX_FORCE_RUNTIME_SCOPE ??= ""
+SPDX_FORCE_RUNTIME_SCOPE[doc] = "Space-separated list of recipe names to force \
+    into runtime scope, overriding automatic dependency classification."
+
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
 SPDX_FILES_INCLUDED ??= "all"
-- 
2.53.0


