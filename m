Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D11C001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 14:12:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9284.1689603175893272921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 07:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LOqpMark;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso47788995e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689603174; x=1692195174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=duUcgncxAUNteN0Dn95zVouCGO1XmWMZrsHNhvQE3+c=;
        b=LOqpMarkcLK3284D11xZkuis3YU3oURWrNRY0Ozst7QpAnVszBZpcKeDF1FFfN0BG4
         yzwuj7lHjDfnU9zl5DDjCy3r8PF4ZSjBS6OfeKelgLXbGO5Wll0fFEcwZqMS5NQ1cFGM
         NCRsAJxjEmb1YcZwabiAnNu6mbwV0Ju873+yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689603174; x=1692195174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duUcgncxAUNteN0Dn95zVouCGO1XmWMZrsHNhvQE3+c=;
        b=aNtExHGezQImy7w9+1rWQJ8sG88jqzyzfDLDiQd8DiqII4afZBWRQcYIMKCAdOaWxp
         d0QwYADZTHIvqv2T9lBSmuvj4aDrBJmHL4Ukz/GW2ySt4bqQSsS/rBgjE6U8TeVVqxLE
         0vZUt5VmB8P6pcp9VEy/0Q906QQsvDysA2F8/WjESBw8ZYjl57R+O4f2B68ACViNKvJO
         dee4wVk8xnuCWC8n3XNbbaGOD5z5Ni+EXSQDriHrXA6/KjOUnuBAYaZu+ifX21WShDj+
         NSXuupzBlstuCI/dQBBHIryV64SoIjeN5xMSHG3uX/dzkiOfi3m+HBfEqjZufGKKIGfZ
         KSXw==
X-Gm-Message-State: ABy/qLYa4HTs7eEwp/cy0H5IqAThONisUWuFHB0jtgHikf6ZtB7rloXB
	Q6vESXyfr1SJ7QIvowYpF1h3ORqP0wlDcF4Uk8s=
X-Google-Smtp-Source: APBJJlHukALevo6nz/OXaCU1ybvvU6HNP/VtLpvgaTpb/GFQOnG0+2jH7fw/3u+xylrXdyf03AyyjA==
X-Received: by 2002:a7b:c451:0:b0:3fb:ef86:e2e with SMTP id l17-20020a7bc451000000b003fbef860e2emr10307580wmi.19.1689603173887;
        Mon, 17 Jul 2023 07:12:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6671:c2e1:78e1:cf2a])
        by smtp.gmail.com with ESMTPSA id w19-20020a1cf613000000b003fa96fe2bd9sm8002737wmc.22.2023.07.17.07.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 07:12:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gcc-testsuite: Fix ppc cpu specification
Date: Mon, 17 Jul 2023 15:12:52 +0100
Message-Id: <20230717141252.432997-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 14:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184469

After this change in qemu:

https://gitlab.com/qemu-project/qemu/-/commit/c7e89de13224c1e6409152602ac760ac91f606b4

there is no 'max' cpu model on ppc. Drop it to clean up ppc gcc testsuite failures.

In order for this to work we do need to pull in the alternative cpu option from
QEMU_EXTRAOPTIONS on powerpc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index f68fec58edc..64f60c730fe 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -51,9 +51,10 @@ python check_prepare() {
         # enable all valid instructions, since the test suite itself does not
         # limit itself to the target cpu options.
         #   - valid for x86*, powerpc, arm, arm64
-        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "ppc", "arm", "aarch64"]:
+        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "arm", "aarch64"]:
             args += ["-cpu", "max"]
-
+        elif qemu_binary.lstrip("qemu-") in ["ppc"]:
+            args += d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')).split()
         sysroot = d.getVar("RECIPE_SYSROOT")
         args += ["-L", sysroot]
         # lib paths are static here instead of using $libdir since this is used by a -cross recipe
-- 
2.39.2


