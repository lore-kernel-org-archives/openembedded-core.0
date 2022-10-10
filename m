Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043F6C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 11:58:35 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.5355.1665403106747289516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 04:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n6CE1S/I;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so12923653pjs.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAkOqNiPiK2cG4dodyr5vqPMNzy9IR9VZhqP3EpXeOw=;
        b=n6CE1S/I/iIbe5ZLR9RH8F557YDNi4o7NCHKCXv4/drSCT6890GVYPQ/IMqreR7fEY
         dpSV7xKjwRTpm0G7cadHdTv7llTRlsUIBEPyM1pltSL1IAsth+RgPFUljJYrhdNRderu
         kTXKNI6sqdzUdJ8ZrU7mraiq1+nbKtZhMacVCFNEzaFdS/4gLKV0hlLMIEo6+ov3bBmQ
         UCCfG69mDuFdaIa5kJW6RtdmCo/Bune1GiAFngOr2OaEYs8YWpUb4RLU5riSY5I9yHjf
         ZxQ5bJhUzwIBTqUZGbyPUy7NwgjOXJ6zYUv9FXptL7MD0e6iGdJzMNg+unm32Wey0KMQ
         ktGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAkOqNiPiK2cG4dodyr5vqPMNzy9IR9VZhqP3EpXeOw=;
        b=dHHl+6qNma+OcI+KPCKJKJXRxl4M6AHqEVu9RGmlL1fS8833thLtR0pi037f/T1NLD
         6bTiZNoYa7I7KBVnhlGOqEJwhvaqwsLn8XZiPtDR7Qf3ZB+kAcugHN+eWiQ6QkC01ZVq
         CI+HR4Gp1HYB8j0kNylQII7rXqg1R8gUk4zfTTwXAU47B4VXiw6nkNt07H6QBE3J0WqR
         QKYgsVU5A43WA0q5Eah9WQhq7SYXWgRTiPf1ownPaFGhfZ8Bnd0KAXOR1rxGyYXSgaiJ
         dpEsteR+KIko453shBn61Fa+7bfMLzuKAD05Q5KPVP+THk8pK7eE820T7yflF0uzEJUA
         yhFg==
X-Gm-Message-State: ACrzQf2gOr/Rc+dQW7Xslon5D8Mhk61GFd1BpxknLmBhQmEG6OoHk1i+
	WRrSXEYWymKkLKzvrtlUKrcmv0PH1l2wfw==
X-Google-Smtp-Source: 
 AMsMyM55vaBcfBjBkbK5tRab1yfLp6JYP/bbEghyArno6M3oocZOGvtjM2B+RQadk5GpAkuQSo8JhA==
X-Received: by 2002:a17:902:c7ca:b0:181:927a:9449 with SMTP id
 r10-20020a170902c7ca00b00181927a9449mr9219354pla.11.1665403105538;
        Mon, 10 Oct 2022 04:58:25 -0700 (PDT)
Received: from localhost.localdomain ([122.169.26.246])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a170902d4c800b00179c81f6693sm6473885plg.264.2022.10.10.04.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 04:58:25 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	virendrak@kpit.com
Subject: [OE-Core][dunfell][PATCH] python3: Whitelist CVE-2018-25032
Date: Mon, 10 Oct 2022 17:28:18 +0530
Message-Id: <20221010115818.10917-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 11:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171574

zlib v1.2.11 as used in Windows binary releases contains a security
issue.
Link: https://bugs.python.org/issue47194

Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
---
 meta/recipes-devtools/python/python3_3.8.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb b/meta/recipes-devtools/python/python3_3.8.13.bb
index d87abe2351..e0e6861677 100644
--- a/meta/recipes-devtools/python/python3_3.8.13.bb
+++ b/meta/recipes-devtools/python/python3_3.8.13.bb
@@ -62,6 +62,10 @@ CVE_CHECK_WHITELIST += "CVE-2020-15523 CVE-2022-26488"
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_WHITELIST += "CVE-2015-20107"
 
+#zlib v1.2.11 as used in Windows binary releases contains a security issue
+#https://bugs.python.org/issue47194
+CVE_CHECK_WHITELIST += "CVE-2018-25032"
+
 PYTHON_MAJMIN = "3.8"
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1


