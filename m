Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59B9C3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 07:09:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.8374.1692947357684769134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 00:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TqFcGaT3;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-26d12558d63so362431a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692947357; x=1693552157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8F7IKQLu2AXC8k9NCVuqzI61L6EPxD++5pj8Pp5omZ0=;
        b=TqFcGaT3Dtqt0gvMawtLMc/8vJ0EMq/6mozLbTjjDTGlyv/nwzFtLdK1oJvphFoDyh
         dJJ+B/go0Sr/hayphMGyCI4e5Jp4h7fml96QSKLRM/r3S293W1mleDb7/yTuboHV7zJp
         iY63XMb2/JqAovoNXUGROqMv1s9OQf3Bm+PTEEdo13W7B755kLuhSvbk6hV4AGeazuC1
         gZUD/5BS+EEqITNHS8hV9M66ooEL7hnDmzDtL+WmyKbMNQ4GbQKiLCHEJwdoUYmH8lew
         L7vrSmueqw74hOMk6mYxydnDabnUeM7TtM9AF/l7t7kcneQMgycfzGKN4LKCnSIPbTBc
         cCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692947357; x=1693552157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8F7IKQLu2AXC8k9NCVuqzI61L6EPxD++5pj8Pp5omZ0=;
        b=DHJqiq/PhkJn3IDVy/QGX6Q6vHN1ksZxQr9cLPvgBn8mPTsVNneN6s2B/GBtG1TSWs
         T+0qSC2wEEULiiB44tqycqPGQ2TaThiw4nS/v1riyLBFjQe6NdSB/BIAyoPX753wUz1E
         nQcI5cJyaB7697dLsutmLMym94/vo+asXZi5SayZBbyyJr26WVy124s2DQqRUmmdGuzh
         BbcOrw7m1pC45O7NGq2cM/iLG7RAqk1t7bhb4fTVmVVU4Kc7C5VL+RqLP6EIUqi6SaCX
         qBhV9dCdmB71jgXlD9UKy+yerODNd5Xgv+8NjfyHq51+cUw6F1lq8v+6aGpr3YrjmvWT
         QJeA==
X-Gm-Message-State: AOJu0YwLGQsEzKjnhaTVDRdWXHiSzK58X5D7TFyzxd7N6CSCvpf9fOod
	sJqAiAPRpU8QD4hvneDrPhOdjulSa52m1A==
X-Google-Smtp-Source: AGHT+IGgoijw+fpjvBGtypGN+sMPqz10DT7AawzUcXNmhSi6ctHJAHRXb98RZ4VxxYoF53WzaAEZJA==
X-Received: by 2002:a17:90a:2a01:b0:26d:2198:6117 with SMTP id i1-20020a17090a2a0100b0026d21986117mr14495278pjd.13.1692947356713;
        Fri, 25 Aug 2023 00:09:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id oj3-20020a17090b4d8300b00263e1db8460sm2751800pjb.9.2023.08.25.00.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 00:09:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3: Add packagegroup-core-buildessential rdep to ptests
Date: Fri, 25 Aug 2023 00:09:14 -0700
Message-ID: <20230825070914.525031-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186693

cppext test needs full toolchain as it tries to build an extention with
C, using packagegroup-core-buildessential ensures that a function
toolchain bits are pulled into ptest image, as an aside it also
abstracts hardcoding compiler to be gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
index 8fd1382caa4..e31c4a81ef6 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -424,7 +424,7 @@ FILES:${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed packagegroup-core-buildessential"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-- 
2.42.0


