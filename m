Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFCBC3F6B0
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 14:24:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.7387.1658845458491939290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a6LwmFiA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso11431221wma.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C8820Pq+ObVwtPhiafMUeE7J8q29sOlj3GJlJaCCEkk=;
        b=a6LwmFiA7BT67vtYVwiIJ7cAwq/I3drJ8ek2USxpHtCXVtVH65R2ltVANieWBuMy52
         dbqY1G5ws0Dc85ELZbPLdpJsHvsyE0s+LaGPvtbYoGUi9tm2W1ze8ReFf3nHcdIyQRMG
         rmf4QUSrnFj13AjvC96u+78gjU4ZjmQIIh9Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C8820Pq+ObVwtPhiafMUeE7J8q29sOlj3GJlJaCCEkk=;
        b=P6XE5ikyyyhTe4oqunOFfQO3PNAXZXNq0C/MeWnofO5XJe9hLTQljYgMlznzaCWXv5
         sgAdTJXZ5iwfJjVoX1Gljv0XA0lTASWWTrXgdTJaBRHs+ZeLZ+lXFfADQXfqQvROBwHv
         o9QYPh2qiAHYLjUk9tGMlw6jhfxhYAKL/ueQ+RvsiN4+CX4s71tZ75F+xVpWqsZTThNj
         VaJNr3x7MdY3gIfl809ZRC1s97YFHvgC4XP2PHRTnQIrlqHZVJPmKI2c2LLa7BY4W/EK
         HTeWmTxgXaNkzISXXBTlSBMafi9kLoyZc2/AwrdUp+V+tzv+y2skq8nBrjGUZdCCVVsl
         +Luw==
X-Gm-Message-State: AJIora9IoRiaaJq1IiFb0VnLvDmCHmtHzNW0UPJ6x/NYAi/duEHGmU+F
	kr1MsC24EjYn0ZehuAYhxya5nVlU+rR2lg==
X-Google-Smtp-Source: 
 AGRyM1tXwo2kCV/qN9mtYeOTiB7k2HkO5KIFdFpYhZW+kbemGoxDm5e7mufb/HeOJDPrXB7LJ+z+ew==
X-Received: by 2002:a05:600c:1d1b:b0:3a3:e2:42d1 with SMTP id
 l27-20020a05600c1d1b00b003a300e242d1mr12144710wms.137.1658845456539;
        Tue, 26 Jul 2022 07:24:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:289a:8162:dbfe:813c])
        by smtp.gmail.com with ESMTPSA id
 w10-20020adfde8a000000b0021e50971147sm14522654wrl.44.2022.07.26.07.24.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:24:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] populate_sdk: Add SDK toolchain language selection
 support
Date: Tue, 26 Jul 2022 15:24:13 +0100
Message-Id: <20220726142413.2262729-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726142413.2262729-1-richard.purdie@linuxfoundation.org>
References: <20220726142413.2262729-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 14:24:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168509

Add a new variable SDK_TOOLCHAIN_LANGS to allow different laguage support
to be selected within SDKs. Initially supported options are rust and go.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 16f929bf596..bbca4cedadb 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -43,9 +43,22 @@ B:task-populate-sdk = "${SDK_DIR}"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
+SDK_TOOLCHAIN_LANGS ??= ""
+SDK_TOOLCHAIN_LANGS:remove:mingw32 = "rust"
+
+TOOLCHAIN_HOST_TASK ?= " \
+    nativesdk-packagegroup-sdk-host \
+    packagegroup-cross-canadian-${MACHINE} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
+"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
-TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} target-sdk-provides-dummy"
+TOOLCHAIN_TARGET_TASK ?= " \
+    ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
+    target-sdk-provides-dummy \
+"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
-- 
2.34.1


