Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7288EECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:38:17 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.40.1662741491450903958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L/MiEm46;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 u9-20020a17090a1f0900b001fde6477464so5854178pja.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=mHiJDttBZ02TAV6SAYShKW/2RATr19NCFoBldtk2HMI=;
        b=L/MiEm461voCxSnxho5D6ijFkgw0hdifBTH+3dm0ynFx0zY6aKohMTfqV5NqmkmSa0
         W6n/v7njtUuipOQjEa5TVcXAdu3k5BcQ7g30T1/8apcOxX0NZblnPIb5kSTtmN0Hr+jc
         7dcYy1j1N7p1qkvtPDUqTiZIKT5D6gkTy8icQRGPzJF/p6hjfjuAzv4uQRc7MQ9xtRXt
         dfKgCHbKL/aZQ7p3F/wnLQ97qNiCXiB+Lqh0kj8QAwIT9ZwRZED/REErUtWa0uRs5i7b
         EKgyaUM9bSFn+4pxDCZ34bLYkXn4Pla2zpEyKpeEUXGMdKUsEMYS1f8km51k0PFXlCBC
         cq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=mHiJDttBZ02TAV6SAYShKW/2RATr19NCFoBldtk2HMI=;
        b=WVXPPDEKaLvGl7IQy82W84iiZqoQrOOggEqZQIWn5DrGwAfL+Yp83fEXneaPzz+jwa
         UztEBtUL9GohM/PKiGHXi6sy1kigB7ZleldXn0m4KMvaozOyCZKptUavAplVzxQ1xKpu
         AH2OBbPMBkJ66du9Y+GL/Hr/8n1G0FqGMO3vRM7l+aPqTo8JuVi/j+qfCDyr4jhxmQrE
         jCwubPJYuWATT2WJIlpJBqNztVvepF2wPGHIkitKcT3jGYvE7wH+nUjP4pE8R1Ucf3Fq
         Rcdn4KvC0dfkfcP6hfIhcuwW2VBnZoE8Nsp8wqDHeZvpM3NogY/BEXMpHDVmYOVAKcqr
         Y+ZA==
X-Gm-Message-State: ACgBeo3D8wET4XZLfMQONioB4kYCn+siFWOrR+4i07MX5f++PjuFpaT+
	WkQKfyBtJXXROWdtdrm9fGXoN6ZgM1Upqw==
X-Google-Smtp-Source: 
 AA6agR7JBhpBUmQKY2NUgu1vnzUfzRBnFyUkcaM1lJQ8LZDiHzzq+xaUphqzPbLQJf+ayPmap71ZKQ==
X-Received: by 2002:a17:90b:3144:b0:1f5:2c6d:7dea with SMTP id
 ip4-20020a17090b314400b001f52c6d7deamr10268634pjb.220.1662741490545;
        Fri, 09 Sep 2022 09:38:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a170902c40800b00176a715653dsm701810plk.145.2022.09.09.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:38:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] bitbake.conf: Define TCXXRUNTIME
Date: Fri,  9 Sep 2022 09:38:07 -0700
Message-Id: <20220909163807.3887959-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:38:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170496

This variable is used to denote the C/C++ compiler runtime to use.
Right now there are few alternatives out of the core which could
use this variable to define this property, the values it can take
are 'gnu' for gcc runtime. 'llvm' for using compiler-rt+libc++ and
'android' to use android runtime. Default settings is to use gnu
which is current silent default also.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 52a36d788b..e88dc2b5bf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -389,6 +389,7 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
 
 TCMODE ??= "default"
 TCLIBC ??= "glibc"
+TCXXRUNTIME ??= "gnu"
 TMPDIR ?= "${TOPDIR}/tmp"
 
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
-- 
2.37.3


