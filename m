Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.659.1601560794771430838
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 06:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WX00ntuh;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id j2so5896772wrx.7
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 06:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkwPCN6REY3QdC4phodRrAdQSCei9408s3FAgd5KuNI=;
        b=WX00ntuh94mhUn9+Mkn/8a+YYtcG1R+qxLkJBtXDUb3WW/Sm4jBji2DNvoCkZw19VL
         BrMFauu2AejQvfL0VoAoVIO65xexTf6hnV6t63t68p6fVsYHSMEGy0qLt4T4+x2brRqN
         PpBnsIUvjrpYivu1xggJoRk1Yh0N+sj+Kz0XWK04zQUCJMZOYmIOb0zqxeMbRTvn3AKo
         gP3PowJLnJLiKC69c8E7aX68gDai+HoKHw0U5agrNr6MbB4xy/RmrBOWpB1x+x+/yKSX
         2wsgq+xP0FiPnFcbQAoHXfJFN4IUT+OJ17y/8GcMMVoK1zGk3HcYkdYJ+HF+EIk5OQbN
         l+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkwPCN6REY3QdC4phodRrAdQSCei9408s3FAgd5KuNI=;
        b=qQ/N6ahtHTLrh4FDLjSaVR68eCr8YedB0AJod25gDhMoZHp8iAo4h/Dgvg0CIkeTFk
         HHF8jzQnGa4B5qP737uuZcVX+RXoQX5enn6wfzlzdAVXILb87+9hTtM0tsZELfhSBPvF
         qLid/93ajiHx0hM62aUF2/8IJJUTIZhy0xoMWYTT/Xu9J/jZPUDL179/WyAUdj6Srj0w
         178iJjQYU2x2IS3Mgwcson/WPt6FK2qFtCHVKtfkgs2cic/KXHoXNA/OvZ+AXO42sZAQ
         nwE6HaMe0hiSw1YrXM9ctWSv7QmQOsDM3kyrLomNzPlCvcXfY7Dg70jYlyj+q1poMrfz
         oyFg==
X-Gm-Message-State: AOAM531OIluv1Kjsegp769ft2tPH3CUx93zb2DpGQUbjptgyD69Sh+Fs
	AgMOFd5kI0WL7e0F6SMqPOi8qE3se3V1zA==
X-Google-Smtp-Source: ABdhPJzj55UqDsXZqRnfyTL99Gxyn9sZl3lWdBdhGi/e8DM6Kwhq9BFDFlux1XhMTGo03sfZQpXnsA==
X-Received: by 2002:adf:d4c1:: with SMTP id w1mr9212235wrk.108.1601560792804;
        Thu, 01 Oct 2020 06:59:52 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from localhost.localdomain (dslb-002-205-007-068.002.205.pools.vodafone-ip.de. [2.205.7.68])
        by smtp.gmail.com with ESMTPSA id v204sm99338wmg.20.2020.10.01.06.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 06:59:52 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [PATCH] module.bbclass: add HOSTCC for out-of-tree modules
Date: Thu,  1 Oct 2020 15:59:27 +0200
Message-Id: <20201001135927.721794-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Module build environment should be aware of native C and C++ compiler's
environment otherwise kernel Makefile might silently fail for some checks.
A particular example is CONFIG_STACK_VALIDATION when CONFIG_UNWINDER_ORC
is used, Makefile tries unsuccessfully locate libelf, even though it's
already available in recipe sysroot.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 meta/classes/module.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index c0dfa35061..8a691922c7 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,6 +1,6 @@
 inherit module-base kernel-module-split pkgconfig
 
-EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
+EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR} HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 
 MODULES_INSTALL_TARGET ?= "modules_install"
 MODULES_MODULE_SYMVERS_LOCATION ?= ""
-- 
2.25.1

