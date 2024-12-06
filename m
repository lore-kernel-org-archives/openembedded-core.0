Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6662E77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 17:31:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.43396.1733506286161154844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 09:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atFmeaqD;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so22904855e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 09:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506284; x=1734111084; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4snbm6o5fAnvzAd9hv15ZofMSyccDiRgyHEzZjQREQ=;
        b=atFmeaqDnZNtyLBRYqmj/FQjmxwTfZit/f2BdB5u4f/NLjguZa0GKmsrF9+HZ7MI8y
         jzfFWd+kWL13u1AG16qabPL8VxWCYnFRsuEUKY9T/0CnBHeHX+11hZwkFanUkAWNS7p2
         TpbnLxYUmBc8Zir1/DIdFC3cbq6ggbtS8ZY4YnNz3yToFphQJGT6UIv/ZcIXV70oukSN
         zi5apdyZZzevPaW+y1JnFwbGP5eX3AupqLhw8q+34bXphezHVuPBPViqmX6Gi6FU2rG4
         Ev7IpbYHRm8qJXvSkd39EgzohCuJ2NaNw/Tx6UF022eHziiJKBZABRoMRqFgoQYUTTqP
         kLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506284; x=1734111084;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4snbm6o5fAnvzAd9hv15ZofMSyccDiRgyHEzZjQREQ=;
        b=ssrsxS1QNXD1BhP0Oldg3wj9yn1mX10pAn7H+IRAWb98aOf0EXrjsxa3YyTRrtd2wY
         7Waf1vrBSzGK9oZ6SDgeoFy2U/uHNr88inuvfQYXcVsO5Nma3o9GUXW0b6nr+l7KN+Bu
         CilSOdgbuSN8yKpiVBOEpx9X3Bbp0/tFrcjNU25239MNuxwCghQICpC0hpo7g7DpbJju
         o87F2+tIOw2tvtV/CSIO7KF660i1wpAiP+t8fEIO9Tmop5/BK8x95xQdW/1OQHjQk3qG
         Juf9c9vb5UMyE8pmN/H20XZV3tN15cGrzB4pj+oTmfKXJxyfquyyiLTxtgUhfnyEH5n3
         I9QQ==
X-Gm-Message-State: AOJu0Yw4qAslVm9tn18GU8EJiuw+G3aCMsAUD61HHaLWekg08El+/BqX
	/1aatGkr6lT/g9u7YAC5FiqMnSt1N70WEIP7dXlCSha+FH4kQjXPuVtQqw==
X-Gm-Gg: ASbGncuq8niQ9slZiT23Pou8nzxfJK2OxHysW/934uviIEd3x6zUa0uQlAEMVRL9sza
	dQmiqbp4lshDoSt1u1nOGbV/6hGA0IrSqqj37NrZbWTdpvnTMt6IxgSpchhM9doYORAtCC4ZpCd
	iZI0fwO9e6Xbu4wWqBABseU0WoASqrH8GDQKq8SyI2tZ8qDURBw6IZzEAQeFAKywBbcJ4IOxou5
	1S7MUQ2+uvI3Md6TlhWCN8yXYMJJFqs1zgHspCUaaoS7nFwzyqbtrfsvCQ36QYrNbVd7lxELUuV
	T4qRHBfqb3wZs7yBOGtO49180JJRTKb6a1Nu8v2JbDJbBQ1S
X-Google-Smtp-Source: AGHT+IGZ8a444z37+f3t2GJDACx/uQIst9H+MIBXQ7NPBpqOPm7NXIic2yQlPDmziDjqGL2fEcbtcQ==
X-Received: by 2002:a05:6000:79e:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-3862b356212mr2836161f8f.20.1733506284528;
        Fri, 06 Dec 2024 09:31:24 -0800 (PST)
Received: from t460s-2.fritz.box (77.118.58.106.wireless.dyn.drei.com. [77.118.58.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862294b1e3sm4993141f8f.109.2024.12.06.09.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:31:23 -0800 (PST)
From: Robert Berger <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Subject: [PATCH] go-vendor.bbclass: avoid QA errors with absolute paths
Date: Fri,  6 Dec 2024 18:31:19 +0100
Message-Id: <20241206173119.12422-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 17:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208434

avoid QA errors with absolute paths from go-vendor.bbclass

Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
---
 meta/classes/go-vendor.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 38ea69ab50..12667b2d60 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -14,7 +14,7 @@
 # folder. Additionally a manifest file is generated for the 'vendor' folder
 # 
 
-inherit go-mod
+inherit go-mod relative_symlinks
 
 def go_src_uri(repo, version, path=None, subdir=None, \
                 vcs='git', replaces=None, pathmajor=None):
-- 
2.17.1


