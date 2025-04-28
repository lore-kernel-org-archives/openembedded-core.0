Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399F8C3ABA9
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.60667.1745875587794370211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xgv7XSJp;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225df540edcso63878175ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875587; x=1746480387; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIDI0NAFNUci7eYa9M3fuwmDhU/zBi0rNU7pX9ifaPk=;
        b=Xgv7XSJpYjMLJUQxmP8HY1VG9uICZHlG4ThhsmycwmklZLV+xUAvmYVRAGj7PhVq5X
         DaW/SdHTUQMEoE1TszSuuACFrQa7oij0KyMMxFuvgQD/LsQwNG073iii9zU0rYQsg27s
         6/cLOsobieWl9i6ev2CqjRyHuE9QHIaBY3F4PJj9dd474EL97HlcRWKdx93uxTp8YM6+
         IR6Ue0KQ2xMv0MGETJhswn8Ie1d/FDmuterdmpJGRpRzPeGmgtSrrRq3vHz23VkrlSrh
         8ROlUpPe/D49ddjOBDrgI3PDL7lHQXMka1DOwRsKYqLbjJpgYctAy/yLv1RibF0kHgpQ
         dTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875587; x=1746480387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIDI0NAFNUci7eYa9M3fuwmDhU/zBi0rNU7pX9ifaPk=;
        b=Nuq8EHOozYkOvB2+vZVHgSmbLCAVx964vUaq5fpSvr8M7vCd18K4XMp1YIIOxTjg4g
         vQ5rbGNMg1R8LrN6hkJ3P2DDFIAW2xKRhSkp8JsibyP/wud4DMHptDyoXHOBQX0TeGQ0
         Vi5OKsWJB+eE58RMFmIaF376zRlgX99xIJ6LJDLA24FGElRhQvadmLFMvMPkUWTJT75o
         ZuhcvbN9cwv+K/O/txX30WJT4IHdyXp5ZJ2QhW+wr8fjLpru91qdNFrmpRDBDTjktkDo
         YuPBmOSdwK06G0Ca8pVJFI7pgHD0lZv8JqrUWtFe7cfVMvzmkrhG4+2xYbaAadAnuROj
         nm9Q==
X-Gm-Message-State: AOJu0YzjP9eaZxf5koDO7v540+rRT/YK851Sgg4v9h6SSG9fm1MIYpRW
	5AKeUcCYNf5dfUdQRiD3COs83q9ZVvduunfPlIABdgkeLcbzHbJCrsIypXNq
X-Gm-Gg: ASbGnctsQzo9S766Oo+/WVoc8KkNAEPqf1XteNCya/W/0uHfJndOefy/5StFfDAKwLk
	QPvYKggSBZYOKu3WYeGCySo6tCBGE80yVIpNrFiCOS3e8AZISWt6VPCvh0Ni8u4cXhTC7xaXeOT
	l6c5kFh2Zk2tD6bsSv7FO4Npw0j7HQNCOGQZceXJ6dT+mOBUwLZ9Z4g/ilPSUDY+IDTFfEDPIYj
	caIsLXU0h/0cqzDAO9ie0vBySCEopS/B+66I86uzYFlD5w+9R9Awn5CJw3ivMZzawTn4mWSHagG
	vtM4HLWxIFu6Mj3hG1/BhL5iEt/puyCF
X-Google-Smtp-Source: AGHT+IHU7s6tOYYJHqjxcZlGGNSWSoOXJQWhkp+lm4HDnnJfjoEZPIKIuZpmD4t0B7wPzLem6DJASA==
X-Received: by 2002:a17:903:1b24:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22de6c64cb0mr9065355ad.21.1745875587165;
        Mon, 28 Apr 2025 14:26:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:26:22 -0700
Subject: [PATCH v5 07/10] clang: RPROVIDE spirv-llvm-translator and libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-clang-merge-v5-7-c31e76e643e1@gmail.com>
References: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
In-Reply-To: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215640

This paves the way to spin out these packages out of clang in future
specifically spirv-llvm-translator which is not yet part of llvm monorepo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 5248a6c1fecd4665772a4bac8075c9d1257caf78..f797f5a4adf6f7ced22e76f1f846898ed6f9e060 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -334,6 +334,9 @@ RDEPENDS:${PN}-tools += "\
   perl-module-term-ansicolor \
 "
 
+RPROVIDES:${PN}-spirv = "${MLPREFIX}spirv-llvm-translator"
+RPROVIDES:${PN}-clc = "${MLPREFIX}libclc"
+
 RRECOMMENDS:${PN}-tidy += "${PN}-tools"
 
 FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"

-- 
2.49.0


