Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C681C5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9357.1672830362235773377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FO+WRkez;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id t15so23700216wro.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUzMBiCjmQiYWES6faD64guumCcbeem/4vKqx6TiMqg=;
        b=FO+WRkez+av2mshFR2NsFFb2RfFD2/CD3BfJhZKuu90O+N9lzWGATklYh7HmlTQOFH
         OnU3fC41OWg0tMJZwltJsFNVWp3uAges+WxHzFdSeBUyZsFn5v0alq2JnIPwI2ePbQ+q
         1G5P6YNSWZSPzVqlnsJNjBFA6s0vGN+GU7XKx9GbkRu8MCKg1YtfoBMr0UCC026G9ScX
         Jm0GHMrvLVwurTTaQ3O2m5/mPGT7UZiqyk1zkyDG5yu9G18qn2PuT6FFStCcB4YaRdos
         hpvBEw92kJUT4u4UH1auwInk3864Bhsnebu+CzB+oclatYSbUQHEEV9381UEXHJAM5ry
         nzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUzMBiCjmQiYWES6faD64guumCcbeem/4vKqx6TiMqg=;
        b=FH1JeeSh91IIUptxlpHzbhxlCibzckzKt3IxUH+486/lCGNcRm6VysZ5ncntgSrdD3
         vQOEFMRkYmK9XlHLpJ28w7jG2m56pwoYgkUyt/gRFXoJVXEY6lizR25B3209nuMSkVWP
         UVZ4dnsHklKDFT6SR7cSioWpSYU6lH3zuf47/bCEUnKROE1CkjVR2AMqywUAHQVTKxRZ
         vW5IlIdDTBJxYa2eD7tDBUA7sas1cOmRVoGTgirWmEs3dzpR2DvlLQfuNqscgxcJCJds
         CaaszQVyg0ICbc18n5NrjOqPxwoobg3c+osTpT2W87aPF/KB9UP8qz2mrj8pvwquXVzc
         R3sQ==
X-Gm-Message-State: AFqh2kq/lE30lBOHaV+zUVHUDKi2BVnDtEtT5AOmSjLLw/0j6yGGWcem
	yUwqcN8NLa4XzTJLAqe6ezoJCAvFPCU=
X-Google-Smtp-Source: AMrXdXvVZDr9kh2wpcCCK7oV6ZUC/1Wd7vT0gn899LHtntWxAYEu5r/xFVnon/yZEXIm28Sp4ZA/pg==
X-Received: by 2002:adf:dd83:0:b0:27c:3042:9dc2 with SMTP id x3-20020adfdd83000000b0027c30429dc2mr21102299wrl.29.1672830367431;
        Wed, 04 Jan 2023 03:06:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/77] webkitgtk: upgrade 2.38.2 -> 2.38.3
Date: Wed,  4 Jan 2023 12:04:50 +0100
Message-Id: <20230104110548.2537259-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175403

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkit/{webkitgtk_2.38.2.bb => webkitgtk_2.38.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.2.bb => webkitgtk_2.38.3.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
index 616416f6dc..e890079dc5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            "
-SRC_URI[sha256sum] = "f3eb82899651f583b4d99cacd16af784a1a7710fce9e7b6807bd6ccde909fe3e"
+SRC_URI[sha256sum] = "41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.30.2


