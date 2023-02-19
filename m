Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F21C6FD1B
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3841.1676835070862692901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F4FIMM5V;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c3so883703wrb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmlal+NXf313BkRh5PfaB1lRZysHP5vH6Y/nllcQ460=;
        b=F4FIMM5VkVEdenHSfQQHOPfwOCtLrGpIkv2I3IDdW9Z8EsU+yQyuBxm7lkgUfhbvRZ
         UsBwbPiv78k0HVpS9Q6wfeUL6pEWlRlC31sONwUsXYZscjyyb7UVzTE71Yj8wV/z9Mgb
         YNS2kZdtepSHcQ+wBjn5PUPNcpW9jfbJ7ZuhJgDrgOXPub4N0F5tckEc3dZ+RdkxTvyp
         HgIDXx5izQzjs4W3LX6BEOmHRUti6o3IbrITJovuqmUdhZD9X1LGIXXkUnJFC2Jxromd
         OGsGgikTEKcpJVIe3cvWix61d1tWGWTHacutzQgtacPEKu60a4QNaIh3jfyfDnPgkMjs
         hViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmlal+NXf313BkRh5PfaB1lRZysHP5vH6Y/nllcQ460=;
        b=5rxjpwZQmTJ7MDHgPGNXfIQQNLgjY/krMDtvJSoqoqO18EpfqAmvS5wzf+i+boevWV
         /vNQNiJnTlaYHehZ5ASfoZK2DiAIujqSCJqnvnD7YP4DZ+PXlyOeCaU8VG/Vl1G3C9vJ
         S5Tka0RUto6WU5gx9QVJere7SDhcMgWNA9IP+vczw7loY/qMus/cFfOX/2JlApCh1kcj
         vAQKGV+ev8L5FnV+rI2FBpRc+DNtn46XZfxczJC5oaEAAyPhTM7u7GD/kjWEWtb3Mn7z
         o7VAqr9cxdGOe/wv4nRXt4ecPLq8On20Auz45+Kr2D96ls+zpkZrPF1mPoNkPvb6MrhR
         uz9w==
X-Gm-Message-State: AO0yUKUJ7mC00f86hRqw1RfwrZBvP28rzAKfcxLC2U9S9tgmmQuBySvO
	TzLWbOjUKqeL+FKWa4XlrQMPJNw0dl4=
X-Google-Smtp-Source: AK7set9mnAGSMWUC9erBneLD8S1uAKEKtqJ9fjLMWgGJ1DSxAtgRCvWReO/7WR4U8OQE9hnRe2d0ww==
X-Received: by 2002:a05:6000:188b:b0:2c5:3fce:423b with SMTP id a11-20020a056000188b00b002c53fce423bmr1307767wri.4.1676835069469;
        Sun, 19 Feb 2023 11:31:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/39] freetype: update 2.12.1 -> 2.13.0
Date: Sun, 19 Feb 2023 20:30:30 +0100
Message-Id: <20230219193101.338397-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177351

License-update: additional files under MIT license.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../freetype/{freetype_2.12.1.bb => freetype_2.13.0.bb}  | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.12.1.bb => freetype_2.13.0.bb} (87%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.12.1.bb b/meta/recipes-graphics/freetype/freetype_2.13.0.bb
similarity index 87%
rename from meta/recipes-graphics/freetype/freetype_2.12.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.13.0.bb
index 46c6182630..514672c0ee 100644
--- a/meta/recipes-graphics/freetype/freetype_2.12.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.0.bb
@@ -7,13 +7,14 @@ HOMEPAGE = "http://www.freetype.org/"
 BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
 SECTION = "libs"
 
-LICENSE = "FTL | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
+LICENSE = "(FTL | GPL-2.0-or-later) & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
-                    file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
+                    file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec \
+                    "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f"
+SRC_URI[sha256sum] = "5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.30.2


