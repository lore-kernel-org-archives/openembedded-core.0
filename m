Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0685C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 10:56:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.5776.1684925798738794699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 03:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WXZjU1Cj;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-970028cfb6cso135830666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 03:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684925797; x=1687517797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BihTiFJ0w8xkvGizPn+Yo4CNgKxSC617GmZtgUeCvFE=;
        b=WXZjU1CjandQghbzv22BeG7Q+o0DiH+0yVQd79WbEef5BhEj7c6Kq+iPeabbsVIaXR
         sJGOBl4SVFhrwYg6iVAv68VbjqV5hkmcKcKwumSiqmLqmyDfezneT1Jj6L/RxQVQ9JG7
         uNCxIErcHlX5Gto/zeRs7goPh4Q/DJEqso8TEgwv/zuUAuNp1RHtLuiVXo8DxO1V5Cdt
         0o6gFQWgK0Zcza3I9PxMIJtq3V3kKSuPVXDGWidnTS134pDmHEgkg7hP4i9gpi4+dISV
         W9I+CxWKFUHtvJQaJYpk3vjhyoBhxmzezROrmio7R5oLaWSDzbd8Lqd1AqjyVxnckQJx
         CVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684925797; x=1687517797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BihTiFJ0w8xkvGizPn+Yo4CNgKxSC617GmZtgUeCvFE=;
        b=hkauXQ5mYK/kmC++vxOViOjylTYHN8doWwS2SAKncm7RVqFyz78bpcHL0DZrA+q2lI
         EVKpYtv8qmZxhMgsmQWTCCR3NBg+tVZHymRj4N7/GoI4SUYxramLH31/LgIUhFYE/gr+
         6RD80LdqxRSRvlysZFgBVslFEyUVmbV4A1R2b7WzGl00LkY+DXDsZfOEgfDEF4fk4/p7
         FdH/YqKq0u7bNur2RqDQRaQnh/Vg9ewwBGW9PkGRG7biQwWkGDAAfiqnfpsQ/w4FvFG/
         19xMjOe5QAtm1suLcalWq9oKMUDaMIt2xcp2wHNgDHc3gEpwU15WpPIVq5NGf1VVaeOP
         iZaw==
X-Gm-Message-State: AC+VfDxH6CcWSTyoTVxFyktBIZXfejQdU8MIwBMZUMotqWDbXv7ZaPpR
	5sjJ7Z77ofgxEsx1kk/4oSqiIwW3H+M=
X-Google-Smtp-Source: ACHHUZ6hwrUWDp6GJi8pREVpK3O+Hi29Q4eZNJACfviX3cG6kaNiQThecUlNP+xnkZeQcCPy+47yMQ==
X-Received: by 2002:a17:907:724d:b0:94f:1c90:cb70 with SMTP id ds13-20020a170907724d00b0094f1c90cb70mr17081528ejc.66.1684925797028;
        Wed, 24 May 2023 03:56:37 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jl15-20020a17090775cf00b0095844605bb8sm5646296ejc.10.2023.05.24.03.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 03:56:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] cpio: respect MLPREFIX for PACKAGE_WRITE_DEPS
Date: Wed, 24 May 2023 12:56:31 +0200
Message-Id: <20230524105631.517832-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 10:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181669

* unlike DEPENDS/RDEPENDS the PACKAGE_WRITE_DEPS dependency isn't automatically
  extended with MLPREFIX, causing lib32-cpio to depend on 64bit ptest-runner (and
  all its deps)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.14.bb
index e55fb70cb1..d6473dc08d 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -66,7 +66,7 @@ do_install_ptest_base:append() {
 
 # The tests need to run as a non-root user, so pull in the ptest user
 DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS += "ptest-runner"
+PACKAGE_WRITE_DEPS += "${MLPREFIX}ptest-runner"
 
 RDEPENDS:${PN}-ptest += "ptest-runner"
 
-- 
2.40.1


