Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AABD597B7
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 23:49:11 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.101679.1731455345989217422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 15:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jHXecEXW;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: awais.belal@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so8953189a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 15:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731455344; x=1732060144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAKR51bp5fRq1Kyl7vm1B79lNHQTt/VuiJqnfiVmn2w=;
        b=jHXecEXWnGQ+OIoLNLPdtkIzuDNPzqSWGWhRcS73AtRYz0Bcj6HNtG3aYc07mdOPZ8
         km4tcS2O6eqyLzGYnUl7jUUQpmrTESITU5Mhgf7a+Fb1z4MWbJvjMfarvd6VteTmSPCJ
         6cJ91ECaPVI1Kt8YN8wThcR7cSo89jZD5fDZR5jM6DQswWqnvf73Hscho93Po9066SsB
         PY7iu652fQUL8F140MEGupaZq4YsVrQLXc3U+Ns7DnEzL7Mlrc5d3bL1QRwx/Ebm6wpO
         aFANdUdD5wIXnA8VMVCiiKKtIbwX2TxWZEUz/pE/G4SJ/4wUGsI0vXx3CS8jKz8u4rOp
         NTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731455344; x=1732060144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAKR51bp5fRq1Kyl7vm1B79lNHQTt/VuiJqnfiVmn2w=;
        b=cLXSxdXqWFdMFJl8aHnVvHMNqRYVy4ap096kPPxmNLyUIy4jjt2u9NCFSfurBh1QHQ
         lq0yIOe02lbczl1KeK1rYzd8CgYMWM+CoXUCGaqDx8dpxNLkljDS10297QbM4mOkwfJX
         VERZVukvKIhxYM5DqUerbs8rPjlJ2yF5g4jn36idi+itN1XmMJLIDeQBcJ+alZw3lbjJ
         b1kchszjDuudGqnSkweazM57K/Yr1MvtZUiuOPBsQYe7sagZctct0acQFDKCUkeAqR+g
         AP7kBRLIzdSttGD37nlMGykuE/Ix4aBXB1Fc2eIOK5WSaENLy0JBB3Y9N3ek4X96LKGu
         M3gg==
X-Gm-Message-State: AOJu0YyA+NghNU+nE1O8CeL5MIANc1Ja+dqJkPiUwy1nklgoi26ww+zs
	T+PqEAgN9hVBzZ+LNni/PqHrrythzsoWx3QM1oY6dEFqcC5StHOr6uCoGikd
X-Google-Smtp-Source: AGHT+IGPtDyb7n0TDIccRfmq7dSwBQy1J1ZQ/LEpUG9EiD36FBFsY+zatCLyzdZM3N1iXieiuni5nQ==
X-Received: by 2002:a05:6402:5215:b0:5cf:255e:15a9 with SMTP id 4fb4d7f45d1cf-5cf255e1878mr10834227a12.27.1731455343627;
        Tue, 12 Nov 2024 15:49:03 -0800 (PST)
Received: from elitebook.. (ec2-176-34-88-141.eu-west-1.compute.amazonaws.com. [176.34.88.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf08ca5bdesm5770935a12.11.2024.11.12.15.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:49:02 -0800 (PST)
From: Awais B <awais.belal@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Awais B <awais.belal@gmail.com>
Subject: [PATCH] quilt: fix dependency on ptest-runner
Date: Wed, 13 Nov 2024 04:48:56 +0500
Message-Id: <20241112234856.2780842-1-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 23:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207071

Specifically when using useradd-staticids this fails without
creating a ptest user entry.

ERROR: Nothing PROVIDES 'ptest-runner' ptest-runner was skipped: Recipe ptest-runner, package ptest-runner: system username "ptest" does not have a static ID defined. Add ptest to one of these files: .../passwd
...
...
Missing or unbuildable dependency chain was: ['my-image-sdk', 'packagegroup-core-sdk', 'quilt', 'ptest-runner']

This is seen when ptest is not even enabled. We fix this by
making a conditional dependency on the ptest-runner.

Signed-off-by: Awais B <awais.belal@gmail.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 19aeae510d..4bae5c6c19 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -61,7 +61,7 @@ do_install:append:class-native () {
 
 # The tests need to run as a non-root user, so pull in the ptest user
 DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS += "ptest-runner"
+PACKAGE_WRITE_DEPS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '', d)}"
 
 do_install_ptest() {
 	install ${UNPACKDIR}/test.sh ${D}${PTEST_PATH}
-- 
2.34.1


