Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07024CCA47B
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 21:43:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.32767.1654897408442313828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e6bmHq6Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so2312078wms.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=e6bmHq6QiJjUUEki9XlP51Bzl3ppGAoRPMOESKk+1xUFDC5xrtdyhvIIPGe73nJpav
         KyAhzMOYQv+QCUygQBjEaw280g7hUl1BQT1js8bwf/7x3Ql5MtGSjQXl5Xvpqh+oWrzj
         ddCKtsPW0IKExd7kf2TLJeFF2MqFtMnI6lHW8sV8BbN9aE3/Vfrfz8z89u5T95ksBlj+
         n+13W5Qg4qp46XHdOCF/OQpkq4QiZc4D8Nk/Zl3KT7AnvvJ90/Kh7AiFPMPnPM2cvQVX
         E5Zi80fl68VZ53iQ0cFe5sLG5vpdCr8BGhXM8rYsRswkaoup3+K4QBlxZc43WvNeO4J/
         hoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gd+TT2+h7sHZ8k4eCB3EylAjwP5hm50V6/bgYDIOHXA=;
        b=0pfeSIb/euJLdMsXPEBPeUG9aIyb6P8Z+Ch1LDWD6njAjpLV3TpZYe1GwiWm3gZyt5
         KEmyJe2p5Z4q6/CGcJPQtkGtJAOv37weusi5LCmU3vxtvav6I8UfOk5uPk2xcANPkuQS
         kGxH6UvqSrqyacfAk2ykKN8sbsef1bOuz/UzKIRnVoJexniqKfumAbWprLV7CEKxtj7z
         6phfEdRSO8hy7WmLug1f6X4GHbkTKJ3q59x0BsJf3z8smBIKH5aUBUWEneHBK87e3pUZ
         G30NRNakgl4wF3XbHDuGz7bJWjEDP1FfsoHNW/XvjAcxIOzE8c7rJJgrkhZVL29efG0O
         Blyg==
X-Gm-Message-State: AOAM5301HIzmLsXoBbzGENkrzCaRyzekEdKMT5kzTJoTD+t6Fsq3tRmk
	ONtGpNm0cobk5Ekvw5Qgt1ix9I/aGg==
X-Google-Smtp-Source: 
 ABdhPJwJLulMSfMljtP1ZkvRTUKwBdXKM4u4MB7vedrCxK98Yh+RVVLmVCXY5VGST/VnwDaTnYmcbQ==
X-Received: by 2002:a05:600c:19cb:b0:397:51db:446f with SMTP id
 u11-20020a05600c19cb00b0039751db446fmr1664349wmq.182.1654897407053;
        Fri, 10 Jun 2022 14:43:27 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 e15-20020adfe7cf000000b0020feb9c44c2sm579309wrn.20.2022.06.10.14.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 14:43:26 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v3 7/7] libcheck: Fix too long shebang for native case.
Date: Fri, 10 Jun 2022 23:43:14 +0200
Message-Id: <20220610214314.2754247-7-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610214314.2754247-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 21:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166819

It requires a shebang wrapper due to the fact that awk interpreter
has an argument.
---
 meta/recipes-support/libcheck/libcheck_0.15.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 188d689cc3..1393aa2a1c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -23,6 +23,9 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
 RREPLACES:${PN} = "check (<= 0.9.5)"
 
+do_install:append:class-native() {
+    create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
+}
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "checkmk"
-- 
2.25.1


