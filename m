Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC30C001DB
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 19:15:52 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.2983.1691090145501911442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 12:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NYCUTISo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bbf8cb61aeso9437565ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691090144; x=1691694944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rqAqxvT30m30BumAa8xX92chKcCf4p90SPurCkNl7mA=;
        b=NYCUTISoN9S904NxdJRXSP4RGO76Gro8bF4kogVvIwiHwKPPCgy+qn60pExw2ykRin
         bn1mJb5PaNR8EKFR2NsHWe6v81Xj8D8qqMNXXJVDALg4VGX+Kt97+YRqvRnQBJUt4Gce
         JhPfAZ3YvUvxjOKT/nIW400aPPWvkPLlgeYHvHZCzWAi8tW9sSobPGfvt7ZdofG4i2qg
         k3HKPyUh9Jg/aBZ9X9faG7UNqtzICcfd9ZvvynFXdkPteQQ6/wFnpJmyZLqXo4Gw+1Kl
         Xj4dv20lwFpTpPKkk/SeuBSsK1q5aB5l6kdOAjlBnaYTyxFBHewYKK11iDRyrlIzdCYS
         JPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691090144; x=1691694944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqAqxvT30m30BumAa8xX92chKcCf4p90SPurCkNl7mA=;
        b=btHQYluiYldhZ3AuSnRaLI0dKYyhFOJYVj56BwI6ZI7JWgVL61OKN0GgmZCSz1Rey+
         eb/A+5ganflvChGkQLisOUKuaf8FPY+RDiOaNcQuNzHLnPLZEcNXD/yWz/mMD1HaTi2I
         C+vZQsYDxvml41+wa2okqF3oZxTMZ3+v5rzFc5slxW1zpZSBeEWIKEu36837Z6DpOAky
         081kMHnVkbyP1V83iCHUMu7O6ctkV4Giz4GnWqIcfsy94qUfkPM76h3Wgko2rbs41oDu
         J0KzAq6c8laMyDlUVEabo8sj3fKKeEUHKYqqfXCIO+w2e5NNMjV852iEBsrwuf3LDLWT
         ge+A==
X-Gm-Message-State: ABy/qLZNAkpaVUwmt4AcVsJn48D3Sv5+OiOMm/KjB623peiocH4fNC7W
	qcd7QmVm+z2zcISiGXZjMQ6dpJcj/jM9foQ6yVQ=
X-Google-Smtp-Source: APBJJlHDpgyOH0EniRMcg/ho/SZs1g8WmVOaFT5E3Vo4M7tZu25DM41KHrQN6mlhdq28r29ODmTCpw==
X-Received: by 2002:a17:903:454:b0:1b9:e937:9763 with SMTP id iw20-20020a170903045400b001b9e9379763mr15938736plb.12.1691090144185;
        Thu, 03 Aug 2023 12:15:44 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902a9ca00b001b9d88a4d1asm192492plr.289.2023.08.03.12.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:15:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell]gcc: fix runpath errors in cc1 binary
Date: Thu,  3 Aug 2023 09:15:33 -1000
Message-Id: <20230803191533.4101188-1-steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 19:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185498

The runpath in the cc1 binary is:

Library runpath: [$ORIGIN/../../../recipe-sysroot-native/usr/lib:$ORIGIN/../../../recipe-sysroot-native/lib]

This does not match the actual location of the libraries, which would require:

Library runpath: [$ORIGIN/../../recipe-sysroot-native/usr/lib:$ORIGIN/../../recipe-sysroot-native/lib]

Prior to gcc 9.1 the recipe set B explicity with:

B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"

and this build directory structure matches the runpath in cc1, so there is no issue.

This line was commented out in versions 9.1 through 11.3.  The upgrade to 12.1 once
again uncommented this line.

As a result the runpath is incorrect in version 9.1 through 11.3 and cc1 defaults
to using host libraries.

This patch restores setting B as done in master and versions prior to 9.1

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-9.5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.5.inc b/meta/recipes-devtools/gcc/gcc-9.5.inc
index ec28246bf3..23bfb1a9db 100644
--- a/meta/recipes-devtools/gcc/gcc-9.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.5.inc
@@ -75,7 +75,7 @@ S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[sha256sum] = "27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f"
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
-#B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
 FORTRAN = ""
-- 
2.34.1


