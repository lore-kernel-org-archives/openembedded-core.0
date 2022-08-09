Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4A0C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 05:41:25 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.8488.1660023684910663978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 22:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lXXB2C3X;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id m2so10450025pls.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=wtQjfwV9jF9CyplBpF79OVTLbjxB7OCa01biNS2UWYc=;
        b=lXXB2C3XeYYkmF6M/9QrGpzdOaqn4Pc35qHAColCOHpkz6rGXMq9qoFqbNgAXOFW/b
         O0StEJyxrp46Cm4E6HhHnAKmv6loJ89zuhyaZv7Ea59vRnRAxp3ZJYaQDwtGTwW6X40n
         agvCHYjCB7ic4oKPemHku9RLiiibR8vs2ksu8vGG0XyEKOgjo2IYeKCGCWBPIUHbulvI
         AqOSfU7EgxYapV7XenlDqdY5F/gKw4QIJPlVXGuNFxfODLVRgIkOTve05pdBhZ5c4TMQ
         WdNJlVXQi/ugOU/HYnyb3Az3ZAhDyjFG4pRvkmgCJ26eLMS9xCXpqQX5LkEDWgTjtJO0
         W78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=wtQjfwV9jF9CyplBpF79OVTLbjxB7OCa01biNS2UWYc=;
        b=T7U3zsJrolNslxIGRUSZZnxPwGrOBXtzvmGCi/S3SokbppyEFqhkUgPZQneEXrcDHf
         FOk+tBl5oTRl1Td2f3X+fv7/4By+FBnLbNf0jDJxN1ClsNwrkCu6gxb81BY9wN/73bi0
         fxLeP521Yu9GhbNl2gS51sKUaQ/UMLGPtfxJimxwFofKPFver+V6W1evJCw8uz7yROeL
         eXEkzwyCD7gA0zoPbhqkyMdnc14VY+hfoD1mDQlDLRi7iQ4NQj4YFbn0iatbltvgpu4r
         h3Ros5kOetPs3LdCbQy1Va13e0Lo6f+sRPnDWUC+uKBDM0IHvHxR+6dwUG7IbNpfuBjv
         cUhA==
X-Gm-Message-State: ACgBeo3oFJ3+Qn4jEn7gtucq6cdeiiFVlj2d6cYqa2ztEFHCSIbsUMyw
	HSV9DfXhaDX9tj4AFb5+gTz/jAq2lNw=
X-Google-Smtp-Source: 
 AA6agR5xMENTLphw/IC8LYPzf9p1ld/qxhZkX1jkgTFnttx6r+/KuMNLcDhFH1ApFaFYiQLbX5/A1w==
X-Received: by 2002:a17:902:f711:b0:170:9e3c:1540 with SMTP id
 h17-20020a170902f71100b001709e3c1540mr9863076plo.22.1660023683994;
        Mon, 08 Aug 2022 22:41:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 a4-20020a62d404000000b0052553215444sm9684419pfh.101.2022.08.08.22.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 22:41:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] perl: Pass additional flags to enable lfs and gnu source
Date: Mon,  8 Aug 2022 22:41:20 -0700
Message-Id: <20220809054120.820562-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809054120.820562-1-raj.khem@gmail.com>
References: <20220809054120.820562-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 05:41:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169134

These defines are needed to enable some GNU APIs and large file support
is default in OE anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.36.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index 4456cdbcfba..ead7dace165 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -45,6 +45,8 @@ PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
 # Don't generate comments in enc2xs output files. They are not reproducible
 export ENC2XS_NO_COMMENTS = "1"
 
+CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+
 do_configure:prepend() {
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
 }
-- 
2.37.1


