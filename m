Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD0FCDE00B
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33409.1782253630551970901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UDzGvYhR;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso2378945e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253629; x=1782858429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/XdRCiD9YdIdvd5aoaNtBrMyOSMJjU6xvlaofT5HDs=;
        b=UDzGvYhRhoie6KZLuaO1Jb5eKg+CAggDpHq4T4C7rqMTkrxc/KzV24/FCxDx5Jy2HS
         bx/4a1FUCB1TddKFRmoT5gSXpggZFAiB8nGynSYtRgNoePYmySrEjuvWSGgeTji/HuYX
         fljZkqWqoc6gxUhG9lJYC/fOuyuiEPu3xlNj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253629; x=1782858429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/XdRCiD9YdIdvd5aoaNtBrMyOSMJjU6xvlaofT5HDs=;
        b=mKJtGO+lRLDVji6ijSdO+WxrUkTR1h3Fo55F8iiBhxCTohB6HtLvI3gw1DU49u3wy7
         PFxZ5f+DCA6soJpKDa3ti0BKlRMKbEdsXr6mzUqoeW/x2A+mPpzpUw7URmg0l3A5wSmj
         lKTyC+jyqPPjahX0eIvD5fCxwLvKLT2U2vzOwJSMx1tAfErKYO3EjpEii1nb+hxacbfH
         RQuWjcZnzBml9YXedBghAv8k/HOxjvth07R8zdD+Uo/ziStJCEMLVDYZQHT1VKMOP0cb
         wT41vFFwzpO9wgRL4b+X8/QCrLF438ldWRlb012rlO38lm4px+0cost0u7JF7DpTjFG1
         lSTA==
X-Gm-Message-State: AOJu0YyjC5Soc2FyWzB/fxdPv/qY4RgJwoWsXCGXNSoiCm9ljjXCWzOF
	YZdIaBTSxae+B0c6mH+LUNQiloIUIEMihsaMy30DqDiJzs/FWL4KJf+XDypGnFjEdhvZXLJt+nJ
	Fy6uX
X-Gm-Gg: AfdE7clD1mffPiiQWh1yfeNHbb3Z5onyInyGaa7QEMO4HY+n3N6Rv1qHgzVO2TYV46f
	OpQi1a0dRTnfmb8ffaftPyIqvFMlFeA09hAptBJSaiQ3G64cCDp7BSFQfZP9zw+p0RhuaimBZ50
	OAYPe2YvWtf/kQbrWEHCvcVuKIRtg2j14MAludd7yO5+vbLIpmqShRGaVykuhSnhGPTZKnfBMfR
	rVy27BSUO51RPk+U74hfZLENiTNddY9eRcI4uIUtQFtx2YdFRD0Dr5UA3xZqHkiOxRQiFBc9P3W
	MXsUAKRUJpVjPJ1SYo44r8JdZqiaqeZ6FUGTsnV5VFhhVVDbfMU6Vu+Tvtn+hz2Tx6C+OnHQjEm
	2yUxb+N2RuTZdFJvE8AdXwZSRdWb144vM27ROVRVYoIf2o6onV2Ubf31M8K8p+ZhhsLV2MVzk5g
	3ZcYbG4Vt2EF2QlSWmCxDSB4i0soCu7CeiSfGxy0ooejadnC5JaUXhERZE5ZQSgykHH3ktObkQ8
	ildXnDz4mHeuXRZ78tv9U1I5hc=
X-Received: by 2002:a05:600c:1553:b0:490:cb90:3e13 with SMTP id 5b1f17b1804b1-49260872798mr7207185e9.21.1782253628763;
        Tue, 23 Jun 2026 15:27:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 20/41] python3: CVE-2026-3087 not applicable
Date: Wed, 24 Jun 2026 00:26:19 +0200
Message-ID: <96efecfbb2d1eaa24e1c96fbd6593a7087464844.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239442

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVE link: https://nvd.nist.gov/vuln/detail/CVE-2026-3087

The CVE is only applicable to Windows OS

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.12.13.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 3e28a3942bd..bf0e1702d54 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -63,6 +63,7 @@ CVE_STATUS[CVE-2022-26488] = "not-applicable-platform: Issue only applies on Win
 # The module will be removed in the future and flaws documented.
 CVE_STATUS[CVE-2015-20107] = "upstream-wontfix: The mailcap module is insecure by design, so this can't be fixed in a meaningful way"
 CVE_STATUS[CVE-2023-36632] = "disputed: Not an issue, in fact expected behaviour"
+CVE_STATUS[CVE-2026-3087] = "not-applicable-platform: Issue only applies on Windows"
 
 PYTHON_MAJMIN = "3.12"
 

