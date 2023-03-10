Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B67EC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 12:33:09 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.17859.1678451579636276168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 04:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cO+lOEJB;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id ec29so19779973edb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 04:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678451578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJUK24ZGJhhk19ZZDmJd/MGNT/fvbrpLVFNsXwp5AII=;
        b=cO+lOEJBuH6MA57XldVkm7r/EzkRxu/GFfnv8roDNslc8Z0R3FzkquAoNqRr0gDu33
         PCdAlR0WVrqwbYTov5G6zlpj/H33+N/yeAUj5B4fvMh4SpA37OTHIytRDYEP2vT/wqeJ
         vQ42bxSv2CsjUfdhTnvT/B/AOMRKVr4JDx/YEgODBR8h3/OKaDf4HPALZWry6r1Sbr59
         vg8VMuGwwcwNFsp5eWGWij2hThbAgu2IPAP1gZv4PqVyilDBhIxPbW38dSnNrrJyL2zI
         Xb4K5xpAfNAwJC+JF3LR7aC7L6M6gPu12p1iFy7IkV0zRtTuPko3dq3x7sW6gTC53/nX
         rHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678451578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJUK24ZGJhhk19ZZDmJd/MGNT/fvbrpLVFNsXwp5AII=;
        b=QlL9lInhvN7Tii9fM1Hy0uWyjdbTR6bdYoMWrmeoHJ22Ae45WlvyNNqOj/BuOvtOzx
         oMabV4hMd6FkJLueEH2WUGKGoru4E9yDXhFkt3a1jfEjfikFslpDABd1V76q0Wqmtae5
         IERGkYAhgu/jX7t04pQDges2oTlWhkwifijDpe9kbJGTZ6CwmSa3CIQAxz1e/x7ezsCr
         IHeG8S8FZDlqDCRkNeyccCuyfmf4QjuXdtZarzv2+CsAuC3oJbhAnKKtRdKrlil7KaM3
         sD1dstZxdNAfphvwulOlzjCet6agCrQkPDErzXw3BCjscERohRE17/wxmuYEHOOCTzc5
         WhXA==
X-Gm-Message-State: AO0yUKXJwxXUyjNkzc37n4s7d6iTIgLGssDsoNsWhIQS/u37zEnc0ftS
	NPx7CiRk1x2OKyNg87H0h/RQtdU6hec=
X-Google-Smtp-Source: AK7set+Fst1iSBw/DRyM7Dru06oZtJrxYRbq+UL+ZGbKNillcKLARg4uLp4uhU4w2WjNo92wLzxJ5w==
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id sd15-20020a1709076e0f00b00907672b736amr31042000ejc.31.1678451577730;
        Fri, 10 Mar 2023 04:32:57 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id s27-20020a50ab1b000000b004c13fe8fabfsm768310edc.84.2023.03.10.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 04:32:57 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] pypi.bbclass: Set SRC_URI downloadfilename with an optional prefix
Date: Fri, 10 Mar 2023 13:32:54 +0100
Message-Id: <20230310123254.2744497-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CANNYZj9qRTsH5mJK-h+aXJofM+eEoL3Q=nRxFB9LUzrLWNxvGw@mail.gmail.com>
References: <CANNYZj9qRTsH5mJK-h+aXJofM+eEoL3Q=nRxFB9LUzrLWNxvGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 12:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178329

This allows avoiding clashes between source archives of a main
project and a pypi project using the same name and version.

The new optional setting is PYPI_ARCHIVE_NAME_PREFIX which is empty
by default so previous downloads can be used. Example usage:

PYPI_ARCHIVE_NAME_PREFIX = "pypi-"

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/pypi.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index aab04c638f..f510bfed06 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -15,11 +15,13 @@ def pypi_package(d):
 PYPI_PACKAGE ?= "${@pypi_package(d)}"
 PYPI_PACKAGE_EXT ?= "tar.gz"
 PYPI_ARCHIVE_NAME ?= "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
+PYPI_ARCHIVE_NAME_PREFIX ?= ""
 
 def pypi_src_uri(d):
     package = d.getVar('PYPI_PACKAGE')
     archive_name = d.getVar('PYPI_ARCHIVE_NAME')
-    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s' % (package[0], package, archive_name)
+    archive_downloadname = d.getVar('PYPI_ARCHIVE_NAME_PREFIX') + archive_name
+    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s;downloadfilename=%s' % (package[0], package, archive_name, archive_downloadname)
 
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
-- 
2.39.2


