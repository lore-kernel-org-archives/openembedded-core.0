Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BF9CA0FF2
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 12:06:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.19119.1756382780420979877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 05:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w5gB5eut;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b5d49ae47so4746375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756382778; x=1756987578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37Why9HGaGsAyF9TK7C3607SmvdgN1O2aEGhjPNzJgY=;
        b=w5gB5eut1aaJTVfjqagCX/Cv5eRbcE+8Gfh0JYymqiJkmhItn5ae2TSFgSxQDwvRGk
         aKZ3ngQCfQiRk4pt1uywfFmHuJ1OOeWapKjbSyDTA4AoaEgS4HP4uEXZ0Rtpt6g45xQN
         zGHuz91yZ56uWoQfzAnPoFt9b13qvn2XqOO60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756382778; x=1756987578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37Why9HGaGsAyF9TK7C3607SmvdgN1O2aEGhjPNzJgY=;
        b=nIlDKh3HfhfNSWuEDZdau6R6OcPp3rf6ufVOUEy0C/0KvabaN4C+X8ji+VadNSq+mz
         OGnhcAjQUGRAH/5mrkbfNzyuW/+swkBXePQsWykgnfNIHmWv9mvAfl7VEEI9vXATkTeL
         thKvn7cO4mlWN9iTDufu3BEotQCrdKz5TppmB1QofRz+T3qMgfey5DuDhA9wTR4ZYiFo
         wQr4q2QQcW325J2QNMdp/OjjurH7oLBy9D+2oXNFnnZ/LJaePvestAvj9OGoGY1A4P65
         6EVqPxsMIMC6OoowhZEoQQ0br/Tg+4x7sGYed+gBGceMcOhWx4QhA40nL7snPR5+kZCf
         OdiA==
X-Gm-Message-State: AOJu0YwmBR7TjseL7i6J80XVJtBNT/upSqTGqwROmhW6s40qvFup5kf/
	XGl2nj/Px9bOXsay7+oWsc7MkzUFLDKXfavfL08dsDy4P9O4p8I9Nh0rnBoYB/DpaJj27DNPMxG
	eBEDR
X-Gm-Gg: ASbGnctSaWk1TN00ZXBkhRGJoM2+lmDFRQVwSX5qWm+b0f4rPgEx6jAmMj61aJBpzmr
	cR/jXNOBL08PO444aeA+p5wQdhXW6czVtmt21gYKbTlNHEMsxyz6MKkmOLFWUGmOSShpr3MlhsK
	bY+fnUPCa/Mv98X3jBw+GcQBGlLrPz1qpXr5uyZ1fiQlYxhBbwMWdEzjfVnZCKxEgwwjUumVdmK
	qKlov0HbTYOp8dESF+cCSDUZiatA8QIqje4pXxBTVouZUN4XZ6BM0/SUXAmJyRLnbZgjNaI9cLV
	GWFpgYk6TK+J7A6ns3fD8xWvGsm2uz1MQQnCYGnLf2YZWhEsZ3zfUarHkSQ5j6VKRshGXrmuhQ5
	Er1IEP+rMpg0/C5kbyfgMJI1pH1oJQgbi5zU22eTpaS/okViHX5XTE3K/YGDG1vYv5VLwLNm3D+
	QEJFnZS5V6+kCOBrfUs3yxzcfC5A3u25wxDqVB4K6nmep01cCoOmmx3YSM
X-Google-Smtp-Source: AGHT+IG70r8ZZVLOl7QGUwN9zxv5IQUH6vfKJjHngkxV/AhsqGqBwh/gjBVta2vnMn4kEaDS0+WfEA==
X-Received: by 2002:a05:600d:108:10b0:45b:6de3:63f9 with SMTP id 5b1f17b1804b1-45b6de36594mr37193945e9.30.1756382778506;
        Thu, 28 Aug 2025 05:06:18 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b797bb7b1sm31728575e9.8.2025.08.28.05.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:06:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [PATCH 1/2] ptest-cargo: move run-ptest rc variable initialisation
Date: Thu, 28 Aug 2025 14:05:43 +0200
Message-Id: <20250828120544.2982231-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 12:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222567

From: Yoann Congal <yoann.congal@smile.fr>

ptest-cargo run-ptest can be generated in two fashions: generated from
scratch or appended to an exiting run-ptest file. The rc variable used
to track tests failure was only initialized in "generated from scratch"
case. Which lead to errors in the "appended" case.

Move the rc variable initialisation to the common code of both case to
fix this problem.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index ece25ff1eb..e35de1042e 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -103,10 +103,10 @@ python do_install_ptest_cargo() {
     with open(ptest_script, "a") as f:
         if not script_exists:
             f.write("#!/bin/sh\n")
-            f.write("rc=0\n")                
         else:
             f.write(f"\necho \"\"\n")
             f.write(f"echo \"## starting to run rust tests ##\"\n")               
+        f.write("rc=0\n")
         for test_path in test_paths:
             script = textwrap.dedent(f"""\
                 if ! {test_path} {rust_test_args}

