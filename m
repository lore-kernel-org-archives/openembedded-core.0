Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49A7C10F04
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:34:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.425.1701455646472713660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=et1qcurs;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cdcef8b400so2397071b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701455645; x=1702060445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzgGcht6WyBFi9Mlmeko+w4O1YMVo3B5tKlCb83zqx0=;
        b=et1qcursnb74MgfWbxqTS3pOd6mn2OdMNsJ9EVq8Flj2mE8bVYzweGnbT1Zo+BmkVH
         TJ3GJAd3Jaz9Bqmle7xgHqgkCLFQLba4f34nEYf/zMdEPZLQZ1MILkAT/pXNDwbx6bu0
         JmmWh3f95sboePiG6Zrq40dBE2My85B75NQKFDrq5a4v3d/UlDiIPO++WxsW3/2m+fy5
         oNX3TZTRT3Yrc+G0noDoz5V8w/Vj+54/sHxIFC+xQlc64YhI6DYT5Xg7R7L4YVIpg7/1
         Y0dv95XMWiX4j8d978SySHYBhgrdin4x+sefzD210D1XmWBAdJ4cj7JiREtW7/GEIopr
         1YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455645; x=1702060445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzgGcht6WyBFi9Mlmeko+w4O1YMVo3B5tKlCb83zqx0=;
        b=jO8to4XWdIBi9uZj/of+ohrojRP3jCI9Q89yRFxGuusnr2Wkseq1639yxmlcNTVFTP
         z1r+Z85Hf16ypfz1s+GT+DUoK8OoLq2XJ7jB+Y3oKrVmZ4ZM3X5zovwahB22tY8y5yrR
         mPtp1DN8wd6j+8A1HYPB+aytZi4S9PaEKDetHG7QKcx76h9W4RVLTSAzyZutjQYEpEkD
         4SDeFOIH6RV8vqTExTb6n1yE26JJ5KIWIFRDI+igJteTtH2GfEXufk4mEjs355kHOG66
         3XvTU0aSa42D5eCgYsFbyeXe0uX3zlOsUn5dqp3cynIGYovnI/L459fIxt3Z+vZVOqvf
         4ZWw==
X-Gm-Message-State: AOJu0YzMmBU0gRk6nOxrZ0obEaJvlDAOvgES9DLGgXTmhiPahLNpGAg+
	/tQ/QawZx6N03KLUTaKARWTsIjoGF44=
X-Google-Smtp-Source: AGHT+IHilbcUNYCEWRRT+ecGsLnyqlCEbuLzGW+WqjIgWPPaLbK0HVEuK5TiorKOIqXJCfBdIg/NeQ==
X-Received: by 2002:a05:6a20:158b:b0:18d:b43:78e8 with SMTP id h11-20020a056a20158b00b0018d0b4378e8mr10572452pzj.32.1701455645465;
        Fri, 01 Dec 2023 10:34:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id g24-20020a056a00079800b006cde7dd80cbsm3297126pfu.191.2023.12.01.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:34:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] llvm: Upgrade to 17.0.6
Date: Fri,  1 Dec 2023 10:33:54 -0800
Message-ID: <20231201183356.311137-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201183356.311137-1-raj.khem@gmail.com>
References: <20231201183356.311137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191682

Bring in these changes

* 6009708b4367 Revert "[runtimes] Add missing test dependencies to check-all (#72955)"
* 04caadc61fa2 [Driver] Enable __float128 support on X86 on FreeBSD / NetBSD (#72788)
* e919a83f96fe eliminate python SyntaxWarnings from check-all output.
* f6c231c15ec8 [clang-format] Fix crashes in AlignArrayOfStructures (#72520)
* f74f3e6f58d3 [clang] Fix sorting module headers (#73146)
* 7e30ce9528d9 [JITLink][aarch32] Change writeRegister's return type to void.
* 03373fd9cb6c [CMake] Support building shared library for NetBSD
* 21af3b62b632 workflows/release-binaries: Do a preliminary build to fill ccache (#72576)
* 201faeca595e Add RV64 constraint to SRLIW (#69416)
* e957e6dcb29d [runtimes] Add missing test dependencies to check-all (#72955)
* f8575ff46f89 [clang-format] Fix a bug in aligning comments above PPDirective (#72791)
* a71237b9f67f [clangd] Avoid null result in FindRecordTypeAt()
* 308c816de5a4 Bump version to 17.0.6
* 442401f7c0ca remove tests from bad merge
* 76c7e0e1e2d1 Use the correct namespace for looking up matching operator!= (#68922)
* b5cbb35408a3 [libc++] Use correct size for deallocation of arrays in shared_ptr (#68233)
* e6de86cb9ef8 Revert "Reland [clang] Canonicalize system headers in dependency file when -canonical-prefixes" (#71697)
* bb66d8f8f73b [clang][WebAssembly] Link crt1 even in case of -shared

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index de8d4116868..9a88549260a 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.5"
+PV = "17.0.6"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "98bfdac5ce82d1679f8af9a57501471812ab68d7"
+SRCREV = "6009708b4367171ccdbf4b5905cb6a803753fe18"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.43.0


