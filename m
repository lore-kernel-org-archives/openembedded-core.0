Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F57C4167D
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:54 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.963.1650650733998577284
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 11:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rp3Rig7x;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id b15so8700369pfm.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtiR2HbxFJmv3/xM98I6llOfzNdA5rqLQBlzy+iTVpA=;
        b=Rp3Rig7x6WuodsJSUe+6FxQ+SCz5nmhQ0gACr1tzaln0z7tr95FNiRVIqWk71pkY1O
         pOMeyfYvqGyU3XFvFTGzki14UaoosegcycSf09f9W8VziDr66qmu2eEk+walFHmBCV53
         /0BqIzOppkXQtaYZP4LWiowA53ZsUUS4PqLLO5p9vB1VQbx0xuvL7b30taz3Eo1/dmkP
         YxcJfVcXLAymK0vvkhh6v5NmnmSib24mLLhQdgxVU7dUaHejHs+8N97IdwbYUB5EhdNy
         Lk87ZKQYSSDo21sxMuMdKQ7FoIu1wIqNpzycJKAYwHrKRHz/L5VqmF3AKpgff7GlUfT4
         AIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtiR2HbxFJmv3/xM98I6llOfzNdA5rqLQBlzy+iTVpA=;
        b=s0+On0+kiJHP4sEJglfhHkj52YYdRI8ZVELoy16XLdlF08mGTbpVAAu+DX+55xfL8K
         Az0DHmxq1K+LxNnbah4YTYmbR/zx4z1nb4JeCVR4HP5bwfAKpAvKChYKVn7ifALctpJ+
         GPnpggVNmBMB+5/5EVXWGJMPaGVvXUjCwI70VWwpMUXz34Oulpiy00JmqRWO0tCU7hC+
         6fERzT+EsqmzbYeQhCV8e6Y+WGdmvK1il4Hl4KYxd1Ibmeidumi88UbmMazxI/dr31dj
         LnFP54UOt6s8pNU/0OPZ1KQT/a2+cCDH7Zjg0n0OKwLpa+DGpcvJll7fDViXkb9jHnmt
         64pw==
X-Gm-Message-State: AOAM532WkTXya9NTrNW3GHCliw+D6gRWhK5+/LyycujSJYI+Qvr5Rlgt
	gR6hYAo8x8zvrQopc47/HWQH04gw6gEFtA==
X-Google-Smtp-Source: 
 ABdhPJzQFj6CfgdKM8FE1ovT151BvKJISCvyihvcDlZCro+Nyxgb4rnK/QkvI4QKPXqG0hoPnmaoMw==
X-Received: by 2002:a63:fd07:0:b0:3aa:1cd9:194f with SMTP id
 d7-20020a63fd07000000b003aa1cd9194fmr4903779pgh.509.1650650733059;
        Fri, 22 Apr 2022 11:05:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b004fdaae08497sm3101989pfe.28.2022.04.22.11.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 11:05:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libc-glibc: Use libxcrypt to provide virtual/crypt
Date: Fri, 22 Apr 2022 11:05:30 -0700
Message-Id: <20220422180530.2398801-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 19:12:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164799

Fixes
NOTE: Multiple providers are available for virtual/crypt (libxcrypt, musl)
Consider defining a PREFERRED_PROVIDER entry to match virtual/crypt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-glibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index f4855dce111..f48d16939e8 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
 PREFERRED_PROVIDER_virtual/libc ?= "glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/libc-locale ?= "glibc-locale"
+PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-- 
2.36.0


