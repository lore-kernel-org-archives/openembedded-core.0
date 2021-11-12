Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C89C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 13:57:09 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.15868.1636725424209992000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 05:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HBSwmQAe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso4645147wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 05:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HE5XosUSRPkJR8rVqm9Vtc4PTy6JojgHW7IiwgHCtuA=;
        b=HBSwmQAeXCEaVncsMHjkSkEV2PG6WM+EgAkzIblRrBm2Jq+gzpQp/4GTtIVO7DSwcw
         oHah4hMPK+cDxDF1TROCpKRn95u0zOycAYPSqlPWe1SzeDpFJpXTMqQP6nimj8Rs0RJQ
         z61GrdcE2/9qHdW9UJfrC+3l0rtcd02vzFaD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HE5XosUSRPkJR8rVqm9Vtc4PTy6JojgHW7IiwgHCtuA=;
        b=USYTxnHrEEkniGT4kBVs8xbwg9TkDqw6/+ROOH2oHNkts2keq3uzl8T4wFU3nsfkQy
         /4v+ZdcpghwckRDc5vyhaLPVdX00MyAW6vA3/BuqltMVIRPm/yvDROweNJDli/7xYOW6
         mVDtKCpAnl4RUyieJUy/OEr6eFkwmLTLQH2RWcHsrOivbGCkiloIfIRYZhO+e4NpSj/x
         ceI6TavTYm0NhknCJcVQyPg3xf/0bSmF5fXst3GI+lux+Gy+5ZZyQaB5as9R+LTd6JkH
         Q/x5DB7p74OSXX2ELRpbMtqxtPJz+38vSPpavN03mEMeUicgplFEGAOvTHKBjFtUbaUe
         4ybw==
X-Gm-Message-State: AOAM532mqWnzNGjXhGfYZVrLTUTpkT5BIPFv6aU8KIB4JZnovhRhlp8e
	tC+unu0eHgXGp9t1Pb7+oHE9BDeqLsKwTg==
X-Google-Smtp-Source: 
 ABdhPJxVk02+TGA20kL8r+lmyYnxAk2uYCegMGVFDtB+8J1nUngCG7g67lWhoeTNM50NZIrLxZls6A==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr17333601wmi.15.1636725422425;
        Fri, 12 Nov 2021 05:57:02 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id
 r68sm7043237wmr.45.2021.11.12.05.57.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:57:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uninative: Add version to uninative tarball name
Date: Fri, 12 Nov 2021 13:57:01 +0000
Message-Id: <20211112135701.3893672-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 13:57:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158218

uninative works via hashes and doesn't need the version in the tarball name but
it does make things easier to inspect in DL_DIR. There were reasons such as
ease of publication of the build tarballs but we can handle those differently
now and the signature issues from the early code aren't an issue now. From 3.4
onwards we can use a version'd name.

[YOCTO #12970]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass               | 2 +-
 meta/conf/distro/include/yocto-uninative.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 3c7ccd66f43..4412d7c567c 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc-${UNINATIVE_VERSION}.tar.xz"
 # Example checksums
 #UNINATIVE_CHECKSUM[aarch64] = "dead"
 #UNINATIVE_CHECKSUM[i686] = "dead"
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3165fc93b89..6833072cd3a 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,8 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.34"
+UNINATIVE_VERSION = "3.4"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.4/"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
 UNINATIVE_CHECKSUM[aarch64] ?= "3013cdda8f0dc6639ce1c80f33eabce66f06b890bd5b58739a6d7a92a0bb7100"
 UNINATIVE_CHECKSUM[i686] ?= "abed500de584aad63ec237546db20cdd0c69d8870a6f8e94ac31721ace64b376"
 UNINATIVE_CHECKSUM[x86_64] ?= "126f4f7f6f21084ee140dac3eb4c536b963837826b7c38599db0b512c3377ba2"
-- 
2.32.0


