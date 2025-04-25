Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4981BC369DE
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 05:43:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1030.1745559814773588964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 22:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fkac0rvK;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bb647eb23so1572263b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745559814; x=1746164614; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=Fkac0rvK7IMDszNBR1QdAezDiu/7Q04H7aqYekDvBS23nL7aEKPODzeMI6ikD2FFCC
         B+ZMU7IC1vJHAc9r6e5SdZIb/Y8UH0qF/zSR+P9J4h1g5hQNCPW/zYLUgNLOryTZynsM
         rUh+h4oxUaJ2ghLGoTyNazA0h7RIKeW+oX2+zROpjCSQvtmDE+0te0WuBqLehl/bU0cX
         YzLmC1mt6Fd/SihCOV9FEx6pqj3cTA1WSbrUIeW/l0VqbjgM8Por4lWqayHRfCbEPGz6
         of1ObAmi2QYN9gb/HIzOlO0lJ/8gpXy1C/6v3H7ytijay2lmguTbmxLZWOe2CfyYOSaa
         pPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559814; x=1746164614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9myFScv483zzqOlxGxF69WE1oD420belDLdY8A7GRw=;
        b=XUQzdD9MmVExPczEmo4XsblfR501pLNFrNfAKP4n0jG0W3cwbeLeacZ705dkUwB2W7
         1QoPXOIB8TaWAxXawVNJRXHZOETqpXzV9rbxDc2MCDMhzPnqfP0VhoD1hqELi5AZO5y0
         w7+zWMfpewxWc7Rs7EdbL+COPP3R4nINQsuZFToGIRXaZrKMTrvGHagunCQwbtHlEaDz
         2G1n+zMu6gzJ2Nno6C0serm6BXecSjo9dMHg7R+Ueg5itRvB2TO8V9WfZ/wQds88P+AW
         cNOh25cluRtBz81T8F/3/JyeGC1+x10HyMqFHNg1sgeA5r6Q+KHxCQSPVQ4lLSBjgdAi
         079g==
X-Gm-Message-State: AOJu0YyXb7ZeDWNs4NiDIyUmTfAonle0k1X74ZktS2UxxMCezP+hPn7K
	Xhptp/NH5hz7CM4SIDgpbi4BrcvaM/eQpyo6zCfcPfco38kOj2vLwfRBhVIw
X-Gm-Gg: ASbGnctdfkcxI0D71OrjRrcQ2PTYY/SyvWHlKwWIa8YpzNWgWRSC6G2INMSP+d2Lz0q
	tIN2GRiDoNlAr0fpD7ER1V+8ZmcTITh/dVFvpHKmyzFFCrmP14nXxPv6qehgunrKWhskbsWHfK9
	5siZ/SOnhhltozgoeEQOvqyIUgnTdBgwddMBMB3pxwl+JW8U8OPumM9S7BuFVnwQo0tXMsWqb68
	ckkVo6m4X4Vj7w3sKcxvlOYr7nwpV9igPlNCy/+wAY5DbGDKYDr9T3BCkEi5+BOoem+efTACGYo
	7vBZWby3JkIOMRt5E8X5BOhFkZyq39rkEa+IgBrswn8=
X-Google-Smtp-Source: AGHT+IHYlgJULBWEZ8R8NJtXPaaCTysmT6xwpFr0TbZ9EpzdCOozV+cNST89u3w6ehBFgJjLh3NhDg==
X-Received: by 2002:a05:6a00:39a1:b0:736:4bd3:ffab with SMTP id d2e1a72fcca58-73fd876e18fmr1254753b3a.17.1745559814179;
        Thu, 24 Apr 2025 22:43:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm2363626b3a.167.2025.04.24.22.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:43:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 22:43:26 -0700
Subject: [PATCH v2 5/7] kernel-arch.bbclass: Do not use weak assignment for
 TOOLCHAIN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v2-5-0a51d0c1940d@gmail.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
In-Reply-To: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215420

If a distro sets TOOLCHAIN with ?= or = then it overrides this
too, however, we demand GCC to be in there due to KERNEL_CC etal
Make it hard assignment, it can still be overturned via a bbappend
in that case it is intentional to use non-gcc compiler for kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 749a266ea36c04fea34fd60d4b93d340db998936..7aea9cd3e8e3329412ddee07e2f3d43a7722ad5e 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -81,4 +81,4 @@ KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
 KERNEL_STRIP = "${HOST_PREFIX}strip"
-TOOLCHAIN ?= "gcc"
+TOOLCHAIN = "gcc"

-- 
2.49.0


