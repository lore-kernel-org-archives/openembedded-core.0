Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839D8EB64DC
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 05:32:37 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.12120.1687584748362224907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 22:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bTaoeQ8S;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666ecb21f86so1205708b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 22:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584747; x=1690176747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekk+a+AOHut8l9wvzWTAqsZc/Wn6W1W1mQFsyFZm1lg=;
        b=bTaoeQ8SSQMG218KvCGuInBwFZkh3tVrKoAJTIUj4OM5cYYMh1BTpo/l+MW/D/B0Fz
         fIjq7iRfFWsPcCs6Y7js2/qNR2/gjrje5Tf83ru67p/3PzJ0os6SWa2lhO7SJQS1YuCR
         c9n//Xq8BwWyrGXVUFl+BxC1BgsF2B/qeHR/NcT/H+lAmS6iPLgquqGB0V8Zru6oe29a
         NKb4GnXLw1hwxmGXvl9ET3socTRAcpxa4wSpZc4Sa47nDuuVG7HPr39n/7DIzuuQU7LK
         9vypO8lHiWMXEnfCpxR92OWxVXDb+QV1wBdGVMv34EmX+BH2nBY1gWTzKq+ujXGtWK+k
         Bh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584747; x=1690176747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekk+a+AOHut8l9wvzWTAqsZc/Wn6W1W1mQFsyFZm1lg=;
        b=NzBkcelSGhXnK2vVIvdSGPQQj6fu6NJaM3iQRLcl2Rf7Cwr+vO5yobVmsMoNyztnyQ
         Oyg4FIyFmB4IhbVf7UwGyTSkwzYeLKWZ6l9NSuWi5gyV+lUVcQIDnp9P+K23FyGGf6G/
         2isgqIcWCNmSq6fyfDgSz4Bn4Aec131NgvK5GnqIi2dGX3AGVkDoWRHir62zfdE7cjN3
         rgq+tqA9eWozlTSgNOiPbb1HVfyEj7ElxSCUEwmacvOJSuQQOVeipCiyhRHbQwG2Se/S
         cnPgo4/D0IYL0Sj85H37DtSMWOb0sgUs0w7xzd+ENugpuG/WK7qO5zoza07ImRK7eX8j
         M6uA==
X-Gm-Message-State: AC+VfDyluus5NW8EeJMGD/oLsFPeqAPMWw8MBy1va7xgq6sy+gxCx7JU
	3mGuewETcUVDsStRPSd5h2SH0i23jTA=
X-Google-Smtp-Source: ACHHUZ5aaNxeZER5s9PQnezCtLJo6f89U+qgP9gXfrXKOi94C+DFrPsMVUIdxsRu7c2vguDB5gWeWg==
X-Received: by 2002:a05:6a20:9146:b0:104:1f67:1157 with SMTP id x6-20020a056a20914600b001041f671157mr29350863pzc.26.1687584747193;
        Fri, 23 Jun 2023 22:32:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b0063b6cccd5dfsm353797pfn.195.2023.06.23.22.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:32:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] alsa-lib: Disable old API symbols
Date: Fri, 23 Jun 2023 22:32:22 -0700
Message-ID: <20230624053223.228117-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230624053223.228117-1-raj.khem@gmail.com>
References: <20230624053223.228117-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jun 2023 05:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183358

These symbols are currently generated as undefined in the shared object,
which means we really do not need them.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
index a8bf09904d9..d482e27683b 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
-    --disable-python \
+    --disable-python --disable-old-symbols \
 "
 
 PACKAGES =+ "alsa-server alsa-conf libatopology"
-- 
2.41.0


