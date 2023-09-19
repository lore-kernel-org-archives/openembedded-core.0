Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64739CE79AA
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:46:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.22623.1695159988233651732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IU4grjvw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40473f1fe9fso64136315e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695159986; x=1695764786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrdueq8QVs+aWd6xbZq7emjNWkeQn5bpu9ZkC28y3EA=;
        b=IU4grjvwDYFyWKLbe/Ao9RI2gORUvg8Q1FFoj7GIKgjubaeqXQK4tb69VypARL8TTM
         KgEjM+sasIylZj37Cj5l9HI+tkoXirBIaHO73+qp4xheBGzy6P/nJG57MHMRtRSeukCB
         MbjSyr6W3Zs90RYA4i6HY5oe/3ZJTdroDqveI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159986; x=1695764786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrdueq8QVs+aWd6xbZq7emjNWkeQn5bpu9ZkC28y3EA=;
        b=JitfLvgWATNnVyNsXrbYiM8Jpz8TetfgiVRHF/XeO4GJhXvu6SFcCmzG166OCDBOOC
         juX4JASn6+bGkOnI0F5vukyP/9ZUTxuqOci7aVQQT1qv2NBTpUsB/rlCvum0MVN8odHI
         F9RSKHhzfUmvsatcJmlUhud9NKL6G1MYjPy0mK/i19kKcaxrniPTHYLdkSfCWxfbLUj2
         ox3ZWEghy5ymjU3jx85DU860aaKQ+nAgmXvS3Gl4Dw4DEHbHWkbYbgaYcNOC+oomFUFt
         VatAhsNrU87TjnHptgHFt6GM8qYy7NDnw1MUyUqhJVWbcoUoAh05tXE0HTqj8QeUyToV
         wDtw==
X-Gm-Message-State: AOJu0YyA2C75l1yHrreqOyC3O+18w8bYJhMpYm8bt7YvQzrmqNi/FJ6q
	dvr1CoeAMzG2ixgczmZ1JkudjEVJ7ADhC5LJ43Y=
X-Google-Smtp-Source: AGHT+IFHIQiL7rNFMRQ84bPh5XhaSFm04xf74ub3N3bDc/d42tVt+HPYpFs79nCVybC+I0Kz4p0K1w==
X-Received: by 2002:a5d:448e:0:b0:320:976:f940 with SMTP id j14-20020a5d448e000000b003200976f940mr671485wrq.13.1695159986560;
        Tue, 19 Sep 2023 14:46:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b0030fd03e3d25sm16657827wrt.75.2023.09.19.14.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:46:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] multilib: fix SSTATE_ARCHS for multilib usage
Date: Tue, 19 Sep 2023 22:46:20 +0100
Message-Id: <20230919214621.903967-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
References: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187882

When building multilibs, we need to inject the multilib sstate pkgarch
into SSTATE_ARCHS so the list forms a complete search path. Add a tweak
to do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 8a1a51aabad..673ae98fec1 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -13,6 +13,7 @@ python multilib_virtclass_handler () {
     localdata = bb.data.createCopy(e.data)
     localdata.delVar('TMPDIR')
     e.data.setVar('STAGING_KERNEL_DIR', localdata.getVar('STAGING_KERNEL_DIR'))
+    e.data.appendVar('SSTATE_ARCHS', " " + localdata.getVar('TUNE_PKGARCH'))
 
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
-- 
2.39.2


