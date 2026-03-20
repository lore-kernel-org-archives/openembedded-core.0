Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0141093168
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2630.1773966515535836300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Mog5Rbf+;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48538c5956bso13238245e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966514; x=1774571314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Brig5MXXzBasL0oGROb86REdQH9AStmhYe0KWitI1f8=;
        b=Mog5Rbf+ZysRlW1yrX3Cp8bLpIxIlCeLNBOmdhQwSJHaTNKNCOFcm5OD+DLTtLURv0
         qc0WOS2Gki+bLKfDtwR6G7vZ7owZI2ZGRnehOP7qxYCdZBFCrZUAS3Lt/IVW78Sea1j2
         aqThIb8+W21ItrtSAcn3Hu5GhO9DvxMoXvSc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966514; x=1774571314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Brig5MXXzBasL0oGROb86REdQH9AStmhYe0KWitI1f8=;
        b=CdzKIxewPXqnaTLhSa+0T+/VtNse6GvAMvGki/lNhDviByoLDpFBeXr5XI8fq7DWur
         3XsYsuDYnhKLG4QBBSt7kxepVY3rTDv6+6n0WuOh9zUGl8ulr8qe+YQDnzpOuv6AFpw9
         gv1MjrKhO7DHBZXrubqB6MbC2ZZmFiPYB2tCtVA3XmS2oQwg7DDrbWe7j2PxR9YgZmJg
         LP3L06AjkRkSGWIWFyni5aP0QWnL5jluoEjWbLuxO7QYCELGqwSu3UtUsl7Rw31Lt8FZ
         JkGcWKu76iIjiKxr5AjdDrW+v3fkS4FtlQLz6Iy5HcKu9/IIpolDCnY8n7YIeb//oaqO
         DzPg==
X-Gm-Message-State: AOJu0YxAxzyMP3P3CHYG2PxW7+GXVqLefTV5yEhmhXlBrKKSCRJSbGre
	ScY4y6riZL1TLgyfPB/Ud91BamfZvKAp0lvgkPtpgV7Ze6WjK2ouMs4YT2gHGjbpb7qjudvXuPy
	evJ38
X-Gm-Gg: ATEYQzz3WZKXO4Ox5DygYkd8YE/fkA1maa8YGXJQiLvnUIh8c3w95XX37Ifr0uJtr+t
	LUaTjP0I8jA4sbQUzJWW61kuD9j4VA7JUuBGctsqUgAaSE0jUUbylmwRrYBvnJwsOR0Pk1Ci1PW
	TLls6V8YXHtJ7RO7ruTfMxAt3Rs4mqGYgZaBQiZm5wOFW6TwrZOUaYdA0918pZCNwLYvkHyNRYj
	NMkxQsXhCkH0yw/4nLNAV1ESsexNDduw1fPWBRGQZF0SiDliT0JFK4m38ub2IV3tMCCN2PhVXw0
	USR8igiMoVXD1hrq0b5lwWB46oD94KmAyjK1w7cSJk07eGteYPmZQDCvHnAfX7feV0OCH/7/uxC
	1BSipeW8qsUL44mSugHxTqJdhLsC+wc6fVYQAAp7vFy8EvBWWFMXTCX/LDOOsfH5IbXMPdRhqKT
	2alMv8E065symuaEIBlSdK23WYgELnyhAPq2W82OdnEKnzBSdJLWEDqSMQIELOK4Tf0dplx6KAM
	co1UpYO2V/HzVHWYn+CKP3kcWZEfV+xWSrEmQ==
X-Received: by 2002:a05:600c:3105:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-486fe8f08cbmr19347315e9.14.1773966513601;
        Thu, 19 Mar 2026 17:28:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/15] oe-setup-build: Fix typo
Date: Fri, 20 Mar 2026 01:28:18 +0100
Message-ID: <42f69d702f790f6f2c0eef0124ab9d618b1fd945.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233572

From: Ryan Eatmon <reatmon@ti.com>

A variable was mistyped in an error message resulting in this error:

NameError: name 'tempalte_name' is not defined. Did you mean: 'template_name'?

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 275a3c015d37729c3b0c9cc4395d50ea2f210f02)
Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index c0476992a2a..1cb06b3b793 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -77,7 +77,7 @@ def find_template(template_name, templates):
         for t in templates:
             if t["templatename"] == template_name:
                 return t
-        print("Configuration {} is not one of {}, please try again.".format(tempalte_name, [t["templatename"] for t in templates]))
+        print("Configuration {} is not one of {}, please try again.".format(template_name, [t["templatename"] for t in templates]))
         return None
 
 def setup_build_env(args):

