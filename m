Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF31C55184
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21335.1785666548403466246
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LYsuKEAo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso13324785e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666547; x=1786271347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HINYp+1rNa12pmO3GGzCpHIEZMSWq138RVqVTJsiq/A=;
        b=LYsuKEAov7NEmQhPpI2aF1VgT6zhICRlDqP1TkaGp4PGxOmhhVg2Ev5Cm+OYdw2H+g
         vUVsEPQXUyiQldUVD4ERLvtWVsqNqLNm9SfKv8ZCZJ+83DcSxEHx9ImTlt0cCyVlwT2m
         0R+cG2cMTwz+0GQQjgdkk9gsW9LpW51h8ziRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666547; x=1786271347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HINYp+1rNa12pmO3GGzCpHIEZMSWq138RVqVTJsiq/A=;
        b=cVGYA2ubfUKLsllAhR9KCxEFAnvrsbVrknXik0qXm1bhQthsL3hmuULnEksujzodsr
         irz3EzaRp9460fUn324qLwsw4ATS23SjFeKnvtrqinmlk2XnwEbE8SwyUsRW/uzWnjqS
         ESq6FqrV199Ydq3bFkeowOE97UpUgYtod2oLzqlKCcg8Y3hs086QEgpup4LZ3Tke3Nar
         8sCcbsVZbwRCtU+fviQF8UrpirueDVmDg70oipf2RWczmX5fMw1QV2EZTvM7zm1QnfCt
         5N6X9gpuN0320FRW9w8qp8YLVNe+BsNsO5ftc7cROLdTm2RAZiwHcKqX/NDB8x/xpI6Y
         RHtg==
X-Gm-Message-State: AOJu0YzOjjDfS1lu1ENPLvWb+xDqWNNlT/m8C0Ryig6kH20VlLxIfXPw
	tueQnT/tyxTvkYTt+36YpbgGK11Bxsd26Tn5zpTrdwVippe3LwwLqud5QWI6bdTF8SS7iLlsM7I
	RLumXdvk=
X-Gm-Gg: AR+sD139FALn6YYbES8BhjblYaBj50Ung34XwOxLdzF/u2ysI7L3EL5eY2pwh6JtFNF
	hSumC7zXokprhYxr5Hr+o5khozD6gk/HALEflWuSceT5PhRTB4NoebwwQTmeIs43FPoM86an9Nn
	zTFv4/hy/EMX1a5pX2KmE1mAYEehtPHkgVSkcrCCbMjCABfdmJt+ON48/VXZBY5ZZ01ZcuywsOa
	itq4q6xzpccgxdJIxUHr1c/Sr+ht9kFWWlmnspHhuV4W4mjD/dtmxMxZsLXlHXhOxEwzTT91bbj
	Tvs4EweC8/shcplXbqY+GCkBKDbIvmg01MwblZAWbfM/+p1AMbRmw4ouOmCLIqEFdmfXf8VxV8O
	zTCIBBybIaUTxgldxzDRRcRjfX9KXJZAFsg+3YexGy+YdKySmpO8EOt+BxJXAH5b0oK947wiiAB
	ae4kh+LSMip6sm8XkuvwvxRXIKqqoj90cuQirc9oBonahzqOhbEWX5vvhAMVjruZrSwiNs/AwCh
	bTvYaXlha2xTCTuWg==
X-Received: by 2002:a05:600c:4514:b0:496:bbce:f3 with SMTP id 5b1f17b1804b1-4980eb4e952mr121370035e9.6.1785666546685;
        Sun, 02 Aug 2026 03:29:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/25] barebox: Separate out from kernel-arch.bbclass
Date: Sun,  2 Aug 2026 11:28:38 +0100
Message-ID: <20260802102854.3952760-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242534

Move the ARCH usage into barebox.bbclass and stop using kernel-arch.bbclass
since there are things in there which barebox might not want.

This does mean the variables ARCH and UBOOT_ARCH are no longer in the environment
but I hopefully covered the main usages of the variables with alternatives.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/barebox.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 2411fb5caa1..d8f56859484 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit kernel-arch deploy cml1 pkgconfig
+inherit deploy cml1 pkgconfig
 
 LICENSE ?= "GPL-2.0-only"
 
@@ -49,7 +49,7 @@ BAREBOX_FIRMWARE_DIR[doc] = "Overwrite barebox' firmware blobs search directory
 BAREBOX_FIRMWARE_DIR ??= "${B}/firmware"
 
 EXTRA_OEMAKE = " \
-    CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
+    ARCH=${@oe.kernel.map_kernel_arch(d)} CROSS_COMPILE=${TARGET_PREFIX} -C ${S} O=${B} \
     BUILDSYSTEM_VERSION=${BAREBOX_BUILDSYSTEM_VERSION} \
     CONFIG_EXTRA_FIRMWARE_DIR=${BAREBOX_FIRMWARE_DIR} \
     PKG_CONFIG=pkg-config-native \

