Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D96C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 13:03:12 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.12953.1654779786709070478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 06:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AHYVOqHh;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id s12so40129894ejx.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NL43bjS8g3m7hy68p07sA6F9BnwhYHRXLusGClP2arY=;
        b=AHYVOqHhK0jF5Fb0qmQSTtl0VRotcHpfWQQvmi9EGUhU/ry57FnVupGo6pf/hYjpH4
         2ftCaKkN3BzdVWt/qD7O8IjxlgzwffP5eEF4ernElUIC0Q/bvcsZzU7fUVlpKj/12B67
         Cp2Y3kUBBf4savAbFqn2CgEQpLzX0sKrt8unuD9Je2UuB7xm8Q1PDwqyObj8WaNGoJ7J
         NMV3qJliI1YV4CAsYOty2QKL+jFOB9zdf4xGASc6W67iqWhulbJ6teniU5jnRrGrz6IO
         0meA4JDpUXGmBHP/aJqPNyGgghqInO2B45O3eV1iVcn566spXjzUHph42rDHK2Pd32hn
         GyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NL43bjS8g3m7hy68p07sA6F9BnwhYHRXLusGClP2arY=;
        b=E+0q5w6QxVIhPXkx+mAQm6O7Zb/n1FGzDCvR65XE3XFwZwHPXz4E7LLY2stcMMaTY9
         MN5ZU+MbdRTqLHUPaB4jlY9pHPfKkKQtoCh80A0aE5OXALaBZTXvaNwSrAjR6OksbVbc
         eoJJoFtTSc7qHAXf+PSsdHmqYnxshwb+8iUdGd2Hq668e4Esx0GNkcEscZiaPL305qzA
         I4MnE+jAZvoVqkCYUFU5jmg/xSwpcqDpSQj38N6RJS1W0KW2CXScRujAnT9SH4p65Ti+
         wENKgC8LoWqvtB4yJLfy1M1se8851v4GlbXNz9I3fipOqW83ld4Ql0uZaVpQmE2QIBdo
         XzGQ==
X-Gm-Message-State: AOAM531tSlH1lhyHm3+J7YfWdsZMvRx9uLuoRpmyKTY9AZUTXbPsdGZg
	RFkjlIZBAQPDl20L3MPUh2RBNVWR41s=
X-Google-Smtp-Source: 
 ABdhPJxZuEznF/xCnu8dJmn0qxc8QMbu7wMMbJUEQORGJPKXiItLk3A3CwmA1by7R5tb/YXULG6VFQ==
X-Received: by 2002:a17:907:d24:b0:712:1142:88c7 with SMTP id
 gn36-20020a1709070d2400b00712114288c7mr1178090ejc.435.1654779783845;
        Thu, 09 Jun 2022 06:03:03 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 n24-20020a1709062bd800b006fee28d459csm10893953ejg.224.2022.06.09.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:03:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] systemd: Fix build without utmp
Date: Thu,  9 Jun 2022 15:02:58 +0200
Message-Id: <20220609130258.3316501-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 13:03:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166778

* backport the fix for regression in v251.2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_251.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index 80f80849d0..8370bec0ca 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-shared-utmp-wtmp-fix-build-without-utmp.patch \
            "
 
 # patches needed by musl
-- 
2.35.1


