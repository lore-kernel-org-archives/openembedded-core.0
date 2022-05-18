Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCF5C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.3534.1652871532703452603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H2m+O70H;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id kq17so3054921ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JNyETuz1+XRfxxIEkzxB5xiDhK+BCbhfulCbu1+InsU=;
        b=H2m+O70HwMbMTMqDNasNnILF0stBFgtnpYvVmug6FQv3yE0VWe+tTUFbVzg1mHdVHC
         TvPhlJetYAHVMtCabLPBOLA/6Ln10hteeEoSpx7WM/SMsvmOfGuyv6AyZyu4gtXmwtv1
         UY4+18RiUVMYstBMhvJYoDxrJw346+XY+40WNOs2JOk2Mgw5S5tWUjgoZWBskfxVhZ8x
         tXVYHK9pR9A32mSf4juFuNjRjfMZryHgrpyKHud7+3OHtNUtU2ltEJi0FrLQfSwlVWc7
         k+PeD1JVqb1aLeVBbM9M9Aol8ziDl/1epPpO5gFUdzbYPzILn9sNduq7shOkoTOblFFD
         olQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JNyETuz1+XRfxxIEkzxB5xiDhK+BCbhfulCbu1+InsU=;
        b=HGweoZfjEnnsfQWOxDVU3oCR/qixSZ8RJVVcrAcrgOHCY+9KQ7HUb9BXHvB3HBKonp
         B5VAtOKiQSXw9pDov3duZCCUIWoxxjN3yCPjg8Z0w/bz5fTb1Dme0c5O4fkA0YOcYxbi
         8bi6PhIxaf3AS/qcvohwMPivG1xoTobe7WDFR/qflD7QB7orCS3D6Lc0eHNZsWeyNqQZ
         Sy43rJxRgWFj3jA7o78ryYu0yNEIHVP6ssi7rlAAjtvZFKVS74sbV/rjYRy9hm6fbtTC
         Gt/NJpttVP1eiqCZFdLjDzaldeufMzOugV7lsUQsTDlYsg2G/jamtjsBLR56DOebn5ip
         iAgA==
X-Gm-Message-State: AOAM532b9DPGYvMosMXkP97kFv0QWmW9UxOqA6QUn9BOSTSCuEkHLlnd
	quawaKHCBvlkPvuzp3m6YBQDmiLqqH4=
X-Google-Smtp-Source: 
 ABdhPJwajZNtFa5sgYbAJalAdVxf8iYLqjYB9HUxQWpTQOqi52WpQrhBBKzVpvm0hP5fdDNbLrNaPw==
X-Received: by 2002:a17:906:478b:b0:6f8:5850:4da9 with SMTP id
 cw11-20020a170906478b00b006f858504da9mr23689106ejc.619.1652871555477;
        Wed, 18 May 2022 03:59:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/49] libcgroup: upgrade 2.0.1 -> 2.0.2
Date: Wed, 18 May 2022 12:58:22 +0200
Message-Id: <20220518105843.3299331-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165825

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb} (93%)

diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
similarity index 93%
rename from meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
rename to meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
index 857a4e86fd..7ade372cae 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
@@ -13,7 +13,7 @@ DEPENDS = "bison-native flex-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2dd9c566a90a053e7a5f47607e225648ba7aa9bb7763514dd4778e2ed530fe90"
+SRC_URI[sha256sum] = "8ef63b32e0aff619547dbb8a25e1f6bab152d7c4864795cf915571a5994d0cf8"
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/releases/"
 
 DEPENDS:append:libc-musl = " fts "
-- 
2.30.2


