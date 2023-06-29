Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162A0EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 14:03:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.9026.1688047384759228938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 07:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SDpr1I25;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so1102725e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688047383; x=1690639383;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Iz4dhQxVnyyVxhn2OiXrUARvc4sdts4IR/94ixG1hg=;
        b=SDpr1I25QY5zNEhPCdDdhgRjp7ms7pH8GzI/983XcMxu0so6WXnI4ttIMv1pT5gg3+
         QL6hVj5Ygayu66+eexKeZpce9jmxKnICSgocEcvWwtHNwKP8v2e8cp3k+es+Ne4T4Ha6
         tu41TL/Dnobo4TGuhvD805rurU7lNeIqowolJ/1xxsKnxtsai2t5pv236/1m7nNX4qUw
         BlzSLUg/2lHlXSJYQ2BcpHnHAJY2fzCmyKZBlLE64UAZdqE7fjkBFjtm0r5eegZ57YE6
         kkbDIy9BBv90duCexWIOu76pFfESPtkaIN32f7GmfHwzVkk2/iWjqh1qUW7oWWu1rp1n
         kakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688047383; x=1690639383;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Iz4dhQxVnyyVxhn2OiXrUARvc4sdts4IR/94ixG1hg=;
        b=bqbfkBN/t6yXhZuT5SnS6eddKq86uK6nVw0lZYe0k/+oAByzVIT4+62BOXv2puIOYW
         FohgEBdYa7uxN5WbKMp4f9wFgt8ffcOQYIBbNO2CVtQEorNpwU6WoTpszmPivfm5Qa2E
         8hukcAU+7NlfCAcdK8t/fHalztqqwf0/rTrmRUS5wNT25007+G8lXm4/nSxBBFvXews4
         DlFaKbsRfhHLwzsmTtqDdGY27T40wmU+urVgPCXsi/LVazNXSztQyKUpHOQUlkoef4XK
         C1GU0QDW4+sl9WabTSKY8XqOdbdfb576J7CxpLVbb3SS+yJBjVaPYNKCOiaYMeHV0xv3
         kQew==
X-Gm-Message-State: AC+VfDyHcFVogqCWchz3b/QYG+1DuP2GwzE3nHzTvycdPpXUVo3vjBjl
	FomTlsFwKZzIGg3TqFGO9tM/IxnFJqPNvF7T
X-Google-Smtp-Source: ACHHUZ68pJ9jat+YkJqZJB/GAp5wRo54g5s1dxQecuN0LdTMns74bofdwBGSufU4Utp2Sh1DMaBQww==
X-Received: by 2002:a05:6512:2348:b0:4fb:897e:21cc with SMTP id p8-20020a056512234800b004fb897e21ccmr6399338lfu.67.1688047382601;
        Thu, 29 Jun 2023 07:03:02 -0700 (PDT)
Received: from t460s-2.int.vlab3.dyndns.org (213-225-15-104.nat.highway.a1.net. [213.225.15.104])
        by smtp.gmail.com with ESMTPSA id s19-20020a056402165300b0051d9df5dd2fsm3653970edx.72.2023.06.29.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:03:02 -0700 (PDT)
From: Robert Berger <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Subject: [meta-oe][PATCH] uninative-tarball.xz - reproducibility fix
Date: Thu, 29 Jun 2023 16:02:58 +0200
Message-Id: <20230629140258.5635-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 14:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183628

added --clamp-mtime --mtime to the tar command

see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15148

Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b23ea26d40..c804e7520a 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -86,7 +86,7 @@ python () {
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDK_ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} ${SDKTAROPTS_ADDON} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
@@ -286,6 +286,7 @@ python check_sdk_sysroots() {
 }
 
 SDKTAROPTS = "--owner=root --group=root"
+SDKTAROPTS_ADDON ?= "--clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
 
 fakeroot archive_sdk() {
 	# Package it up
-- 
2.17.1


