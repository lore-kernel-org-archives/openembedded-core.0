Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F695C10DAA
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.91946.1701080284433288510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WiR16gNr;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-548d60a4d60so5364954a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080283; x=1701685083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqpsgy3ONaslkRCh5SCKL4UrcVlW4KbVc2Mjo73D30k=;
        b=WiR16gNrJutKChQz3YadOZfyvN+S6X/qIXqYr7U4L9L/1abbBxOPiszEB5wt1Y2MjL
         TQs+Ht4E/CJ15BVT04AaKaGMhLaI9lj06kfMBcp8bc8OzK0+E/Y1AePPVMeDjVzjFOqy
         dQHe2REwHw4Urfx1271zjsmJdRrFmGvSQXzrYRv0S2cF/C3M3yyMUbBWHAVPLgDaCOow
         6EeOVIZt4fn6YH7LqiM3W3waw3yhSpW+j7dfJNYNI8D+YvlxOjFoA82QVKvhT50PXLvX
         MLNXunixyEqqMb3u9S8vuAvQhoMnMaOaMFmzqwJlg1Bf4vZSVdf0t6ELUBMXUIc+WCTd
         BMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080283; x=1701685083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqpsgy3ONaslkRCh5SCKL4UrcVlW4KbVc2Mjo73D30k=;
        b=NvXopX4UmEjdYecq6rXXRsVe+tZk7JNO0kjMTIYH9oXXffizRnSM01YSyVFwSf+93u
         DKufZ8rR7A7dxYt/180DwwMrQqXsPQQBcFNxG5iKhpKB4mk1IUrdamHmt22p+U8xesEP
         nG4RB5a1oo61yV8KJX3AOWwX6QlXkvH+TvsL3iuryHLHDMHHECf/GMw3LZyK9aZhOSL6
         RPnIaMAq3zraS/4Cx9gYbYU+e9h95W7WSWk26YwbN0e5RaStkLPLdFSkkKnSdFbgii+p
         F0bp6LuGyL64LXBaIZ4Hnh1/41UAHuyf6K39TWgSdmbo6fYDpI8qek8JTk5CPbOhHzE0
         leXA==
X-Gm-Message-State: AOJu0Yy+XyJDn07b6iuqD2flf2p9M5ZDSJXftp1oHYfIo9VjdoJOPwRf
	rMFlHG1WiOWI8PJbvizAF5gYdzJr0gc=
X-Google-Smtp-Source: AGHT+IF2oAHSsum4Z1qihNhK9Z3e2PT9lKfymPdDMg6lCySOKz0CKbwAwnWwMhhFSnXXDvEuuOQCVA==
X-Received: by 2002:a17:906:b299:b0:a03:ad29:a00b with SMTP id q25-20020a170906b29900b00a03ad29a00bmr9114747ejz.36.1701080282925;
        Mon, 27 Nov 2023 02:18:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/19] cmake: upgrade 3.27.5 -> 3.27.7
Date: Mon, 27 Nov 2023 11:17:38 +0100
Message-Id: <20231127101751.3187950-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191273

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.27.5.bb => cmake-native_3.27.7.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.27.5.bb => cmake-native_3.27.7.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.27.7.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ef4eec5ab1b..ecb0e487df2 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
+SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.5.bb b/meta/recipes-devtools/cmake/cmake_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.7.bb
-- 
2.39.2


