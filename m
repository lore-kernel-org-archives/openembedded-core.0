Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F36FEB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.7499.1686734995293749451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GEQWKSfX;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9823de726c3so87017366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734994; x=1689326994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTpmVkPvT31I2Z+BXYADfL/dVB05/PjbghMXzriRgfM=;
        b=GEQWKSfXrYfGISlrX9Ow5g6tWikSsBGIn5yCP05SbGEwlteBG5p38aNY1s2386SIRc
         Eo9kSQBW5WSUeJUuKx6QYM+17ZmPkY8twDRWF8ON32uHIO8rkMKDeRnxo0sfI8ZBNbzn
         itbgTObqWVT3lGzRPlJsVNCpu5CmnEMUgdLiJpr9zpFit64OkWczxDQ0lkKpse6saig/
         mSokTc/cJ92vffbanaa+McmjczYTgIZK++/O8JvbLxruHVHzsQIVv5czmoHdx5x1v46q
         +nHQ+ivciV3euf+PmgciUhT0l2w3qxuS58UPexN9dfXfqmF/A6e+GI4J6qQdvVUiScb4
         vnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734994; x=1689326994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTpmVkPvT31I2Z+BXYADfL/dVB05/PjbghMXzriRgfM=;
        b=HafzHZOVbZDpfxHz5kyFgU36Q3rHJAvnKF81Gz8IxOlbKEAs+f8NSKUqwgbAs5S7f8
         C3fVxdUwpDs/ajPf/7pKBD4vXfqrnoNXl+pvXXaW+/ypXFoPwSzxipykujaxHBFDy/Ml
         yw14T5ptUG1Em33IUHHyuVn9Rng5p1avgVVpZ6jQHM16H/la+vCqvmrrAJnXpAGzLKPS
         zzyAjOS0Wg3G/HZ4wKWIzaR/eJD2/igyf+XlOCOyGeJrm+BTfmQgwUBfWiwJSc3bCn7m
         g60OLkOjpiTqTxaNMkd6p6ooRmia8Y2hnGlO2dCGpaUrsFXVMdXUrfrl5A4wNhbipcDB
         3Fkw==
X-Gm-Message-State: AC+VfDwoL6VnzaON1U+qZZwJLBHqrQMM/B8ko0ka8E9ctKWVrCfT41ls
	b0Cbq1f3ymn1fyyAMusBLP3tjtz6kgc=
X-Google-Smtp-Source: ACHHUZ6HxnivrPtSF0IHeinaYWrTKzszxnhpeM0X71IA4zEGajXFQ8ukRsG6wueCAMVeWFvs2jJz9Q==
X-Received: by 2002:a17:907:7da9:b0:973:93d6:189f with SMTP id oz41-20020a1709077da900b0097393d6189fmr17878481ejc.61.1686734993725;
        Wed, 14 Jun 2023 02:29:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 48/55] strace: upgrade 6.2 -> 6.3
Date: Wed, 14 Jun 2023 11:29:11 +0200
Message-Id: <20230614092918.4065570-48-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182793

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/strace/{strace_6.2.bb => strace_6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_6.2.bb => strace_6.3.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_6.2.bb b/meta/recipes-devtools/strace/strace_6.3.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.2.bb
rename to meta/recipes-devtools/strace/strace_6.3.bb
index dc01b57d80e..ae614716720 100644
--- a/meta/recipes-devtools/strace/strace_6.2.bb
+++ b/meta/recipes-devtools/strace/strace_6.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "0c7d38a449416268d3004029a220a15a77c2206a03cc88120f37f46e949177e8"
+SRC_URI[sha256sum] = "e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731"
 
 inherit autotools ptest
 
-- 
2.30.2


