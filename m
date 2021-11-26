Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B47C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:38 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.20173.1637901397380469061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o7mBu1mW;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id f65so7100664pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EjQDhFGcKsBIHzqkZSk1Rq6UQYrfPu/SBJl/wGMq3q4=;
        b=o7mBu1mWvmzniYAQycYy4olKvLEvkz3zclwZV5hkcsXlJZKTVLdGuEmbz135X/Btwa
         DRUZ2IVj5uF2OxYND9PokxohOKEypZao4pdEm/wDbbrNhFm5JdrVQIQRaLsAmtEvQGK7
         WLtSg5eA88nYkDaPPJyRBzY6dBJ6a8AS/Kzlu5J5vDLolE30hr0DMQUbWiegorO+to11
         vhRVZ+Qo1KyNaaFsoALcnEPI+mIBsKwhjD/T+9/ddzeHZoJ0nc3aqwRJZ9EwTu5o8WYE
         bk3VCLLLyW8yoOAqyS6rCgifcLmFVodzJKXzM+6bCP/Fu5umdhtBZafrk26bTCwzieO6
         1HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EjQDhFGcKsBIHzqkZSk1Rq6UQYrfPu/SBJl/wGMq3q4=;
        b=G8FEWKhTyCiE9yfBl62jkkyMGpJ2GXgcKUHwpzrTd5Fp7NrV0szrQQoFAMouuZa5yM
         kqfLK76/DgBoQ2wqGj/yhEPDTrScPBtduUzTzK2qgu2+UYu4l75XQjnTkdaVK9kF7FZC
         8TXYCA/vIZD6c3zJTDv48kw9s2ng477Hz1VFY+QPMEkJ9ABy9SBkHLOORVnkUN4qpF47
         1c63kdduttkPtG5qgx4oSeBN5x5CvMEEFJNTDPzqSVQ9+Dg/9O7mSDfqBZedMHPrBqwt
         SjOkiR5uZLOWvQSRLr96/eNG/33m9pEdYSVdSf4ShKR5sUa+Ldq12L1LShZh7fE+mTKb
         RbMA==
X-Gm-Message-State: AOAM532QVwlyYMN5oV3GxOw/BrfGBy3bT+5dqqrNV7zmNbCcMFujSPti
	m9jCA6cIvyF0czBteKCxtkO15sGnWic=
X-Google-Smtp-Source: 
 ABdhPJzrHlGVJBrUJERXGa/JlqWiUcMG9mkvmUwVirLZJJRMxwfjVxdL0zCJWGj17dEEiX1xLB9zMg==
X-Received: by 2002:a05:6a00:acc:b0:44b:ff29:621b with SMTP id
 c12-20020a056a000acc00b0044bff29621bmr18512105pfl.32.1637901396714;
        Thu, 25 Nov 2021 20:36:36 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 26/26] rootfs_rpm.bbclass: distutils -> sysconfig module
Date: Thu, 25 Nov 2021 20:36:05 -0800
Message-Id: 
 <ae89d966b2148c672915cbebe708e6474101579d.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158822

Change a comment to reference our custom changes to the
sysconfig module, as dnf no longer uses distutils.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/rootfs_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 3d8d784f792..bec4d63ed6c 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -4,7 +4,7 @@
 
 ROOTFS_PKGMANAGE = "rpm dnf"
 
-# dnf is using our custom distutils, and so will fail without these
+# dnf is using our custom sysconfig module, and so will fail without these
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-- 
2.30.2


