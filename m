Return-Path: <andriy.danylovskyy@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34426C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 09:06:46 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.26176.1664183195861646706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 02:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=LL0Y0EaS;
 spf=pass (domain: streamunlimited.com, ip: 209.85.218.43,
 mailfrom: andriy.danylovskyy@streamunlimited.com)
Received: by mail-ej1-f43.google.com with SMTP id r18so12573783eja.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/LmQ+DtP+Rbz0GwbKDm432MEItmmqwOkKytmo0uViQA=;
        b=LL0Y0EaSi94xOmWr6nqmtVsgi7gBLwXhjCXOQNoniIlEn2tZECaYfENiyJXCSrc3k4
         TyORirBo+BLXCC7oWTW9qj/mRtvlvtIQqPD23ZTFBDJiIKedEWw2LCoKIXRHkXGJKxap
         2sQFkoY8MG+U2oZWgKo9H7ypVEV/kd+dBRG+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/LmQ+DtP+Rbz0GwbKDm432MEItmmqwOkKytmo0uViQA=;
        b=mXqE+VMWoBddyt7xIJ1e6Rq02j215A76JDZpfQ3jQDYc8Jr1CthGmwoarFlUHVlOQE
         dtdH6h+1RLws4vsIdaBmIUhbM7h/sCg8zKnF7PmHRC8DFjwHAnw+UT2F96XcXyxIo7R9
         9x2XJyKQZ1690TQVqT74PZDtD6/8YCIs20LepLBd5COJ0AV8olkSBiKy/a/293FZKHSr
         eTvg76FHPKZpWJRmm3TpsE5mZ8TwhjJwoIpNe+K9/oEwiEl3h47W8tfUOwCBn+e/+k8O
         kU5y5VnWzqAXBIZ3KnCB1VgexlwjxPvNUC3QtNd2QcKRdzmMolGvzqNfXQTs36r9k0VA
         srBQ==
X-Gm-Message-State: ACrzQf3YBMVpEr3bbVDbEly1zjJjO0vb6BhzD49dsmQkWdJgRCVJyZyd
	ZJwROSVCR5LYbqQi7zIT989WErtBwRA+sw==
X-Google-Smtp-Source: 
 AMsMyM6t5ylQnwKZEO3oVjq6bwXIsd1DZXd6EOLuw4ZjzqkTytHD1cYb/dbCBb5cNDSGOlPUS2E10g==
X-Received: by 2002:a17:907:7e93:b0:782:d87a:b6d7 with SMTP id
 qb19-20020a1709077e9300b00782d87ab6d7mr10459080ejc.326.1664183194035;
        Mon, 26 Sep 2022 02:06:34 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a170906399100b0072f4f4dc038sm7891455eje.42.2022.09.26.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 02:06:33 -0700 (PDT)
From: Andriy Danylovskyy <andriy.danylovskyy@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Cc: Andriy Danylovskyy <andriy.danylovskyy@streamunlimited.com>
Subject: [PATCH] classes/patch: move QUILT_PC for patching consistency
Date: Mon, 26 Sep 2022 11:06:04 +0200
Message-Id: <20220926090604.23397-1-andriy.danylovskyy@streamunlimited.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 09:06:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171054

This will move the quilt cache from the default location '$S/.pc' to
'$S/patches/.pc', to ensure source invalidation always wipes it out,
together with all patches.

Recipes which set $S to $WORKDIR are susceptible to a weird issue: if
a source file is patched by quilt (a .bbappend adds a patch), updates
to it are ignored by incremental builds, the first obsolete version is
picked again and again. This is because quilt keeps its own cache in
'$S/.pc', and this one survives source invalidation on do_unpack.

This is a follow-up for a56fb90dc380 and 42a513489dc6

Signed-off-by: Andriy Danylovskyy <andriy.danylovskyy@streamunlimited.com>
---
 meta/classes-global/patch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.bbclass
index e3157c7b18..6fcac18d9c 100644
--- a/meta/classes-global/patch.bbclass
+++ b/meta/classes-global/patch.bbclass
@@ -5,6 +5,9 @@
 # Point to an empty file so any user's custom settings don't break things
 QUILTRCFILE ?= "${STAGING_ETCDIR_NATIVE}/quiltrc"
 
+# Move quilt's cache to ensure it always gets removed together with "patches"
+export QUILT_PC = "${S}/patches/.pc"
+
 PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
 # There is a bug in patch 2.7.3 and earlier where index lines
-- 
2.17.1


