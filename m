Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94701EE49B0
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.1050.1692634309684250499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CceFWsXN;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso4314457a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634308; x=1693239108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErVR+4mr/bEwryE3Z1g4lUfVjCMEfJBdh+oxF159VxM=;
        b=CceFWsXNFgp/eRTnHqUBfkyK/zJ9bVf8QMUHEqStXvw/uT7OwPQ5QZK6neC1X7Vp2m
         gukrqTECq99QeWiL4XBwHkYT3ynPvxGRIZf8FhEZ/jzs49TfH/l4sCrgB1glr/Mc9you
         FpPVxc1sKkHak78+y4M0sqs7RT4djVZYLlcBeUy/v/g5HHOYDnBYfcgp98bu5Nm5kbxg
         XeNxXSboLPLqJ8ZscwxDCxBEEQfF1Gu0uwq0bgpPn+MpHzbqdc6Q2G/qLv55uDTMcK4x
         O0W3HAsTnXWaD7jT7vMgOFoyo3Dke0tJh3LMdy7HyFfMRxfA+A5ZnhNZhh6eecLYtxQC
         9uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634308; x=1693239108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErVR+4mr/bEwryE3Z1g4lUfVjCMEfJBdh+oxF159VxM=;
        b=kz6jokt7oPOp8FAfYkZ5jxCjeO3JJg9jtWBgHUV1RzVK2LgLIhlVYhGRV2jR8TE6Zy
         yoV/FQWX31Y8893I6Dmk8I56YYMLn3rap6KkkVIO38hw29XfPUJKh1UKir060fEWIXPD
         t5xGUc+232JL3cCnlqDB1T6p+eRJ4FBfozztYL5+iRjKKlSTmGyJuettNSaWrAau1Fz/
         QdM3aKtWLnFDnd/bLSWVl5c/QzDMHAi5BlNvs1lx7lEBY6mWZBxOs7FJIKpAr+y6A3dG
         v+Csq4RZof8/XZUY9GTeDXegS3rZwuUNZcFcQFdcuIW+4BHQqpezsiiglK0A6kptMv4a
         GJQw==
X-Gm-Message-State: AOJu0Yx0kIP0iz3zkNB0jiFdBeP9j5IIaeGiFrJO9U78nPkfotDEBX9J
	Fyfu+dNqsdr/6U7vFIBh2VVMTgbmTxM=
X-Google-Smtp-Source: AGHT+IFA1YmBjzo0XPvj0wPmMIFNiAAdGNjNetK0stuvP6w1uTvmLeHFvTBn0us4cOpdmxlTMsXdnw==
X-Received: by 2002:a05:6402:1610:b0:525:5886:2f69 with SMTP id f16-20020a056402161000b0052558862f69mr5661396edv.36.1692634307753;
        Mon, 21 Aug 2023 09:11:47 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:47 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 08/14] cmake-example: workaround for pseudo breakeage
Date: Mon, 21 Aug 2023 18:07:11 +0200
Message-ID: <20230821161120.171956-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186471

---
 meta-selftest/recipes-test/cpp/cmake-example.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-selftest/recipes-test/cpp/cmake-example.bb b/meta-selftest/recipes-test/cpp/cmake-example.bb
index 96d543180b4..fbf1f266721 100644
--- a/meta-selftest/recipes-test/cpp/cmake-example.bb
+++ b/meta-selftest/recipes-test/cpp/cmake-example.bb
@@ -15,3 +15,9 @@ SRC_URI += "\
 "
 
 FILES:${PN}-ptest += "${bindir}/test-cmake-example"
+
+# This is a workaround for packages with sources in-tree
+# Without this bitbake ... does not work after running the install script.
+# newenv['PSEUDO_IGNORE_PATHS'] = newenv['PSEUDO_IGNORE_PATHS'] + ""
+# path mismatch [3 links]: ino 37529096 db '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/tmp/work/cortexa57-poky-linux/cmake-example/1.0-r0/package/usr/src/debug/cmake-example/1.0-r0/oe-local-files/cmake-example-lib.cpp' req '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/workspace/sources/cmake-example/oe-local-files/cmake-example-lib.cpp'.
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-- 
2.41.0


