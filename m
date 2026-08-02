Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94981C55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21185.1785666554762451024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gy4LbvfQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso6661705e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666553; x=1786271353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=esB94ZwwO3JHyChsFu6AvzKu1aM33cmO1iPXXDujpXQ=;
        b=Gy4LbvfQuKq5EjKJ3BC0FfO9MCZb8UpE/6yFYY+dSW7OhGOlUVD9ScT9avIBO5A9Qs
         GvJNGHHyFFQwV1mIyjePfbhwl7ENNLWJSOHcftK6ha0QcJdOcr+rAm85grjynw5/FAUY
         zMZgV9T9LGhwvH7kKda3uLj6q/hinhPVsMe98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666553; x=1786271353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=esB94ZwwO3JHyChsFu6AvzKu1aM33cmO1iPXXDujpXQ=;
        b=FZFiRHRt2mJv44wf2Ys75nMKqNR6H+wDGz4GYF7L9dKO4dFnB//PdM5ymj0xmJ6FEO
         IlzCs+mhfHz37TkVPBC+0WGW73NtDlFr4Rm6UN3qjKrM7TZbKcLK5AJswO3x5y3+7pJs
         UuDewCNWL6ljJd5jN7Q1woDlNFTRWmfXGXOQPFXkvgOOp5paQCeUFTal+QG+aW3oiMVk
         01xv4002NDvVU/5xQEZEYD1SWnonnfOCBuf7i5A7KIDt8UHuFiOefbJmyiKDQqWqdlBx
         dIONkWmhr0v9Kmf5ZM0IN1B+XG0BF4apKjP9xXUwlmuFFI2jw2S8de0yw5D0I7C6WJ24
         6kBA==
X-Gm-Message-State: AOJu0YwMyR0hzAaiVReZ2hMMVCK6CGkMPqYtrD8noZmaMgelQfQ4unOq
	oqnyQJmjXmEYbpIMWyHAFoHw3F5nR4/Rs+LSYxi7Go6/FTOah8A8cvSadq8KWD8W1RzcM97HHv4
	9Se8e9As=
X-Gm-Gg: AR+sD12J19g8D5Pn63ERrhym8OddFciwP5cmssLFAHGVw48LX6Cuya9bvqT0PKaPCpE
	MN9vIs81FjejBcxCslXSFUT2qdCJfaUsW3vtYd8+3Re5/DO/LzYqkrKKCKN/j4SEe03g4WDNdr8
	teWNu1Pbb0Y/JPpbOk/xIBjzrUvdc2eJ97mUUALOvt7Jig++oxgQEK7dAzC9YMrHMJciRkgjeB3
	0DKPcrvhazRZR+Sm0BU1ar1h4+Rt1Mtu9B8nVd+kmAjEjBDQuTqhZnJ7A5n9eFJR0m2yjuQriKM
	62MzAOoGSKJ/MGnbD9Ou946QEhUIltc4H8PW1DEdJEYlX7lgMHXxS+uLD7dw0Z9/BdLbTZDe/aM
	SGL3DdtDWTpxAnxYsLE2lAwWGgZm15GBZr96QPOtHVY7Tn/yo1MhXM+nJpSueZjs7nla1qApYRZ
	TvWZisC6U4piDnGhtwSumQ9npK42yW9XAwv2/Egcgq/HkvXZ+soDZHHQJDspACDrRgLjRtsvb30
	fin0oQrsytorjRLnA==
X-Received: by 2002:a05:600c:628d:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-4980c64b868mr128670325e9.9.1785666553055;
        Sun, 02 Aug 2026 03:29:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/25] linux-yocto-fitimage: Set UBOOT_ARCH
Date: Sun,  2 Aug 2026 11:28:42 +0100
Message-ID: <20260802102854.3952760-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242538

The tests that use this recipe need access to the UBOOT_ARCH variable
from the recipe for testing purposes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-fitimage.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
index 75dbcb2af5c..1f95b9064e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-fitimage.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-with-L
 
 inherit linux-kernel-base kernel-fit-image
 
+UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
+
 # Set the version of this recipe to the version of the included kernel
 # (without taking the long way around via PV)
 PKGV = "${@oe.kernel.get_version_file("${STAGING_KERNEL_BUILDDIR}")}"

