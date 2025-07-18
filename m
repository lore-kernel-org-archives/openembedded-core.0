Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9039FC83F34
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 04:09:19 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.13356.1752811751144975626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 21:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=byEDC692;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2170914b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752811750; x=1753416550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDhoefyQvyVqYiWXe1tHhAoPLYneR0RJZ9ZDpR6RJ8I=;
        b=byEDC69218CPojMKlKPNhaxSCUhHKu7Qvip5m7zOT0ugMN3+oOzXUx4O34UYoaWGe5
         bqd45YoULQcOoxQ28TET9MWra3pF9IcOnzeAQ0kHLy7P5n5mwCvwoLszWdMdp53t2fnI
         58N6M8SDsL82gT5wzkt9cf0jzcogDEsZ2MLd7xyWQTpupxvQjNPYT4Lefo1m8Tn7WnG2
         W2iCCg7pOwk6pcAGOCtglLKpt98ogTpdCq5H4b1d715m4PAui+j8sMODXZcqUsTDazNI
         2gUN+nVdu/TlznPZBrZn+pewetdf5EKGom4k9mQZsdIEnt6C+zUx8jUtXt7SrnYakqKw
         fJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752811750; x=1753416550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDhoefyQvyVqYiWXe1tHhAoPLYneR0RJZ9ZDpR6RJ8I=;
        b=DISLssaI2iAwyQ1loRjsFPW4aKnUeHbqFMObmhT35bZ7AtOe8fP+Gklpq2rxEV2jyu
         tHe14Y1mUI2rxJjPBtyBMMZsVyxrlr3cqCc3onCkwB8QXsXR7BuJC5exfONi5W9lKK5S
         KhlNekNRYou9VFQ9QDrRc2/F772BMOHt/0Jj1mrColAxmzYH6BXflp2Ck3J6u1ZByKuc
         DCJzbrNRDyGHI8ffDAh5bDzI9h9odY6c5DsFrw+b5zcKP9o0O81b8OcLi1WIwXw3Tvhr
         edtICusKyNHM+Mdf94Hka0AURFuOFEWu3CKGsdkeXYv2/znxgszAS04KY2wcVqKSVtcZ
         yapQ==
X-Gm-Message-State: AOJu0YxrZDoC52NmaYo0Pm/1jNYvH5aInIkI/xnCfBffkAFMr+fSom8E
	AESXvDvsr3gKSGSLfNTfo59owgMVZw5CtIUZTPv24PYfsQrHRkbu2/r3lF8Kr6EfX94=
X-Gm-Gg: ASbGncv4KJ54FZuhy5VstvExMTeikkgEohWMH13G6gbex3fU0s8Nj6FOxpDckRBUSC9
	PwpL5qCXcwifQwfZi+nShj3NQGt8YrrZOqNFEQ0+BZQ37yecQusnIaon+zjxjLFtW0F6AdGCST0
	ruqHRDAuyKWsnTpHZHkObPo75799KNjtuYvT13LNN+IBekaA7lU+Ez67PMsuGxRA3uBj7jrmq8+
	Oi88fssTMxPI4XcJMtwfLogvsT9Pc2Wc2/+a6CALLuhEVS6FFZ4qRwJyOoS1kVApGiE7syOUwEu
	CY1v3ZFfsU4/rmg9GKj9SxMknnsGrAtq7M9X+UFFBb0o0l2qD0o4R21KAeiqBJB31vZVC4/H7kp
	Zr4QhzzedeuLzRQg5VHpc/ajq
X-Google-Smtp-Source: AGHT+IGXykF/iAeMHuKiFd82Z2bFr9Q9tbP3JJEo+RcQLdywjr6XC7JiR4B3Xcg2rwcGFIv/SbF6NQ==
X-Received: by 2002:a05:6a21:6191:b0:236:355d:5f23 with SMTP id adf61e73a8af0-2381366095bmr14106963637.39.1752811750114;
        Thu, 17 Jul 2025 21:09:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8d14fsm417157a12.26.2025.07.17.21.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 21:09:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] cmake.bbclass: Define CMAKE_CLANG_TIDY with toolchain-clang
Date: Thu, 17 Jul 2025 21:09:04 -0700
Message-ID: <20250718040906.3591603-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718040906.3591603-1-raj.khem@gmail.com>
References: <20250718040906.3591603-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 04:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220567

clang-tidy is used by many packages these days and probed during
build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/cmake.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 449fe2bb443..2c6d28b7a95 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -216,6 +216,12 @@ list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATIVE})
 EOF
 }
 
+cmake_do_generate_toolchain_file:append:toolchain-clang() {
+	cat >> ${WORKDIR}/toolchain.cmake <<EOF
+set( CMAKE_CLANG_TIDY ${HOST_PREFIX}clang-tidy )
+EOF
+}
+
 addtask generate_toolchain_file after do_patch before do_configure
 
 CONFIGURE_FILES = "CMakeLists.txt *.cmake"

