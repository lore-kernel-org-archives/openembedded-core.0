Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7EDC3ABCF
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:13 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.1422.1746804244433656949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x2LiZPfX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso3193382b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804244; x=1747409044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFY1JKfV40ePZ7BNGWJZN/ncD8gPJzMqvq1UW+mwqBs=;
        b=x2LiZPfXVCLv2KuPmCvHwwIve9mEUNsFUi2pQsAPdYhbDZybQsKarGM4WDIadBtL5J
         iJQilRk0zDWMWlhKSRsk+tk1BvwtIWKNy6Ppn52cT6eVDK9dEvcrAzBXdg2/lDJDjghs
         +RKq7mts21ztjp11S2enc3FbNpJ3lH+yIyJdKPmFtzJv0AxGoaOiG1o/9UtDg1Qo+HsW
         MhlxAkoH9/AGwAxUes0vRfQ5fj17aQNreuKQIMiQe86b/+6bJqELMEYdMDxpf30d6Rvf
         CuTeZGphC8m6rcV615iRzjTjYfrq70BB5HB10UG7XJR3BZLPRG53QAb7TvgpRBRfBU40
         363g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804244; x=1747409044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFY1JKfV40ePZ7BNGWJZN/ncD8gPJzMqvq1UW+mwqBs=;
        b=KxfRB1D0MJKKvDYyaAT8ZDxZXYwMxGRY6ZPHH1YuTd/4EE37ujM0WSzTpP1UFWoS85
         YzXiNwX8+3S7KCRa0+P8D2/Sxzu9MuVMBxLsscEIkDrHDeUti7xoBPb3IXBHMEHWV9OU
         Bgil/6EKe23fJDkf7JZFTpWArd5MIyqrbN7FU5ynTVH3F5y9567JjMAZZnho8u3kl7Pi
         80F9CdkoywetdovqxBLHQVoSZLWB49c+ATEuBqK6yF/fiuOQrlPE7LtcWgT3XcQ4Ogzf
         GYZ9aZuwbY2Y3W6Zy1D5M0lkDGJChPCCH14RdvxLJN6UcfQwdwAov3yw5zbYNndJnC2g
         uHew==
X-Gm-Message-State: AOJu0YzNQjGjE2I/UGYsqmcHWDeqgygvOCsf/C6Ub+rfTTVR4adN3Uj3
	Ifp6WD9HBuRmaVURZMQOKCif/KyhSxaMimNikrtNivFEC+sAU/ZnnWu8Cf0GP8fPlL8lHhceTcs
	v
X-Gm-Gg: ASbGnctpnhMOWUsA4SLD+6aZcp2CFDZj8Qj+VknUCaNUC2G2ML5YyBAQ5omvCoYaLM/
	9qNrNKVNsVlakpI8H0+rdZ9wEhF9Sw4FngRBMAjhfNhtcsSjU0ug3B/sOl66DpcS7PZxgla/YJo
	/EpMGPyBJYwEDofVxOJ+x6DYSKQBzoEKWv/hCVBcw6ZdoaDN1gQHqjYiKJb7kLivzx+97jJUB/Y
	vvifghSWvpQJHJNSbGEN9A2DxBzP8CS3jAZTnESWxkgN6jTBSc+wzfDL0OtskWEU9dLpCc3B1gq
	PM2hjS9BVh8sI0uZNG33iwMSIRD+Uwdt
X-Google-Smtp-Source: AGHT+IEHOxVGyn+YvoUMJIxHr1IRmbWeNAi0XyH+QGNMR13DMMxp3xoD6LWF1B1lRW2LE/A1G2rn9g==
X-Received: by 2002:a05:6a00:4605:b0:740:9c57:3907 with SMTP id d2e1a72fcca58-7423bfeb5b0mr5464986b3a.19.1746804243662;
        Fri, 09 May 2025 08:24:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/17] insane.bbclass: Report all invalid PACKAGECONFIGs for a recipe at once
Date: Fri,  9 May 2025 08:23:24 -0700
Message-ID: <c311d5ddc102f26ac1813c540520175cfed3a5a6.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216216

From: Peter Kjellerstedt <pkj@axis.com>

Rather than reporting each invalid PACKAGECONFIG with a separate error
message, report them all with one error message.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 748de050e0..cd26bf5eb9 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1469,10 +1469,10 @@ python do_recipe_qa() {
         pkgconfigs = (d.getVar("PACKAGECONFIG") or "").split()
         if pkgconfigs:
             pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
-            for pkgconfig in pkgconfigs:
-                if pkgconfig not in pkgconfigflags:
-                    error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pkgconfig)
-                    oe.qa.handle_error("invalid-packageconfig", error_msg, d)
+            invalid_pkgconfigs = set(pkgconfigs) - set(pkgconfigflags)
+            if invalid_pkgconfigs:
+                error_msg = "%s: invalid PACKAGECONFIG(s): %s" % (pn, " ".join(sorted(invalid_pkgconfigs)))
+                oe.qa.handle_error("invalid-packageconfig", error_msg, d)
 
     pn = d.getVar('PN')
     test_missing_metadata(pn, d)
-- 
2.43.0


