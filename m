Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA65C41513
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:43:01 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.238789.1697568172978013560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q7bqOYpG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso2949920b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568172; x=1698172972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiCZl4+uXxpisJPvq56PjrKgn7/8brIYJxsdrUiYSrY=;
        b=Q7bqOYpGGuniz7kmfQwOgKUgGpHzgObDRYLWfkyWgpDJN1Lkspvplyve1T+8lSt1UL
         qrLLq0y2dW4dcAShkDLPpXejvFoJTmLq6ADvOKTFCt3DPqJjWARMkdBM+ye0IOpm4CaA
         5U0THZPajBvZB0Ih4krhVc5ty6FRudokQMibX1jZioM7nyw0BDT0asWgp6jbF4osGZGl
         bzx7bS+t/MWfbTjv5V1eYsIZZHFIMS4CiH4lnFCCvGH+TmADyReZqn6wHn1+cN/OGCOF
         XGnCPCf/7f+6Yl7EE83f7uxyeEJ/B/Q9L29LbZiu7aYqa7zsygR8SSFRYG1OnFnqg2MF
         Dteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568172; x=1698172972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiCZl4+uXxpisJPvq56PjrKgn7/8brIYJxsdrUiYSrY=;
        b=HzyKOHJyHLal//FXypeVuEuDyeQ68qxpcHJqlp/bz3QQNvmjeVUPeyqaDPxrbLypTu
         NEO4+35vm3W7EQMy85IB5ufJ1lXrmX6Nv8vssgXmWRhB/0wX48bLn8wKGOm1sQFqA9Ev
         K6HuAHfbn483efHV6g780+8Bm8Rh2/YIdwu1yWfK5FWWZg54l5KbqLdRituTq0xMQMjr
         inAW3i4zvQm87coOiCO1SdIKyjRYqSjohNdY8tgC0Lo70eiMQgGTWtCFWMEJyUJHkv6J
         BoZLY95eoLb7ntgEi1nixosxC6g8Eel3HbMZtr3YRfedUQMWCtRKyUFNGCAX4StoX85z
         Bv8w==
X-Gm-Message-State: AOJu0YzqI7Fy5Qc4friopOkKEZhxyvAtocRX45YwO8iE39wjD6e1BCtr
	KpizElwmLUs+Qy6xOHUiwsiHRbhM6QOEpFUhtC8=
X-Google-Smtp-Source: AGHT+IHYlJooUP6ivEaZqquKLGEIuCS7kU/y8dCD7FWvq1kDhCSjgrGK1VyA/yA6J6qX3lKWB7P7ag==
X-Received: by 2002:a05:6a00:1952:b0:68a:582b:6b62 with SMTP id s18-20020a056a00195200b0068a582b6b62mr3588342pfk.7.1697568172043;
        Tue, 17 Oct 2023 11:42:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/10] kernel.bbclass: Add force flag to rm calls
Date: Tue, 17 Oct 2023 08:42:29 -1000
Message-Id: <844faa7c51ae8ec0966e9c5c3f70a1dbf2222c21.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189360

From: Ryan Eatmon <reatmon@ti.com>

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add the
-f (force) flag to the call.

(From OE-Core rev: 2e669bf797b15d803e7d6a700e449bdc467a4bcc)

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

Backported from kirkstone commit 7e177848f97e.
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ba5b6cf384..ca7530095e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -405,8 +405,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# If the kernel/ directory is empty remove it to prevent QA issues
 		rmdir --ignore-fail-on-non-empty "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
 	else
-- 
2.34.1


