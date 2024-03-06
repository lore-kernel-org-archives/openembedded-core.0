Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAF2C54E5E
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14885.1709739744386708373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MaH0yPTl;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a450bedffdfso466416266b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739743; x=1710344543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qt/pgr6HFZWk7BiyPw0JnVA56p7VyR0T+lGkelIpZjU=;
        b=MaH0yPTlCzSIM0Jnhm8HdUVlGsyuhEd6tCXbQh0J4c2Jki/YabagjgbeWzAo5ptcNe
         xlxbwLnZoEb4xPaOXpVjF81sxIFih8uOhzVaxK0ebq7SVn0VPhw7wYzFib2n88eSSf1N
         /cenHJJOsC3q2l2HLA/geZL9RO+WBBl9EA9I6Qj+7UhiDNeK/704FDL3xkeYhhq+FgEJ
         QViJktcqX24LA97Ud07h4R6f3j/p/RPZqokfw7u4QWnD9flx7aOR8oR9WSRJPSYx7xt8
         TNdm1m/MaVNjGmkmMnkbae40Ja5314uweCYuvP0dwVdEa2ck3MRbEp86ug6VKUOqSQBw
         yRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739743; x=1710344543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qt/pgr6HFZWk7BiyPw0JnVA56p7VyR0T+lGkelIpZjU=;
        b=q3Q4vhncH+eUqZqqqCL8YMUrSzZVfrbb2Qsa8S0IkCE+dldieDxDTe+GzrEscCvTV7
         9S1UhgQXnT5VpRK1qE1aIQNxgzjXUDwLZe/Asvh5L0uTnJItzBtdnxZK5UiNtt51l39r
         GvEu8+GXsgIKT1TsIpUD6FPEwNmG9XWXNHE6x3c2gloVJfODNPvze0L1j37gAbjnxbFK
         F4j6hDt9rg/qPzpahzeLXCaQceb5nFNhA9Bygi1jFc4SYQEon4h5bws2zGwyYj0aFp85
         zPtv2XHQPYVw9Oi1pDL5Coh7DTKH4VCagxhSm0aAfGAKOUVu514LaxElIq83FiAcb4Yp
         4aNw==
X-Gm-Message-State: AOJu0YxSai+cun73obqsTZk1ykylQydPPjaG3JAH7pSgLc6d0jbwgJFz
	rSvi39TTZm3pdytDf2bWhVsumyAZsbJ9IO25znQKh6W6jKgXjPzdIK93Y4Rj
X-Google-Smtp-Source: AGHT+IH4UNmjzaRqlm+yVUVQwoyr/Jvnol4wVWbz9MJCIfKU8zo3FX0Qt9BAP/D9/X4z35inYzpU4w==
X-Received: by 2002:a17:906:84e:b0:a43:b269:d27f with SMTP id f14-20020a170906084e00b00a43b269d27fmr9503720ejd.64.1709739742727;
        Wed, 06 Mar 2024 07:42:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/47] systemd: upgrade 255.1 -> 255.4
Date: Wed,  6 Mar 2024 16:41:45 +0100
Message-Id: <20240306154151.3741709-41-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196724

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ystemd-boot-native_254.4.bb => systemd-boot-native_255.4.bb} | 0
 .../systemd/{systemd-boot_255.1.bb => systemd-boot_255.4.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_255.1.bb => systemd_255.4.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_254.4.bb => systemd-boot-native_255.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.1.bb => systemd-boot_255.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.1.bb => systemd_255.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_255.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_254.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.4.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.1.bb b/meta/recipes-core/systemd/systemd-boot_255.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.1.bb
rename to meta/recipes-core/systemd/systemd-boot_255.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 1417e0150f9..a35db5091eb 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
+SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.1.bb
rename to meta/recipes-core/systemd/systemd_255.4.bb
-- 
2.39.2


