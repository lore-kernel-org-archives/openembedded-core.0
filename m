Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735E7C88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:05:59 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24038.1789070755285719815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HIyOTpPU;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso126553a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789070754; x=1789675554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHWP6DM91DbS67E+q99Cke0GRF2GtNWUxEA/ZG6cI9M=;
        b=HIyOTpPUMUsY0fGs2A5k+S9f7yh6/2Vmsi04a4vhcdYuQu61UvZNGd2Y78u4aFZ1I/
         yLs1PO+wOpgyYaKbD1yQlJqBQhkGv0WzEGyy9ZyZqShADBKGSvNAPUNhQ2xQnAnhPjBr
         62kwGPczLg+09qBffxehNGpAL52pi+gvXDWaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070754; x=1789675554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHWP6DM91DbS67E+q99Cke0GRF2GtNWUxEA/ZG6cI9M=;
        b=lTmL0PrkZFL+xfXe/UctYJnbWrHTnr3hHm4sVfaWcY+FrrqltE8LFUHPWaCpp63P8B
         N/DcUhp/AlPjpJxULk6HPJmIXTg93FOgP2TwtE0JqmTTg41ohwrRWrueBHMGQwG1zMAo
         mQoLwCputfO7T3WkP3OUwwScj4QsZMjDX23bzElbeNrPX8z7j0NHCPy42jUx0+PaTxR+
         NiwKsd5FG8PXruc40mHfrONLWffgqlLrhiqLC5Pq692yV0wdaS3nIHoYOFfQv8G9nL6Q
         Z8e4nIKZtNsAWegVFoaBt8cbMffjNxVTmnOOHRC5R5V7yRdx24C0uazwVUPF922WbShC
         2uiQ==
X-Gm-Message-State: AFuF++ktanse7f4qmMgdKj/krFvR2uLOloAZIj13j/G/Uy9VrhhSfQBd
	fknLK7YFZqjmDpIv1A79kfkbn7LYNo5YrNisIV8efGmPWzQwLX1adquhjD3904mLDbqX2QMceDi
	AAIAA
X-Gm-Gg: AYBFou0AWWcX489B6IIcdUWU+ZJTlbCesykXb+Ag7miPC1HJzFT6mQi0T0uSnjvW8gh
	wZpYCFVl1iRBEU3T+k3gG2wBKWBzRSUkXYxSaZglVZqUfa4UllHOutkrWtMDAnraN6wT87yBE4N
	m50Pv/d+HO3//tM/tYWBb6y3/4kq/BaIjHFqog28N9ekI8WhVkixYhiU1fPI6tPUfCvKkXviiN9
	T/BiFBniFnF7xVclVB7Hcekfewld5DX0BvmiM/K0lZI7zkD0BUeguLetUdKAmXXCQTi0SOKLz7P
	5LJkSOWfkPX4vpw7fq0AVzpiDcs0I6o1WPk2N/dqFVRoz0vrLHTB2fT+HnzA2W1vFsSchcTqNNR
	Myg8mDDaCBoQrZ6bPOj2G7f0NACWyAv9BripUSWhJVGqrpjdDpTsTP3qyQkm0NH8yrilkqwR/dR
	upwbZgKWCjrgGmPJKX8Ry0850HfDYh3TFm24LPdCEF3DStVIzxACEItfAcsQfloeA2CputdHQ2f
	afZRsvt8Q==
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960825mr696706a91.0.1789070754488;
        Thu, 10 Sep 2026 13:05:54 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm527974eec.3.2026.09.10.13.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:05:54 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 3/6] libxml2: set CVE_STATUS for CVE-2026-86139
Date: Fri, 11 Sep 2026 01:33:26 +0530
Message-Id: <20260910200329.842463-3-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910200329.842463-1-sdoshi@mvista.com>
References: <20260910200329.842463-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245595

From: Siddharth Doshi <sdoshi@mvista.com>

Analysis:
- The patch adds return NULL guard when xmlStrlen returns 0. [1]
- However, in libxml2-2.10.12, an older iteration of the guard clause is present, which was removed in future versions and then added back as patch via CVE-2026-86139.
- Hence, adding the patch as fixed-version.

Reference:
[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/8edbbdb09f24d26a2f900141fddc2b9d014f53b0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86139

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-core/libxml/libxml2_2.12.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 28ae601118..581f38197f 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -46,6 +46,9 @@ CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail
 # https://gitlab.gnome.org/GNOME/libxml2/-/issues/958
 CVE_STATUS[CVE-2025-8732] = "disputed: the code maintainer explains, that the issue can only be triggered with untrusted SGML catalogs and it makes absolutely no sense to use untrusted catalogs. The issue triggers a crash if an invalid file is provided.  https://gitlab.gnome.org/GNOME/libxml2/-/issues/958"
 
+#The codebase contains an older iteration of the guard clause if (!(len > 0)) return(NULL); which inherently mitigates the len == 0 attack vector described in CVE-2026-86139.
+CVE_STATUS[CVE-2026-86139] = "fixed-version: Length guard safety logic natively present in version 2.12.10 protects against zero-length integer overflows."
+
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python \
-- 
2.34.1


