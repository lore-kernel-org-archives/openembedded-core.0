Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE8AECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 13:15:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.6250.1666876491848990263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 06:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=cl7iJ+4V;
 spf=pass (domain: snapchat.com, ip: 209.85.210.181, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pf1-f181.google.com with SMTP id d10so1462685pfh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBX2Ctj7ZdU6Bgm338nuH+ms7PVjHIRsCZ+Ns3MzXg4=;
        b=cl7iJ+4VuGTdyChgb6Kf336mGRYWOcS+FH+1jMBbteDXX90jUdh3Z1oXsjuMRwnXDL
         IopGgUun1X4y2evk4nmWU+y6X0gf84BZ/IKtQRtkpieDYECLTWdNN8qK2A8OYO9kyUz0
         cMRzAgQFhLoCvuRfK67t2MHCI6+oDmpEv0fw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBX2Ctj7ZdU6Bgm338nuH+ms7PVjHIRsCZ+Ns3MzXg4=;
        b=MFBQe3QiS0ta38cwQPRbyoNtXtpEevHSyDvS5m8kmER9W6Jr54TU//YgIAnYzH9Qia
         saPPzGETgB+WGMoLcu3oSgTzlyfC+i4bIJtgf6i3AIQCevnoeuYACi6hf2SI1SER+3/p
         JbecH4l0t3Felx/zDNpIkZJI6jqaZssVet/9cRoluaFSfLjkLV8QTyiliubCTWc62fja
         RPVvrm1BIDi6670zznAX23xDNYU7GxFp/LhJTUV+wN4Lew8K+4nh68bK7gF2e+H+0IYd
         XzcIT4GMeKmhjcti+MKbqBRtFvmIe+mVadWw8ZgLITuFuYfEfxpIMiiYx3HEWKUsYN7C
         c6Ig==
X-Gm-Message-State: ACrzQf2b+byOUxbZdr75o632bWbIflE6maX1R8POa5xyi+jgkLZd9OM5
	HRHTX+CAmNLPvSB/j7IU5xvZwWFDQasj4kNk
X-Google-Smtp-Source: AMsMyM45VRN2Xb+vclbw9WJx9+i64hN2Uthd/PFGQ+GxNCAGPtxWNlsw+mIehRKc8YR8duUUFGvWTg==
X-Received: by 2002:aa7:9250:0:b0:563:723f:7914 with SMTP id 16-20020aa79250000000b00563723f7914mr47750893pfp.12.1666876491039;
        Thu, 27 Oct 2022 06:14:51 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.86.25.14])
        by smtp.gmail.com with ESMTPSA id je11-20020a170903264b00b00186ac812ab0sm1192183plb.83.2022.10.27.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:14:50 -0700 (PDT)
From: Etienne Cordonnier <ecordonnier@snapchat.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] mirrors.bbclass: use shallow tarball for binutils-native
Date: Thu, 27 Oct 2022 15:14:34 +0200
Message-Id: <20221027131434.825285-1-ecordonnier@snapchat.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172191

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-global/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 9643b31a23..81fef7f660 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -90,6 +90,7 @@ BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
+BB_GIT_SHALLOW:pn-binutils-native = "1"
 BB_GIT_SHALLOW:pn-glibc = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.36.1.vfs.0.0


