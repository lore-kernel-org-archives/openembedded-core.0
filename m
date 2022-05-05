Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866E1C4321E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7351.1651727164934262085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=al60SK9j;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id y21so3913055edo.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MPM6l2wYY/VltOPTGBTFLHOBg5LSFiDDb0zC0f0m+iM=;
        b=al60SK9jvV9b93Zweri2HkejeLe8kfMPknNP2IEIq+6t/idcvjwBv5sfobdYgFVmPy
         9s5Iop+CGNlp/Zj6toM4J806Ha7YKzplpCzfefNLMNsbTDMmSh4YDya8XhLRdQDWiXR3
         C+DaXZIchwQ5D5ythODrJW6pZ6rw9tXX73+s1OrgwCMc48UscMtovhHriDTDXijqCrOo
         WQs1pvFkesCzd5iKKO449EsOlFX+cRn6H7ODXG3faA61WfE1QE0aR6cxHZbJ4RBlrTJG
         9LvcNcBkU1/JZ2YSPDJFDa/vos0TyTUkxVynPBxWOhP3b3DVvYUUVOqMc9CaSoCC9lCX
         MnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MPM6l2wYY/VltOPTGBTFLHOBg5LSFiDDb0zC0f0m+iM=;
        b=yAPuYGPzKYj0062u58hc+1fUQah4XzrSWnqS2NBDy8tI+uijR0ihJzX3h5eMcSywVa
         sp4C1yNlu0MTRRF5ZTW7PWB2Jhys3p9L1cVqQ5v/4h4S1+mBsYT5DpFn1JQsbiRSOqmE
         9rwhrPhjw054FyO8F2zRnUt1etyGIknNn73DJ33wjDd+O9mkQSVHypq2i79TkKN6igOg
         RtrTpLBk0XUiQaNwb2Ggkj6G5lLYWM3bqw+GlWSTEXIIFWEEj+CzVNbOYZI67aBc9eP+
         0claConY6e56P5WPH0AXNr66NvnfycoHIl6fW9bRckVEIhENMbz1zGqb9do+iN5iDKaV
         HWBg==
X-Gm-Message-State: AOAM530+kk/xI9dM13s7kqekZ5ePZnQa+UTMu82YAfmx8p5Gqe50TJgb
	s5qFJ64MFZKVnMkuFH8MaRi3xRP8ce8=
X-Google-Smtp-Source: 
 ABdhPJw2C9g/MJOK9Jqgsg7ADMQUIDGZ+bQt2khYGaQDX7xDs6uvusJwHHxK7C0TykqbWC5wwdWuJg==
X-Received: by 2002:a05:6402:278f:b0:428:3c79:4eb8 with SMTP id
 b15-20020a056402278f00b004283c794eb8mr440536ede.81.1651727163576;
        Wed, 04 May 2022 22:06:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/61] fribidi: upgrade 1.0.11 -> 1.0.12
Date: Thu,  5 May 2022 07:05:04 +0200
Message-Id: <20220505050544.651895-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165251

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../fribidi/{fribidi_1.0.11.bb => fribidi_1.0.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.11.bb => fribidi_1.0.12.bb} (90%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.11.bb b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
similarity index 90%
rename from meta/recipes-support/fribidi/fribidi_1.0.11.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.12.bb
index 56ca734558..b29c47822f 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.11.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "30f93e9c63ee627d1a2cedcf59ac34d45bf30240982f99e44c6e015466b4e73d"
+SRC_URI[sha256sum] = "0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.30.2


