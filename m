Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72C7EE49AF
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:45 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5237.1692732225254799920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Zi9DIadB;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-98377c5d53eso614479166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732223; x=1693337023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=Zi9DIadBEDINUwOo0Wfyhkr7KtPBc9mqBapUmBT3TpjH8sNuIkxz66yyPGav4M+Ga3
         DKw7leTG9SINJHOe922MpPbugCn12X0Ui3NhEBC4YzaObEknkXeh/aYLbbwk5YPVkeag
         OdVv/4LkS97465HWBfWS4ucBfMNQ6GIJBwy9EJR7MmRiwC8IlktAtNNxKA5d/TYlgJm7
         BtHhZUjIOk/Oj3yQq3sZO8QtW4ZyT3wVibBaPGRUsdE8DxZKpY0fNcStku7oGWxsq22X
         zdt2xj+ZVnKQ64AoU7lbDYHwN26IS3ppbQYbvRPcGzo/QYhm96yAjhOAZwg4I1mbc93W
         CxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732223; x=1693337023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=jDNGrrCUk85+xQwU0hD7efixYXNuQK0Xjb3ZUoCL30h158b5oZLyLgadjcCMobWLJL
         R2WmwU/DjIlqEEhHrjkriRpuccbHtx6KL40puSoXqkcRve0E2lT6H6Pp7wGBCh39FnVV
         tX8CbtUFg5wDM5xPfsjK04/EitFFgNFcy4YLblFJUB9tKeb3qUPwAjapGQ3Z2O0nSyh1
         jLZk33EPbLgEh3nYbNXMaqoICiaIhzjnI5eSmTSRPyH+xfc44xwOFcNIoXIFVxQs9uB8
         JKJih9gjdBjOyN4vSLA3MjKjDm6fpD0iNKGq10T/bHGbEU23PwxedMdslWpifBpIHT83
         3CWw==
X-Gm-Message-State: AOJu0YwGduuNUaGPZx/UO/qRU/M2gzZxY7I4aUbgtWgJ+YI7w7enTA8B
	qmX3C3SyEAidsFRUs0bL0i113DB+0AE=
X-Google-Smtp-Source: AGHT+IGQzpQGkAza0iLhTD8LfPEeEa7v2ihM3rvtCN3jWPcXrgTZ1Nx5NMqAY1iD1e8eamA0639VCw==
X-Received: by 2002:a17:906:5354:b0:99c:5623:a8fb with SMTP id j20-20020a170906535400b0099c5623a8fbmr7698996ejo.18.1692732223463;
        Tue, 22 Aug 2023 12:23:43 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 07/13] cmake-example: workaround for pseudo breakeage
Date: Tue, 22 Aug 2023 21:20:13 +0200
Message-ID: <20230822192300.3235896-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186530

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/cmake-example.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-selftest/recipes-test/cpp/cmake-example.bb b/meta-selftest/recipes-test/cpp/cmake-example.bb
index 96d543180b4..fbf1f266721 100644
--- a/meta-selftest/recipes-test/cpp/cmake-example.bb
+++ b/meta-selftest/recipes-test/cpp/cmake-example.bb
@@ -15,3 +15,9 @@ SRC_URI += "\
 "
 
 FILES:${PN}-ptest += "${bindir}/test-cmake-example"
+
+# This is a workaround for packages with sources in-tree
+# Without this bitbake ... does not work after running the install script.
+# newenv['PSEUDO_IGNORE_PATHS'] = newenv['PSEUDO_IGNORE_PATHS'] + ""
+# path mismatch [3 links]: ino 37529096 db '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/tmp/work/cortexa57-poky-linux/cmake-example/1.0-r0/package/usr/src/debug/cmake-example/1.0-r0/oe-local-files/cmake-example-lib.cpp' req '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/workspace/sources/cmake-example/oe-local-files/cmake-example-lib.cpp'.
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-- 
2.41.0


