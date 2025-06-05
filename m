Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291B2C5B549
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 03:43:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.35817.1749094992971736414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 20:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e38n354O;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234d3261631so3762555ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 20:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749094992; x=1749699792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBU1XqI+bN8khsF7k5Bo4dwutD3QaOzi/5vhBdmX994=;
        b=e38n354OQld4PJ4K36G2oNC3hrjG57ucu+dglYa7KOnhEqik5I1t0kdvH8p7AlPRe6
         SmjVMoJVa830CtAZ9OZqltSBO2ZjBqmYtwoqQvjRviaxkZjyuBO7P4feptsuVDYFODjx
         Xy+J1BhlGwBshzOVTUT2Jc+wi+xhUg95boyL3kwJ66K4q7u+KPbo8toHZrUtVVWucuko
         kfxDV30CSkf4x+wl3QcJKG+zD5nlm6rKoKTAjSYTOnz4y/bd2JgQwyzfWK768O9H7w89
         SUJe2/OQKFeI6DGl8biCH3sNnq6cPM4uQZNLC/QNRCC9a7RQ6r6uuwQo9dtAv5u+42vr
         XDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749094992; x=1749699792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBU1XqI+bN8khsF7k5Bo4dwutD3QaOzi/5vhBdmX994=;
        b=lZa/4FYcZ52gfRGyGrHS7wU2nWcrPB06o8ofzc/FBmqKR0fgKDH/DRCmWGoBwKDAfr
         F1824mFK1wq0vHMSke4q2nhrBxJBbDMi8jqof2HmLJ0Sx+cNlF6oJEpnau3+q3lc6adz
         D+z+ETfo08pSWqMssO0rmGPnf849/CFY7udq2e/xwQsm8uwp3056ocAavnQ1QySzT4p5
         yiPeSNZaDd7YkfzuQpE2gp1qL911BbBv+AbGDbsKXdSzYymCsg2zA9zjXdwrhrEPQbcs
         I1RUW/LZhVl9JTM0ZA2szVVCyyHv/DAWuLvfdDuumD+qsPXCio2zInuPaShMN1mhjbKz
         +BbA==
X-Gm-Message-State: AOJu0YxLZeBcL84zByEA7PcDSoMrwPHCeS6Ep/4b+QQgWtgbXTYfyxBZ
	OHorvPFrwx3jpySw0ho4gGZjto3MdacaeWtw/7csXJP0VOaMvc8oBKs3apeAyxrk
X-Gm-Gg: ASbGnct3UB6B8Gz4E23XpVRk9AFZN7QQ6K0ZDj1pI4rzeGTf2BNmlF7EngYOHFW6LQV
	U9sIxypA0842h4OaqobRByczNr9xJnwO/G1sKFt9K3IgS/uYGaICjskPfXVtzwB3VIPIIENdvm9
	mDFFoj5r7cZPXCHW015OsiEMYFa/vFU503dQRmji2exTbH9THTORoHxSKMoJbDO7Ovy/OOknGRU
	9znWAbQ5+PnzqpmpW3ITcteYHUlED2+MzRKuXL0Xq08nZr9JpaURr83LQEFdIA8pppVRuoqurNs
	TBJxaRny0rXNeFB7gO+DKUDyuKgy1bWQRzk5jL7sVQ==
X-Google-Smtp-Source: AGHT+IEekR/9cAfuIJv93tSWsskZjiws3VCaZTBh5qKPgu+RQL8RG3r+yGRYnugAKQVGiI3F0oZjJQ==
X-Received: by 2002:a17:902:f54e:b0:234:d41e:f0e6 with SMTP id d9443c01a7336-235e11e74c3mr82411695ad.34.1749094991985;
        Wed, 04 Jun 2025 20:43:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::9b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be23c1sm110860295ad.78.2025.06.04.20.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 20:43:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Turn FORTRAN into a weak assignment
Date: Wed,  4 Jun 2025 20:43:09 -0700
Message-ID: <20250605034309.3104001-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217978

This ensures that it can be turned on from a distro layer
config metadata e.g. local.conf without forcing overrides

currently we have do something like

FORTRAN:forcevariable = ",fortran"
RUNTIMETARGET:append:pn-gcc-runtime = " libquadmath "
TOOLCHAIN_TARGET_TASK:append = " gfortran"

to enabled fortran support from distro conf file.

After this change we can do it with

FORTRAN = ",fortran"
RUNTIMETARGET:append:pn-gcc-runtime = " libquadmath "
TOOLCHAIN_TARGET_TASK:append = " gfortran"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-15.1.inc             | 2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
index 0032500cdcc..18f8cae5ca2 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -79,7 +79,7 @@ S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
-FORTRAN = ""
+FORTRAN ?= ""
 
 SSP ?= "--disable-libssp"
 SSP:mingw32 = "--enable-libssp"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 5c799362429..e3fb48c0301 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -6,7 +6,7 @@ require gcc-shared-source.inc
 # These can be overridden by the version specific .inc file.
 
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
-FORTRAN ?= ",fortran"
+FORTRAN ??= ",fortran"
 LANGUAGES ?= "c,c++${FORTRAN}"
 
 EXTRA_OECONF_BASE ?= ""

