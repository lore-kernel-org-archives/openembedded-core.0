Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC13C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:03:49 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.22824.1636985028449860984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 06:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOv+AsXo;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id x5so4445115pfr.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 06:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aymu1OGxwwmt0YUUbvFDaYxNEbWnqdjTsoTjcqufRw=;
        b=NOv+AsXotWvSFSbwgpjS9NtLLCOBjWrBcrtFBilf0u02GuY+AtP6sJhIB3IFxPQDos
         qwL5NTOfh/4KhO/+83mLiowBIhzjfJbl59QFTkQFYyCVTV0vfLtwyvkXS4/AFU6Ymufo
         0yH9jfauetzHUIBmkIehev81oS7XgE47IZzy42DsP8t71+y+J7SUvyCfPDZaH5JQxkZ/
         9Sr4sjEWPSZ4JljndNtBMWS1gQ/Br9faA8NNAbxM7Oh1exISgODlbgDpuILmua25eJj+
         j0OUPZyeNd2ESfGOGf4paY7L72XJscDDftJGDuStRj3pqSEktk5AxI/D1+RWYLNCGdtG
         ZS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3aymu1OGxwwmt0YUUbvFDaYxNEbWnqdjTsoTjcqufRw=;
        b=y03h/XfaHzzrobhATcFnIW4grSNRcXymbtEwvO38dJv+SzOl6b4tkUvdRmvcE9ZSIQ
         jd2MOKhzmXYjuUFgp30NbiWEYJUEXCye4A2/EF0xiGpccMuInkedR8r5aOdz27CHjx10
         5PTOLBf1qNIqwG41SA0VvC2a/Ijd43iuNm5L6n5WFM8QUCnxOIFwy35cVrGIAvTIbTd6
         PZfaKpftj4KdyZ1eyRTq4/aKYvbTd1qCSQaJHTbt0UBYV1sbncGhovnpSp7DBKdxzU49
         Q1RBWcv/aLiiOZFrtKa/IiZZijvIXGoSabila+xe7tVCwXikAPlT/AOhNZKUAJNxbYn2
         WOAQ==
X-Gm-Message-State: AOAM532MwOoN4jmJVNKhE6VernFyxTKgrHvY/wRGMMFCOJdIBBBgUsLJ
	tIdJ4qVhndgoS4y8GiSAv7lDyaIp30s2QA==
X-Google-Smtp-Source: 
 ABdhPJxFU2kkKJANFsZH+P1huz7U+0nTGnJu3r4mPKc/xWsYGMTCH+3htVFWe3E5/855to7M13krkw==
X-Received: by 2002:a65:6554:: with SMTP id
 a20mr24491436pgw.107.1636985023857;
        Mon, 15 Nov 2021 06:03:43 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 n16sm14575927pfj.47.2021.11.15.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:03:43 -0800 (PST)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH v2] rust-cross: Replace TARGET_ARCH with
 TUNE_PKGARCH
Date: Mon, 15 Nov 2021 06:03:40 -0800
Message-Id: <20211115140340.8047-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 14:03:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158292

rust-cross-* imported from meta-rust has incorrect signatures,
depending on MACHINEOVERRIDES making it effectively MACHINE_ARCH
as shown by sstate-diff-machines.sh:

openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc \
--machines="qemuarm64 qemuarm64copy" --targets=rust-cross-aarch64-glibc \
--analyze

 === Comparing signatures for task do_configure.sigdata between
 qemuarm64 and qemuarm64copy ===
ERROR: gcc-runtime different signature for task do_configure.sigdata
between qemuarm64 and qemuarm64copy
NOTE: Starting bitbake server...
Hash for dependent task gcc/gcc-runtime_11.2.bb:do_prepare_recipe_sysroot
changed from
da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 to
47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
Unable to find matching sigdata for
openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:
do_prepare_recipe_sysroot with hashes
da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 or
47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40

The following patch takes TUNE_PKGARCH into consideration instead
of TARGET_ARCH and results in signatures as expected.

[YOCTO #14613]

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index bb625f4240..a77f7d5122 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
 DEPENDS += "rust-native"
 
 PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
+PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
 
 # In the cross compilation case, rustc doesn't seem to get the rpath quite
 # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
-- 
2.31.1


