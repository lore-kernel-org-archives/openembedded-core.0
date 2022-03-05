Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB086C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:57:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.1957.1646445465438525810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QpV04CGp;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id bd1so9236036plb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CbjFvNwrTBY/I2VWN5IMADBbcgp3lQE8T3CsmdFz9EA=;
        b=QpV04CGpV/qsz/QvsOGqyp2iHrAGF5HPjq/DkD10CNMh75KxFKvo1LdFiZ7ErIk5di
         B/P2Za0gU7glAWoGewVLQVlm/7WCTx+Ua4/LBd48JGppVM0HbS5ZnuZgcTgnW0hrSlIR
         eo4sAkg2mzFzobFRCaKC7DLb9H+1Ub+tYwwY5jS8OV8k332dpwwGN3nHqHB/ykFRlpxO
         Ez6QWZvNHBEV+GIiPL73/F0QPhg6qF7toWUataKYVtGUWMg85f+KApW2oGsIykyTANa1
         FQKhSRdSt+x8IDEPdHsvzSsJhWKIRq0AoOyzJE88urRCkhy8YeoewPKDlnr3E2fe0ynv
         1zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CbjFvNwrTBY/I2VWN5IMADBbcgp3lQE8T3CsmdFz9EA=;
        b=ruUnO5jYg0YRIvaRH+BnDehmAdNqP7ZmHXPzYQtE1bLd3gO6naKCGiLp71BtXYtzq6
         xSZXHwVJOqERWpcjZ/Jj4uwdMXzzkCP3vg9aIVnbtgrdU9O1wpY+pME3aByqo2jvzLA9
         59VOGH8EViO3M8KFuU19Q61rIBeAVrcEQ3fqmxGrEJ0H+9Kpb/rrhN6d8Iis7d2tBO5j
         Du8Swua0f/IeAj5+kd8BI3wtcAPG/88fPJylzxTQgu4J0BrVmcYqd7pGFhoZvVORussF
         H4kD8L8scwQUwUtEfYzKUrheR0x4/EyAoO8EbgCoqk+rV3DQDh1vkwjmRceqePrDBeeA
         cPRA==
X-Gm-Message-State: AOAM533PDUBqARSX7jkbyB/O8PB2ybsld0G1KpdgCDHX8InttHgBzD5F
	pdude/7xIt3InKAVftary642nAunPp3pTA==
X-Google-Smtp-Source: 
 ABdhPJwlmGv/kz4RASVJZKG9GH8YsCisKkAwCmCklAmaGK5aJoLzFPBNVtw9N+aTySaTU7IAFor34Q==
X-Received: by 2002:a17:903:248:b0:14d:6aaf:2c22 with SMTP id
 j8-20020a170903024800b0014d6aaf2c22mr1230543plh.72.1646445464695;
        Fri, 04 Mar 2022 17:57:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 d21-20020a056a00199500b004f3c48332basm7005962pfl.159.2022.03.04.17.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:57:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Revert "libical: Pass TOOLCHAIN_OPTIONS via CFLAGS"
Date: Fri,  4 Mar 2022 17:57:42 -0800
Message-Id: <20220305015742.3339281-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:57:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162776

This reverts commit feb8893e0f52c7ab2d5efd456901a2bb91839d44.
---
 meta/recipes-support/libical/libical_3.0.14.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
index af8bc59dae3..58baf3f32f7 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.14.bb
@@ -20,8 +20,6 @@ UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig gobject-introspection vala
 
-CFLAGS += "${TOOLCHAIN_OPTIONS}"
-
 DEPENDS += "libical-native"
 
 PACKAGECONFIG ??= "icu glib"
-- 
2.35.1


