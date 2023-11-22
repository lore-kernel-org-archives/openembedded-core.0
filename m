Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CA4C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.18441.1700657119063693908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fr6KZw+Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a049d19b63bso71219266b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657117; x=1701261917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkkoPa4gtIEmYq10V2lKRB2HlrHMrPXdzDg3ZWqT1H8=;
        b=Fr6KZw+Q0x0J55msNPwqYPXN4JITMMmJHeebgDm7VhgrLOducucgWSV6lgH1ZQtHB1
         xlHPzKCrtt9k8l6/Y1pegZPwEWAlGxdovX/qlchnzgrUs7DI5Syyi0X1JN3hLDGbP95I
         uiCsquhDY1FdaKQcbk3NlORcVrjOdW5X/CIzr9fS9n7yE7PDHm8qvKnUiQvmWOiKS5er
         2wRQKDBCnXt/HEFRXCuAaqz9590brS6KP0rt6ve0TpwKFbP1mGBI9Oljl/BNZxmdgFRS
         4EEZfZ3Dc6RE9NZnBMcPOudvLKFjKNN0lq2R9UWhtbtHpJ0qRZjptmoyDT1EhNzCTuJT
         LobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657117; x=1701261917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkkoPa4gtIEmYq10V2lKRB2HlrHMrPXdzDg3ZWqT1H8=;
        b=h55xqT+LaPhtl8mAm3iYm9tDmMkNiAcB/W37GMN0STYSBtf5DGce18IRxuHhENud6I
         wZ/LEgrQjkQStJFbBSXXDUJCMdoduZurdeZey7opoDemq8BA4hEYf+NFRCWYzwXGGijW
         xY/WkNctFlj0l8MF+YvY482iIiF2ImuLpGChkTT77QfJNGTgCZkFkUZHT9y7wo2K6syS
         MlkbcnQSRUjzQnUPA5xx1FdpXlQiG1w/x0mPn6rb/adNYDqmVjJSgoFxif+UQ8Qm+FUa
         VGBjdISxEO0zk5yVC99oBxAxG7Cq/QW0hZVfRRDdbvelSAsc8h8ql4x0wexOgKYcEznn
         oAGg==
X-Gm-Message-State: AOJu0YxmJqidNzcW8qHhFFN6DtlUS80A/VvOtYcZrh/CQVjrT7sARkT+
	BOe+Q6rFZ5sGmXWOzCnlZZijHxYFQTE=
X-Google-Smtp-Source: AGHT+IFujJK+wPQL/e87GCoIcejk9EnweQYbkWRq4w2Rjahd+rHf6YEZYXrDig8BQN5RsXNX+zOX2w==
X-Received: by 2002:a17:907:1a54:b0:9bf:889e:32a4 with SMTP id mf20-20020a1709071a5400b009bf889e32a4mr1354987ejc.54.1700657117341;
        Wed, 22 Nov 2023 04:45:17 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cd17-20020a170906b35100b009b2ba067b37sm6508703ejb.202.2023.11.22.04.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/21] linux-dummy: add do_deploy_links task
Date: Wed, 22 Nov 2023 13:44:42 +0100
Message-ID: <bd41dbdb2d9c98ca221097724f86f92dc4bde568.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191089

* fixes containerimage.ContainerImageTests.test_expected_files oeqa test failing with:

  Initialising tasks...ERROR: Task do_build in
  /OE/build/poky/build-st/meta-selftest/recipes-test/container-image/container-test-image.bb
  depends upon non-existent task do_deploy_links in
  /OE/build/poky/meta/recipes-kernel/linux/linux-dummy.bb

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 2396f46202..47a0d5e9da 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -60,7 +60,12 @@ do_deploy() {
 	:
 }
 
+do_deploy_links() {
+	:
+}
+
 addtask bundle_initramfs after do_install before do_deploy
 addtask deploy after do_install
+addtask deploy_links after do_deploy
 addtask shared_workdir after do_compile before do_install
 addtask compile_kernelmodules
-- 
2.43.0


