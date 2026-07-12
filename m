Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0840C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:40 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14791.1783866580454024375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=gqEHVU3M;
 spf=pass (domain: underview.tech, ip: 209.85.128.171, mailfrom: vince@underview.tech)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e771226b0so33246627b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866579; x=1784471379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLHYSayuAI0+PNxiORMP6oLepN3WwbNmmuhzSMJKvkU=;
        b=gqEHVU3MtUIuA9ZXOSp1CYkFWG2LvPVrqz9pUkounIXfXRX6bRuVvlg81RbHqcP7my
         9/CsePhzsjKZqOm4Q/zKY4nbzSbcgQ4DBVekio5vF8IjMQcp9hUBF/XwVyVrt0dR5a7D
         UYrzDFU+fIyOk6Qm/CMskuTdJKMmcmwIf0BwdaKi9lQAo2MdKSOn82mfwA0X/QOq4g5O
         NPGZI+CHatOJ5+KwXsisy+TRZtsxlTyI80AeUu5RfHD01qwfK6Qmzail7S8tnEAHXBL9
         WZY7Sw9tOE48KJXJeOfWBPR3MkLBUJG9vny+LdD2le0rHyFBQDketjcKK0ZMKX+H9s3W
         27PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866579; x=1784471379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLHYSayuAI0+PNxiORMP6oLepN3WwbNmmuhzSMJKvkU=;
        b=bElLVkEsSxelx/JKi/X8IY3xWIM8e2CCMabsNqgDBb9LafKbzZLXgpVo4O+zHFYqM+
         cjAqRlbp1VxrpSZEnGTprA3YJ5YbB2XgOMRiKRkrQh36+ayr9eC6fdlcK5L90CzeupO9
         p4gWLLxQnQJ4q9CcEe5eOxiI4QEmkTJu2YZNFRIp4uDot2fku0nFFZaenuFKWxl1WmUQ
         rf9zYVm88cGix2cDNeEMIg/WkBD+A6AhgawazXBdYy3AXq7PRKv5uy/dHIm0mckQNufd
         zG1EZ8h/2duMbNrLSTr45DZJsl5YSB1c7KWHAhpF7fUgFEXmMy8f2L1u7V9dU0P+UZyP
         jeZQ==
X-Gm-Message-State: AOJu0YzXI47VsxKfBsMiRrgbvFiNaTntVaChXIL6aXO6vAIa+0PaH2p8
	LZjrVk0yicDFRxNcqYpkzODo/0PdIzu4NbuOVQEap0YP91SutO6+TiWklmLFffuR/NOe+YCaBw3
	Anc7zrOA=
X-Gm-Gg: AfdE7ckypmoYbXk6oIOOdcNCVU6X+1/NYcW81CAPLq/OYrcRfZtjXaNPiREXT+12vnk
	wsGjg7E/bXpJTRxNoQwe6dIzpD3EclqwTAEtd4JlK26TlVMQDQD7vF3bVkm/N0IXoDX7O0OT1J5
	iJHc6yEJjRMHRIM8zjzZSxee3an+q+/d677hxx/8IY6ccRqyQ9iO5zCfjP5TYXQzXsYJXkY96te
	kVxL4UWhKRnPrPAQhU7GoQhNfvNX0P43X3/w0D75Y6MQ4gnt9oAtnfmWwfeAGZpOqfClI2XYHsP
	l+WL0hkAZpKe0dUYfKIQyv5ZyL7AHv2np1Zj/w3gC2vpFEmSUypp/X42XRKf6ruT/J6C5XlOZ7a
	gfUi7h4hRpzftV5TwWxUS1LOnvV4NFAiFEp7ip3x/N+jGK9GzgAbzeSjv3DPPHZjIaAFTrgrz/2
	C1xXefF3YujvJWS6RRSZwoA7EI
X-Received: by 2002:a05:690c:b9c:b0:80c:85b6:75bf with SMTP id 00721157ae682-81e902d64a7mr43792597b3.72.1783866579525;
        Sun, 12 Jul 2026 07:29:39 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:39 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 17/24] hwlatdetect: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:09 -0400
Message-ID: <20260712142916.2573370-17-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240783

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..7abbe25dec 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -23,4 +23,4 @@ do_install() {
 
 FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
-RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-hwlat-detector"
-- 
2.43.0


