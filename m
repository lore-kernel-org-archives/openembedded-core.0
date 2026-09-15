Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16D9C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:35 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4699.1789499020323391749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ndSzrAS1;
 spf=pass (domain: baylibre.com, ip: 74.125.230.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca17so436051cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499019; x=1790103819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LW1NvF+bHo3hl8Is3qX5WbPU030ySSriq5P5jw7Zk3w=;
        b=ndSzrAS1g9A1dKTwyrU2tDo8cCyykZGOMrvqHcVVsXVjptNsZZRnwtm0SVD55FgsLz
         NYkBcp6Xu5AAqcOEBb4wH1cRe188QAqlMzB6ZzbibOOMVbl/KrKT0Y5nRHIvmCmYzVCd
         Ic4RsK+6TsciGKjgeCX3/I37c0nYdGYFCHKCDjDuk2+GXliGt0w7+Kfhewr2lAUhfz8p
         0aVclaVzGO5CKLRWk0Qe9QvqfKurVPdSO+5vbVdw9jE2lq4juGeHbg9n42he2EFvk/ga
         vYoyhfFI39Ix795IkqX0b1lhUtpjqhtDp6pGyvkegmZ997WOyK0lfSz3vX7P9e3hFGKI
         30OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499019; x=1790103819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LW1NvF+bHo3hl8Is3qX5WbPU030ySSriq5P5jw7Zk3w=;
        b=zZIxr0RbfneZiqeXZAoiTd9TgnXU4RSU76cSQcf0fw+CLYCPo0CySkw1kTuWagUyo6
         GVndV/6FSpvi7Z1TCg3r8qr4w8MCYrKlS5ixOpL1MJPcuUDlcgie3HIB5KAPxMIoybxJ
         yqdzuQaz+qwPmgEdnfTtoJTPfwKEnL/9SYE8h3zaRRWOiqyFVIQJDhA/S9pz1/EChrwI
         1a9kRv1ArGjbmgh0eMPldax9K+xhqOn0jnxEoIzQOAUMbpm44Q9OTjQE2pmGI6Mfinsg
         81QvYwmv9q7iMNEqfppjwk+xwaqYACpn67WXYXgda7CUf63xhUKcMSMvaJIGScfB+Dzj
         LcBA==
X-Gm-Message-State: AFuF++kXQlDlLgnkKTMt1FmU1VNmlFpqCCSL0JZn98rN4F7Je7t73fvV
	9sf6aYUFVvB5GWnr9udsaQT+I9ISnbx/8dZrQYcVLZ+s3seJNvH2b0ZcjxaNkEJGVgZau1aIjvm
	ugAhN
X-Gm-Gg: AYBFou3SUO812ZzQcZMF/dK6/fD0LWXWlb4CvaqAzE8EM+vOaG4htttdbZMaY7djbQX
	lm6rjN3k2Yy62bt8TDcU+1ntlcsAsFwfgtPil+vYWBrKQDindWf5a1w7+xH9DdlhkAR6Nhcqt/U
	bt/uMNN8OdIZdQbbYoljLZYnCnPnMUNsbpktO9BVsC7c8EDatAkzXMzD1jv1T6v18MPtv4YxH6w
	F9DHSA1TOgEfGLU6EuG8Zw0WQl1J4dT+y67RTLI/ha+ruzJXPCPj4FDymtWTI0C3TBdSQwhNwf6
	0JnzH7n4gCJYwLfbulyD3JBjb+dcAx+Iu9yuQHVOEu8GhSSz0m63FXZ9e9aBBlis4m+/NjBpeSl
	XWxoucPBZM2GNy4KYuiU9AltRjRwK6CUmfyRM4SD6uPQjF3OuGcGLgm7pVDH7AcYY6Yzm1OeAZ9
	EnS9aeG7T638mq2htnD5MqrNd98DuRuHf/ohwAD4ePq9T1K/u9EnYVgOESfjfciVuRJ785YUlen
	1DTJdOn8gLadWOalt4LGnXwZqVTZvnAAK72UcoJDg7l
X-Received: by 2002:a05:622a:494:b0:530:313c:292d with SMTP id d75a77b69052e-5310d03c62emr146905791cf.36.1789499019097;
        Tue, 15 Sep 2026 12:03:39 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326200b8d1sm1663871cf.12.2026.09.15.12.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:38 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 07/14] meta/lib/oe/tune.py: add rva22u64 profile
Date: Tue, 15 Sep 2026 15:02:37 -0400
Message-ID: <20260915190244.2983746-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245882

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index fed593e9af..8827d68a23 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -9,6 +9,7 @@
 #   -march=rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd
 RISCV_PROFILES = {
     'rva20u64': 'rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd',
+    'rva22u64': 'rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt',
 }
 
 # riscv_isa_to_tune(isa)
-- 
2.55.0


