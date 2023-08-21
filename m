Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43555EE49AC
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:44:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.292.1692632692538357860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JcLIKY4k;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-649c6ea6e72so22052646d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632691; x=1693237491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCOK6SNm9zdZg0fNjTbDo9pvy0UDwbmVPoj83bWv/E0=;
        b=JcLIKY4ksZYXwDFmQMhOjzpmXOgq7v3UbUPqiXo9ntFdN13Lcf+wK6NYEjNKaWz2C3
         d1fHQTj66iw8GtdlBZOWkJn6AHdLjaTMXnElNA4at11/b1oW36ayn/r3le2+lNirszeC
         x2t8E4jKHro+ugxU1l3haN8FDjdehww4iRIfZiSskoKX7ksj6oAW46Y7TtnZgHHB4rNh
         HeWvevDhL7rV8nTsu9sMsIz+iDXYgckj+Z5S2IyLBXZOsI0Hsa+YpJ2b538bX+s8h/iJ
         M6YLgY8cKuin4YITO9G3SKjJUhQKPnLyzWCMwfY8VIoLVX/xVm/zb9h0fVeiD2jua8ae
         PsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632691; x=1693237491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCOK6SNm9zdZg0fNjTbDo9pvy0UDwbmVPoj83bWv/E0=;
        b=F8evrlEN+R0QF7Kmobzcats/Ryv4Xm/u/0U/d/0+s4PNQwfnXN4O0zGxxD3Um8zA1j
         42j+pO4Vp0XjMlRGR4oTfEDChYbgMzBA88/Ka5EIGK1xwcZAUkLBlJXAiUZEEfG/Q+sh
         gao9XVQr10o/dZoz7PdCpl/Zy33+cTu0gPk2huCiwOjU0F4SESYGpaoPYbfn60vuigJ2
         t9sfDWdnpeiT6AfJMxqE/JYyRP7L/X+a/FGG8ox6WDdWsTGj8cCfpnk/jyjziljMd59h
         WiyDTaDF/h76DroXMbXQxEsC2avZqBDWfFfZvdoLZJovBg+TLQsYB6M3cYsWtXYsGYfE
         l/qg==
X-Gm-Message-State: AOJu0YzrvCnflP4JuTz73nic9xSdzBzhJgi4ffSwnyBWMuzjVWldQaeS
	WEtzwAIOnQqF6aOEpIflNYnM1CjoaRQfYw==
X-Google-Smtp-Source: AGHT+IFlJEZO2dksVjt1HnFGu0Abt45EDT/o6WtOAgmCfy7T4MKL7Hxv29E/Hf0dCivUSC9PuQzERw==
X-Received: by 2002:ad4:4e52:0:b0:63d:7214:638e with SMTP id eb18-20020ad44e52000000b0063d7214638emr6653481qvb.56.1692632691584;
        Mon, 21 Aug 2023 08:44:51 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] kern-tools: include utility to post process config diffs
Date: Mon, 21 Aug 2023 11:44:39 -0400
Message-Id: <7016067094121b43c289918b6c990a589f963180.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186454

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Trevor Woerner contributed a simple utility that cleans up a .config
diff to produce a fragment.

    kconfig-diff2frag.py: introduce a utility to post process a config diff

    Add a python tool to generate a config fragment from a unified diff of two
    kernel configurations. The diff is read from stdin and the fragment is printed
    to stdout.

    Usage:
            $ diff -u config1 config2 | kconfig-diff2frag.py

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 388d8feebc..cea12240f0 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "2d01f24bc78256c709728eb3f204491bce13e0e5"
+SRCREV = "6645d3897cc2eeb1237ee0e2ff5342bd73ee0875"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.34.1


