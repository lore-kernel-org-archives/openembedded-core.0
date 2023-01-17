Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23604C38147
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 23:19:00 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.2329.1673997536201441152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 15:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j+P9cITF;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id v3so23213942pgh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 15:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SC1JwcTF+TZ78dkP/9MiKmdLERtj24VdI5kTOVsvjlo=;
        b=j+P9cITFIMVro19ztPd6seK4Kjl0D8OBueNXPJyPVxy6OgFcl3/k4n/HKdPlVjWCSv
         W/TsbQJbRXQHgvvZ2GUl4wGWq2Q6qjktCbRr2oHzfCsqhGKXvgU3H1nfzoATDzCfg4Zd
         B90lnEMLLyMiWzt3/Az7uWuLUiY+6OeIBIXP96/co/d66Vrf6lMKmO7tTydcoobwbI2y
         S4rhQ6E1gi/a4wZcN55YrflczDzW2TZ+60ja4xExJxc2fMSRuwIB7K/s1TSoBttM6NQo
         CiMtrL7qtmfarlPxBwHEiasEnLnEVnnGSbgPvngco/YaZ/Z+7/kcevUXEpWA7K5ohPFr
         enRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SC1JwcTF+TZ78dkP/9MiKmdLERtj24VdI5kTOVsvjlo=;
        b=aGF4d72fsTx+b6TFi/HN9ighgcTxKoz/O6Zz+4DXkUUhN1a5rvNi2UOfvHFGwzB5iv
         7UfY8nj8UN6/BEvUKFI/1UmSzNIRf1gyxQMykhXVy919Ku+rtDZa6/BhqdpDbqS4PW7Q
         bXz2vIU2dmPEu2GPkGPzM428W/vIUCHNho0VFjTm0Wu3fEO5YaAAPNAdKHmCzCXvsBQ/
         SMHRbP7m3qBorKckAEi1PynjSSRmfXaKNAQzEA0MAWtsZ2ax7l6pbrW/8dM/ypLLs8gt
         a44WXtBzQpfIygtVZQ2DAfYyPYT2aUwn5dxoHwUa7SVWb/twyvPzfZ3Dz44tj37WicOg
         UliA==
X-Gm-Message-State: AFqh2koch/t3tbRb6DcxtnfuJ7/F1G1D3bY0c4kVi380DArZlQ8lNeQ7
	2R7Iso9ntuCMSX27k1dMLWqtEYUwnY6nKA==
X-Google-Smtp-Source: AMrXdXtgEzGx9f5FQJCEM3BA/9aFHUOm62nV7LpT7WBg+TggnDxi3zpT8sTDh3tomejmj1osNCukuw==
X-Received: by 2002:a62:cd89:0:b0:58d:acf7:9648 with SMTP id o131-20020a62cd89000000b0058dacf79648mr4952006pfg.22.1673997537723;
        Tue, 17 Jan 2023 15:18:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id y15-20020aa7942f000000b0058d92d6e4ddsm5445717pfo.5.2023.01.17.15.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 15:18:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] musl-obstack: Update to 1.2.3
Date: Tue, 17 Jan 2023 15:18:53 -0800
Message-Id: <20230117231853.1511529-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117231853.1511529-1-raj.khem@gmail.com>
References: <20230117231853.1511529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 23:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176069

Switch to void-linux github handle, void-linux is the upstream anyway this brings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl-obstack.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 5c95ddbc94..4c71a141b2 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -8,9 +8,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d23e4eef8243efcaab6f0a438078932"
 SECTION = "libs"
 
-PV = "1.2"
-SRCREV = "466f773fe171da427e28be79b9cf48ccfddfb7e2"
-SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master;protocol=https"
+PV = "1.2.3"
+SRCREV = "f4385255be1615688c6a5f042277304d7ab288b1"
+SRC_URI = "git://github.com/void-linux/musl-obstack;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.39.0


