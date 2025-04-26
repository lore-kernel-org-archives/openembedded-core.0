Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4842C369C2
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:37 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.2860.1745634929814068716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K8RRAfgf;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b03bc416962so2133693a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634929; x=1746239729; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3t/CJys6/I5/TC/kB7/SG2Uc5VHsPZS4TIdl07QpwWI=;
        b=K8RRAfgfbOFnEab5ZYGk67YS0nzAHOozhBt829Ib5Ph7R8vvNgwLrBhQIm3oT1IZE8
         1QoWTEnIRo385dNgc5z5zgetx6WXhcR8Fdi5dgMwTh4PjRfiCaoPHXFb+VJdPGmJx4hG
         uc++xmNucSqsiZh9fFupfO0wbbvpzAdtrnxSpJIgHd/7qItEdpnPsXIocWUvh/DF2MjP
         g2BqUW32WU16QDByR2v+RNKqyKOCufhz+QwOuuwoUKB3cVqVt+3wRjWHClkaDxl51Etw
         xQT0FBZNBaZworUf930uCHu66xL/ixxxjLyIzZwKT14S1zs9rdXchjF31EFCSDA8HGKx
         ur9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634929; x=1746239729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t/CJys6/I5/TC/kB7/SG2Uc5VHsPZS4TIdl07QpwWI=;
        b=KFqBvVtL3wiFnI8PZVeVKSA3u2GRz6+OBKG+itDetiiTXbGMD749nPCcPtRfW+yNSw
         vHcWBGDlkc6nL7uFk/oPgRHkpN0z5RuhTdGoTZaaX+ziCAcizZUPmMIxZ6H9NfpXU6Ij
         xLtysQyD5wXxDLf4eMLUT5xUI+mRyNlMGpLLunDZeh0AfOK9E0qNiaHVOUn18GqkVeD2
         /Ppn9FlluKc78P1mkLlPRkuQ93G398cn2yJjHDl3lAuMvk8gYssCFKWSLth5KjGhkZ1i
         7yZgY8cwIVcoe1QPtZAdfBJ2AKqruUG65lgVYjb7jzq+wOzA7tgNptC7IYdQG6G1g+fn
         Latg==
X-Gm-Message-State: AOJu0Yx06HBBDRjEsc7sHmSd64ddra95w8SgY4ChFskNwR28vgYigHm5
	S9EhaeKu/mCvDtVOgj24XaW/ZdcgtR2UQWEpkJaQUo6KsXSD02091J0kmU2n
X-Gm-Gg: ASbGncvcskByOmG8DXdv05UHk8sFWqw/wBBr6XY4xJ+R8GSB6o/EtZjEet4KHJHiPty
	Xx0vEM63ruwhYJHVflZbaZHH1JD8EnjsMSXolfbcfGxNKgWTKYiKH52XjkUswik5FJj/r9jVahL
	P8l4yWJo3/rh8dk2dhnlmu8IYVM+LgvuK+rK52ukFqZTToVVQ+Xn2ctgImtAikoDanBLi4xFB/y
	TMXwa+S2b0DRYUWdhGQ1FAcjN3aqwWUspRgms/Zk8KBKDgTovdQUO0eUsXpkwC0ZT/fhugdpCfe
	fSdo4W3+ErUsDeovbZzmgUVF9axpccSH
X-Google-Smtp-Source: AGHT+IE1eirE0j4nxhnvFbyKo20a8D0dnS26XFBlqTuhUAcpiI7vpzrG4D3sB3+gdcR+SVY06geWew==
X-Received: by 2002:a17:903:3d0e:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-22dc6a6c8b1mr27126855ad.32.1745634928946;
        Fri, 25 Apr 2025 19:35:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:09 -0700
Subject: [PATCH v3 07/10] clang: RPROVIDE spirv-llvm-translator and libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-7-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215505

This paves the way to spin out these packages out of clang in future
specifically spirv-llvm-translator which is not yet part of llvm monorepo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 3e9192b5570d440b7e30d936dd1a1981facf723d..081fcdaa8ace778e592c16a14293aa5a348644b9 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -335,6 +335,9 @@ RDEPENDS:${PN}-tools += "\
   perl-module-term-ansicolor \
 "
 
+RPROVIDES:${PN}-spirv = "${MLPREFIX}spirv-llvm-translator"
+RPROVIDES:${PN}-clc = "${MLPREFIX}libclc"
+
 RRECOMMENDS:${PN}-tidy += "${PN}-tools"
 
 FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"

-- 
2.49.0


