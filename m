Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA01C32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.469.1660894072830837589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=czNrMyrf;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bs25so4185710wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=4eYZEVRmxtadr5Cu+MxGpm2DMcbbxk3Ro1Fh6jAb8x8=;
        b=czNrMyrfKu08EKey9qOtUjanG4gF+cXu4yDY4tcrnUU2xpoAfEwDTm3DgSfJo7UmWC
         JCqwHTcDQtETb6z8v1Ugdtt5E9uW2xu+U0cCPLJD3l9GW+KzGohqFaHW4RhYZMBjkj54
         c8nKCO1pr3elCrW25CADs0zIf+cLD+r3TDUArfjb3kVYk8pc6nyutbMpuRi3YL2K2G1o
         TunxtT1jiuJi+/fGnxWGB5vsFwCObVBUaLZkaZW15GF06boX9zC2FHvXMR2tIz8bHUWY
         XmUJbDIIUToIesnVJTzoc0UC5B//T+zqGCYz74h3NDhQWTv3OHCUv1f2XNdKIC717YCX
         dWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=4eYZEVRmxtadr5Cu+MxGpm2DMcbbxk3Ro1Fh6jAb8x8=;
        b=WfI4AvD/3LcZQF0C6BE7Qk+AuXXlbOm5vZnMnnsSmGDZM9clsddbFHw4EQHHwvBN3n
         wmlhK/hgt3XQ7tSXizhnoGwWNGJnXBaHtvrqvbj52rfIxDn3QTF/k2mwvbFPXgRVUOCG
         SVl++t1csNbu74zdiHK1gyW9cc8KyuBVOElEMpX9Vrcx44JW3C9HN6FXuWbqFj2O/F7E
         9nOuNojAGMat9XzktsERqBYgismEQyUkKxOXabfnYzMXhYeTXijhOJH/QGzRD6o4qILn
         /YFjqplyG1F7dza+E2sYO3OiwnNuq4cTvjV9c0192GzMFW5oV5bwlwOn6nlL3LSnx98z
         klfA==
X-Gm-Message-State: ACgBeo144KuCC1Jh99tGGjLzUSyHSEKat0/dA7eXRm5GZbmUDcNAlpbJ
	VRn3K2E/X6D0zeJrQMvJ3nvcG9XtrKw=
X-Google-Smtp-Source: 
 AA6agR7lIBeiBMWKgaTGJ1RnSSTWlLCLNciA0Iox3CE+jyetfl+c9rUqg5MbJS+84u2XGJrwT9w7lw==
X-Received: by 2002:adf:fbd2:0:b0:21e:e983:165f with SMTP id
 d18-20020adffbd2000000b0021ee983165fmr3332027wrs.517.1660894093210;
        Fri, 19 Aug 2022 00:28:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/42] python3-numpy: upgrade 1.23.1 -> 1.23.2
Date: Fri, 19 Aug 2022 09:27:15 +0200
Message-Id: <20220819072727.2236928-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169601

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-numpy_1.23.1.bb => python3-numpy_1.23.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.23.1.bb => python3-numpy_1.23.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.23.1.bb b/meta/recipes-devtools/python/python3-numpy_1.23.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.23.1.bb
rename to meta/recipes-devtools/python/python3-numpy_1.23.2.bb
index 67ab1d9298..960dcf9410 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.23.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.23.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://run-ptest \
            file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch \
            "
-SRC_URI[sha256sum] = "d748ef349bfef2e1194b59da37ed5a29c19ea8d7e6342019921ba2ba4fd8b624"
+SRC_URI[sha256sum] = "b78d00e48261fbbd04aa0d7427cf78d18401ee0abd89c7559bbf422e5b1c7d01"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.30.2


