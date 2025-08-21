Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC286CA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:37 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.727.1755790828498695636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Aq5gfRh1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b471738daabso1018080a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790828; x=1756395628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4vI8BU696Nj7eASIyv3BxPwm32KjgzhxreP1IMYKuE=;
        b=Aq5gfRh1Bo8mEKJly9gFJ9JdS0NJ4INafhtjkrhjtHnKVLPnXy5yovMcLQgnJPGON0
         JMXKmqN6Xoe0UwrPy61e5ISq2PWYftTf6+76VHZkFBzh4gQkXZSxUp6YPkH6qCy4dcAS
         jnGUmecuYL6yKmID9XFTPdnqkt6XAdWERlRNHeejo3Oh/aCJb6IUYCfZ5lsuQLxrmekZ
         c0JFUtmX5y2u+bns/WGqrGbu2A+TWQ0jaT5CFyd7Fp59GyDDhwENpGYHpFWiuLn8Tijf
         Jm5a3pZK5wG4KtD2IpQwGdceo/irD9rRDPlE3b6kTY97fhaAAzSBHLhGAjYpjKXysUVU
         DfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790828; x=1756395628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4vI8BU696Nj7eASIyv3BxPwm32KjgzhxreP1IMYKuE=;
        b=ZiuzAmlKwWpDr1aUcXopWDjl5EqyvfNj/VIDBNlAXYtMrHTGqZV6AwF9c6t/OV5Iga
         bjMJOfAaDaugDc8073Gy8iEJxUO0KFL18NghMBEizh+hsxKS26K5DvtRaFU5EHd/zDOS
         DcUgqgYmVj5DgSntwwHSpmcuY98DFimK3rNZQqPrPKl1+F+QELT3OKsvWGsTzksTDw6h
         gm/DHIH4m7TlTlNfc9dL1aj8ScuB3kTKFZNLxtQHLK4GECe/2Sy3lBY6ST8kn6VADIS3
         ae1pcdUuy5f0BBIZxhtglAZ0d2BSxFyfLA3v9lpN8FtuJsJpnMPMLDsBrWCN12LyHKu4
         plaw==
X-Gm-Message-State: AOJu0Yx9PoU51UvFxjgAlt7z2KvH9JRSzLBxGHQvgIJxX8sUbANLmC1g
	/oQt4qW3OSbEuRz8wLdLQNarNwEugGZLhpLHUMB7tn/N3DgO4OAiHrk/cbnvmbOglBigrOe8osz
	wA6FK
X-Gm-Gg: ASbGncvA810yj6NhFBVWSQ1e78gL6DG6FsM/mdV1go+QuP2ycqJqq8eGdb6pWoJ9os+
	aVwTBMWxTNHkg4Kdg9AYuOBTr98gHW3yWwctBivldyFiap8MYhx7Ah4VGbP0UpjXlWg9BqVRRZq
	KckbY60YVr3M+VPGI8LNZqU2sqb343RmdMeqxErJhn/gPiauYgKOcFaLpqNxf6XRR1wfmwNt7JC
	25Aaj80MwzV76B7WaG79HrC63rUba+9W8TFwmaBd/Vrssei7wcQfM4P0zK2Ped5boTpZw7u6awg
	MOZwwFvK8l4mMjPK3ZqwoNE+fFemjLEg81Qzkce7zTP6ToE2nt5owsRBhwms2Ci6x1SZ2zJ8Lpp
	AXEwLUGKrP77hIg==
X-Google-Smtp-Source: AGHT+IGYhzv5g3xAUnYEQlyCq3zlrkbXfQqR4jxbBl4i/xI5tg8EQ6f1iVaHBLZLlOIZuf0SiegH1Q==
X-Received: by 2002:a17:903:2f4e:b0:240:79d5:8dc7 with SMTP id d9443c01a7336-245fedcd33bmr41371465ad.46.1755790827698;
        Thu, 21 Aug 2025 08:40:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 14/15] bash: use -std=gnu17 also for native CFLAGS
Date: Thu, 21 Aug 2025 08:39:55 -0700
Message-ID: <0c09f4a449fc03e6f5dfb6e5961c0a0471a7816d.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222263

From: Martin Jansa <martin.jansa@gmail.com>

* fixes builds on host with gcc-15:
  http://errors.yoctoproject.org/Errors/Details/853016/

../../bash-5.2.37/builtins/mkbuiltins.c:268:29: error: too many arguments to function ‘xmalloc’; expected 0, have 1
  268 |           error_directory = xmalloc (2 + strlen (argv[arg_index]));
      |                             ^~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash_5.2.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
index 9f02ea17b5..2c0645cbd9 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -21,5 +21,8 @@ DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
 CFLAGS += "-std=gnu17"
+# mkbuiltins.c is built with native toolchain and needs gnu17 as well:
+# http://errors.yoctoproject.org/Errors/Details/853016/
+BUILD_CFLAGS += "-std=gnu17"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.43.0


