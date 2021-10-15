Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692ECC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 04:16:20 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.5162.1634271379163829916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DYEHiDRH;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6423172pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icl0qOTXiZMect94hbS6LPa+sBc25jhZjCGVQr2SrGM=;
        b=DYEHiDRHeEkWmW3YJa13Y7aT7ZvI+H2L/oA3CqhkuTvYXE+xQg6byTyT5E8su+CuDZ
         rmjJ3RN49SnNm/W6fkJjNQAqaL+W0d8j0VAfegtbrbTyL0QJc6KeEOOI8fN5S6RBOP0A
         XsYJPq9cUiLDXIqWIuFEyRTji+T1mNgV5qM3/498cs/e/FE6F9mRhCUNX+LKJJ+qL0M0
         kBxsPEByQ2gBt+kdc35yxI4IW78aWv9Gw9ffY6/qRtxYpLy3xmiwQhCrfyAP4yVPjoC1
         pXs8NWz5bbpfjwq1dUw7fbXJ7+zzchBwRYJ/sy8o/N6FnGlUtVvtkFF8Ufvf0H9b0yF/
         QlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icl0qOTXiZMect94hbS6LPa+sBc25jhZjCGVQr2SrGM=;
        b=fQKX9nVtL7wxtNX19Z0/hDLlb87++e3neQGSkSQHCn0Cm3Yh7L7ZUgCq5cPvr72TL1
         WY0s2K8LsN6tP7O96azHpVQTlhd+nO74lfFghhML8zj97giJB0icpTbCefh5VFlh9SRv
         dXgq3A0JcASiTK9jp4Ul4hSaPczlEL4EJEYa17AO577iG2JiKjR7/HsnTDosC7nIy87k
         QS0JC2zhbi24PFB1gqyAecoMEMcpeMQPdq1GURQRsxnLKGKddiMogHatBU42iyYbUEVB
         GmOnyi0oCny7hkBNytLYjQl0tmQocUjxOc9puacaNfPpPPo8cWFQSO9SUXtsw75gPX/d
         wNFw==
X-Gm-Message-State: AOAM533pioZz6y8xb9G3gNQ2QGrWb2v+we/nyHoa0sAcuwanVpGYnkg/
	LhFpTj5H8oLu4NS0Pm3uc3Pds72DfuKmzw==
X-Google-Smtp-Source: 
 ABdhPJw3TKC2S2MVbdjFkSY4/rJWbW/fizXA/A2tMxOVTKTcfTZNJebQ4ugdSNFfkdsEi96qrfDUnA==
X-Received: by 2002:a17:90a:f013:: with SMTP id
 bt19mr23019772pjb.82.1634271378391;
        Thu, 14 Oct 2021 21:16:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 s17sm3953555pfs.91.2021.10.14.21.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 21:16:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] qemu: Add knob for enabling PMDK pmem support
Date: Thu, 14 Oct 2021 21:16:15 -0700
Message-Id: <20211015041615.1846604-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 04:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156985

This ensures that libpmem dependency is added in a consistent manner

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Correct dependency name to a match recipe from meta-oe

 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 54ffb85286..57e5e1a015 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -194,6 +194,7 @@ PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
+PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.33.1


