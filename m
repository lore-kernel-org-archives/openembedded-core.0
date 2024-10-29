Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE430D3A685
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:13 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.1939.1730228412722265624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XM+B0hWP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71ea2643545so4774010b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228412; x=1730833212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSYA5pBCqsLh2NjTC95ALLFTrafOVixZ39m1U67v5Q8=;
        b=XM+B0hWPVqssqHnyrcEoc0rB8ubj8WfzT0JiRbsNAd/Rv7O60cW4Xr6DzPfCk2IhdB
         1zdy+m5FhYlY2eNwQOYLdWe4t5uUtxGlLc9Yqp7grOvsVh02pDk2Mi/1ni1SIYZahU/K
         St7P7R6eRH4TcHt3iLYOlh0i0kIBZ/IC0OgCuQ7k24mnYv4MpZCF7Kj+D9wbSSaCVSKX
         IGf5xhGAGR8OEXOMsnS43rJZd3XhcejgWevpjp9vkHXso6FRW8iqL789fLQQC1AN25vg
         3fLRzVQMgelUQnd952mHCtE8XqHfAI2cmT3owknOOgElPM+j4soDC2DlFEhJRi/KJvps
         VD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228412; x=1730833212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSYA5pBCqsLh2NjTC95ALLFTrafOVixZ39m1U67v5Q8=;
        b=gNpOHocjW6HpnfcuWZn6c1aTsydsWYo13UV3tgG13+1FDdPBG7iarSQAbZP1tFOr3H
         4WP2yaYmeoAJklcRXL3eyy7MIt3zz6smtUnlUNH3BL3GAVgK7hkaO5IlXZVESWTWDdMq
         fRCDcftOCMIwRB6EpQhChkvtPb9T30wRBL+ZL+pkg5noOvde77zfkR/DZ7VL9XTDvV6M
         FaWP0AG0BpC9tUmLDQHvo7KDgYfRiDrdNn73/mGNWMV0nE4OlMDvwOAKDbX40TS7zFBq
         tXxv3f1jGDi7Y74PchLX9D9xtmBm9/AgWQJyBQHCwmQZjTCWN/h3ds8RbIclVQRvY19+
         1dbw==
X-Gm-Message-State: AOJu0YyBRymTpeZsdsNTs+k/wuW2ha7hoaA/JRmCbXhI1Iuy0ADvV7jJ
	HfWZdzuSoCk12JieAeTCGGOFiZyGodCWvtV31/OnMCSCUeM7UqNn8kpztfOkjSMpn0sctVd5Vs1
	8
X-Google-Smtp-Source: AGHT+IGt517hy3uIatRQ340WWLzAjokitccaO6Yxmy8DY5FFFvRL3UxIoEOqVHxBJ0zX0mQDLtzB3A==
X-Received: by 2002:a05:6a00:810:b0:71e:7af9:2d0f with SMTP id d2e1a72fcca58-7206306dff5mr19624382b3a.18.1730228411845;
        Tue, 29 Oct 2024 12:00:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/19] vim: Upgrade 9.1.0682 -> 9.1.0698
Date: Tue, 29 Oct 2024 11:59:40 -0700
Message-Id: <45ef5c80b1085d88d08679025bab13161c1f1fb2.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206517

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE-fix for CVE-2024-43790 and CVE-2024-43802

Changes between 9.1.0682 -> 9.1.0698
====================================
https://github.com/vim/vim/compare/v9.1.0682...v9.1.0698

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e530265415d93e3f49ec7874cf720aad18ab2e22)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f8ba37156a..11daa900d2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0682"
-SRCREV = "cb90ea9cba6f033fe141db0e466fb4117f28402b"
+PV .= ".0698"
+SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


