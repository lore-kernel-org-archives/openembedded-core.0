Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CE2C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:40:43 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.68010.1710175233151976018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 09:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xw7ji/kf;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609ed7ca444so32652057b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710175232; x=1710780032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyMrZRbIxkmPcTH+LAPTPA2ICxmkdE8AGd6G/sgGW0Y=;
        b=Xw7ji/kfd777HuWFDYIePJtxKllHZGnNq/mYi5dfnuTarQmlPjn9y1gjE4hB+bVHix
         5t9hrJg09o+LkOZnZHhL3Y7qv+ouhtyJBMM6cTlb6YLe88vnNy4e+P5jFGQkZJPQQioq
         nz7K6wNpsCbaLnpLfr7Ayf+7FENk1Nml16bnOI+MzlE1V+jYa6nMrzYjyvBfFTEr6aHv
         Cxa4EF86KLSAFi0d4I7LpdcK34AuIWfoNrF9lubC7tsbCzeefzM+wjNYK/gWn5I8OoUx
         q1OFV8suYoAE43fFQfrom0ijmqldsNHV4KfjW3bify1mdDm5dg6R75FDHpj6mMyAJeG5
         GAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710175232; x=1710780032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyMrZRbIxkmPcTH+LAPTPA2ICxmkdE8AGd6G/sgGW0Y=;
        b=Os4MrgzyQGOBwxWOxXWY0hAKKuOq7Oqn2aqGWtUjoFIESGYv82XFppjf78Snp+Swk7
         DUELNQDUnyyv7vNfmHywOsW8fEjBCduy1k1qCuZKm/T1wnLzE7a/L//grpq+YGjJKC+o
         AX+5XXFH/RUhACUO7v0Cv5Fbvsd7wvZ9JLvD6BzioO3xIfx89Q6R07GkbhibHiYq0omt
         H25PQGlfFf0pygVG5mjpdLjjZO0GW52nErlO8qqdy58FF2nhrzHNo4B1ikLlS6Vt2Ppo
         sJZ/iiTTyWtZ/vD8ZsJfWaKKgdyRwYStUrr7CSXd4BfnmHjT1e92FOsit619hS8W1BjB
         STGg==
X-Gm-Message-State: AOJu0YxLcGPSncx/gwZteqBWsOwPWr6xQkl1fW51rtgd1eOPts67+idN
	1U3aEzWm7EpTCZHtoXWoUp1FSRHII2UbtMCMvn4GRr4w851LHFhy8xzRxGKzzbk=
X-Google-Smtp-Source: AGHT+IHcCSCpX+j74WxwRiiyv0IRZDYdP/1Wpfh1QbcLGJggZE3dgYZcqEaWiP1qedEik2qLfea2+w==
X-Received: by 2002:a81:a210:0:b0:609:bab6:d70d with SMTP id w16-20020a81a210000000b00609bab6d70dmr5614575ywg.43.1710175232103;
        Mon, 11 Mar 2024 09:40:32 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id h14-20020a81b64e000000b00603eb201977sm1421672ywk.70.2024.03.11.09.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:40:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7][kirkstone] linux-yocto/5.15: update CVE exclusions
Date: Mon, 11 Mar 2024 12:40:22 -0400
Message-Id: <ff04ae5bafb410d17bc03c8d0dac2096028109de.1710175022.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710175022.git.bruce.ashfield@gmail.com>
References: <cover.1710175022.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 16:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196947

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_5.15.inc              | 197 +++++++++++++++++-
 1 file changed, 190 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index d33f2b3c7f..2e30efe6be 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-06 21:02:11.546853 for version 5.15.148
+# Generated at 2024-02-26 23:36:34.200936 for version 5.15.149
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.148"
+    this_version = "5.15.149"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -7433,6 +7433,99 @@ CVE_CHECK_IGNORE += "CVE-2023-5197"
 # cpe-stable-backport: Backported in 5.15.147
 CVE_CHECK_IGNORE += "CVE-2023-52340"
 
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52429"
+
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52433"
+
+# CVE-2023-52434 needs backporting (fixed from 6.7rc6)
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52435"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52436"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52438"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52439"
+
+# fixed-version: only affects 5.17rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52440"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-52441"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-52442"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52443"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52444"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52445"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52446"
+
+# CVE-2023-52447 needs backporting (fixed from 6.8rc1)
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52448"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52449"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52450"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52451"
+
+# CVE-2023-52452 needs backporting (fixed from 6.8rc1)
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52453"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52454"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52455"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52456"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52457"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52458"
+
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52459"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52460"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52461"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52462"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52463"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52464"
+
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5345"
 
@@ -7464,6 +7557,8 @@ CVE_CHECK_IGNORE += "CVE-2023-6200"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6240 has no known resolution
+
 # CVE-2023-6270 has no known resolution
 
 # CVE-2023-6356 has no known resolution
@@ -7511,7 +7606,8 @@ CVE_CHECK_IGNORE += "CVE-2023-7192"
 # fixed-version: only affects 6.5rc6 onwards
 CVE_CHECK_IGNORE += "CVE-2024-0193"
 
-# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-0340"
 
 # fixed-version: only affects 6.2rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2024-0443"
@@ -7549,22 +7645,109 @@ CVE_CHECK_IGNORE += "CVE-2024-0775"
 # cpe-stable-backport: Backported in 5.15.148
 CVE_CHECK_IGNORE += "CVE-2024-1085"
 
-# CVE-2024-1086 needs backporting (fixed from 6.8rc2)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-1086"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-1151"
+
+# CVE-2024-1312 needs backporting (fixed from 6.5rc4)
 
 # CVE-2024-21803 has no known resolution
 
 # CVE-2024-22099 has no known resolution
 
+# CVE-2024-22386 has no known resolution
+
 # cpe-stable-backport: Backported in 5.15.146
 CVE_CHECK_IGNORE += "CVE-2024-22705"
 
+# CVE-2024-23196 has no known resolution
+
 # CVE-2024-23307 has no known resolution
 
 # CVE-2024-23848 has no known resolution
 
-# CVE-2024-23849 has no known resolution
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23849"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23850"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23851"
+
+# CVE-2024-24855 needs backporting (fixed from 6.5rc2)
+
+# CVE-2024-24857 has no known resolution
+
+# CVE-2024-24858 has no known resolution
+
+# CVE-2024-24859 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-24860"
+
+# CVE-2024-24861 has no known resolution
+
+# CVE-2024-24864 has no known resolution
+
+# CVE-2024-25739 has no known resolution
+
+# CVE-2024-25740 has no known resolution
+
+# CVE-2024-25741 has no known resolution
+
+# CVE-2024-25744 needs backporting (fixed from 6.7rc5)
 
-# CVE-2024-23850 has no known resolution
+# fixed-version: only affects 6.5rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26581"
 
-# CVE-2024-23851 has no known resolution
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26582"
+
+# CVE-2024-26583 needs backporting (fixed from 6.8rc5)
+
+# CVE-2024-26584 needs backporting (fixed from 6.8rc5)
+
+# CVE-2024-26585 needs backporting (fixed from 6.8rc5)
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26586"
+
+# CVE-2024-26587 needs backporting (fixed from 6.8rc1)
+
+# CVE-2024-26588 needs backporting (fixed from 6.8rc1)
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26589"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26590"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26591"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26592"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26593"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26594"
+
+# CVE-2024-26595 needs backporting (fixed from 6.8rc1)
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26596"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26597"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26598"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26599"
 
-- 
2.39.2


