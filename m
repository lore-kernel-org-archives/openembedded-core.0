Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D24C43217
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:55:05 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.306.1664560498355713000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a+IGmzwu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id x18so7982349wrm.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KrWnQYNe1UuXJdErm+S/Lzm/yFS7AcdKgOZj4cjJP0o=;
        b=a+IGmzwuXjfYppSTYVABslYSiLzwz1M4jcDyyQEdVSXIpLyfkYXoki63tP5ClnlWPa
         jtoJQXqC8f/mJmd+fBPqH+x4R0MhhpnIXQFCQ1O+UryF4/Ft/UBzcavooQpxLzSHgE7q
         3IrR58seHog9/kj2dFAKudqwpr6ewfaFSArSIFiXoPYU54dkutfQ8p1ks9Zz0RCIIGRK
         8X98bnx9SgaUKq/CYuj4PPBHG5shJdtm/Zu/s8sL/Bh1aFPbLBtRRDvwAPsoUp6jbWAX
         tm+p8ve/AlzWcO/CTgnf/Z96qWC5icCqQIpXov4qa0LeJZSx3kC2OWSh8CfhRbQXvHr+
         v5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KrWnQYNe1UuXJdErm+S/Lzm/yFS7AcdKgOZj4cjJP0o=;
        b=MoRkJ1CzaKNn+EHI28rOHgpcwRN2IKpCxTCZOB6r/WlqUzjTZLidgX5aTKmBzbTgZM
         aQa4EQHXF+ns8RtIufwRh9XS4skNvmt/k0grI7aRkmTeRP5QyKAn0xvWuj+NKRhZ8esy
         Gxd+UMFCLCHpR3/XJvZeked7iXPuFp8dLeTRc7AEKW6oc/4/SlvPL/+sfNfRTtz8Yf0w
         vwFZLZNTPLwGWa8LcWLGDbLznV9PVEleqyPE4iNLyovh9EaxIncVS9BzSpwmH/Qi3zBp
         58aRHxeuabv1PMYtR+CR/YUgcDN5JpAgiGY5F/SRaZx0t72EPfaGSp9wUMDZQambl6jz
         1bBg==
X-Gm-Message-State: ACrzQf0x31uhPEe/S0ceCnHf36YtJRQQRvp7PLDYkcT7x4zIFLmGtLuq
	7JXw6vTGo/a3ZAJ5576GjUWqoVItzBAzH97b
X-Google-Smtp-Source: 
 AMsMyM5gsgONJjz6iqgqOjMdbYj1lugHTsQaMK89DSElXMayqEIjqcYt18GZiLC8BFZ7uKeCI297RA==
X-Received: by 2002:a05:6000:150:b0:22a:55bf:80e9 with SMTP id
 r16-20020a056000015000b0022a55bf80e9mr6724537wrx.654.1664560501469;
        Fri, 30 Sep 2022 10:55:01 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 y9-20020a05600c20c900b003a531c7aa66sm2636017wmm.1.2022.09.30.10.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:55:01 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 2/3] kern-tools-native: don't pull the toolchain as it is not
 used
Date: Fri, 30 Sep 2022 17:54:39 +0000
Message-Id: <20220930175440.2168008-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930175440.2168008-1-jose.quaresma@foundries.io>
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:55:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171234

Prevents the default dependencies, namely the C compiler and standard C library (libc),
from being added to DEPENDS. This variable is usually used within recipes that do not
require any compilation using the C compiler.

This also improves the speed as it will not populate the
native sysroot with the toolchain.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index dea7b65a7c..5fe46341da 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -19,13 +19,10 @@ inherit native
 SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
 S = "${WORKDIR}/git"
 
-do_configure() {
-	:
-}
+INHIBIT_DEFAULT_DEPS = "1"
 
-do_compile() { 
-	:
-}
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install() {
 	oe_runmake DESTDIR=${D}${bindir} install
-- 
2.34.1


