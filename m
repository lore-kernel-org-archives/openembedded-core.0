Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E0CC47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.151028.1703864755952998050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rOttsPI6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d2e6e14865so33240865ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864755; x=1704469555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBdeHcYnJPD7+XUwqe/K7JOg/XjDxZQrJMegvc2p5Vg=;
        b=rOttsPI62x1itQqtiN+gmGcquT1XAd1O79i+L1UljYhZJFvQbnSQYw3csWYjGCZSR4
         TR2OcJ0XmQTVlOwETJY5t7Z7OUGCAx0hbZkr1mPE0RrAZFHFr3U9XZiNocI65vG0/lH1
         H+9yWXZr6TsvrnBqGUlRBOai3as5X6pi0gIxgKWhebgEZtVItDBvcNIT4zn37Kh6GNN1
         M8KdeBV1lDlYWIFAqgnbDeO/+laUMeQ3ygJCwP5DYveUsPk9mdXpK3g8xalGLZXb13W/
         f/Xu1YoJQrp8irnVOK5D/dCbX/9ZfDkb2gX5iKsgCUUoauB3DoXzc/lQMPTaiTpMjjwf
         DrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864755; x=1704469555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBdeHcYnJPD7+XUwqe/K7JOg/XjDxZQrJMegvc2p5Vg=;
        b=oeLbGRAIuFgHcVimm5Ri1Vw9+aq1Rpi/XmgbY0+siulG5geJgHtwlYgIK6Rm99+4/K
         iFvdIZPNA3lzCLtKHw2lEjbAZr/sTFdFIOgjfihd4mwc86NkGFA02/N034QQvvzH/xK7
         JfeckVniavTY7P43aF65H6C7naBRN3DmQsf7q9B3JwsQmooEzG7MqI/LJUvi/8zIzXln
         QxBtXrXcih/wt38WsY/jpuvIuGDj7vp49Spg4/gbiwmAy3agYqIiFA81raTutoXAPVAl
         Ch80Myznkum9o1mZSlA55/ews1PN88UTiyQ5M75YlyvuGbXhLFd9iiAEGZHNx1woeMpa
         Gcbw==
X-Gm-Message-State: AOJu0YzC4La8AIyU7pCHknsEX5B64aH9gWaUHnlEzV0JkuDt5wkqU+JS
	vo4hAFb0KIrHLSP9COxIcnaeo6hAzNJleBg87Z3Vdxha0lZ/7A==
X-Google-Smtp-Source: AGHT+IHbxLZ0NlhLC/9spNvA9qPaflOat9QaM5Hf5T0gewWb8MeYRfqBPx2YFr0F+yaeCIx1G+J8Rg==
X-Received: by 2002:a17:902:ecc2:b0:1d4:5fdb:59f9 with SMTP id a2-20020a170902ecc200b001d45fdb59f9mr3936272plh.127.1703864755180;
        Fri, 29 Dec 2023 07:45:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 28/41] kernel-arch: use ccache only for compiler
Date: Fri, 29 Dec 2023 05:44:42 -1000
Message-Id: <4fe3ec1b7e1d034b236816166d58801a4b0e8d70.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193045

From: Javier Tia <javier.tia@linaro.org>

Attempting to use it with other tools is not beneficial, only with the
compiler. Confirmation from ccache's maintainer [1].

[1] https://github.com/ccache/ccache/discussions/1346#discussioncomment-7616180

Signed-off-by: Javier Tia <javier.tia@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47fa8d81083f1ef594f8fe6fcab3e227e9607b3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 6a50bbfd42..404f2e7061 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -74,8 +74,8 @@ TARGET_STRIP_KERNEL_ARCH ?= ""
 HOST_STRIP_KERNEL_ARCH ?= "${TARGET_STRIP_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
-KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP = "${HOST_PREFIX}strip ${HOST_STRIP_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
-- 
2.34.1


