Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BA1C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:43 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.18868.1724244641269902331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CAnYxnys;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.54, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2701824beeeso3471872fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244640; x=1724849440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9MvrQat7vyziTB8LBGF1ECnGbtKlYM039OR0DHPuUM=;
        b=CAnYxnysuvukOmW/3m3lyVvyrfW8TGUmXv11IYDNoTYl2BK7k3QbYmfpyR8VHVDdnS
         tMtSEt0sQL5vlaOIty4s/U05eznIH0fhsCgk8z1I7dpHiS9GKS/DUAsawmLOqwQ4YSYd
         BUvD7b5d5iMLnkJx8thPmwGNZkSzFJnH5Ppa5kuyiaSGyJk+Zv4VMOXM0DdQRYFT/Bhh
         SPTnfP6YtNp0zI/vNvsvK+hlOJX0jb8P4+TIJHZDHFedXnPIg7AVFHUTtZV7YE1s2Qdt
         58cQa0bQ9DF6ZRk2x2eDmeijnCNi2hXZRzDkHGrbf60R2jTsaqrapc7/NOinn4fFJfdu
         sp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244640; x=1724849440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9MvrQat7vyziTB8LBGF1ECnGbtKlYM039OR0DHPuUM=;
        b=aUpHwhsyWCr7CHbcz0RNq1Tpo/pC8wcJuAPn7LNLCKkGb8MgNUMjPtoTL54+jCRsvS
         KB7T37ZtVzqrhC/7EnZ7eCiAmnxnU1upIMhHsh68kje3unqvF9geFH2FoslSvcn2FMYe
         Hka55IwLDAHMQaACr9ixejae7Q/S/UY+Cmjs6b2j7teURYlGZv80xuw6nahv+RccMg+p
         XYS7RKBcBGlwssHBy/2t9Oqa2qd+q1A7dk8eLPvKd8jHtNAZFqHU+Y00QPV7yat9W9RL
         5B6UFrzEYeDXBfzIUF+2vl04jhlo7Su9FucadGtnle5yWtqKPtdCr2wvpSbobF2nond2
         5SVQ==
X-Gm-Message-State: AOJu0Ywhu7E0jGcEu33+XJGz8P+I1qz61viPYsuWpv4T8MLdEM410T5B
	Z+s2HYQYTWEsiTADE8Jq3Q8BJ5oVGmSJXMDkpx46Lpa3+DvLCqcAz6p5s/1E18KM5cg3xLd/Z93
	XLvA=
X-Google-Smtp-Source: AGHT+IEBZe7hPSuhsfmILjRLnI5ipl+PNizUve9sTRiVvIRQLWUJNqyDx11iuvezxUxwT0hvRQlKMg==
X-Received: by 2002:a05:6870:ec8a:b0:260:ffaf:811a with SMTP id 586e51a60fabf-2737eea9b9amr2035646fac.8.1724244640382;
        Wed, 21 Aug 2024 05:50:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/18] llvm: Enable libllvm for native build
Date: Wed, 21 Aug 2024 05:50:15 -0700
Message-Id: <bd451b9cd951778cc6cdb0fe13f87c723c153d27.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203592

From: Mingli Yu <mingli.yu@windriver.com>

The bpftrace recipe under meta-clang[1] needs llvm-objcopy [2] during
do_confgure phase otherwise there comes below error:
  | CMake Error at tests/data/CMakeLists.txt:6 (find_program):
  |   Could not find LLVM_OBJCOPY using the following names: llvm-objcopy,
  |   llvm-objcopy-18, llvm18-objcopy

The commit ec22bfa67f llvm: allow building libllvm in native builds, subject to PACKAGECONFIG [3]
introduces libllvm to manage the llvm function for native build
maybe because there is only mesa-native to use llvm-native.

Considering there are other recipes such as bpftrace needs llvm-native,
so enable libllvm for native build.

[1] https://github.com/kraj/meta-clang
[2] https://github.com/bpftrace/bpftrace/blob/master/tests/data/CMakeLists.txt
[3] https://git.openembedded.org/openembedded-core/commit/?id=ec22bfa67f6f1766102501d4593ce29aafe8c166

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/llvm_18.1.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.6.bb b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
index b2df5b60e3..0496b8ed14 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
@@ -55,7 +55,6 @@ def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
 PACKAGECONFIG ??= "libllvm"
-PACKAGECONFIG:class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libllvm', '', d)}"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
 PACKAGECONFIG[libllvm] = ""
-- 
2.34.1


