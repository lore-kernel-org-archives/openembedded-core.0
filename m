Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8307C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.41009.1747972375459980309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZkZMUVK;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e331215dbso3739565ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972375; x=1748577175; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xra1JA2vLpqyYbfNNBjSebz93oiatkmBwPvx+NKgrqA=;
        b=NZkZMUVKoWxZX+NwgOIPkFyQfRQ5ivOiTvqVO3EjmQGkADJpUL2RIJ6xNuk/CBJlcM
         nwQQgJzGPXh28OI03ELOLyef0QvvUszh5YwugnxNreDlesWrmM+oR6K9JnVQnz/KjReK
         Zj9F7bYWqIdM//ZcE3hqM/Se93Pd3gWHudELz874Cn00xqmt+TRHlbrZKY6lMngPDfOE
         f7qpKa23Dd2XfSP79qc2XIKK1DqnSWluRvFOMGUmrazYTduBbQP5BMzlwjQXSDK/5Tc7
         ZcDPhK5D2M4ZIvg4RfnRXXIwPCbKw2nhs/0HRbg2jnd0F7riHEjb/ToFt76haxQb4FPc
         CDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972375; x=1748577175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xra1JA2vLpqyYbfNNBjSebz93oiatkmBwPvx+NKgrqA=;
        b=UfPI1HSvtw1/Gosuak8eYBXX9UI77z07RXoiDmhZ1NjAqCUhJN56JZKYHHnjCsV9Ch
         BvaMJIJZAQ8GB4OjLg1iWuOYHBD0oyCsU57WQccJydC5vdgL1HmtVv8twJSiMHYIw3iB
         ZjOrsE94mfyJx7xcqHNcV0+/2EJpzW8MJRRgeTeBfiqdtOqzPJ6jQ39guCnUb8YWWARq
         AjHTv/fm6bYhSQTZxH7e4llmb/JD76dFACeVdsZBFzuvohESMvDZwTi+De7z1HkbP7nG
         yqYqsruv/mamStWSVyrLcQvpO0ylS2JK7lvlZx7kgjqefKNfOi7jjIKPX5TZfp8F4K8u
         TAwQ==
X-Gm-Message-State: AOJu0Ywv9zGItIgsoDb5Z1v6N3lludcuBAxtKa+PfsBlwjJO8QILxStB
	DEr6KCmy8BuqNWcHzKbSX5qnEhVGHpcfVm9sCQg6XoiCa5VPIstzCh19
X-Gm-Gg: ASbGnctgSlDZ5cb/x5++R/GNAr10sfnE48+qo9dt44tPfeRVYilJEAISctyopiSIWgf
	+UE1egS5wES919L4vk0uvyypKOkilzPbdT+rTPSBfI/NArgDNOPCVPy5+wtDtPuLD8xzf5i2qZ5
	RtGOMaB+J7JGqmGrfX8b/MIp3iNbYsSjQiA+udcjrn7fZeNcwYyBjgc8UPvmMnz9+EaoXyH2fKS
	N3OzBnQr4GcZZleYbEDFcGMFjRWJT/+MS/gLjl1L/BJpsfSFp0o6ueeRNS1SYFRynNuIIZ+Ui0s
	ipMS8cnD2to0JMo/pBWVobgkJ18V7z+vXsYeRe+Sgtr9lFRgent0iw==
X-Google-Smtp-Source: AGHT+IGzGjUeXe2P7kTVg6HOYdy4s/msBfqJB2ClEdL0V9pc81o2hEMUClKqAeIy+AsGPR5MT0r+Hw==
X-Received: by 2002:a17:902:ce89:b0:232:5d3:aa73 with SMTP id d9443c01a7336-233f06784bemr31737245ad.13.1747972374729;
        Thu, 22 May 2025 20:52:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:45 -0700
Subject: [PATCH v3 11/13] seatd: Disable sign-compare warning as error on
 clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-11-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217171

Make it build with clang+musl combo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.9.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 8ee43a3dc8f61eeb6f1c03dbd5a68585fa471424..87e1c3b67d69ba29cfde14caf17e3a2010046eac 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -15,6 +15,14 @@ inherit meson pkgconfig systemd update-rc.d useradd
 
 # https://www.openwall.com/lists/musl/2020/01/20/3
 CFLAGS:append:libc-musl:powerpc64le = " -Wno-error=overflow"
+#../git/common/connection.c:154:55: error: comparison of integers of different signs: 'unsigned long' and 'long' [-Werror,-Wsign-compare]
+#  154 |         for (cmsg = CMSG_FIRSTHDR(msg); cmsg != NULL; cmsg = CMSG_NXTHDR(msg, cmsg)) {
+#      |                                                              ^~~~~~~~~~~~~~~~~~~~~~
+#/mnt/b/yoe/master/sources/poky/build/tmp/work/riscv64-poky-linux-musl/seatd/0.9.1/recipe-sysroot/usr/include/sys/socket.h:358:44: note: expanded from macro 'CMSG_NXTHDR'
+#  358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >= __MHDR_END(mhdr) - (unsigned char *)(cmsg) \
+#      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#1 error generated.
+CFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"
 
 PACKAGECONFIG ?= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \

-- 
2.49.0


