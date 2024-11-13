Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39457D637C4
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.22188.1731530570724599288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=06xemwTo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2118dfe6042so38467055ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530570; x=1732135370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh7wdp8fqAr9lPeGHhDC7vknd1jzz4zIbmOP0rZ48sM=;
        b=06xemwTo+4EYLyzjLG63y9tiNWCOmTfknA2sG9fKapKiJuW3w82kTic2cawfAgAuN+
         svfryCoJurXjRCcNUzSsF5VUNY8ORcmWF7xPTBO+zU++03NpN2U2RRX6tnX4qgmPF7cv
         7G+ANkKz0Aj1naFX0sKaLJ/xTgNfGOeLA7Z8w1F0ZfNbRRkVKK5SmJpqeUJzqHaeU6sm
         Ke2/iUz2suX83pO3/MwnZVaYAA7QHxC/vrzoZ8GGOszI3I41/T+EpKVTsSR5dxvNWpO0
         wVOaL9lI31pe9zhZs62fjgbdxsQzLoV01VsTfeMqoTaDyYy2sEvTjg67NEaTZTEl6LQ2
         wUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530570; x=1732135370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh7wdp8fqAr9lPeGHhDC7vknd1jzz4zIbmOP0rZ48sM=;
        b=PxeqiwfaCedIulbDoMankdAGT/6K5osoYMERYGkHGJ535KFFy8OvXuZpF1FlsErbOS
         0nlUr0j20Wb/htw1mmByDOw4+bPzz6HYwrcC5xw48drbehOmZBRS/pB7WjRvT2zxhCeW
         mMvr4LkAdRb7qWstRuPK5jNVOHM6lF0rE3MY6+yyynLmhMsLMp4VzKSsCnT1/Zizs/uN
         OeZcO0zK7iPdbsWtDWdOY48pTBevbZY1KPLYQMUrw9mtpiqDkiX/rGRzXDfCGUJc9+21
         oX01HbxMJMCtYA1sKfLa+MgkULLUaIXkwC3MygpgUm+hOvsZfqS1roxWq2nRe0KblvzI
         mDXA==
X-Gm-Message-State: AOJu0YyHxhq9bmAw3zz+KTeCyhsl75Xr0VrFRTFzc4tF0ZjkJwRIh8dU
	4mtFaLM3YnH2VwsETAQAg2iH8DusZCC6FTu9TKZyARTJBJSuS7O5jR0SA94nBWAWUJ0lf5GSL9W
	u
X-Google-Smtp-Source: AGHT+IHFR56025QtEyddEWaDWZI+Q/4bFKLzM0vmEZIW5A9t25bmLobzEsWbghBicP8WPKezchGOCA==
X-Received: by 2002:a17:902:c951:b0:20e:5777:1b83 with SMTP id d9443c01a7336-211ab952b9cmr108705925ad.24.1731530569939;
        Wed, 13 Nov 2024 12:42:49 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/9] enchant2: fix do_fetch error
Date: Wed, 13 Nov 2024 12:42:23 -0800
Message-Id: <15337a58f77de3d0a30b73fcd836349df811ca39.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207132

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: enchant2-2.6.7-r0 do_fetch: Failed to fetch URL https://github.com/AbiWord/enchant/releases/download/v2.6.7/enchant-2.6.7.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/enchant/enchant2_2.6.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.7.bb b/meta/recipes-support/enchant/enchant2_2.6.7.bb
index b31bdc422b..26ff4e8502 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.7.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.7.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
 SRC_URI[sha256sum] = "a1c2e5b59acca000bbfb24810af4a1165733d407f2154786588e076c8cd57bfc"
 
-GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
+GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
 S = "${WORKDIR}/enchant-${PV}"
 
-- 
2.34.1


