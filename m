Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.6402.1623744769248604492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ux3nDk4O;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id my49so21092426ejc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yTJRI4E0AH1xpYfWfliEvXiTHK/3aAwEQfJNc9YwPZM=;
        b=ux3nDk4O3NkAuYOgO6rW8A6kzpAunhqRftdC+0b4CCZdNr9sVgGSAHbb1G4/IwUeNs
         1aCvNVZCyAF5ET387RnAF4EXtp6Ekyf2aPIDZzC/AIvY1wCWW+Q5pCPiDbHcnjyJijqM
         XbMnu3ci+QsIsLcmjpGfJinOrqtdlX6WDYn2L2+jYY1ABnl5H8Fol4Gq3nwxT83RIL5I
         M1UrpLWGRWWqOrGGTqKJjQJERxWIblVMi9J4W1c2yMR4lBBv5ONsVY27XwY7mhBq1Ueo
         7CXpI/o9WJLKBKf5RYno4FYax5zAdKHRkJzjwEU1L5KfcayHrb4CgW6tEBgiW9sDFLes
         Jtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yTJRI4E0AH1xpYfWfliEvXiTHK/3aAwEQfJNc9YwPZM=;
        b=mOWtiwRb7WvyJgSSLAQyj3ANLZ2B0F/2xqn7GWgcxgLMKROU5dJxqRV14sgVFFMNZs
         XEV4JgaeSwtQS8RJ8kufZF9n4z7BVoRvpuClpZMXF4r/cmCQNQ/RC959UpnYNgl8LKSE
         +hbrw3xHQz1rMDYu6UWSs3jODqmk/rU9iU7tYqGAwztYXGoMvTwVxApD11cVQUhtMezv
         7nbV+QT5pjT8jLF8AtPkrPLG7mXAqg2vGygl8WDehLNo4VTwmIyUzot52IU1q+nSSvuA
         Q1cycc4z6YKNHinjJtsaniOH080A7NBnnNC2s9FvGXIvCDkJw46VUNPPxWkPyHp9Q34g
         MH3w==
X-Gm-Message-State: AOAM530ppASYiIkkQGAcpvbo2bOUrML7D2m87IM2V7Po9twvUbc02cR5
	sh51OnaHu7iJmwlAsk3ykrPg70iqDyUx3g==
X-Google-Smtp-Source: ABdhPJxtlPiHEshFcj5OL1ebDx+tiEyoImDY7KSirDKMe8+KgO5tDH1iIEfDb9eVehXVM+JAl2poKw==
X-Received: by 2002:a17:907:35d1:: with SMTP id ap17mr20291271ejc.79.1623744767687;
        Tue, 15 Jun 2021 01:12:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/31] bitbake.conf: enable debuginfod in native/nativesdk
Date: Tue, 15 Jun 2021 10:12:13 +0200
Message-Id: <20210615081240.1734087-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was an oversight when the distro feature was introduced.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f451ba6a47..160abf40ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -845,8 +845,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.31.1

