Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55150C77B73
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 13:27:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.6090.1685101924754348730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 04:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=UFxNOEBr;
 spf=pass (domain: snapchat.com, ip: 209.85.208.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51440706e59so875667a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1685101922; x=1687693922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nOJbxsfanwBNa7HyOF5fD74aszcpSWNeTxYLQ53gXMc=;
        b=UFxNOEBryFPoARqtTm/o/YL6VKtp5fcuyXwm764Txts8Gk3HshaWGcNaba0QarzNkI
         pJxop1p6bPS0h+Dpd+fyrjodka3TcQ+7jrLa5R3qage6CjY3FAmveDdagci1eyDp5fww
         Og5erYsCaoP+/RaAZNV+beXKgTutY5zAuI3pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685101922; x=1687693922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOJbxsfanwBNa7HyOF5fD74aszcpSWNeTxYLQ53gXMc=;
        b=fiDjctNFAizsVz9P+YNdgbRDCR6Oped8hVhou3Uwlsfs3zGUJyHEreEf9S+hElMgeB
         UOBdsIKenSydTzPV6djl/y2L75m266cWdyNcN/dnA+XMGF2LMUmsxPOTMc5K6/Pn1sj6
         VwUpgShCC5XdI1BDMuciRS3DbGiz3QuKuvlSsvXpotO4KYeCvn+4H8TxLPoPRIPnfD7y
         P5MRHV/LL3pq45YEJtWCiUngoU/WORV36/ekz5tSFqzSeeQucSUc/t0+kALmvsqS5LFE
         sXT1twnDMDsjiJ1nlMg51YBNhfip1MhjGYbfx77li9yOR6LK6GmwSqIk1yGnYdhIOURZ
         EkiQ==
X-Gm-Message-State: AC+VfDzbinNaUqHYnA5jyndUq1JoJsFJDFsuBtOR0NnalSlYlunjARR9
	uRXDpzzCSR2SXAoL5U0u9rVHdT3IEqGz6sMNgaI=
X-Google-Smtp-Source: ACHHUZ6SIvuLlFHjaYkV+A1E/cL33tQBs3HLe2aWMsf+Yt9soaymMPxTl7/upI7uSfeEP/WmMDJrUw==
X-Received: by 2002:a17:907:1c01:b0:969:7739:2eb7 with SMTP id nc1-20020a1709071c0100b0096977392eb7mr1692255ejc.4.1685101922355;
        Fri, 26 May 2023 04:52:02 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id j13-20020a170906474d00b0096a5d341b50sm2055369ejs.111.2023.05.26.04.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:52:02 -0700 (PDT)
From: "Etienne Cordonnier" <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] libxcrypt: fix hard-coded ".so" extension
Date: Fri, 26 May 2023 13:51:55 +0200
Message-Id: <20230526115155.1953481-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 13:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181769

From: Etienne Cordonnier <ecordonnier@snap.com>

2 issues:
- the .so extension is hard-coded, and therefore the libxcryt package compiled with
  meta-darwin is empty, because the dylib files are not contained in FILES_${PN}
- nothing actually produces a file libcrypt-*.so (the symlink file is libcrypt.so, without dash), thus
  defining FILES:${PN} manually to contain libcrypt-*.so has no effect.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 61b0381076..454a55d73d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,12 +17,6 @@ SRC_URI += "file://fix_cflags_handling.patch"
 
 PROVIDES = "virtual/crypt"
 
-FILES:${PN} = "${libdir}/libcrypt*.so.* \
-               ${libdir}/libcrypt-*.so \
-               ${libdir}/libowcrypt*.so.* \
-               ${libdir}/libowcrypt-*.so \
-"
-
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-- 
2.36.1.vfs.0.0


