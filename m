Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194A8C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 14:37:21 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.66.1746628637889513161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 07:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNV4CF6/;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0b646eff7so504288f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 07:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628636; x=1747233436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wayQHwCB1CptNDdj217stb2gfy7C/jheaWfBY/zxNn4=;
        b=JNV4CF6/EA0+ITEDcK6rqNmhdQiPdupf4jDkZ87dkdV0TX8f8AD5UxRe8nunnMpAYG
         r/8hTMKUoXgybPtaymvRhbgCKjfybqQsAXKNx0nPKm/s0Y9fkx7MGZZoay1l0xI9+nwb
         RfoRRCoobQZAAbwOnDG4BdYiYD7t/DkktH9b5ANW0CKNVuSGce9p7vz0DG1ClMpYCP4X
         cVPsoJ2nTjWghiFOdy/V3THi1ElTXtNvBH7WRy33HKKCRThoCkIMnS2TqqscBqoxRjUM
         XT5rPAT7zzWZ8zrxj1g6WnjoXAnLxlNgorY4chGtV0K8ij3xum22y2eP5cQcp+6k/nea
         zGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628636; x=1747233436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wayQHwCB1CptNDdj217stb2gfy7C/jheaWfBY/zxNn4=;
        b=etAqHUfw2SBsVi9ibGFI0VHmq9XnAmbWP1a4t2cYk6ljwwEhEWyW5trBaaU0JYHBki
         lw2RktQGPmeYQIGOKleeqjWDC1T7227M5adFMOlZ0UV3jw3TsZRAJOJE7NmdEhlZA6I+
         Fb4nsiWV8iwyp1yKH9uHBnvgSLI0QX3RxdHl8mkl17qpbwS66K0A4BKrf5pJ+O8AmoS0
         Jfov39WvyyvJSpNYCDhb6Y0em6w2FsWJ+QYWPjPoba9rD21j3uWP5D/1KzNQIoznBP25
         ukw+wEJvN1FXNUnHtQDrJ3gvSC4p04QrgJN9hgAHDkTaRA/MNbW6Dx2/eyom/xpa8CtP
         su7Q==
X-Gm-Message-State: AOJu0YxNntrnuKs50IjzvdBZlhF08pgTIVNCASSW/B9pjs+hsh7bHzix
	Jh+OGDwAZZRhS8aa25h0vGyb2Q2YLDGZYVGeH3dibvRaVenLUe2mqu63ow==
X-Gm-Gg: ASbGnct2wWj/M4/iOai5QFYUzi39GQ8YouJl5bBOWgOFTjF8M1bxl9kCuYtgHiZ5eZo
	Nc6ksb92jk9NZ8XVpTcwuCv7LakbVKo+wFJWYbObAONkmnQof5ax54c219AuLogTIR3HTij+Vlo
	+ffo0Y2nCWq7WyfcVZ5mfdiaztSgTGXsKZN+5sUxMEM/o3K+gkNa+PnAVUQelJhV/AAN3/XFH9T
	tTV7ZDBF61UGvmvY0EkSTGYiTykyy/XnuHtrAotxO3DKr6H+lCL5gzuDcjY/bWHrTEikFBKQ1dz
	+NouqMxpj6cvxEWRlOq88fYGOHajxtwWNAbE/zdNolIYMI/jDOvmdCvw6vsmnOLFQieL6SeWvyd
	s9g==
X-Google-Smtp-Source: AGHT+IHj2SjDkyPH0JIjrZaYpTVHQMA64071rMTY0rUksQwhj7Re/LJU2Bjp/kwc4ftsA2LHD8pKMA==
X-Received: by 2002:a05:6000:2582:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a0b4a66f71mr2981030f8f.41.1746628636068;
        Wed, 07 May 2025 07:37:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b0dffaa1sm5113068f8f.31.2025.05.07.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:37:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] clang: fix upstream version check
Date: Wed,  7 May 2025 16:37:09 +0200
Message-Id: <20250507143709.2372281-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 14:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216115

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/clang/common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index f733566bc88..a25a2031627 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -14,6 +14,8 @@ LICENSE = "Apache-2.0-with-LLVM-exception"
 # GA Release
 RELEASE ?= "${PV}"
 BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
+UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
+UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}.src"
 SRC_URI[sha256sum] = "b6183c41281ee3f23da7fda790c6d4f5877aed103d1e759763b1008bdd0e2c50"
 
-- 
2.39.5


