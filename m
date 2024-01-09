Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22262C3DA6E
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 01:10:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6594.1704762604753172334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 17:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A91nbr47;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d437a2a4c7so4342245ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 17:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704762604; x=1705367404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcNcocfLX6nxbyjguOb0EH8qo8bPfHWGO0L5uBEeI4w=;
        b=A91nbr472Hm0yBHG3aR1P57TrNn4NpXgcolNmampEce1dicHpOecUGAsiw3Q0Re1wb
         Aa9+rA90d7vsUVX1TvBoC0dzE+oJ5GFDXBPhOJ7XfJEu6x0gL6olz0TY9Uz2856fkbIb
         KdJ1yMRXXtMOApCwXYU2YIsjIwhAGOE3xk/qmyjs3ThKZ7SsYwSD8JFJ2rgItWyEdDg7
         Opd1/voXFgYgjObN6DPs9EWgTnZb91Dk375C8iSLgaGmOEUT9JJVcQ34QILhi8x4mCt5
         Mu10W+7E/a6QA1/u/2SGeiFtaP1ntkIzo8Sv7/lnbQLczvul7lfEsGVCPEadm4KqEaNF
         J/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704762604; x=1705367404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcNcocfLX6nxbyjguOb0EH8qo8bPfHWGO0L5uBEeI4w=;
        b=jXMUe+xROZzlryCMhzcm6dJY/tHempY3q/xd6ooAx8iYJiAIgrvwbxsD9glHDXLjxu
         LTNV3e2E2fi8mAXowfIIGASpX40wPW1vDJIHKrNGi5nLQc0W1DM5IuhuEDlxM9I/DxoA
         MWuoePPJw1RorQfI0AJqkP1vrSDjuwY9OOf6LXhrX8kyufgIsDE98ZaotHW6xfFI8xzm
         WbZqDlK7ub9OYeNQboxyCPnEdmMPVd9hWS6cmnYhFvQXgHMereeK4yBJWW2L9X5HHPQN
         MIXgX+Igu0iAdmDAQ4RjXv81fO+JXbxR8Q9NfJit6NZLrMM6h4UO+ll4/OXUBQ3AqPzp
         LmtA==
X-Gm-Message-State: AOJu0Yy8ilhiSCfLzEZN/4VTbnJPVa51SdrLKwV/bsv4P309YAPVUMgM
	g/eMS/8G2JVRV9rLEhzcuhdH9UGybaM=
X-Google-Smtp-Source: AGHT+IHE9WgDFenTqCVfG47hf/YteZSEpJHzrCBCX9Hddr6JWouCsYgwMleAH4p7rtuhkRF8IFTReg==
X-Received: by 2002:a17:902:9a8d:b0:1d4:bd3f:4d2e with SMTP id w13-20020a1709029a8d00b001d4bd3f4d2emr8989722plp.0.1704762603831;
        Mon, 08 Jan 2024 17:10:03 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:63f2:cfe7:4b90:23c])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709028a8400b001d4c9c9be42sm492012plo.151.2024.01.08.17.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 17:10:03 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] kmscube: Add package version
Date: Mon,  8 Jan 2024 22:09:50 -0300
Message-Id: <20240109010950.3302352-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109010950.3302352-1-festevam@gmail.com>
References: <20240109010950.3302352-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 01:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193439

From: Fabio Estevam <festevam@denx.de>

kmscube meson.build passes version : '0.0.1', so add a package
version entry to match.

Suggested-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 63f29fd169..505acb024b 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -19,6 +19,9 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
+BASEPV = "0.0.1"
+PV = "${BASEPV}+git"
+
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.37.3


