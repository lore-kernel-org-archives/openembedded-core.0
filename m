Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D767CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.33512.1758139524504036828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0l9G2mcn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-777ea9fa8fdso285135b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139524; x=1758744324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ha+wClOcdTrledpeZup8kIB7XwDdNWxaTMj6QdbScU8=;
        b=0l9G2mcnYx/pEsVLulvg/1y7V/thrwaOSKykUZtqg++RNGRNAi1vXUck6Bu4GJDVog
         7b18UOn+LrUIjZws/TAMCkbIpKcgry3wtG+iHPTJ0tLjtioZKLr3ZbIdgeWIGWhv0TCN
         aLcMgvn9Ev2mHX+YOgf8ILtrnNpOobPYG1N5lNwyjrGNBFRtw+sdxvrHxRtqNwEXLVeY
         CvvRuwrRVDcEXtzE7DSWibd9uc9IQ8A7JgW0wmcxEQdAvOCH403ODmjWNR5Hilx/i4qE
         IVgPsdKC1S94cHAMPhmgssg5G53N8YAfId5doBR86Tjxh/E8ViRMDGRypOhdbUl8EBJ2
         Lqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139524; x=1758744324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha+wClOcdTrledpeZup8kIB7XwDdNWxaTMj6QdbScU8=;
        b=eb/WKrBBYNGjL0XuIVZ2YUHY3JUIWNVPBSdpr1EFogv8wPzJ2Tsx/RPfhv5RR2CLGa
         f5LxyUiXtAUJnOVEeW4H7/jqpJK8ELek9NpdQvf2gx9IG+Z0E/fyjS5p4LkoQFNbqU0E
         GPsmmawmhi7bDtEPbjEVaa0xqSRAoO4JCiv/5/vm79QEy2eSENFmVDWjFY2bVhSs0mbL
         I2C0KF73347d05eTbXeMXwBOUbS4el1VFbiOyozqUHiPauuKgQuFowB1qA86jAHPjDwe
         EjW4y52KKT0ZJYa5OBjME0wp5qkqzQd39cEp0eQRYFv83OxERFKoxynQBTBJ7gkvGfd3
         7owA==
X-Gm-Message-State: AOJu0YxQ7kAK30to7UuMIRkq4Rlb9rP0+PuUYQplV8+7aJN1/c6x2cX/
	Hs5VtDFDkLSVO/JF4VIFl4DKjCUdoyhRx8blp2Rq40tg1szT7KkzU0VucWR1Plu+OsFboE23BVe
	G99KL
X-Gm-Gg: ASbGnctrojDNMN1Y+GgrpVK3T2W6kd2V5onpqAUcytn6XTPOiewjkO3XCOLB2PNtX9N
	jBm6cjF5ww+AvEHznzKS95Luh0iblFcD7bCtFZD+uKWBwguSL8xFnjTU8GK0/lx+wDuJZBhoNE9
	ONrbTJ+LabgWSUrJlo3rpxgFj8CYV+Npx2YDY/tIaBtcx55fL9IdmiG1Wow3EBjqU1zLp4cBOMN
	GXNtrt0997+TpdSVY8+mDlfGKn4KPZcHZMzAhY4vKlfzDL6U3maXOFScvm6s5N5N0eSh/7crj2g
	SYMBUj8erlQr5iJtmjxXVDTFZddsZCdPiyzZK8nBhp9pXTqZYtwPY1wzFGnUsR6EjpdbKOyjV8n
	NX7Q04wXzJqQXbreKAK8qajmB6MHZExej
X-Google-Smtp-Source: AGHT+IF32WF06Qz+1eeQ6Yd9sp68s/K2dvFxX/xWIWy78AT8V5Qkrq6trx2PyBGtXn9eyI/JTS7pkw==
X-Received: by 2002:a05:6a00:88a:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-77ce1b8a501mr857196b3a.10.1758139523770;
        Wed, 17 Sep 2025 13:05:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.05.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:05:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] license.py: avoid deprecated ast.Str
Date: Wed, 17 Sep 2025 13:04:43 -0700
Message-ID: <df9898f13c261eeac2cc343569c843bc7dcaf163.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758139278.git.steve@sakoman.com>
References: <cover.1758139278.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223621

From: Martin Jansa <martin.jansa@gmail.com>

* it's deprecated since python-3.12 and removed in 3.14 causing:

openembedded-core/meta/lib/oe/license.py', lineno: 176, function: visit
     0172:
     0173:        LicenseVisitor.__init__(self)
     0174:
     0175:    def visit(self, node):
 *** 0176:        if isinstance(node, ast.Str):
     0177:            lic = node.s
     0178:
     0179:            if license_ok(self._canonical_license(self._d, lic),
     0180:                    self._dont_want_licenses) == True:
Exception: AttributeError: module 'ast' has no attribute 'Str'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/license.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index d9c8d94da4..ac5b296e60 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -172,8 +172,8 @@ class ManifestVisitor(LicenseVisitor):
         LicenseVisitor.__init__(self)
 
     def visit(self, node):
-        if isinstance(node, ast.Str):
-            lic = node.s
+        if isinstance(node, ast.Constant):
+            lic = node.value
 
             if license_ok(self._canonical_license(self._d, lic),
                     self._dont_want_licenses) == True:
-- 
2.43.0


