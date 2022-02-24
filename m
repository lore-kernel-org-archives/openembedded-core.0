Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8082AC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 23:45:21 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.1043.1645746320564326045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 15:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kCdMy/FL;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id ay5so450921plb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 15:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snffgOhdDKDfpr/NR1BOGMilI17NTtimh1iCO01xf/g=;
        b=kCdMy/FLekNX3vY0RvB6NL+DWdjZGVx+jIVW/exNmI4I6thPh52BGDigRWUxkrV5o8
         lICakt8KC6UP97QNddiihmiBGiU+Esu0tk9rZ2OpyYjhI+Skomo1qbIdv2am3gKaux7y
         zHTefoBoY2IhRGwF815XqP4y8EE5At/jQF1JjAdPPah48DOEpL6/x6NKgs4+oas5sUmU
         LzTXRnaC04NhsDaAsZaYToYpjwpAdtfJvl4LBRtsm7LWdHQDG+b5wtyHiBnmGB+7DVnD
         BpJGRloX9bCF6Vctu+nkdJhXBjqJhEtTDn3jqFBDaSB5WmBFmsL++zalxCJd+gq8qOYj
         89aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snffgOhdDKDfpr/NR1BOGMilI17NTtimh1iCO01xf/g=;
        b=kXWOIa/kHZ/rBmqr0glnwc3K3MONrEQaWaG8oaUMLxtJXFexwJiatG3vUCZn9I4SgO
         XXItsY2BVbJ+Z5P2bNYZ2+CbF2PNHEPj6VZTsbMvEscqPl50yHGhagbvzCv+herDZ58L
         zsAvxcqAVdvIxA5+gu4AW5UDeWAI5c5pBSompnjvabF5J2siY/DFvI/8cr6hngrNCPST
         QGzYr/GEc70guag2z3Pw9GD/OS6nrjtCUC2LHd5Gp6XTxirV2rs+gBNcnGppKu1sxZDd
         8A+eDnszx87vtOq1Qyn9pwqel0HrG4dYjlrtInRj2MTtHlYY9dQJrCRolbLlskSqocuu
         EHIQ==
X-Gm-Message-State: AOAM533RZ3JxKJF4eE7ick9yvrpQoJNH264N7s4TtfuDl2QbmDKYfU8Z
	PdIEUmuKcPqwL5HccMmUSjhkV+ZaNspcvA==
X-Google-Smtp-Source: 
 ABdhPJyYbovKxRlaVDNbFTiNLmhL7+1wQKg5tmYlMddjjrD63CDrl7MkMKTnmEupDpxnSejJyomqPA==
X-Received: by 2002:a17:90a:d498:b0:1bc:9269:e46b with SMTP id
 s24-20020a17090ad49800b001bc9269e46bmr452457pju.95.1645746319589;
        Thu, 24 Feb 2022 15:45:19 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:263d:523e:139c:a040])
        by smtp.gmail.com with ESMTPSA id
 j67-20020a636e46000000b003740d689ca9sm542306pgc.62.2022.02.24.15.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 15:45:19 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-flit-core: inherit pip_install_wheel
Date: Thu, 24 Feb 2022 15:45:14 -0800
Message-Id: <20220224234514.2761033-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 23:45:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162332

Keep the pip install logic, especially --root in one place to ensure
that we fix e.g. reproducible issues in one place.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-flit-core_3.6.0.bb               | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
index 6dfacafd31c..a00ea1810e3 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
@@ -10,24 +10,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
 SRC_URI[sha256sum] = "b1464e006df4df4c8eeb37671c0e0ce66e1d04e4a36d91b702f180a25fde3c11"
 
-inherit python3native python3-dir pypi setuptools3-base
+inherit pip_install_wheel python3native python3-dir pypi setuptools3-base
 
-DEPENDS:append:class-target = " python3-pip-native"
+DEPENDS:remove:class-native = " python3-pip-native"
 DEPENDS:append:class-native = " unzip-native"
 
 # We need the full flit tarball
 PYPI_PACKAGE = "flit"
 
+PIP_INSTALL_PACKAGE = "flit_core"
+PIP_INSTALL_DIST_PATH = "${S}/flit_core/dist"
+
 do_compile () {
     nativepython3 flit_core/build_dists.py
 }
 
-do_install () {
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-    nativepython3 -m pip install -vvvv --no-deps --no-index --target ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
-}
-
 do_install:class-native () {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
-- 
2.30.2


