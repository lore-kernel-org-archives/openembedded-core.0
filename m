Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D43FC25B6F
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:29:45 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.165470.1698200983947442356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 19:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jfvhG45o;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-27d3c886671so4517419a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 19:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698200983; x=1698805783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cpfLymLVzyGgNxX4vxTBoNY6rRHH5XQQwCD7Ms1ZMM=;
        b=jfvhG45oexy8eo1ZCNgOejKeyIPNg6PJD8ccneu5mIgmYQLAj7EG+AhWpEw7nQLlyX
         hGFkIh2KducAHZme90439VBRIbf3BxouOGvE4LL/aD8SwK1s3tpg7/+dX9ZIv1ZuOhSR
         Qxre44r7YjjgjtV8rp+wp097taVM0ucVfp9EdO0xMQqTi55JU/kb9Z3xHnLD/5pwJrEB
         c1ut8yq8PmzlRuZd0A7p9hjjUuaByHoEqi/GQ4wX4CzrvYNTId/z9QzjIabkXs7QIyGP
         QkGX+AllB5UrQqFuRlGrtxnsz9Pk0QqggogJwui6xb48n+0UF80ChfDMFP6U15bt/hfv
         SInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698200983; x=1698805783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cpfLymLVzyGgNxX4vxTBoNY6rRHH5XQQwCD7Ms1ZMM=;
        b=Yv3L26By8P9dpWV9OLZpwvz3CSV2f/NUl3NYsbiLyNq5jjQptD+PU0jwtB/qVrsyzb
         lYbOmJ3y0AKX48llyE4cBSTb+uEOoTjjc2imGimt1x013J64dkwlikpj6FcOkwHIjwhW
         5qPTSZ4gfFMrHv5yXa7/uaAdbqvvidAhzM0HdKbSXoCrTcJ7vPNIVmpJFeIQyK3m4fct
         pqxgjf/2uIsMHEMUIv73luW1MipclOGTz5DZ0IBE/QTaIdc5sHhBtOQm8XDAzhnM9LZX
         8ghcBNudPCW6F67454/80gBLwI0l27aOfSMT0J1Pr7/5kmOcSDQvZNK6+OkteBR5Iwiu
         BfUg==
X-Gm-Message-State: AOJu0YwEYeLTLFNAk5/4EkCj3LG18f4Vnj9FHdfqIB+kvXd4XyxvM+at
	zgE1hMAzo4b4kWRFRXvDQvaNfpLFjH3y4XAbiNc=
X-Google-Smtp-Source: AGHT+IEdHTueKBAO2tTpFf2W6Hyqf3vQUqcCP0tr9+dTtJiKfb7ZHeqb/xpXySMveTg9zbiDi3n81Q==
X-Received: by 2002:a17:90a:aa8d:b0:27e:22b:dce5 with SMTP id l13-20020a17090aaa8d00b0027e022bdce5mr13569720pjq.27.1698200983037;
        Tue, 24 Oct 2023 19:29:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a388200b0027d0d4d4128sm8538615pjb.25.2023.10.24.19.29.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 19:29:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] resulttool/report: Avoid divide by zero
Date: Tue, 24 Oct 2023 16:29:27 -1000
Message-Id: <33d3374a7149ad1afe86d86c0dc2a948f70e26bd.1698200772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698200772.git.steve@sakoman.com>
References: <cover.1698200772.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189664

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid a divide by zero traceback if unfortunate test counts are encountered.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5aeea53dfacb53dedb8445cb3523dc3a8cb6dca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/report.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index f0ca50ebe2..a349510ab8 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -176,7 +176,10 @@ class ResultsTextReport(object):
             vals['sort'] = line['testseries'] + "_" + line['result_id']
             vals['failed_testcases'] = line['failed_testcases']
             for k in cols:
-                vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                if total_tested:
+                    vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                else:
+                    vals[k] = "0 (0%)"
             for k in maxlen:
                 if k in vals and len(vals[k]) > maxlen[k]:
                     maxlen[k] = len(vals[k])
-- 
2.34.1


