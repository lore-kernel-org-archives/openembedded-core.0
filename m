Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C216CC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 13:49:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.72107.1673272174193295538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 05:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bIdxTN3M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id s9so8207370wru.13
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HvCr462qfC7ZTICo3j9ZoOGVmioApZ7raM+z7UItRI=;
        b=bIdxTN3MJy99HrydkalHh/YnZeDOV5OJ8G82kp79yHkyWxoDj9NCQoU7lHdUOS5gyR
         ofCVfrKCpz1VhLpdVfYsOgldwb1c7JtFo/StRr0ZBuUp9OYxIbr1fMABbqmGFRSa5UmP
         lSq0uT1DzsW3o/iZF11rVg2mnCOO8N7he3w8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HvCr462qfC7ZTICo3j9ZoOGVmioApZ7raM+z7UItRI=;
        b=ErHJrnSlGcbfLmIBS55+hDCVt5husfL10PXroQGwVSFZfBAlS8UIPlfOARmh8P0S1/
         OWFx0tMCX1PwIhRscvSk6kde4Pdan7G+uvMy+33ioAeD0IB3IRyrpX++xNo5F+tJX9TN
         iExCgT0ddnBAiGJV2E9l/bDgu6/TNvSvFH6msPw37SHP6YecjWOzRDbTxbTeXLxI/VFr
         FjxByJTE7Wspi1PJpJtlsQs7aEfM1d9ltk52q5Sl2GYC6X/xTjYtFCjKWBf20l2JLzeW
         UpRUM51aLBhGi89BbqaBDrIDJOqfa/PYCk7BdPaC2LoU0o+B8TPl7sRrIr2T0/0YL+tx
         Ez7g==
X-Gm-Message-State: AFqh2koMUschZzifM+Zch6ai8gSsvZUwvynKEyvX4Ozy09/lHgPZtRov
	FF+fa8WbsqAYTLJgm7HOBwVYE6jB7LtEZF9k
X-Google-Smtp-Source: AMrXdXtGDXWc/iIHfB1BFoJVVruOyTsBn9gNvG4ttQPkOHrhVasu0VQGPW3i3uCka6RrJjGLa/TEvA==
X-Received: by 2002:a5d:4d91:0:b0:2bb:eb1d:bba8 with SMTP id b17-20020a5d4d91000000b002bbeb1dbba8mr3034907wru.3.1673272171991;
        Mon, 09 Jan 2023 05:49:31 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bf05:daf1:cc08:7166])
        by smtp.gmail.com with ESMTPSA id s2-20020adff802000000b00241bd7a7165sm8559649wrp.82.2023.01.09.05.49.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:49:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uninative-tarball: Add libgcc
Date: Mon,  9 Jan 2023 13:49:30 +0000
Message-Id: <20230109134930.1409270-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 13:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175684

We ship libpthread with uninative. when uninative is active we're seeing
failures like:

   libgcc_s.so.1 must be installed for pthread_cancel to work
   Aborted

which is since we don't have a libgcc that matches libpthread. Add libgcc
to avoid these errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/uninative-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index a21d08b591c..4aecf39b890 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -20,6 +20,7 @@ TOOLCHAIN_HOST_TASK = "\
     nativesdk-libxcrypt-compat \
     nativesdk-libnss-nis \
     nativesdk-sdk-provides-dummy \
+    nativesdk-libgcc \
     "
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.37.2


