Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.8130.1630503934274292458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cSaP3hL1;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id i3-20020a056830210300b0051af5666070so3508003otc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJmzmzI0ZS9xlC4gsKrgwnE0cdhAhylmttUzoPY1H+c=;
        b=cSaP3hL1KN/JgYWWVo68cQtlQ1TiQ58nBmjg9cJapLEUED52b+p3OIje3GVywlPtPN
         Pa1vI4ufGWLmJVXW3p3dFFwIAqWSc/8dlSs14T1ug00cvoS5/zAR7odigJi6r38yiQwI
         0UanHQ1uYlZrNEFeudjMO+ql1qGzoAZZ6SQx0fONtIEWSayBUaunVTiEGvYNXsRgc6Y8
         g2c+kvcHXT2ho4I7qxNC+yQbYLLyKm4bWvbm4C/5jhJTRxGSt4PS5HNPZc672AjRjCQy
         OA5I0PK9ItqKXo9pepj+1osAHd4VBwkww38CO8mpJudmwFKMXGmAVu46oQJu7LA1EQqe
         9/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJmzmzI0ZS9xlC4gsKrgwnE0cdhAhylmttUzoPY1H+c=;
        b=sQJCtzFpWetUfJWWO61jY59DhwdHukocRl13JBMxjef+gu6mfcxry0UoVe6BK0Spsp
         p2ten4ocZcciQ79JFjxFnHqZvd74g66ymylQUqJchwOLEs5vggJlUBmpYWjNEZjM3EwS
         pNb2MyD9sO/esKN9BdOMZ0RuRyzTpG2PpH9XoIVMg4agq8HCsmoud7ZX7SwnpQcCDtah
         oX08hHmYApjJBvx8GQqWhf6b8NFrv1TOKftbXo2xrDJPACoXyOq15tJX7/J733vvMfn8
         qhNeaeQa8oNOBwoxWktaZIidyMmwjbjsACftFpM0WXV6aVEIh60PXhvVbD7kO0QB7f9W
         j5cQ==
X-Gm-Message-State: AOAM5314liV5/eyB2ZyZUzyKOeZOhJ7DxJ6KiTUdu+N2NIMwqNaocPrQ
	d+d0AyQ8S8g9yaJG0qkiuJ6jvDVwdrs=
X-Google-Smtp-Source: ABdhPJyBwHHp2wm0bnbWDt694tm9BfL+MK/HqDgKD+qUKlyv2S+AHuKysH+mvAO2ofnw0z6SqaA2LQ==
X-Received: by 2002:a9d:a12:: with SMTP id 18mr29317348otg.252.1630503933362;
        Wed, 01 Sep 2021 06:45:33 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:33 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 15/31] classes/create-spdx: Collect all task dependencies
Date: Wed,  1 Sep 2021 08:44:54 -0500
Message-Id: <20210901134510.29561-16-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop filtering the runtime dependencies based on do_create_sdpx (makes
it only pick up things in DEPENDS) and instead include all task
dependencies that are not the current PN. This allows other dependency
methods to be picked up correctly, for example the dependency on the
kernel used by kernel modules.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index f72b7b762e..db1d1756c9 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -528,8 +528,7 @@ def collect_package_providers(d):
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     deps = sorted(set(
-        dep[0] for dep in taskdepdata.values() if
-            dep[1] == "do_create_spdx" and dep[0] != d.getVar("PN")
+        dep[0] for dep in taskdepdata.values() if dep[0] != d.getVar("PN")
     ))
     deps.append(d.getVar("PN"))
 
-- 
2.32.0

