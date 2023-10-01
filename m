Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D26E748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:01:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.62447.1696176060499889693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mod203RL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c737d61a00so30752985ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176059; x=1696780859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRajYGjwE/GRqc604e917epBaPuqlpCsFTEqAlqV3QU=;
        b=mod203RL0RpeD1beB+v2O6RiQAWMFFxC/jj0v12rTo++GKhCkQS+u3QHTiFt9uTQA8
         D/5X+Ye01rHSKcrlPJc4NNrIdvs9uf7ZjIq2y1CaobIrWVzv1qkC7Z9FUwlXeB+Dq1Q+
         thR2MdK/yZ2DJSp/QIY2/NZgPyhWO8NuKbHxlEzzvu4zz+cLFXl3y4lxFgjMUOP3YTQD
         hI8jt+qmhUDfosLcVeWufei+Xu0xjTsAFqFKLiQT9hiq0h5YyRgXyOoAl+ZTSWzrlkH3
         5KfCHCJrgLYJOP2nAvJP/NeVi7KUdq5cBV6+mtINzjhBaU+dJLJjDIbSRZoGO5TysmsY
         9Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176059; x=1696780859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRajYGjwE/GRqc604e917epBaPuqlpCsFTEqAlqV3QU=;
        b=G4LQhvkIZFJcdwJjrd753AXKL1pGjDbtf68U1mbFjvUz0SEkdvUbAojbP7BXbkPxO8
         5LL8vOOMLLed6hpufbiZ4ciufihdA/K9GiaiMovIPfWMDcL60k8XQWkgFeTzPZZPzmvg
         U8WtTbzM4taKaLjw11i79/lhbq9cwiaoQHY9ZoJui5xkaAULpoD/J3jJfgahcJk3uDT1
         QVFua8edt8TPzjnq7b3ZTyEO7uwLIPO+A7MzpwgWsjl9RGpCnSbTII3+mmMwBldeEsHf
         7yJPnTF8bg61NFeVQwAvmR2EYBdsAADPAbgBbL4NlYgH5O1/fNc1xuBN0L5hq4W1P3Uj
         HA7Q==
X-Gm-Message-State: AOJu0YzfxbZQOShHh8/+uCn5VvNaFvFzC3xxZXf1QyWEPrLWRjMJUhi+
	0lEP6+gxRJ9I9pv4rDBiBzMnFbHuKXsfJWh1iHA5Lg==
X-Google-Smtp-Source: AGHT+IHPnjH289af5lvqssyHGu6gXDHg26TDdd3d3HjZtXuC4s3li2MYVMn7Ynzzt41MTHBDlcSiWw==
X-Received: by 2002:a17:902:d918:b0:1c2:1068:1f4f with SMTP id c24-20020a170902d91800b001c210681f4fmr7932599plz.17.1696176059652;
        Sun, 01 Oct 2023 09:00:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/23] kernel.bbclass: Add force flag to rm calls
Date: Sun,  1 Oct 2023 06:00:09 -1000
Message-Id: <f4422831cce168d0b113fb47eebbb480d157cebb.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188511

From: Ryan Eatmon <reatmon@ti.com>

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add the
-f (force) flag to the call.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e669bf797b15d803e7d6a700e449bdc467a4bcc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3abd689794..31e4a683d1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -445,8 +445,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
 		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
-- 
2.34.1


