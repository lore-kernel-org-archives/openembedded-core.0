Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7245C4450A
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:51 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14798.1783866585096381116
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Sq+isa7W;
 spf=pass (domain: underview.tech, ip: 209.85.128.174, mailfrom: vince@underview.tech)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81e69a2db34so33321157b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866584; x=1784471384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R67z6hoJ0NIyO+wE+zoZjMrHko4pBYAtLrCdkO3LGaw=;
        b=Sq+isa7Wh2G61avmt0AXiynwoTdn3J27RKXA9bvBUzUT8hi9uq40x2R0zrgVN5NJ6I
         7YM4A4hfQLmtVbiU2FAmgVVfrLAvBAzV7LjDDpGmX/xPxmbFiF9OiwXpvcxxMoipQF52
         ic+ugFHUmlkusoPUTf+Cvr+B9SSV3/IUPBK0zrqLKTldQtT2HOPS0uW+cxaLNttZvmhE
         WCGGrc9z4VOkNp/dMbfkHWFcMN0Cd7CwqEsWyxhlAoWo7YiFUOzmsszE7eMdkAsho8wF
         CP7viYPbiNcMJhJ2TGRZLVnh3p4c+S5S2lerhOTujxv0PPJAeqi9nBRBzjg6VLrPkq2a
         1HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866584; x=1784471384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R67z6hoJ0NIyO+wE+zoZjMrHko4pBYAtLrCdkO3LGaw=;
        b=XMaP1XXZ4qm8ezynhfYDLml3uz3R9MKo8EekAMGvACVO3t+bZLjbvklDpzEq+v8Y/O
         qWNRD9AnDDD9Lmuz0b8RQVN5oMbDgGMKz3+vHIrQkLWlWCvHe5SDK6RRG96ZOEBewZ2B
         5bDQk4RGmrYdgdHXZwvGB5MJ+oJtiPKZ1N7y0Cy+w9Ua/jdeNvT0UIGGLSlFx8svUUBu
         qNirlzbegqyeJV+kFufjcY4qrXKDPjZdVBzSNgjnuZAtiUwQdvLQxy8x9cAG4CEtDgnP
         nufl7vwa6MGsEbow5VMIQs9On3Z/nNkMw/M1gmvEaQULmBVEejLMbqrB69hzllHTNQ8F
         Dxtw==
X-Gm-Message-State: AOJu0YwTrYA3B0mndZAwDdN2ucBPTwcroBVIEdGd2RiL9lyyt9AEOwKy
	8tbYZSeQKzC5dUaBhQV2oomOMGdNEFX4mCLi+X0Q8sWNxLDAiWOhVfSGOgI+/gUkRdaUnpyJsUv
	yruVQjX8=
X-Gm-Gg: AfdE7ckjub6ryPFFUDzKEwwiyDr34G4R0x7xF99UB+nXLtL19lfBKPbUHirf5arW7wp
	f0UeL5IlJd5dFQvRt/n9bBaT8Llsk7fdzqFTrl2l474vStOYFZpIOY91habIxFAQGoBW7BUEHHE
	wbM7QGseRmjcxVMyxbWh8+FolVx/AEURUOO6w2tM+WxEipxXSYzzjhSyuXHd7Vfzcv0I4nS5OsV
	eUzQFi8kMoMWrDOCcf16nDQ8RHFZnlA5zRM0NIAFjnajuFOSAMlJuVDZYaWiveS4craPysfi6ER
	Emyo3Ki0pIF0nzWHkaZWflO5tw2bV07iPxPxOc6aHIMk8HDoSygUqcyqrqFtJJfJGf8rWQ3f7vE
	4xKiHxa/00Em6OfYfITO1GND0HX662n7PTq/Ho03OHPthCI7NCA9/3k9PxAdr9xaaO6CXbvJ67X
	gubDHzg+akGM3wmw==
X-Received: by 2002:a05:690c:3391:b0:80c:e8d3:1157 with SMTP id 00721157ae682-81e90085d1emr48334177b3.24.1783866584059;
        Sun, 12 Jul 2026 07:29:44 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:43 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 22/24] libnl: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:14 -0400
Message-ID: <20260712142916.2573370-22-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240788

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-support/libnl/libnl_3.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libnl/libnl_3.12.0.bb b/meta/recipes-support/libnl/libnl_3.12.0.bb
index 2b46fb69d9..cbc5eca20e 100644
--- a/meta/recipes-support/libnl/libnl_3.12.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.12.0.bb
@@ -54,7 +54,7 @@ RREPLACES:${PN}-genl = "libnl-genl2"
 RCONFLICTS:${PN}-genl = "libnl-genl2"
 
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '', d)}"
-RRECOMMENDS:${PN}-ptest += "kernel-module-dummy kernel-module-bonding"
+RRECOMMENDS:${PN}-ptest += "${KERNEL_PACKAGE_NAME}-module-dummy ${KERNEL_PACKAGE_NAME}-module-bonding"
 RDEPENDS:${PN}-ptest += "iproute2-ip"
 
 do_compile_ptest() {
-- 
2.43.0


