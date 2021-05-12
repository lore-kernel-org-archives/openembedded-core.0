Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.4446.1620855135713469918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 14:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z8sfwrn4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id m9so25060543wrx.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVRwG9/seCkyncPHOx41Z1x064mn9SoOfVvcIbYcW9U=;
        b=Z8sfwrn4BbBgUvfzPKQl2C5oY5LvcdJ33YaWsEZSzkl0+HmjDEGeFvYEggtTHtPtrH
         4tq+deLgYu32Zc65/CQ8jegmOybkIpe6Zwoej9JVK4YoiiM+BEIx+tbAbPxjF8xwoM03
         VdgOzJg2EwmI+NjCHNWorFtdzgsrPMJ1JVvZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVRwG9/seCkyncPHOx41Z1x064mn9SoOfVvcIbYcW9U=;
        b=fEobG1VuwzLTKTcIPxIJujiedYqgqEeU67e/yUTRbnE2RYUH+edFpYnpVwcmzQgDXQ
         AASVYkn2Pwb/HMm/blWZVSDIY5Z51qn713D1AUzpXzGnr9THF2EuvV/ZaNFYB8vROoZN
         ahy0Sk4HdPjXllI+SvU0dzCYChMuFS3eZ5bkOqR1wJGfHSZJq2/Oxcs8Wd48DYespWab
         Lcda4I/+CYE6G4VDCwwtG+Ih5HFXwk15k6uktSvRkPiAZZWHduXkEyEStAYpNltZ5m0L
         jUiug7JXYag+7HG0mEBD++sQr7b/JUvgStvlzuJyIjel7IwYhLE6N3nrDhA5KGZm53pa
         72sA==
X-Gm-Message-State: AOAM530GFZuqXXeGSb1/n8LtiAq5+dt6FwbnvAEXDfbRtdXEIe+kVSiJ
	fm5IB/Du54VCDnnrJrTiV1e555nCExLDtQ==
X-Google-Smtp-Source: ABdhPJz5YGoil30171wSBnkENoEic8lsNqkV+tVDvWBRjp4a2fgw/yqMM6hFESwWuQ0gXe0RuR7t8Q==
X-Received: by 2002:a05:6000:186f:: with SMTP id d15mr48153136wri.400.1620855133861;
        Wed, 12 May 2021 14:32:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id j10sm893861wrt.32.2021.05.12.14.32.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 14:32:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ovmf: Disable lto to aid reproducibility
Date: Wed, 12 May 2021 22:32:11 +0100
Message-Id: <20210512213212.2283022-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lto tends to break reproducibility and makes ovmf near impossible to debug
reproducibility issues in. Disable it and supress the warnings that then
generates from Werror.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 1fe01146d6b..ef5545bf705 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -102,15 +102,22 @@ fix_toolchain_append_class-native() {
     # to make ovmf-native reusable across distros.
     sed -i \
         -e 's#^\(DEFINE GCC.*DLINK.*FLAGS  *=\)#\1 -fuse-ld=bfd#' \
+        -e 's#-flto#-fno-lto#g' \
+        -e 's#-DUSING_LTO##g' \
         ${S}/BaseTools/Conf/tools_def.template
 }
 
+# We disable lto above since the results are not reproducible and make it hard to compare
+# binary build aretfacts to debug reproducibility problems.
+# Surprisingly, if you disable lto, you see compiler warnings which are fatal. We therefore
+# have to hack warnings overrides into GCC_PREFIX_MAP to allow it to build.
+
 # We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
 # --debug-prefix-map to nasm (we carry a patch to nasm for this). The
 # tools definitions are built by ovmf-native so we need to pass this in
 # at target build time when we know the right values.
 export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}"
-export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP}"
+export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -Wno-maybe-uninitialized"
 
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
 
-- 
2.30.2

