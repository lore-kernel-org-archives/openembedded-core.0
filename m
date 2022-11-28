Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE11C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 23:47:13 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.135603.1669679230302490241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 15:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HTblp8CF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id h11so12236289wrw.13
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 15:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nelq5dBM41otFFu+dZeTT9sRlvnFtEq+x5JmA3rsKkw=;
        b=HTblp8CFt7RudSZDxx9JzzEklY3KRrd2jGAVQkfEd6kZzKcSoa6Ws+feqwSQdRNWJa
         RVMwlC5NBwGGypYWEZbQJjLXHpf6s0b/L3MFr0ixgmWWEtW7Wc6Z2koVMAXYPc3CF20P
         8Vit1E9dvYtif7t9zg9at/MEowqRjfeCag2w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nelq5dBM41otFFu+dZeTT9sRlvnFtEq+x5JmA3rsKkw=;
        b=Y/VjcV7jKRGiMiYi15ojMKe0eeHUxWyHuzbpqKvB77KtBMMhSr36kGee1YqC5UMwfM
         nx95TMKVGM3o0R1K1RwZm0PISlQOdngp1m9j0VjpRdIjw483ynSdompDEUNJgtCAlh1M
         135L5vrFpA/7SnjzMOzuV0awgRXS/rjenO0m9156IkP0Hd5tbYh7F52dX5tL7+dTyH00
         6MfK81KDhfoo7FT47hkIHjr/OgqBubNqGl+bMHpz8mJgjn+p29Z0ru5SKWpUV0lzcSTD
         HptsaRyJ6kLoEc5F78eqKSsiTaRP/gvSS+whzd6XzQm0gDTvgYF5eHuTyY7YAMAP2pOG
         e8OQ==
X-Gm-Message-State: ANoB5pn7kcufG3ti3M0MKm5TJQhGFwZoDNziViGTdecDa6gbNc6wWNG5
	MYxIpEHGDaap8VdMlDsB+XreKMXgBd9Wjw==
X-Google-Smtp-Source: AA0mqf6zUD4MwU4O6hnnrhCFUZABhjK3RiUbpnPzKf5a9+IlZkBOjE/4iJkzm6teEO9SFAZ1itP+tg==
X-Received: by 2002:a5d:6b8d:0:b0:236:4c14:4e4c with SMTP id n13-20020a5d6b8d000000b002364c144e4cmr33127934wrx.634.1669679228388;
        Mon, 28 Nov 2022 15:47:08 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:426:d29f:e451:e2dd])
        by smtp.gmail.com with ESMTPSA id s18-20020adfea92000000b0023677e1157fsm12005070wrm.56.2022.11.28.15.47.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 15:47:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Simplify CACHE setting
Date: Mon, 28 Nov 2022 23:47:05 +0000
Message-Id: <20221128234705.751860-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 23:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173953

A long time ago the bitbake cache didn't use hashes in it's filename and
hence values such as MACHINE were needed in the path to the cache file
so that when switching MACHINE, a new cache wasn't always parsed.

Times have moved on, we have a hash which represents the configuration
and the caches are reused if there is an existing hash that matches.

This means the values added to CACHE are obsolete and not needed,
we can drop them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a1f0f624e9c..d47568157a7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -392,7 +392,7 @@ TCLIBC ??= "glibc"
 TC_CXX_RUNTIME ??= "gnu"
 TMPDIR ?= "${TOPDIR}/tmp"
 
-CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
+CACHE = "${TMPDIR}/cache"
 # The persistent cache should be shared by all builds
 PERSISTENT_DIR = "${TOPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
-- 
2.34.1


