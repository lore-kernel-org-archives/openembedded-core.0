Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A12C10F15
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 10:14:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.10293.1714126439076830823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 03:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=acl9ZqwX;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41b782405d5so7659315e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714126437; x=1714731237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdgIbf082/fMojhD6UXxW2/YldGgUBbc6GKpbpD5rMQ=;
        b=acl9ZqwX3iLmkyvfQDV3nPMZStZXARYxLa28FS/Cv8+NoTOX7zSCzEiZ0DDH/uxZkf
         Q7Ym8jVSJkDX+AXcBouAC8O+A+xOU/S9O7rLg2vII1HRaN1+W7DSWlE3QYpwFWH4CmhW
         0GSUUSKaapOIkQ/mgZdqnNhod73+RqvIs/3Frbw/JXZ2raFLkTOMSTDTIwxSMMoW1yRC
         1nvhBKOZL8DJuC8AUOwAwWcQcdNEDZ4wSahdfPMtjX9J7WT0KHHesJUuoN20skjs1+l0
         op/F4dZRtVFo/2n3VbOiwFZpQpRa2wN6RIYxGxvR2MQ9KujF/+y1C2JaVERzlWbNDl2h
         5JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126437; x=1714731237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdgIbf082/fMojhD6UXxW2/YldGgUBbc6GKpbpD5rMQ=;
        b=u8eEx7Gx8WkPgw13aozMzIxbgRs+D6NHUL3HQGgeLvT5WChf+cYONSI5L4lgpmAsCo
         H+ZXVwRj71u7YGgHPlXuTbmNW5PQPbhXAXVBJxt/pLWiNf7WiG1pzYODeXMTp2XSc4+f
         uWUgG/EaaDJ2OyUycpL8ipDZpyJRcP/wKfjqbaOskjBjj7FYlEcafA8ME3UcbLtT9lAZ
         JFfSLlHKK02qfWcQEQ9bWqm2O/17wmNNXy8ECZhpTxdDj+//XDvLYhpWOXurFnilyDAa
         hCLSWbqc3ml1Z92Q2CP4Gup85bHj3uLzaFvJDNOLGOUnfeSakrhdgTx7bvueIxu+WY+n
         eliQ==
X-Gm-Message-State: AOJu0Yyo6Pg9ZvobKl4sv6Ur6zBpr4FlSHJo0aqa+ZqT0GAZzW+BihMQ
	tqxCdJPFlFNJaT/i3nICsnxpmc4Qwhg1moaDP+kZcrWHgOKcGSGG20gorwHaIZUSUAmCD5WQkVA
	n
X-Google-Smtp-Source: AGHT+IHanznJXoEAKFu9xGYLOozAL3YSJAxnkwBUqHFUzVHNOK2YJ9GOS+Ts4FoERT+fosbTZXX7Cw==
X-Received: by 2002:a05:600c:1910:b0:41a:e5f5:99f8 with SMTP id j16-20020a05600c191000b0041ae5f599f8mr2094278wmq.18.1714126437485;
        Fri, 26 Apr 2024 03:13:57 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c475100b004162d06768bsm34254171wmo.21.2024.04.26.03.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:13:57 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 2/2] Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2"
Date: Fri, 26 Apr 2024 12:13:38 +0200
Message-Id: <20240426101338.12673-2-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426101338.12673-1-alexandre.truong@smile.fr>
References: <20240426101338.12673-1-alexandre.truong@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 10:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198720

This reverts commit ab6d3e3d645ffc343f434bf731339fa237df027a
from poky repository.

The previous reverted commit was a workaround. The fix
"oeqa/selftest/devtool: fix _test_devtool_add_git_url"
tackle the issue. So, the workaround is not needed anymore.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5475c029b7..c8f9534e41 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -486,7 +486,7 @@ class DevtoolAddTests(DevtoolBase):
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
         git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
-        resulting_src_uri = "gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
+        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri, srcrev)
 
     def test_devtool_add_library(self):
-- 
2.34.1


