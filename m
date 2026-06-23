Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5D3CDB480
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20839.1782220482650604179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fauaj724;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso36864495e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220481; x=1782825281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/XdRCiD9YdIdvd5aoaNtBrMyOSMJjU6xvlaofT5HDs=;
        b=fauaj724bbSsw1XO0dcWYRd6rYJDzBVvS679mKNgyJnPoiTGrX4Fu29VCX863zdnfi
         /7HBmR+/56Nu/Y81M0BHQ89YwLa79eB0TxBmQ/JZLWg4J7gUq1Ujvjfkp6YaFbMekdtj
         +t+2XixHxddgNBRZEYeCPnQ8483mqR0bmyxKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220481; x=1782825281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/XdRCiD9YdIdvd5aoaNtBrMyOSMJjU6xvlaofT5HDs=;
        b=AlgdKYnVlMNFC5YdurT+B48B6mRMlpCHRWd92n8+tlXtEO5Z0gp8ephbaeQXjxF/Sj
         EfBXRCwJ9x76772iqkE6+FvofE+e5oKlQEPrY8AjjpGmrligbCJldZbiwXnhPtpA+eSM
         gWxME8AZpeqQwZmwbMoMVp4+ALIp9CVPHBq7wLXvXvv/HhDBN0oimEs8NzpUs4IodgE3
         YJoqDYVQ5tJJywMpHyd6m9m+q7/oZGV7/1k7roxp2l3pW4d0K8MrJkdsYhC6JACQdJiV
         B/DtAonICAr5lI8eHZA6tdJls+WocrijysG1JSgykoUVh86DwKMROtXKVre3e64eAcnX
         LgEQ==
X-Gm-Message-State: AOJu0YxcnKJvYC7SWStsLLuVcwnfDfKXYG0MKunNuDZynB8rOC42QAsP
	m7Nx+HdO2zwRJxb+NuxIOYMD8WMOuTNIFMgzQ+X6V5jXt/GgP18h3MJj2Pbf6Nh5/9BCmN6belN
	RHp4W
X-Gm-Gg: AfdE7ckLnK5IVpaOA4NY6L7u3dnjhhQ4rhXvlcUJYKyPtii9yTZpP4YpNFD/HfFZ3u6
	tSngDB4g1nANLHupHGQ51oyF6zuE0iedcT8BxZCia7eXfsSw496q+QGTWi26tBuQHXx2QopMn7I
	WaFxnNmrwOGEDisMHNXKLDAAiwSeRsRD3X/ZLVCbJKHdDm9MeouGk64+268GNAAEflgQbwI2kRt
	suADegqHkKRJN6tWRgQfdXIPg7ezHcRvhPZM09KvswsCifDrkiCdNo1YzC9njZL5fEBFqijDB+E
	36dAWNAg8hiIVmbOfhOBcpc95qaPFfQUfuxuOSY+BB3mIiRVxjo7y/HtE/46hdGiOSRl5tOvz84
	Ldr9PpEXGB/psoyP5YVDmpi0KqqQ4OcrAJU3FflrkoBQf+BYMp2qV9sVKalg+7vP/+uMeQ9IQ1b
	2ZOrKQixFa9Tkx7VYB1gAMdcQcBD7vwyGiZajFZC/yGEYpYJJbpf0a2xO8NYie9tFdQIgrOmQUS
	nTMfbw6CV+nr8zj1g==
X-Received: by 2002:a05:600c:a117:b0:492:4b22:79ed with SMTP id 5b1f17b1804b1-4924b227be1mr161321015e9.4.1782220480847;
        Tue, 23 Jun 2026 06:14:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/26] python3: CVE-2026-3087 not applicable
Date: Tue, 23 Jun 2026 15:14:01 +0200
Message-ID: <96efecfbb2d1eaa24e1c96fbd6593a7087464844.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239386

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
 

