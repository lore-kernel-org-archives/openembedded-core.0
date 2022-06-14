Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62656C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 16:27:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.8188.1655224015978022921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 09:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XPKpIX8y;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id z17so4969687wmi.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xNGFstRvRjHWQTtLI00834GAlQezrAYh8GVPFdPttQ=;
        b=XPKpIX8yYj9Q6SttKYU/v4jFzNJceVtBtG1o5GRbcwiVAvU0ymINtAvPvzINUzMSir
         PtmXbTQguddRsk6g2rIRahmOX2ywROE6/5KKwNRz+VK07nunoOVf5aNq1T/fpt06hF0U
         Z6avQJgfySPlrWNqKBExYpkmAPrk+LUBbyg/Rj7cK5HIgDzoR1u4+af9SjNjYbzuThg7
         q/XcoqCezruMw6S8jlN//x8MKIO0JXfeCmAD/pEDI658APS3+MJZeo+U5aOwMQCzGe8s
         BpQap3yiSemPOsJ/KiGOpW6p9xSN+zOSdrX9T5HVCPrik2uvSJFncEopxy1ZdvZHLZE1
         B/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xNGFstRvRjHWQTtLI00834GAlQezrAYh8GVPFdPttQ=;
        b=yKl+RHIKpoilso4U4DJK4KIsrVnNHcw6/EmEIgDEH/Rp4IKFD9wr/m75nQzRMytIBN
         jRTsWN3bHH+RBwm55H2OLVvzdKfHHM31iRgFjpJ09hyA6g3xZMSfUztGrZjh78sGee3C
         q2FNYhlPejukg7/G/TMMPJbu386/ZgTtw6fQmyuKXnRLQAqQAP8Ugfy7ZMruFyJm1xNP
         cYO5EmucB9ds2IjVz29lNA+M5mHUThHYj5xcz3i6PYuudC+ldqtGDu0dMDgNNu+Q1NmU
         o++WlJ0zSE1ZysbXaqXb1eAEITE80CEXeZ9MyB6/tGhBPDQjc3XJbEYVARNAs41hGXQ6
         uWGw==
X-Gm-Message-State: AOAM533LKDyJyoTfdXXfB2jEqHSqf92x1A9WRMYqIEq8syBf2JIWvZV6
	l9iTtGtAy2ps6loaYjEm8P9NHlM6cwke0Q==
X-Google-Smtp-Source: 
 ABdhPJxz2Th3owpJqC9VZTrAm4k9XdTi64NLR7gJjNHVAsqJy7VV5TKVDDJWMZZXsrLSF1/UTNb1Vg==
X-Received: by 2002:a05:600c:348d:b0:39c:652b:5153 with SMTP id
 a13-20020a05600c348d00b0039c652b5153mr5025184wmq.24.1655224014036;
        Tue, 14 Jun 2022 09:26:54 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 i20-20020a1c5414000000b0039c41686421sm17410691wmb.17.2022.06.14.09.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 09:26:53 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v4 1/2] gcc-source: Fix incorrect task dependencies
 from ${B}
Date: Tue, 14 Jun 2022 17:24:36 +0100
Message-Id: <20220614162435.202899-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 16:27:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166903

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some tasks may reference ${B} for gcc-source which in general would not exist.
It has dependencies on HOST_SYS and TARGET_SYS which are not appropriate for a
shared recipe like gcc-source. This causes problems for the archiver and
multiconfigs in particlar.

Set B to something else to avoid these task hash issues.

Acked-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

 v2: replace "bb.error" with "bb.fatal"
 v3: instead of failing make it more resilient
 v4: fixes the stamps

 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-source.inc | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 0f70be7dd4..2abc0e355d 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -96,7 +96,7 @@ BINV = "${PV}"
 #S = "${WORKDIR}/gcc-${PV}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
-B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+B ?= "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 target_includedir ?= "${includedir}"
 target_libdir ?= "${libdir}"
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 03bab97815..224b7778ef 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -18,6 +18,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
 
+B = "${WORKDIR}/build"
 
 # This needs to be Python to avoid lots of shell variables becoming dependencies.
 python do_preconfigure () {
-- 
2.36.1


