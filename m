Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D18BF588FF
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:40:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23946.1776703186332648106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WBGA6ayP;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2adff872068so15393655ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703185; x=1777307985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbNmtYpOA3mHXGP+dxSUSWoVkVPt2e5+kxSc10nJi5U=;
        b=WBGA6ayPg6WX+JT0lOI4ItG+Dv7LRTVJ2BZMBxgzCiWrRqB7XdBm9qF2iPPEkjXPcS
         3pYvVZnT62Ecjn0hPsL0J/A57EAmv2TF6Q+MW2DuyPh6LTwItyJkbMEMXNKNoHvec/h6
         NZ+mvLhAmA2Z79e/2P2ZPFKasM39e8Gt4+k6XHUgMgFTkUF/inAh+YM/jvc/Ghcu94at
         7yN6yHnMbDwgM29WlJvSkrxQwciSnlljKW8i6Qp6YFFQcoV1GDmTI3+VyjR3v1gmo8Mo
         T8UEPVX97Q2b1v/YipZmJi8Y161nEBvBTaScSzHzLUD8LqBiuLIUn9MHErkBj2yrU30f
         SBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703185; x=1777307985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbNmtYpOA3mHXGP+dxSUSWoVkVPt2e5+kxSc10nJi5U=;
        b=GjayJZe1GDcAI9iXxKkGQrYOlJ1t8G9HPLcOrGGxWKMQ9m9bpSpDfXYTofUgpbYmo1
         qT7QkOVb01/7V/xLbJSVmEvalGbQXryTSeBX71RX5Ati3iJaY8zVuRKF00/ZT3Pr9z87
         4tCioE7D67czjGYBLg3Qp256d9IpxKv9cnFaY7oIy9Hf69ILbeML6rqX5+aCwWF2A0T5
         f/YsAdMaofOpauk9Jl17cKwa5wD2Lh/hnIzK2zmLD5lPvVkzUanGBMdWQwARVmhwD2ms
         lfZZeePT+4MEyselowzxPHAbz7+HIXLii5hm6ngkkM7utN3D9jiWtYDv5U86u74r5car
         56ow==
X-Gm-Message-State: AOJu0YxPtsSBrdtET1F3+wJSiVhj/aMbddmOFvKeC4PD6PltDUfJsQEx
	uQMJ0N/jJN9n6QJCs/fAD7sYe/MDUmZdO1r+tAB9sMATh6euStmM2CcNdzSzsQ==
X-Gm-Gg: AeBDiev8pAuaEYj7cqnGq94srlePGkaR5Ku7zMiqwkXMNJtR1Dyg4nHYvP3P+mXGZTT
	GnNfhHcwSKasbp1xhr1gFhYVGEBJF73QM8zxF3qNmngJHzYmxhuM8aVryRWrWICNekRfK+cB0Me
	h14e8X9G6m0sF+ew6UVXvddxdY33c1N2V5GSLR01xyrJ7TO+feSD6cf27FW8kvRqVD0VjLZiaMt
	5abdLxPtuhXXsbSqwFI5RD8JYeV6E4a4noRxIrl974nBZGoan/NpqpMMVxAeW3wogx+VY9LpHOD
	2lG9Qlcrc2/tde5W0A2Tp4K+kG3m0kt0/unhs7sBY2EAiSQ6eUVPHL2gGmT8CMiUyuA6GbTn3vx
	rF9cVrze71AuYFs2VV8XvjhtW5edfywfIIgaciLbLWmK60vFaKjx+4DlU7Ce1wSJxv5Hq3wWqP5
	eZM0ZUiWH/jYKpIlxFmvmo7KOfNOh2BSz3PzYfhF95y2XNsw==
X-Received: by 2002:a17:903:22c9:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2b5fa01675emr157214525ad.34.1776703185476;
        Mon, 20 Apr 2026 09:39:45 -0700 (PDT)
Received: from localhost.localdomain ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm129221105ad.6.2026.04.20.09.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:39:45 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [PATCH v2 1/3] useradd.bbclass: allow inheriting with only USERADD_DEPENDS set
Date: Mon, 20 Apr 2026 23:39:38 +0700
Message-Id: <20260420163940.182918-2-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420163940.182918-1-zizuzacker@gmail.com>
References: <20260420163940.182918-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235577

When a recipe inherits useradd and only sets USERADD_DEPENDS (to depend
on users/groups created by another recipe), without creating any
users/groups itself, the parse-time sanity check incorrectly throws a
fatal error about missing USERADD_PACKAGES.

Skip the USERADD_PACKAGES/USERADD_PARAM validation when USERADD_DEPENDS
is set but USERADD_PACKAGES is not, since the recipe only needs build
dependency tracking, not user/group creation.

Fixes [YOCTO #15863]

Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
---
 meta/classes/useradd.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 16a65ac323..9d857a4555 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -212,6 +212,11 @@ def update_useradd_after_parse(d):
     useradd_packages = d.getVar('USERADD_PACKAGES')
 
     if not useradd_packages:
+        # It's valid to inherit useradd and only set USERADD_DEPENDS to
+        # depend on users/groups created by another recipe, without
+        # creating any users/groups in this recipe.
+        if d.getVar('USERADD_DEPENDS'):
+            return
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
-- 
2.34.1


