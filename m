Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C705CC55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:46:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3120.1785491184815370015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NMJd1Ibg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f904e80eeso692936f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785491183; x=1786095983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ciJDkQjAduOI7dPC/gCUobfT0mPfJTL8ADteZk23Qig=;
        b=NMJd1IbgWnQedys35Zr5Yu52Nho8mYTDcaydpMXQqCyYQbCBjlpJ8VQrguNeUx+2gU
         cevhDyaouhvDJJVjJ7wyR3LYZl1sYFsti/5/p8nodE8qlrWb8CVpU9WlXd97m/2GhcA8
         u4iTxa5ZSch7K4Wh9IKRVMdjU9fPHNX/PTO4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785491183; x=1786095983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ciJDkQjAduOI7dPC/gCUobfT0mPfJTL8ADteZk23Qig=;
        b=QTPdt+J8B2gZIVrkSAJ2/zwpB8KbUCMXxMYXENFdMNTAfHUtn9I11SGLhB/aqCfpNr
         3I9ob7jqeYVgjN/vIeqJsbDpOrIDpWn1u0rEw8kqg0vJR6NolTnCMqUeC7lsftkhHKja
         Bnxj7/TYDOHwj1LBbg5/Gg0/H1vguRSDzDFK9IZAxN8r3G+Wgw4l7oVTxFDy2BvmFxXP
         hY3SDEGWOwsUk3qwdp/7sbPo0sDC1jWig8ljOcxBXjwWO/3+Fgg3NBUpk9Qo4lhSSIzx
         Lsh8BuLPJ4gYe0rcyKB0cnD1mnMOFulD6r0SaNShw6w2G0cTFX04ZEJd1u2edq/FfOQ6
         6qHw==
X-Gm-Message-State: AOJu0YwALjTRbq3GfMPg3JteA9pKTQaMQcT4LgrAAmq9NZTlwXgZgCSt
	X9BC6Rp843vNjjAsv7DhpUt3xfzzIAHqAvNr7kDt454EDD+EuLMWD1hmhchekWz8n4E78C1CDO+
	elth3AZk=
X-Gm-Gg: AR+sD10i+68VmGKRcyIEcM/Y+wDPbODmk9On9xZAdLNYb5ikyRVjbUpg8lkg2XN40kf
	5u3Lh1P6yDaBshTZXxEg9aF6rqfJ6fb2K0FUPCFSBlJFbXuh8qV4AdK/sLK3hOLYGZhBXk8+A+G
	naprN/WrroDM8OOM5SFmaLeqzMHxiUDjgLPFZAdo7cl805af90vMiBKBDE+n2a+ic+TxLsKUFV8
	exk0TJ9AV0ULClp0wUfnXiLqnvzYEPtexSegsiWPVz80qekMYyfmeO5R6uUPM8/X2MB8cBzExWL
	CarszmW1ybrfdWJeQOiPtoeG3zrICJhNKTXhLwocdwGezQkit9nQwdGScexlO7QMl0Pa0xGoZSm
	gEUURhjq9gAbgNpo5xIBlbl5FOTJ4es9J9mlAqywXJ/hYbMRi+20snNsySAPCP5OeQTCrNElra5
	qSTbISUWUNh/4ZMmJlqw2ddGq8lG5hxeJ9UFBvg7khZWkRwUhwJQrIrRlIrI9fVWgUSkjln2J3o
	+H+hQy8QXlnZMJvFA==
X-Received: by 2002:a05:6000:4808:b0:47e:9f03:e542 with SMTP id ffacd0b85a97d-47fd2b679d9mr3211482f8f.45.1785491182889;
        Fri, 31 Jul 2026 02:46:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7f7b:46f5:a0f7:875c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm2601431f8f.34.2026.07.31.02.46.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:46:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/sstatetests: Work around the removal of i686 uninative
Date: Fri, 31 Jul 2026 10:46:20 +0100
Message-ID: <20260731094620.609767-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242418

Uninative 5.2 is the first version with no i686 support. The tests comparing different
kinds of sstate are still useful and we really want uninative in those tests too, so
work around the issue by having i686 refer to the last release for the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 02fd45fe0d9..5da8caf1c39 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -375,6 +375,9 @@ TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 BUILD_ARCH = "i686"
 BUILD_OS = "linux"
 SDKMACHINE = "%s"
+# We dropped i686 build host support but the test is still useful, work around it
+UNINATIVE_VERSION:forcevariable = "5.1"
+UNINATIVE_CHECKSUM[i686] = "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """ % sdkmachine)

