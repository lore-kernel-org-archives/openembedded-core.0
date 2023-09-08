Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993F8EE57C7
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 05:32:52 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.33166.1694151165839688765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 22:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M8bD+gct;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68bec3a1c0fso1455440b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 22:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694151165; x=1694755965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BV2VJX+KXfbOCg2Ty5HpzejAFMj8R9eqPIHeFGaHLTM=;
        b=M8bD+gct50d46l9bdIC+PYFFsi86TsyuVOc9skkV5HYZ6kPg5dFCVYdPI2huDwbWve
         OEWFNRIG59s6BSZF4W4y45diUzlhG8UluC0Pl2Rah82JOgTwLNTdqAXQPmcJcH9NWMx2
         zZUZcYm6IZMh/FwyTUTga3ec/EaAxNAXQkVEWzB8YWEfugKhr6FAo89AZUQBFKp+p2RY
         DyVGvdGyw1uIYYJ2p6qDFTr2459wAPOEej21YfqejE5XpoNuKvqaIO6daqk+qKs6kWcU
         5s6qSyH95VytImSr6GCghbkmKiD77+L5t2gW1K2yYW7UujjHuhpPgDYS+qyRjg+fv1Sq
         zwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694151165; x=1694755965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV2VJX+KXfbOCg2Ty5HpzejAFMj8R9eqPIHeFGaHLTM=;
        b=Vo8YUwilmJCn/netaSRmmHaduxCuO7gDbRvYCPdeUdntupnqmkt8w4sYrUyDcbLdYR
         2K1l1GP2WJdDCw780HxUP/5n0+nyE8tF4w4+oLS5lWOKdxLQcSx5tFDjUIhFBIGnoI6k
         1MGapSGDbaLU9zmXGJ6004MX05P3/Bxgr8doZkwWY1ZFWgqPabumM5MKTx3bTNpgXjOV
         +tiZ3IXJiPJ8T39eHXYWs/7Ml/IlK/td70hP6/4HVPEY3l36xvhI2c8WlfjZ9QYsyxhC
         RB1hVZzweU747cF5xTmgmKPcgy9S4uqUTdBAcxpDMfNHiqQN8EohC8BL4KhuE5mlvNgn
         nWFw==
X-Gm-Message-State: AOJu0YyCWPFcv8FlMuvI2nPtaArTEei4/WabYR0aohYjIxXonXzhXRfw
	mx4w3w+rekSnQE3MG8gylMX8/yMWv4ZZmg==
X-Google-Smtp-Source: AGHT+IFDY8bVBmIV/eUp9J8Lqlf9RF6VMvo/C/TMIYyNQWUk3L4Frg2g2NShtgrSt3W3qSYyjx508A==
X-Received: by 2002:a05:6a00:2191:b0:68e:36b1:3d7f with SMTP id h17-20020a056a00219100b0068e36b13d7fmr1573069pfi.18.1694151164927;
        Thu, 07 Sep 2023 22:32:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id x17-20020a62fb11000000b00682c864f35bsm569757pfm.140.2023.09.07.22.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 22:32:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] perl: Add packageconfig for setlocale functionality differences
Date: Thu,  7 Sep 2023 22:32:41 -0700
Message-ID: <20230908053241.684488-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 05:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187405

setlocale behavior with 'missing' locales is different when using musl
[1] which confuses perl locale tests and perl thinks it has locale on
system while there are none. Therefore pass correct property on musl
regarding setlocale behaviour

[1] https://musl.openwall.narkive.com/kO1vpTWJ/setlocale-behavior-with-missing-locales

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.38.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.38.0.bb b/meta/recipes-devtools/perl/perl_5.38.0.bb
index 2103a39dfa4..a8623b6e84b 100644
--- a/meta/recipes-devtools/perl/perl_5.38.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.0.bb
@@ -38,8 +38,10 @@ DEPENDS += "make-native"
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
 PACKAGECONFIG ??= "gdbm"
+PACKAGECONFIG:append:libc-musl = " anylocale"
 PACKAGECONFIG[bdb] = ",-Ui_db,db"
 PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
+PACKAGECONFIG[anylocale] = "-Dd_setlocale_accepts_any_locale_name=define,,"
 
 # Don't generate comments in enc2xs output files. They are not reproducible
 export ENC2XS_NO_COMMENTS = "1"
-- 
2.42.0


