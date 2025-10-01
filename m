Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E9BCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 18:18:47 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.4550.1759342722795857459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 11:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJksZ0zX;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b55640a2e33so107296a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759342722; x=1759947522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdprP9T65D0//OIFd4jrZAdWnaXBOGs6sStx3MRWjzk=;
        b=VJksZ0zXlWB5NpR0IzqQBvMKAZGz7G+hpd+5oPu72TMN3Gd1Q4kVWCjnVmRh62mSSP
         L7y5WiF4282ivRmcW1SAF5hrK9upZc8AltD8Z1qH+BXCrKvakQlMfrbbrL60KZyJUdT8
         C87mEJix0DHUt2BHpVQvVIUgftEld3RGEV6RHiI8Q7Cmk2bpYPkSwXeT878ITTXSo7rt
         REM0VcHHc4ftgbhlqcX2z+leEyXotFyTVFjrJViMUmP7Kit7uSj/PduQ9fqeEdcOLiZO
         XYod2eU5KCjgxLfthcFdfkPb2y0wPkBmoJC4KrufZWsdftM+hQWaGsIE9DdUiuP02k82
         38qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342722; x=1759947522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdprP9T65D0//OIFd4jrZAdWnaXBOGs6sStx3MRWjzk=;
        b=gsJAtWI4K2UuXmvE+CyvkAoftjh48t8CVAHkBrG1q7kTE1RRpapJhBjtltztEWOJGl
         BfIjLue4KljCH5Ab1bfGU3UPrHqQM2JQGN5QjK0dRFPY5ZqavtVWcCjm2CJoWNSrp5XG
         dvJ11Csw4nggmShWf4rLmmK5ejjZ0XgXitZeUB7YymHRO7aUxt1ppHrCc8EE3S1IVUVF
         VGCQtUgfnuacJOobhrGhODVPxjSHNPtrJgkDl8+u3lNzqjCWw6Cr44L3h2FoDrEfnitm
         hn3bTFrDxYTsQMfjWBcPMU23YJTc0TsSUJVoPp3LWI7nn38mvdZOm+G2Z417knPdJKxI
         Mqsw==
X-Gm-Message-State: AOJu0YyPwa+/KGpjIh5Cy3ZA4QSEOHjlNwsBQEjxbjdvCn4sVFfV3IPq
	Za4w2PuAHE0g8jYTfr8f08ZsiK0rr6wYpR3NSoQIThjxqQBQye/3KXfwPSamexWc
X-Gm-Gg: ASbGncv8awOptBfO9fN9mqGsw1n/SapFIhDVWX/qT+rg/8cnclqHTd42RcF0LkW0czp
	otZ4AzhuA7w6h05076XTyZRpWMKUZm07NEDZstNly5lbRjlGR7nngQ+BQn9xf0gcZRQfGRinqOv
	P8Zm5x/igwbxQwXtWvL3ANLuG/+mvO7H6PWtWFvNP1uPXt8RlX6F5vq5HIwUUK6vrEOM4BU01Vf
	kalLoRab4MnK9g5IT39sUDwSeMkoxVtWeMTUit205bLcK2rALYmrAUlmdBmeCjZegP/s9iZO1Bl
	2ARNqOd878ZqXIlUNsPfWVnn4Jnc/T2H6k2lJ2ZDI7eTiEHsERR8GWVZPze4LP8pCVc1GKS+vwj
	F5uaiMe2SEPfXP+SfVulCS+Sy0HrcRAZqdP60zmcpZzrHjoJ14IQxXrl4DWiVTPGidj+mJsBRVu
	DEyxd9jlrPhzZfP2YSZYd24cjIZGpEH4JDh/u1GD4levmqSk2lHUTzJsSezDHqLGGt
X-Google-Smtp-Source: AGHT+IHjJJhrYlfJfEDfc/AG3zaurNL6JM9giDcukHdZxUEYEPVZxMCAxmjglMHgGA8k5I5dOuF4LQ==
X-Received: by 2002:a17:903:46ce:b0:266:2e6b:f592 with SMTP id d9443c01a7336-28e7f2a3c2cmr57322885ad.25.1759342721673;
        Wed, 01 Oct 2025 11:18:41 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d851])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d135d71sm2683895ad.58.2025.10.01.11.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:18:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] spirv-llvm-translator: Upgrade to 21.1.1
Date: Wed,  1 Oct 2025 11:18:38 -0700
Message-ID: <20251001181839.1618366-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 18:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224319

Backports following fixes to 21 branch

* 29758b55 [Backport to llvm_release_210] Fix error propagation in parseSPIRV (#3365)
* 615cc15b Fix BFloat16 mangling (#3355)
* 9aae1acb [Backport to 21] Implement SPV_INTEL_bfloat16_arithmetic (#3290)
* b50fc5ca [Backport to 21] Support for SPV_INTEL_shader_atomic_bfloat16 extension (#3343) (#3349)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lvm-translator_21.1.0.bb => spirv-llvm-translator_21.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.0.bb => spirv-llvm-translator_21.1.1.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
index 13a93f3c5e5..503e7df6440 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "acb023b63a4bafd53d0ba6a1a452b1f0e5671458"
+SRCREV = "29758b55816c14abb3e4142d42aca7a95bf46710"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "

