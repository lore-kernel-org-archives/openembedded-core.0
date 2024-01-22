Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E006C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.74257.1705931963388870001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUUHrx9h;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so541156366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931961; x=1706536761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HlAeRAPp3I4urAm+keorks1nYc9ZvWV4HesjIU5poc=;
        b=NUUHrx9hquYXB3XKoiw2ceFttIe5/0FDMHPTqjwvgAUxV3X26Uifqzt7lIDF7ZCUxc
         WxQmiKPsYTFzDQXUXAQRkQmOCVBKIIOjdHWxBoNGGD9LCLVlr4CgKYeH82m9OFJjUojE
         QeQZ3MvBuQ0VPvha5rL2nif5oP32w+GyAhTcZdtuOP8eHCEsBAFSMeUeG6MCVQi5lQME
         Z0bEN6dwRHRil3ypn1m6LMv6IpBLZ0HzLHrJD/w1kPuJ60GD6eiahxPwyzoXeqEpKI2Z
         kuJuD1Yx0x1QP4Mijuk8s2hZbjD8+oHjPSJ1kQsxAdiibOQlp5ulNQVO8ZZIRdjDwSzR
         Zbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931961; x=1706536761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HlAeRAPp3I4urAm+keorks1nYc9ZvWV4HesjIU5poc=;
        b=Qb6GXatypPcJ9jhCoG6HePlbDBJFZOuamWN7V32pNPYTZ5G1qwcIX7wUTR65SeRzQO
         NsLWlTHkE4OcMG/by36T0nkr0DlqY9e2qe/F3iPPVQ2q16VCaOZ7CJFKAUYTJYnkEkf1
         DCnsjhJX7YcOU/9q3yRJ2cpt24Rm1Axb/Z/u5siDRLZz/Vbo4TdFCCH0xDqwcZiYET6b
         DiFFxwIiE7gFA2UTvsms/DOvjhRrc7LpSONR0z23GWkAtW1rKVMjfPvRU6tuZzoO/0yz
         GI2RnsUMxpJ/5Vx6RhNom+tyOa1xDtyhlTenP1CcLxlCnmo+HqGkMlMWiAmmabz6rNDp
         zgIQ==
X-Gm-Message-State: AOJu0YyKqvV8fwkpNnjhPmh3X9BYA/5n8H5ZU/RAu2zwd+vEUi6Oe2Zu
	8Iou1Z3HVwM/buudFAlaWf3AbV06z0HS0YKttlcylloRYGB7ofTSPmT2xZc7
X-Google-Smtp-Source: AGHT+IHOcwMAFiZiGTs6J9JWrZlihXoXOCqc3nrWsbvNOhJGysArflgE8Z6b+/rlNyGKGBgB+I92Gw==
X-Received: by 2002:a17:906:3283:b0:a2f:1546:aadc with SMTP id 3-20020a170906328300b00a2f1546aadcmr4884694ejw.20.1705931961382;
        Mon, 22 Jan 2024 05:59:21 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:21 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 1/9] cmake.bbclass: use --install
Date: Mon, 22 Jan 2024 14:58:19 +0100
Message-ID: <20240122135901.171596-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194150

Since version 3.15 CMake provides a command-line signature to install an
already-generated project binary tree. This may be used after building a
project to run installation without using the generated build system or
the native build tool.

This is a small improvement, for regular bitbake calls. CMake does not
check the dependencies again which is expected to be faster.

The main motivation for this change is using CMake from an SDK context.
With this change it is possible to initiate the compile step from an
IDE and later on initiating the install step via bitbake which runs the
install step on pseudo.

This is also what the meson.bbclass already does with the --no-rebuild
option.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 1e353f660f7..3d3781ef333 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -224,12 +224,24 @@ cmake_runcmake_build() {
 	eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
 }
 
+# Install an already-generated project binary tree. Not checking the compile
+# dependencies again is particularly important for SDK use cases.
+cmake_runcmake_install() {
+	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --install '${B}'
+	eval ${DESTDIR:+DESTDIR=${DESTDIR} }${CMAKE_VERBOSE} cmake --install '${B}'
+}
+
 cmake_do_compile()  {
 	cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
 }
 
 cmake_do_install() {
-	DESTDIR='${D}' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+	if [ "${OECMAKE_TARGET_INSTALL}" = "install" ]; then
+		DESTDIR='${D}' cmake_runcmake_install
+	else
+		# Legacy path which supports also custom install targets
+		DESTDIR='${D}' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+	fi
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
-- 
2.43.0


