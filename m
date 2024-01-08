Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95908C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 11:12:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4403.1704712352361377496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 03:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=koiG8FBd;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e485c49acso5281375e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704712351; x=1705317151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuBkkFCpLjJW6HqdPVzFjtJqz/umO9xuQ9N70qFXObU=;
        b=koiG8FBdjwLp4jOfL9wryJc11ef1PVlCT7w39NT1ziLhRVqIADyzqCS78fDQmtifE7
         VhUY1wqgM2UZVnYsFvmbTZ69Xj4lbX92aDVVi0TGb/7qBBteHTlYYtcZAtUnMrhHft6m
         kuZko3BL7GPvgGNvSSCjv/u0mV5EL9seCipzOTGrLnIEpH5vp5TmjohzpK186yGJww1H
         qFZQS3CDOcWaLMUDhLEihDSQ1prmKSNs63+oIKomcSFWqQO0J1W4ZT4VAS6N6zjPnIrh
         2StIyfTpVP8GTlAUya3TcyCdCLDpKyrmHCi/3oroVP2bBL2pX7en6DhAlYgpmvgx2sF+
         HN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704712351; x=1705317151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuBkkFCpLjJW6HqdPVzFjtJqz/umO9xuQ9N70qFXObU=;
        b=pGAUhxSEoLG/URrUHGV8kW2sRlUwJKYKfHIOVpF83GcHM2i+8VlMAQBMPU9t4D6ciO
         Erz+NIFhWF+ogHOIh3VbJj3I/wz/rvp2WvC7uR+1qSb4cM8QtK1mlM5p11kiwqQrg46U
         EcngLpiYfwQEM5eeuJzfT/ZBxs/sz0SGjTOQWQS7n0+hq3kPQbLY82DAdKYWEo1f55gl
         KA7J569an78YwmN0CO5tygm7MeDhckuuMZjBDhihh3db7rwuJSVThilIcC5vw1TBbcbw
         eMeOD1PdgtoiYwq4PaaWIzK/MZhVmy/QVVcIIAm/8OGjS3EsbbnOzTRJxTURIpZmxXLs
         KBpg==
X-Gm-Message-State: AOJu0YzNVyNH7l6JROzwg4DPFw8atYssLZJx2A+0Fb6rO80VrfHaS+q3
	RV8Twc74EZN5g8RVLOHV7xLD/uHd/3A=
X-Google-Smtp-Source: AGHT+IHB/VrAJShEPFv5Bv0AmJSvmH/k1JBfalK57YWMj5AXxYZ+pjRldqEEQ+iqnm4nNLTL1XMn3Q==
X-Received: by 2002:a05:600c:a002:b0:40e:4317:4095 with SMTP id jg2-20020a05600ca00200b0040e43174095mr1267593wmb.132.1704712350593;
        Mon, 08 Jan 2024 03:12:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s11-20020a05600c45cb00b0040e395cd20bsm10523886wmo.7.2024.01.08.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 03:12:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] taglib: fix upstream version check
Date: Mon,  8 Jan 2024 12:12:25 +0100
Message-Id: <20240108111227.3261354-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 11:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193398

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/taglib/taglib_1.13.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/taglib/taglib_1.13.1.bb b/meta/recipes-support/taglib/taglib_1.13.1.bb
index 3f0a759f956..b26563ae91d 100644
--- a/meta/recipes-support/taglib/taglib_1.13.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.13.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
+UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
 
 BINCONFIG = "${bindir}/taglib-config"
 
-- 
2.39.2


