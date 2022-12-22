Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DBFC001B2
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 15:03:51 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.47442.1671721429601542742
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 07:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IoHj/PRz;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id x22so5495560ejs.11
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 07:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+uECyM4VnBx+ZGQWNgBICW/S6jjEk0fyilP9oXlh2Oc=;
        b=IoHj/PRzlLyNn0Ekv3Gh0AiMU8zjSYGWrmo6R03q7sbgbHsq09TAHtcR6zgQbhi+Af
         SfMoZnQmKi5aaCDanTPCtVpbV3BcUyaIqnoJVHR9tWDYApXAwWUHwM8GVHfTENIzWwa1
         CZSHvvV3AmBUebz3OLjA63o3hj/qD0HIw0t1QLsUhDtLfi/pcZHbki9yxgV26+9eeM/T
         YgXR2EeZ/Wp9eYL1k9P9mNjwX3ltlG5W4gyMwZh51Vf9H9AOJT98athu5fyXHgp2/gLJ
         3Qn5zRPNtqlqMtE8zRPBaQK63Mmd4EFVuG8kM1ISdxtK1NkJtpStr2pG/gEaZhNBOlzd
         gbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uECyM4VnBx+ZGQWNgBICW/S6jjEk0fyilP9oXlh2Oc=;
        b=hgiObGaEgHYQ8T49iyFb2JP8Z5KvQ7mt9iW4h3eeZ82mBYNxEjjFkHHQxUZjs9PcxK
         4/5wfOi/l4y/PEU81e8KSZySgrk337QA68yw01vtGMCQh5Q/+iGt8f7xDzVG7GbnXPy9
         UFcAUYxzH7ZdXbU5WWps3D/8J+YjA91ZPEUrK7O1X38oOT5x1ah+QWLFV8JXOE37hYeg
         5qgJzvehGfcIjy8+okN1bwnOCmHRl9NNvsrrOSePPBnEfVOZ4xPU5+XuaJZGeZFvBUPI
         80M9X34oEd54w+EWvOAd65nEJV0YAjABO/fLh7nj7aTiRSaYb5lhA3H4MDmvWqLONBBl
         n7Tw==
X-Gm-Message-State: AFqh2kpa0wGso0L1jdDbqPcPJgHMsckeajsGav3nf0yAQTQK11DkcvMp
	tNNIPO+4Rxjg1nuqTE/P2EhuTATUs4vO0A==
X-Google-Smtp-Source: AMrXdXt7FGs3J4235XnuKQHukx0BAfN5HfBU2lv5XVJZX1NtnO8wFUwDqjzdNSv7dSjoy+BskYMvog==
X-Received: by 2002:a17:907:9a98:b0:7c1:d4c:f08c with SMTP id km24-20020a1709079a9800b007c10d4cf08cmr4689253ejc.4.1671721427827;
        Thu, 22 Dec 2022 07:03:47 -0800 (PST)
Received: from slackware.local (dslb-002-205-242-162.002.205.pools.vodafone-ip.de. [2.205.242.162])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906a18500b0082ea03c395esm335142ejy.74.2022.12.22.07.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 07:03:47 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [langdale][kirkstone][PATCH] go-mod.bbclass: Allow network in do_compile
Date: Thu, 22 Dec 2022 16:02:46 +0100
Message-Id: <20221222150246.91423-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 15:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174966

This is a workaround to allow using go-mod until a proper solution is in
place. Possible solutions were discussued ealier this year in these
threads:

https://lists.openembedded.org/g/openembedded-core/topic/89464905
https://lists.openembedded.org/g/openembedded-architecture/topic/90782883

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-recipe/go-mod.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
index 61571596bc..da9a583288 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -24,3 +24,8 @@ inherit go
 
 GO_WORKDIR ?= "${GO_IMPORT}"
 do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
+do_compile[network] = "1"
+
+do_compile:prepend() {
+    bbwarn "Using go-mod enables network during compilation to be able to fetch dependencies. This breaks reproducibility of the build!"
+}
-- 
2.35.1


