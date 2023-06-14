Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DBFC04FDF
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.7475.1686734978068577462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Cudz4S/q;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9786fc23505so72653666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734976; x=1689326976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDY9V8wovVa5+nmHJ5Y3cYtukL8qCuetfoCzB0kYbCA=;
        b=Cudz4S/qIwIsC1v5BVniTL7HFm6C3nHfoBL4EAFr8O7zfuZHIJ/dF6xzM+o0z4Y0wS
         5qBQTzhDUhGARqXucweSqK3/Ukd3rwNSkp5MMJp/77GmKt0BMMj1F/Cm5Lc8dCCSeLrR
         X3mF2Sf44YtEKsfqttl0frRJsvccWJ1xY/bU3M9Obqrp17dDNJ7vNs1eMiZfpI06xXlp
         FW6F7FQVBavm3YhnuGcyHQBvkQ1uP6hbPF6inLGa4hcHbnzl9Lsph+CDHjELwF6mda35
         n+ArV1tSAwkd3GhtflEeVTxsm/pJDuipa5BwxPg8KfB0WzyLaI2LCn60BDqJObWO2rdF
         D6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734976; x=1689326976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDY9V8wovVa5+nmHJ5Y3cYtukL8qCuetfoCzB0kYbCA=;
        b=LdjmO4OSSEYL+gBm7ZncvusKdmScY3sIunHaUzSkTlVUrRWa6L5N13iyyZOH45Gn2R
         yp8RSZ23CKqsrdpLUBTk8BuzNHUjkKveuqCmZrmW56SbUBxVtkWiT3x0pydbm1t8FNXR
         4QtCVcc1cAX18JH0ku/rLvW7ORvihoazB/NMako8xaKl1Dvn0JBvE4myhZsL7BUY2Z+x
         Kdl6bVzM8HWZHe2Z8K7+7BkKSyGj67mAa3KIRGuZKrG4tRymnCaIF4HgSAp8U+HiTCgS
         CMBW8jtJZo+aOSxNQ23XY6+QZg2k7Qad0++fCjWgw9DjFIzjKuH+XYvo3LVEKL0vi6Ey
         mGcA==
X-Gm-Message-State: AC+VfDx0jM+TtAukW5cdAwU5qU6w1phtwGylR6iZg9oTE2DqnszCAtMM
	sK0KfT2RuJ4pZZoyZzyj4kebrwO7R+c=
X-Google-Smtp-Source: ACHHUZ5GKMlSMbyStOhUnaOfcuZFA9a4SyNJbDN/dU+UNGpg/HwiwhpJ1vGKbsDGsAfAM5hMMXQPMA==
X-Received: by 2002:a17:907:3603:b0:96a:19d8:f082 with SMTP id bk3-20020a170907360300b0096a19d8f082mr15207109ejc.25.1686734976457;
        Wed, 14 Jun 2023 02:29:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/55] ethtool: upgrade 6.2 -> 6.3
Date: Wed, 14 Jun 2023 11:28:40 +0200
Message-Id: <20230614092918.4065570-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182762

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.2.bb => ethtool_6.3.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.2.bb => ethtool_6.3.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index d5cb8705c2f..5e9024834cf 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From b4ec6635af4d4a47e9ab7bbd5347e78710d19362 Mon Sep 17 00:00:00 2001
+From 08f887f4bc65684397bf8ec30cc61d91d894deac Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ebdfd39..c93b79a 100644
+index c1e0012..c460398 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 6.2, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 6.3, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.2.bb b/meta/recipes-extended/ethtool/ethtool_6.3.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.2.bb
rename to meta/recipes-extended/ethtool/ethtool_6.3.bb
index aea03b729d3..504e6459664 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "1a9f95c3d8c1795a942220912d72c06a208f1c122a78f7690259402856ff06a0"
+SRC_URI[sha256sum] = "342d37d3fe19da79d0276c4c69c34c61f1ad8f87b06514d664bf1eeb29bfd525"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.30.2


