Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EFEC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.22260.1659940999271130472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=czir+uOb;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id dc19so14737899ejb.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x/DdDZb5RdBBIkP+wddtyvvsph+BfIty4r2GHnkDGLM=;
        b=czir+uObhu2s+TVg/az8xcH28YZ7ChW/D0x7ck7uHdf8lCpnRgPkAW/bEcDVN0CiYP
         wDSIVYJRNudwePLwxSqTUp6Lv1nZbhxg5zVCjcswNMo2HzluejBDLJMhT806hApdtgp+
         8WGDy6wkEnIYyyluxYaRysmgBr6JaQpqImw+DCeyv7q7WFD9fLwYfbb+DJIT4jbOmbjc
         J+iJSvkELTml0oG2mm6DvcKJbWBe9ZkvddqYWSgDMZBDh9OBxV/BOriP9RB9zu+6uVHq
         NCGHDb4k0t6ZdPoFX0HkWRuTpamzFCZXsFXFl168HOFxbCLw5pr9Mdu9THrLQWnzMTHd
         xfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x/DdDZb5RdBBIkP+wddtyvvsph+BfIty4r2GHnkDGLM=;
        b=Qgpd0whqcW7z8320E0CptLjo1HcikE35JOcjQO7bnylNPLdiAy98G5wiqn+NlUSudO
         bYoKzOZWHa8mz4NMfNOO/1wJezD3GxgAKyKlhnOSxlzBn8LeOz0vshU0eY/4iTP6Onju
         g0dK4J1Fne9/Y1hKFuPcJ86NAdbGj3oIKUwOroZr4hh/AWcQqa8vlnZNWM6grVnaXN9a
         nzegom6JQ75aHVw+mNguyJMcR2ClMIwBaHmrAuGAsNGroAh1MDIp/wScw/iHpvZc//+F
         CflwskKmGtNA5F2CShRST9IKXc/IYbqRZbygmttK14LtR1BlyOCi27qlVAghfNA3nh+5
         BJHQ==
X-Gm-Message-State: ACgBeo0Rhpl2OisgJpUla25sPsGyzDMxWdiu6x9tpDjxE7n9VPrEplrx
	FvobZ5/c4hG/I0WGrZo64TKrU3JgBAY=
X-Google-Smtp-Source: 
 AA6agR7g6O9B6sBe9YFemOIhRCkOGv6mJuGvSZIraOyPLu9huFZeCOQvesCZv0ENQkL60pWYorc/rw==
X-Received: by 2002:a17:906:93f7:b0:730:da74:3454 with SMTP id
 yl23-20020a17090693f700b00730da743454mr11852536ejb.331.1659940997760;
        Sun, 07 Aug 2022 23:43:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 42/44] sysklogd: upgrade 2.4.0 -> 2.4.2
Date: Mon,  8 Aug 2022 08:42:35 +0200
Message-Id: <20220808064237.3975347-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169067

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sysklogd/{sysklogd_2.4.0.bb => sysklogd_2.4.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.4.0.bb => sysklogd_2.4.2.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.4.2.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.4.2.bb
index 4e6da70e4a..948acbcf59 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.4.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "7dc4783af8e8e0d200d38a87b6a4bc9bbec5ce92"
+SRCREV = "78505913888b71b2fa2e8616636fcc430ffa30bb"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


