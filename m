Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B921BC0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 09:49:22 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.15116.1689328156949807569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 02:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Tq2qLRDu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so2887498e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 02:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689328155; x=1691920155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IFcbue/6ttT/9EZRmK8Lowi0JllB0j7Inzd63fSeS8=;
        b=Tq2qLRDu47pL3M2JVyIhes4lvV24takE+jZ6U4Qm7slV9o0HH9oCiDr3uihebdL0mz
         kuvV1cTqP99R+TvX8Gmejcz6JnW20Bf+tgmdpBPmPDwNAYaWFPFpb9/awy3L29nCMAnC
         HaExUOq9PNLXSaU/Xlw0FGl+plrgdd9Ly9g4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689328155; x=1691920155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IFcbue/6ttT/9EZRmK8Lowi0JllB0j7Inzd63fSeS8=;
        b=DGNMHVB+Ya8Y17+bHYaJNguJrc1l1PSxXNBdbVdEUSl5djf9B9wVMCtXpGR21ysfP+
         ynC5ZuPu43UjbyOISW4OtjPylaUvqNwtCoYEoK/Vd+7NdoNNSgxzMFyqFrUxqbt/upUf
         m3NTkVIrCJJbrS8pDCcOmFBOKWYlQHiaVp4fzXDO/2R0fK4Mf+6M0il5ttbA7+1AOOef
         T62W980gKqbBVRrMIALQWy2GifIFLMjgyMsAwF6GuPcba7Pz4e7BcVpiQkVIRYEIDLgB
         02TKmaPC0q7v2shgWEWMjE75C+dQw/9usFrTIPt1YX3Z1VqRhn5L1JjwqvhrJavAORTE
         UwDQ==
X-Gm-Message-State: ABy/qLakws0sZ16yz7ioZG0zKUWaCderuChXsIjCRIx49zAKxtqCIwKb
	ZfhIpX57yzQgCFFETiaeKxUl6hHDrPk11E6GGHg=
X-Google-Smtp-Source: APBJJlEmEbTydst81At8KIfnplnlvw5xJRpYoyzyQaVDk0YXhrP0/ZJdzCx/7QlOZJWohL7xacJyXA==
X-Received: by 2002:ac2:5e6c:0:b0:4fb:79b5:5512 with SMTP id a12-20020ac25e6c000000b004fb79b55512mr2571228lfr.66.1689328154571;
        Fri, 14 Jul 2023 02:49:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4a22:c78b:23f:a93])
        by smtp.gmail.com with ESMTPSA id a23-20020a5d4577000000b0030ae53550f5sm10355973wrc.51.2023.07.14.02.49.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 02:49:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-testsuite: Fix ppc max cpu
Date: Fri, 14 Jul 2023 10:49:13 +0100
Message-Id: <20230714094913.63841-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 09:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184255

After this change in qemu:

https://gitlab.com/qemu-project/qemu/-/commit/c7e89de13224c1e6409152602ac760ac91f606b4

there is no 'max' cpu model on ppc. Drop it to clean up ppc gcc testsuite failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index f68fec58edc..4e7cec3009e 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -51,7 +51,7 @@ python check_prepare() {
         # enable all valid instructions, since the test suite itself does not
         # limit itself to the target cpu options.
         #   - valid for x86*, powerpc, arm, arm64
-        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "ppc", "arm", "aarch64"]:
+        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "arm", "aarch64"]:
             args += ["-cpu", "max"]
 
         sysroot = d.getVar("RECIPE_SYSROOT")
-- 
2.39.2


