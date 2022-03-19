Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23A0C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.4946.1647674177367918673
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+UKmGXQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 m26-20020a05600c3b1a00b0038c8b999f58so501535wms.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBrSspzU9fBi0bvwI+n+HQQ1V/0MwgmcUX0w8kvqtIc=;
        b=E+UKmGXQu0GqF9fPv1qoAIkD7/c/cJi5+rGyZTnJjI2BehbNiKkpPV+mJOzTj0e/Ri
         QbGaa8K6YJc5NUN2Qz5QSzx5RbeeAFViKoCe9bFvXRyJgSUdkFa0SupsqyQ1iDg/Ftoe
         13Un1W76DyvXwZwA7PRVM+z2WVuz+j3TVzUz6lgGOG1BP8NZVpEfOVVD/SZo9XkVkPIG
         BEfRpHxvcGze/EkFLiDJb2dDLGC0fBYfRZdalUhBTR6tYF1hkVmmc3G/quEph+2/9aFj
         LMOoqTGRtK9KcOyCc1HIBnyabEreX+HtK1BGMviKT95kdpCgtV3H8eMbPzmLKFaI+sFO
         VYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBrSspzU9fBi0bvwI+n+HQQ1V/0MwgmcUX0w8kvqtIc=;
        b=2Mti+3Q4fMwDH/7EY2Q3QjpFbaxqaPhEFwde3/+cIitiYSlmyd7fjSv+ocTX1s9XG/
         jNA9VKF9VjeuLVuNkdvhdScv0jeOidZ0FX9lP2NSngcXFdZhh1yMWJum4oP3RaiTxTIR
         5tlzsevgrrI88H+8Si4fn2apBcKanTu3lrawwhtL1WTsj54fm//Tj9Sm9bII45c7kL4R
         bIGVphyCKdTPfSdA/iBKrrJMvcpd/3sjsLKmJ9c1Xntae4FHrX4sUN775Gtkjz6kRBia
         1ZmBxgl5OdCM0nHdVknatMv/eeWRfBerBii9AaxchlbiEwl+VKuS+Qw2T454cEMMDEzR
         BwJA==
X-Gm-Message-State: AOAM5315XMn5M93o8Ea7t1VVmhlysXQJ4wcvxW1r56OVFRzB7L+pqO8G
	ah0KOkJl9SGS8I+oeUK5XppRFkT6WEA=
X-Google-Smtp-Source: 
 ABdhPJyRhZc81mhhIHJTTtczfArrNngxWZV5gicWm/T9uRgep1VsWkwGj9XNgUC0sjk6oZvvly4grQ==
X-Received: by 2002:a1c:7715:0:b0:380:ed9b:debd with SMTP id
 t21-20020a1c7715000000b00380ed9bdebdmr11317962wmi.54.1647674175783;
        Sat, 19 Mar 2022 00:16:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/11] python3-typing-extensions: fix upstream version check
Date: Sat, 19 Mar 2022 08:15:56 +0100
Message-Id: <20220319071605.152904-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163458

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-typing-extensions_3.10.0.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
index a5f491c770..a8e83fc824 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = "/typing-extensions/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.30.2


