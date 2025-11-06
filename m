Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3473BCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 18:11:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4417.1762452667315985694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 10:11:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BN7CflKf;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-295548467c7so14174045ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762452666; x=1763057466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byeK3STrk2Itd1VQ0Zs2FDtKiSlzjj6oULwI3YrcV3s=;
        b=BN7CflKf5RXwuElzcut0UZ8iLFVmBW9fxMhCaegcGZyz16QBpDVob6yT/OndgxJRny
         wpkZtB3Z+CoFLFsvZVZd79HhzacS+wXOYCcNlaBKKQZGMCtM3qHGtEvFvbG18CetSKNQ
         KB0flOdPvUdiuHeIdnkQPACOwsMGwXNNyG9mVKcZ81JKCDZx+fdFrzz5MCeFm+JtI7Oh
         XUyGJNIiqfy3mhG7I7r/QSZWiTTV/kJLzvoLn+KHTqI0RWFnUU2HMET+EDB92dvC+Pow
         5n8z2ImANEP4KA7t9s/9tNVDXW+ZlITXD+0z7qMAhoqT5NRa6LxVgbWhTRsBYyBclY8h
         Swxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762452666; x=1763057466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byeK3STrk2Itd1VQ0Zs2FDtKiSlzjj6oULwI3YrcV3s=;
        b=Xu1T2Kc802hK2TF3B34dB1Izsqw9knfQ2pniXPQA0n8zsiqrk11jcDDBPBLX8ReiQv
         ub5nE4U3LSSwL2zEDeVccPhlsoIWYyU8UqXua7wjhkrZ0GhEQ16VHHG5JnzW8l+RNNwI
         aRUjbkrYDU9qvE9UO44iNsN0LvQO0BX+xWRNDfTrwmbJbbvPd/lzrbq4A9i3OIBfCDZ8
         qXrpM+pXNx/tBKHCfVh2CO5MraJhhYvJXH3l8cZAl3xTYVWys+j7bgtTfRL+pOQn6gok
         v7lMX+nEW6W8n+kkr5/5mIejyEklUCaYYtMPvKTUvvOB27scOuMEMzzVMfKuXF6ZQgYX
         Pp1w==
X-Gm-Message-State: AOJu0YzvD5oN5cNAhXKk+Td5YiDtMKW92oY4tMAteYMIV40SMd/dMqjO
	14m/ivNaWYxM0VrmDo5VwreqPlrLyVg5byNFhfdIRQVOE4CwNOXrBDVTom3ytxm7
X-Gm-Gg: ASbGncs6tLDQXdPo+CnGLCOckm/ZDIPZ71GEZ9VEm4LkTSl6P/qjevXYjW9VAtGFW5B
	1E1KqeqHePfmNGocYkv8FlN1LVyiNKdGkYoIrauxB3cYi/JYQFDuvUVG60SwFpL+xxquvnrv1JA
	c0NA0eUY54FeBHztubkfpJCntupcZySNIJWeDs+1y3tCSFIy4e5eNZZpYzcIav5MOf7SDGAT5V7
	koXLOH4oElM63NG664YC2cUqPIfG+iw/FebhPlcirff6W+x9nPoAwSP30iJjgVr1NJlmKkdd9sv
	UXJ1n9yZ7uOvm0qgymgBbbrciaESwUcZyTNDv40EQb3ZGBzC2KAH1/4wuZJO0ksYVu6XpY0/l6h
	1FCEYhW5OzrJehH4VmKVtHd4VZNIQ0UdfG0G+9flHGA8608p0sLgKMR7bKuTg0ILiafu758QU3+
	2wZnNUpEQxx0TB/uTW/fI8ND/Y+XG2f2rRC2yj1Zyf0SmrnB60EV3ONhrrW9IH5sZDCBarQpo2
X-Google-Smtp-Source: AGHT+IG/uyGkdUURSzGiij1fcpof94pVVsJuGFHjpxQXMUI9ik4hB3bsLjRQLV/ybGnRMeCCpgKOQQ==
X-Received: by 2002:a17:903:1ac4:b0:295:fc0:5a32 with SMTP id d9443c01a7336-297c03a066bmr4616115ad.3.1762452666266;
        Thu, 06 Nov 2025 10:11:06 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650e5a33bsm35367005ad.47.2025.11.06.10.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 10:11:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libclc: Add misssing quotes around target list
Date: Thu,  6 Nov 2025 10:11:03 -0800
Message-ID: <20251106181103.515146-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 18:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225985

Defualt for LIBCLC_TARGETS is `all` so a single
target is ok but when its overidden with a semi-colon
separated list to use a subset of targets, e.g.

LIBCLC_TARGETS:class-nativesdk = "amdgcn--;amdgcn--amdhsa;nvptx--;nvptx64--;nvptx--nvidiacl;nvptx64--nvidiacl"

cmake rejects it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libclc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index 60909339e70..c4b4881542f 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -21,7 +21,7 @@ B_NATIVE = "${B}-native"
 # Semicolon-separated list of targets to build
 LIBCLC_TARGETS ?= "all"
 
-EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD=${LIBCLC_TARGETS}"
+EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
 EXTRA_OECMAKE:append:class-target = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
 EXTRA_OECMAKE:append:class-nativesdk = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
 

