Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3971C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 19:32:20 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.30179.1682710330975670842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 12:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jt7ssuU9;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5068e99960fso128116a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682710329; x=1685302329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv+O1veh7QyEFZRTrQVXgdtEG0csiWah1S9U74gccZs=;
        b=jt7ssuU9JhKaANzhc2DUlsgJfVDJkABgqnacCOsJGcqrfab+bkQ0BqOvKzKQmp96ca
         8l5OGIdtJyqKphhW3EWS4jXcELJUiaQgRoiqkfZ9EcWSBdFSv4UWf3hvb0EX+I3YHbeb
         DMZU7SzBlDkdq4dWpe+RJ+vkzvoy/xZF4ossCuyVDG40NR+nq6S9rQP5aff9XyALYxYd
         nNUKcIROwkLpm82Bn9sDzpCLlplB7OXbNsXE/ZAsdX9FrjllpLG96UdVC5mhmGRRIk02
         Ha0pWOa1oSWDRazUeG0xq5+bJov36vMyjY3plgkGLz6t6g6CcyBgAtXx+2+CTdOLStjV
         qKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682710329; x=1685302329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vv+O1veh7QyEFZRTrQVXgdtEG0csiWah1S9U74gccZs=;
        b=T3KiLyfHDHpfK9lUil6ZYhtBDzM5tV/FYgU08Yqend7gh3nAKIu949n9qf1Zmub3mz
         MktgHNg64vJDFHekrNFiIDa3rBKYZVJZUtzj+yWL9KdrWXlG/a9vXCHR5JtvW2e6yjpD
         dfCLewwPtro/vybCV5jyrqoYUw6602yfiFkvLL7KUEgeYCloSDYTEHBnv98qwy0vobb8
         1gHbClVuDoDc6M8ZwgWQ1vk1r7oQ/cJyDwDUVwRadYUQtvDriamhsapLTFYGn5L17OHT
         GlLqGToZLvCRT5ZKODVrfE+Cdqbfgi697xqZ8BxNqATxQVg+u/nwrEkHDCswaUjiDPRW
         Uw1Q==
X-Gm-Message-State: AC+VfDxk35iC4cMlUFALZoBUQiil6JUbWxH80jQjuf7XaRtiGh1+CGTn
	kHqSTGTz4O5odVOlRuu9GXDcQ/mVnpI=
X-Google-Smtp-Source: ACHHUZ6o1c4sDSQHAQ73uqwYEcVR3sqZvMhnfDV67UeYNOmAQaQBGVYdIcymH1KGXeYpsxtsbqyrAw==
X-Received: by 2002:a17:907:360b:b0:959:c6cb:9fc8 with SMTP id bk11-20020a170907360b00b00959c6cb9fc8mr6443401ejc.29.1682710329184;
        Fri, 28 Apr 2023 12:32:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id he12-20020a1709073d8c00b00953951ec91fsm11547962ejc.137.2023.04.28.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 12:32:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] binutils: package static libs from gprofng
Date: Fri, 28 Apr 2023 21:32:03 +0200
Message-Id: <20230428193203.3622368-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <175A301228A7A56F.26969@lists.openembedded.org>
References: <175A301228A7A56F.26969@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 19:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180535

* fixes:
  ERROR: binutils-2.40-r0 do_package: QA Issue: binutils: Files/directories were installed but not shipped in any package:
    /usr/lib/gprofng/libgp-collectorAPI.a
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  binutils: 1 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.40.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recipes-devtools/binutils/binutils_2.40.bb
index 4fd296b860..24a847ea9b 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -69,6 +69,7 @@ FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
 FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
 FILES:${PN}-dev += "${libdir}/libgprofng.so ${libdir}/libsframe.so"
+FILES:${PN}-staticdev += "${libdir}/gprofng/*.a"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
-- 
2.40.1


