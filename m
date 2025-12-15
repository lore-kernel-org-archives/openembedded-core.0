Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BC9D5B175
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:20:54 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45415.1765794047332266513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=YBMzTCz4;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b735158ef24so53681866b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765794046; x=1766398846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=YBMzTCz4X7vjotX5PPIW9+/zTersYwlM+swHREO4pVK96L9ylhnggdAq/rGZlOfevk
         15C7BfYmKmaOViGNGZ3UPbeRO+XG/WYgbXe6X84iHRQe0eYoNM1hv0SRLIC4M4+SHcV6
         UXx+qDwgA3xQh8WXMG9N+Eon59YtJT9lFxrsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794046; x=1766398846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rr7gIuDm4NBc47Dk+FZvMdqdV+j8DGLfSt/7BpLfNlk=;
        b=tJ3ovUS5FPusLd11FtCmk/8JRTizWw9YrOxidTFWkHkU3ft2EXxC5CXLgvNbSmWeYT
         kZi5xk/DeCACXZ3sQH2IoKjL7C3ww7boPJ3LLstNBpbBxsQzRzBfQ6MjIe/827rucR7m
         85YFkkC8HdY3od+LcPCuUnroJc3tRhzVIP3gcgPYSD/7xsd4QeHFEsHMmGNmBOhgtpHU
         cLQrSGS6/JbD2n/VHCXGp+msTqbo3UUpL5p4eSA6JZqW6c7/XJDknKiWYGpVO32mOHss
         DuiZC8vLOTXc2DhaBJ8E/yjZ0Ir98fiQ94gl5sTMuwGgb/UHjiXp1ldFkH6kQQn/pLYx
         ip7g==
X-Gm-Message-State: AOJu0YzHPn+VR9N+m5l9mGi4kbMKbtFUeaxJ+r/KbasncwnbxVUY4tpm
	7dMZmpD2v5nfDj68rfquXMdFJlKasAfFHYjGNmpLSsjtS2TWmhS979yjE25xFsys71ARxlVa6Sv
	XB042
X-Gm-Gg: AY/fxX498AkcGFfaK8JlZGaLj7f9LnLI6XPG8+xrkwkwQeUyP1ykkBbSeg+uf0GZ7PW
	aDeBZeKPswzQcU9Oiam8xjcnIQ5hMtPU8qOs+zaO6jbgsgOz/RKUTmaeojYRyPtuYdzg/sHPVVX
	RSC8eWjUXoF0p33xoWwI0PJnWypRPud5zQhY1TNrTy5vMpRc0+Apz4kRPEtfmLtxeeriSUiZ7BI
	dAHiV7XLGV5+O2xD+Hb3Yx/Qp6AFPVaZr49xXuEBme6aCGAkHw4mIqgfwXDwRIfr2uutBqDIvNE
	oMZWF3kJeV0QdUoEsGHXVoyEHIxzne+gGZ2lMUmh5Z2EbJ3gkZbMchHXpAHz9vxgfDWzTHcXB12
	yoF5nbiCNAGYtJNuoibNA1uftr1lkPCJojVtAGVeNly5p2IQ1kMT5NECHvaNKrjO9Jains9Sw1Q
	RHKze/sqRuo4SFJEaxpO/El5Jsj6EsvVYelikcplA8gWCD5vt0RRcB8JAwDpV/xqJf7sSCyXqk5
	bL73meN2IXO2GQYRooRnn5ngMTYz8ptU5xkdKWYLR5ZtZA8WdqPlk/2zw==
X-Google-Smtp-Source: AGHT+IFvjxiE2+2IIKnktZlRi9CvY25VEq3IyTjzAb5rMW6MQVvFZK4BXtfY8d3ZL4Qli2rdRGOXiQ==
X-Received: by 2002:a17:906:dc91:b0:b76:d7ce:b017 with SMTP id a640c23a62f3a-b7d238ebd3cmr608175266b.4.1765794045729;
        Mon, 15 Dec 2025 02:20:45 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51757asm1357193566b.45.2025.12.15.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:20:45 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 4/7] libsolv: explicitly enable comps for rpm packageconfig
Date: Mon, 15 Dec 2025 11:20:38 +0100
Message-ID: <20251215102041.1630567-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
References: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227720

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
index ec74308bb5..52bbc1c4a3 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.52.0


