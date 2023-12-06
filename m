Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D00C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 23:36:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.63604.1701905799374494134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 15:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ArkME/bF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so4575145e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 15:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701905797; x=1702510597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/36sZuOjZS8FMwASHjY+YyUu03Kq5Vs1n/r9YUi4BgY=;
        b=ArkME/bFStR85eH8QD7qFfWNjAz2Va0J82U9S3z5kCW/lmuqHzjsY7F6QgMVCbD30m
         wqR4HbnMyoQ1El5bdnn379pwLmHUI/CPSGx2harxBmKjF/sNK4kRxADOGejBIq7UABdN
         0dGENdAgDEjSknCj5QqZsCGQfKNm0EvDVztwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701905797; x=1702510597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/36sZuOjZS8FMwASHjY+YyUu03Kq5Vs1n/r9YUi4BgY=;
        b=f7OSxk5f+II8H1uXLwGFZiBjmDe6620OLmp4OJ4DCbISPe3uWDLuH7fxA53zAD8+t4
         ZHdkoocjYrumvd65hFJR0Su5G22CW6Th6zKWn0GTBfJtD/ATtpnuZZ5jf1kI/6g8gNWu
         GSvOs7OIfgkICUzEouSUPQ+V6c4N9sby+qG0F2sXKePkrti6nWqJbFcZt+AIqGMKBQeW
         DcSA/Y16TyyTL7OrOtDC4/sqAUS2h5erKcfO6Fr231VrY1DevzqQbDrSODT+0zf59Bhv
         eh2gepthXVJ3bsZWCFij6hFq1ZvJGHn9wQNoFVlXpvr/XF3YV0/dkpPFlyNncEM8BvGE
         S9xg==
X-Gm-Message-State: AOJu0Yw+Z5321fO9iXSjTRm/tyeXL/beH7hWjGvL/Kb0z/THZlLDaBMC
	5OQn4AjHo/3rDWuG3ieGPNMH2TlYSj2xERsOlkc=
X-Google-Smtp-Source: AGHT+IEhAdon1JGEasKdpqREwisfgQ/RpAg/EHdtD4hADVcJPqECSykIDkK0W6RcoAyZHDWLJ8W5cA==
X-Received: by 2002:a05:600c:1e16:b0:40c:1e66:4dca with SMTP id ay22-20020a05600c1e1600b0040c1e664dcamr877177wmb.175.1701905797519;
        Wed, 06 Dec 2023 15:36:37 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:30b4:b44a:2cc6:3876])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d6987000000b003333fa3d043sm757738wru.12.2023.12.06.15.36.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 15:36:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate: Remove unneeded code from setscene_depvalid() related to useradd
Date: Wed,  6 Dec 2023 23:36:35 +0000
Message-Id: <20231206233635.1714521-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206233635.1714521-1-richard.purdie@linuxfoundation.org>
References: <20231206233635.1714521-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 23:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191939

With recent changes to runqueue in bitbake, this horrible hack is no longer needed
and we can drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 5b27a1f0f98..95d5803f17d 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1117,11 +1117,6 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
         if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
             continue
 
-        # This is due to the [depends] in useradd.bbclass complicating matters
-        # The logic *is* reversed here due to the way hard setscene dependencies are injected
-        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
-            continue
-
         # Consider sysroot depending on sysroot tasks
         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
             # Allow excluding certain recursive dependencies. If a recipe needs it should add a
-- 
2.39.2


