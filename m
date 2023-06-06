Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29221C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 13:10:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.8298.1686057007593436344
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 06:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=abu4HpGi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f735259fa0so32726205e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686057006; x=1688649006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC0F89cUx+GMQYtr6DzeLgUQ6EvX2xhmAupgex7Bwyw=;
        b=abu4HpGifvhBNsK6F95UjojI75N4g9J8tsikhrdA9UDGgT8RT8E0XFGLwO94GU/exd
         CENB7WTwDvshJ1/oZQTlL4BRgTWycp5qUoM1Hc9CzzsLj16AXv87S4ifxrqm7taFyVag
         727wrCEadcNENAAPnsdtGzzXyIQ93IxSnaNlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057006; x=1688649006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC0F89cUx+GMQYtr6DzeLgUQ6EvX2xhmAupgex7Bwyw=;
        b=RC8Utt1Qv/aFaP9OGlleoq2vZ1lhBOm2afSJmKAm1KiEFWQXw6z8nc2XsnAmymv0QI
         0XMDlx+FVSIo5ELOYuKU/SrZPaSRVXfzvV1ZtPjWuUbAjlpljiKe4PSiYTsNs8AEoeeu
         IJHWeaux7Q1MU2mXTWfg1fS/1VR6ddq3jGR1l6bR0jPS/9CTEBbAY0ySRUxOzWUlv93A
         FxUNYKtV0iWVBhoKiqPkd3hokFnpsGlH8t4uWSSnX4DaVkgrIMtOc0tG6DOepwpjiAA/
         /1zT4N4eSprL25Z3KKfSuldt9LKBjjCoJJYetTVjEfxKaN0tP3p8JJv7I6MmvS3C+rjp
         +T5Q==
X-Gm-Message-State: AC+VfDy2jDYvAmV+b+/ukuArd7hxJ8dkH1JwBFL4TCnCiRT1aYTWAMlz
	YKhr2ymdvKu3NIOCLByyRsRRobN1hzh31ybhuzM=
X-Google-Smtp-Source: ACHHUZ4J1VBHallrozh/iclkkq3Ip0FMNur6OeZ4QG9GbBVUS1FaEYy1jjD/jAfBg8c+mAOf77UNOw==
X-Received: by 2002:a7b:ca48:0:b0:3f7:5e08:4012 with SMTP id m8-20020a7bca48000000b003f75e084012mr2519706wml.36.1686057005705;
        Tue, 06 Jun 2023 06:10:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bc5d8000000b003f17848673fsm14074251wmk.27.2023.06.06.06.10.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:10:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] packagegroup: Handle SPDX signature issues
Date: Tue,  6 Jun 2023 14:10:04 +0100
Message-Id: <20230606131004.535143-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606131004.535143-1-richard.purdie@linuxfoundation.org>
References: <20230606131004.535143-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 13:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182437

Packagegroups have "special" sstate signature behaviour in that they don't rebuild
when their dependencies do. This causes problems for SPDX task signatures. Since
packagegroups don't actually have any code in them, we don't need the standard
dependencies anyway so cancel out and allow the sstate signatures to function
correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/packagegroup.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/packagegroup.bbclass b/meta/classes-recipe/packagegroup.bbclass
index 6f17fc73b0f..c2db6649045 100644
--- a/meta/classes-recipe/packagegroup.bbclass
+++ b/meta/classes-recipe/packagegroup.bbclass
@@ -54,6 +54,9 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 
+do_create_runtime_spdx[deptask] = "do_create_spdx"
+do_create_runtime_spdx[rdeptask] = ""
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 python () {
-- 
2.39.2


