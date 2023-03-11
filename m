Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90683C6FA99
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.35797.1678494452418640935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ieljktrp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r18so6576868wrx.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jOburbVMyqQ9NFm55uA38s1lW8wdKHelzt0DbNXu50=;
        b=ieljktrpdXVW8VNKbl55DE5viQypUpmYPVesj32MJi20xOC1cXC21CFwV8Ii4GnZj/
         hBmAD0jIhP5cB8BcvHGiUYIpcSAFpT1MGEsIcZwW9k4npIIZLiFSh79dzG6v/Bxta9+i
         6gHFJUOTo6wl23LLVoGmKsYUCJlDwIfAnI7/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jOburbVMyqQ9NFm55uA38s1lW8wdKHelzt0DbNXu50=;
        b=RzrTM41W2QrHEx9KktVWLRtk/NqPe/N5eI6lg5/wirLoFjZ8d21O6FG+O7lWTV/Y66
         KFrXe3a15Noa/OnVyH3pt9aAVJLdCkHFxfrOOaG7JBsK+pF871QZ9XhwrLfuaySLZey1
         qG1aFeAvzn/mLrZ1btORnDBUrP6mkQE9Gs4s1PhcrPEx3tr32c2bTk8s+HGNod4FV0J/
         SAFSohLNWG3+yulopbwwgnhlSH4ckF6eO5WBs0phIEh5XGdKU6w1FFWJ530XYmAguK/4
         KKrhyJQK5VZsATojFPdfK7aRhyByjuUcRz43mdztdxy6u5dOup7zQ3lQpzbZ6YPBVirP
         JLKg==
X-Gm-Message-State: AO0yUKUVYcGpZt5DDCvOu0hLvRPSuZoi+TSEI1gtXwtjGIpYk656SfjL
	giB4UL6QJGBzthXy0EpNnsL6f7K6xoi7WjqnFg4=
X-Google-Smtp-Source: AK7set9EKsvtg/ZtJiDtvhYT4pQ0b4taB0+zxpmLYNYqHvydAMGpJVpYENkVV48O5zuy3pWvvZFngw==
X-Received: by 2002:a5d:66ce:0:b0:2bf:f735:1310 with SMTP id k14-20020a5d66ce000000b002bff7351310mr18769575wrw.2.1678494450735;
        Fri, 10 Mar 2023 16:27:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/16] libxml-sax-perl: Fix ptest dependencies
Date: Sat, 11 Mar 2023 00:27:18 +0000
Message-Id: <20230311002722.3211118-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178356

Add a missing ptest perl module dependency to fix execution in minimal
ptest images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/perl/libxml-sax-perl_1.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
index bc2aa0821eb..b5b111d2274 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -29,7 +29,7 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/testfiles
 }
 
-RDEPENDS:${PN} += "perl-module-encode perl-module-perlio"
+RDEPENDS:${PN} += "perl-module-encode perl-module-perlio perl-module-encode-encoding"
 
 RDEPENDS:${PN}-ptest += " \
     perl-module-base  \
-- 
2.38.1


