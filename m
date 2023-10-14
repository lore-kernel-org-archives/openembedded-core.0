Return-Path: <olivierdautricourt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D66CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 14:14:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.64600.1697292892378697670
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 07:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MLpE52SE;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: olivierdautricourt@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so2730233f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697292891; x=1697897691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNeNyWPs74kE+Iq/JElbnjmGcKRcCnIlPewj4KLY4gU=;
        b=MLpE52SEmrqQyFeDlV2g6S0fOzM9YMFIYCPWSCofP6ZWeoFdBXVvpwtLBgCQeTML+U
         Z2JNNm6HDyylf2H7OdJP4cKzyVnDd4cOFtR/9ik6mrxV7ZAGHVHOka9eyolsNm77tnAV
         Z7agP4va4JOChjQM7aK/gD2UPgeolmbz9f/3NuEVymBOjjceGO2QoPqVyN2fzUyo/R/c
         pTS3UQsfLf7eXvyoGipppIuiUlyJDrBAuP3eoFVWJsPNyXJQ/c8mZ4PJUN+/O3cF4wCs
         GfeeQG6tLlYg1rhkMDAl/bo204Akhnv/WhsuRUXnGiWqDxZY+tcHQPi6H4tLIc2rXoMD
         EWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697292891; x=1697897691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNeNyWPs74kE+Iq/JElbnjmGcKRcCnIlPewj4KLY4gU=;
        b=GrBhVtC56GHLyMkNFLXdvDdjyjIF0K8WJAdKc+8jW/mN7t+uxsCOiMlFiycRIj+RBz
         ZP2aQaTZIoP+UFwZ6jvS7Btik3yd7FjjFRWhULcEiwBWTZBzdomOrvuPjXpgH3akguew
         WG4PCs/y65UnePL8m/KKAP2LhtnFAx8cbI9h4rosV9ZDsxc9ItSNemFypcYUmKFXEbfz
         rPlJsSIQb+D8q6AJO7Q1te2129Ny7eT53jdvwyXZPdq49O4bjvx101q4kvbdgQwEhL7M
         roOv8PtefqT9LMwJhx/z8Zv25LszusV3nRg5Ck2Y/DM1CllpZIUVuvsHOFBVy77PTRLK
         2+NQ==
X-Gm-Message-State: AOJu0YwGWmqISmzfJ5wlizRttKMo03vDapvJoYHl6izCj9NFv6GYFsa3
	4t84J4ohj2qiDa8lqeIhrx7u1GbrxyIkbw==
X-Google-Smtp-Source: AGHT+IFWU2Nk5NarIkuG+MjwMKdW3vGQEJi6UyAovobvhyZv+JwL/TBg23OPTieQeqhO3Ysp2jvrrQ==
X-Received: by 2002:a5d:4204:0:b0:32d:7efc:7e1f with SMTP id n4-20020a5d4204000000b0032d7efc7e1fmr9826250wrq.71.1697292890527;
        Sat, 14 Oct 2023 07:14:50 -0700 (PDT)
Received: from localhost.localdomain (oliv-cloud.duckdns.org. [78.196.47.215])
        by smtp.googlemail.com with ESMTPSA id bd16-20020a05600c1f1000b003fef5e76f2csm829970wmb.0.2023.10.14.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 07:14:50 -0700 (PDT)
From: Olivier Dautricourt <olivierdautricourt@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@gmail.com
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>
Subject: [RFC PATCH] kernel.bbclass: make scripts_gdb when CONFIG_GDB_SCRIPTS=y and target is available
Date: Sat, 14 Oct 2023 16:14:36 +0200
Message-ID: <20231014141442.6352-1-olivierdautricourt@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189115

Since Commit 67274c083438340ad16c ("scripts/gdb: delay generation of gdb
constants.py") in kernel source tree (>=V5.1), scripts_gdb target needs
explicit run to build scripts/gdb. (vmlinux-gdb.py script is used by gdb for
linux kernel integration).

As this step was previously not needed, this suggest newer kernels builds
do not bundle it anymore, this change provides the same functionalities
for kernels >=V5.1 .

Signed-off-by: Olivier Dautricourt <olivierdautricourt@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2ec9ea2091..5206b4f2a7 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -394,6 +394,9 @@ kernel_do_compile() {
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 		oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
+	if (grep -q -i -e '^CONFIG_GDB_SCRIPTS=y$' .config && grep -q -e "^PHONY +=.*scripts_gdb" "${S}/Makefile"); then
+		oe_runmake ${PARALLEL_MAKE} scripts_gdb
+	fi
 }
 
 kernel_do_transform_kernel() {
-- 
2.42.0


