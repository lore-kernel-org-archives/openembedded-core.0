Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3C6C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.92301.1738600910016190687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OLZSuNty;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f796586so54740115e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600908; x=1739205708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2cXHjxH0VtNBUi4c3O56tf02Qbswxa2k0nHceDnZxE=;
        b=OLZSuNtyQhhrDDES/f8Y11BFb5rXqFD/eW5+V0pHLinIa0o+zYvoRpEuZsPJvj6m4P
         v7n7vJpi4HQ+uYpH8OfGjtSELp/qrwTMBuVvHaDKYFxFJ2vAQAtG7bn3ljB+wjqmXQXJ
         9K19GUgycr1s2JAc1QX833uZcjsmW0IaPfLPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600908; x=1739205708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2cXHjxH0VtNBUi4c3O56tf02Qbswxa2k0nHceDnZxE=;
        b=fz2farNg5RYvb06Hr05bTu7tg8G/3VlgqIaq4udkuI0WRrbjnyQJ+AeukgFp6wvpgF
         d5qmV0dt2e9bPIJzP8b93htpzSIcYUYk+3h3h4SV1mZuEchCLTljI2HbdtvUf9U8L2Ib
         I9iu6LergngjK4bKDtK+VfbvLRGuyvhfQnIV9dOY1ZdkrL9cFTvk4Twuw8uyqfF/30mV
         MKtXmqjOrK6ldT2QmfB+DI88KunawPCObZIaFMlHcOUYAKQ5wEynLpq1RLiyT44+dHub
         n4xPNptgDxAZT71AqsK28Wk1BY5Dom7rk0wed/DTKCn7GR6O8RannDlZy6J3vdCaAD2H
         t1EA==
X-Gm-Message-State: AOJu0Yws5tIO3ltcxgzVgPHyzpG55jJ2uW9x1ZDm0AU+nwllIfoAGbC1
	wzsvxUtd8dlXW9P5W/bTDk5qAdBVwdHQ3C4+9yrJFql2nbXAeNPY1uqMQyNV4oKxR6IbI/DKZlm
	D
X-Gm-Gg: ASbGncvllcdqrCs1ECvghcjr0CgPNoKVxDCu/U5aJLVylvYRz9O2mRKgtq89MJYIkZp
	wkQe6CGw3fRzaPN4h+bn4YBBatr4Bm4pkv0r6Y4/AwBxCzUA6XEFUVhvFctw+v1ivvqe3zqmvsN
	ItFDW08O+peNtuKuZd1XTwb1AoPUI7s8Gh1L5ArxMFzqK3mPA9NaOU8KsGsxsiuUZTyPhvkNsN9
	3EJE2/cEofjIX00AfvMBq2sEk61puYQnNZfQhwWhl1FBDwTeN9E90oPL6vrLOjskbY0bFlQ3ITI
	8RbNJlJ6hNXpMFNEpD9babbxwuKXiqma4W18l8Eq42Nv
X-Google-Smtp-Source: AGHT+IGviNthLpvJ/s/8Fbr7pqL5zx41aEsWk/YM+ZPnEqXFvK3h/TEpdfCjCl9JNj2cdyweRhkV0g==
X-Received: by 2002:a05:600c:3b94:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-438dc3cba35mr236912265e9.18.1738600908034;
        Mon, 03 Feb 2025 08:41:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/46] libslirp: upgrade 4.8.0 -> 4.9.0
Date: Mon,  3 Feb 2025 16:41:01 +0000
Message-ID: <20250203164130.3403325-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210690

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/slirp/libslirp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recipes-connectivity/slirp/libslirp_git.bb
index 05830ce8330..5b99a3168e1 100644
--- a/meta/recipes-connectivity/slirp/libslirp_git.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "ce314e39458223c2c42245fe536fbe1bcd94e9b1"
-PV = "4.8.0"
+SRCREV = "c32a8a1ccaae8490142e67e078336a95c5ffc956"
+PV = "4.9.0"
 S = "${WORKDIR}/git"
 
 DEPENDS = " \

