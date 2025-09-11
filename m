Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5447CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:11:19 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.44999.1757592673551598640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 05:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YfFCXdnY;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32d9086276eso601497a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1757592673; x=1758197473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKGu2gVCht9Rh+kF8z3wsB/qcT9WRkwyqCngV9V1zfA=;
        b=YfFCXdnY5/2QLUhsg3EIn2HTPnjnIaNxkfpEC57RemNQ5eMR6wUVvNQuUld0s7QFqP
         vXanzM8C4v9AOtfg39rw8bZStMDJlH52/JdqH/7XJqTwCbi5bPjSu5EIoJgfU87aeXvC
         DSo3J1bKO5XHJ0t/xbeYZg2Sr6cY0l82oSO7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592673; x=1758197473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKGu2gVCht9Rh+kF8z3wsB/qcT9WRkwyqCngV9V1zfA=;
        b=HYk+ZNim+muf4l7Bburrcj9qJauWQAHlFVW0OQW07B7ebV245qDO/QfKyk5ewhMvuH
         w2y7aAFhVFPPhyqSH4HVqVZ+1fGXO4DNUoIDxXNVAszfYJqIioVr/wcINTS2cnFvzu2a
         CeD2x6bNEpFn09dlDxMW74V8Cqyb7pF2OxWEvjLHXHJW3a9pdN/ZDoVgYFiZqVOR2xUh
         OgwAuoY5RKpGhTVTpn/W+SvXYI0M/2taRj37kOKR4T0nYAZwHIpjKnWWuKfa9U0P2C68
         UUXgfi80rvhOHlTWNHrZZM58cnOkut/oGtD52fv3J+v9bj63548wDjD+vicqlf7NnvmI
         IeQg==
X-Gm-Message-State: AOJu0YyHp12z/8DAnYxW/Yy/lumqaa4uECRTSm5xxoVPMkWOSSfw+6vP
	T3uDlXwP82xLnpJgnCURmvJxrslRtfqOgmtfanvZAm+s0nx6/N5EJN4VMEYafyONWisI0Mdsj+T
	DiQHz
X-Gm-Gg: ASbGncusG/GvGKtoYNJGpx5IaCKsR7eMxbK6MdtdUsRt22zDOg1NL/kbVX5dbzJMJz3
	zIPuRSxK5tyCB8f1mKDzzUVUlcaX5sAVMjrbBysrEhk56GJc6sqD7b5Q5KaO1wySTK/Wu0fJemH
	P9SSBtP599P5Zy9H8qvErq7LogERcR8qzE3lu2CtZnlVSBGvqM3afnsO3lLoNSoaIELmlyUZj83
	mVQz/t5k9qdg88psxMIiTMq2DMcFr6IBw03mr4G82PBBEdL14RPrNjztXc0+SVCArGhzDvixSlb
	2+2AuqTdBS1GAXwBvCmiGJt7kitQE7IpUzvVPoPqYzogVOTgpqY/CBwjp1nFYkXAdsrnYDG/g/m
	fq9+MUkQC0j2CvfT9hR60Yk2ESDS3W4omU8GY
X-Google-Smtp-Source: AGHT+IEtBlwOFjgj6nkpmP96LvS/Km/MBYG6zHPnmdpzPX6tFLUxa7nUH55leDlVOLjFmJMMNnJwIA==
X-Received: by 2002:a17:90b:384a:b0:327:c417:fec with SMTP id 98e67ed59e1d1-32d43f1780amr29036004a91.15.1757592672678;
        Thu, 11 Sep 2025 05:11:12 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd6306ed4sm2538320a91.13.2025.09.11.05.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:11:12 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] go: ignore CVE-2024-24790
Date: Thu, 11 Sep 2025 17:41:03 +0530
Message-ID: <20250911121103.22531-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 12:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223273

CVE-2024-24790:  net/netip module was introduced in go1.18beta1 via a59e33224e42d60a97fa720a45e1b74eb6aaa3d0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 36356349d2..b17853035b 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -70,7 +70,8 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
 # https://github.com/golang/go/issues/30999#issuecomment-910470358
-CVE_CHECK_IGNORE += "CVE-2021-29923"
+# CVE-2024-24790:  net/netip module was introduced in go1.18beta1 via a59e33224e42d60a97fa720a45e1b74eb6aaa3d0
+CVE_CHECK_IGNORE += "CVE-2021-29923 CVE-2024-24790"
 
 # This are specific to Microsoft Windows
 CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284 CVE-2025-0913"
-- 
2.50.1


