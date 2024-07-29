Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82FBC3DA7E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:16 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.55655.1722258794871643178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m+FxROCF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2cb510cd097so2401532a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258794; x=1722863594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++JMG7t9VLdoky57Ej8klohBdVlcchUMZzugCYV8ThA=;
        b=m+FxROCFr/J8PlF1vKgpOImy6+ZcnFgw3jMIuqyCRuq1zsFAjcHnzfpc80F1UhF+uc
         YEj6mxelNm5ChOdylV4NMcFQOtIpBVLbj+wfo2t3DQ0p6kfworVJpkEMwOj8UJPzQBzF
         HoV3MA6EXRDkuAO4W5fo6HX3uIQekq7t1R1nJ51df9ZtJh6Ipn3LCGDIKHCBlDCeehKT
         m9AP00kZ6bR16CVAEhJH7V5iAkeQ5spX1jkoDJronD/k6n2cC3gUzOSi4cs0SYVNi3r3
         aiwjos9o4VWDdAASmSxPSqdCDd6TKwNtt3AI81crufMzR+KFuycw0sb4EZpo7QIJPF0p
         h2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258794; x=1722863594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++JMG7t9VLdoky57Ej8klohBdVlcchUMZzugCYV8ThA=;
        b=oQpY88MPfgicApp/+iCXLWdeVG8t1pbY+5byNPkeu2E4AsLS9bUxEUWooaQY9vGlss
         1Eul3TXyvMyiyI5iOowrXyehGvxSXwxsZXrcnjZiNNA7nPLdQ6OE/Ci5NKlnwjs8+Njh
         VxmplXnUWX4iIFBgXoNGZ+xrFhdzhVo8ZJ2uvLycc6cHIUxlFSN5d7e/r8tgjy2FkK36
         kwjpmPmHwKs2xgf/SU4h6svhTS6PtLl9s0/IT7D10iETLAgOmr6W57H6vMTe1j23PTIX
         4/LDIAMZxZ2qYoisWGZxEE8AMxY4eH1e5RQmXnWCAGAuCY+V6vVjO+bxsYfaoVDKx1uR
         hJ1A==
X-Gm-Message-State: AOJu0Ywv0159RTUaYJUrW65e6LQwUSkC4OoBLzmaE1JsxHo5YFo3w6o4
	g3IxEFVq1ZOpDCga8UY2VQ3B7ey6nOt1SiP7y+Iw7WvBuiewWOse239OhlFMbhs6XlpuMutwhi0
	eX9I7XQ==
X-Google-Smtp-Source: AGHT+IGubvxGuWs2iW5NWBc9vMDSYYQwyI2IqBVj2QhLaGyCqkM1iSwjtL0jtRSydWxN2pz9sUrZPg==
X-Received: by 2002:a17:90b:1e03:b0:2c9:7219:1db0 with SMTP id 98e67ed59e1d1-2cf7e097ee5mr8858351a91.3.1722258794198;
        Mon, 29 Jul 2024 06:13:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/37] cmake-qemu.bbclass: fix if criterion
Date: Mon, 29 Jul 2024 06:12:23 -0700
Message-Id: <6f73c5df726eef7db32ab0fd1aa2ea4e45b3493c.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202627

From: Kai Kang <kai.kang@windriver.com>

It always executes the scripts whether 'qemu-usermode' in
'MACHINE_FEATURES' or not. Fix the criterion to make it work.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e163246dcbbd2187c9ba28432c613b0d6c850c6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cmake-qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe/cmake-qemu.bbclass
index 46a89e2827..383fc74bf2 100644
--- a/meta/classes-recipe/cmake-qemu.bbclass
+++ b/meta/classes-recipe/cmake-qemu.bbclass
@@ -19,7 +19,7 @@ inherit qemu cmake
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
 
 cmake_do_generate_toolchain_file:append:class-target() {
-    if [ "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}" ]; then
+    if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
         # Write out a qemu wrapper that will be used as exe_wrapper so that cmake
         # can run target helper binaries through that. This also allows to execute ctest.
         qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
-- 
2.34.1


