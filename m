Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE07EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 18:13:35 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.2989.1689704013053116581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 11:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=1wDw36/1;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-63770af327fso41551676d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689704012; x=1690308812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIOy0J2K9449mon42C45dBVNno9lt6IU4HrMjhDqqbE=;
        b=1wDw36/1JYyQm1PZDpkLPq+/8mPS7PXZQMngLsTaTAFlQKWsOjmxJYwiOPwBX062XU
         VDrDhC/nMYuGIuk4Z0TxbeI6VuGk2XLA3v/rGBnYgF5WU3L/LWc4igfP1IRY5TCp8mFt
         N11FS19m1GtmpYiJIcx+4WT1U1Mzn/qdwnbgXu5U7UI33EcVTxj6dtzAjxBhfWgJbOCv
         uqoKGv/WVey0K+fITzDlQ/3Uztxtx/Zkd2HftrNXl1hW58Q7he4jJofNKjnN4/EcQqJv
         Q1PIZd/G3RduiNq7b1ob42M/8CgdSuztQfmpVsp1g8QBr0n3NDO/9mx+vAw1FEJV8aGs
         id2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689704012; x=1690308812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIOy0J2K9449mon42C45dBVNno9lt6IU4HrMjhDqqbE=;
        b=Fh6h0U2vtOECogpBMBHg0Qe9hFt9+8OpU6M5tkDPX9NZlT3feWZy2fY+YmUycYE0BE
         9BKJzrAR5yVn7Phib90cj1PdEafKPD/NQ9KIk49yh/UzE+EqVyiznHPgp4X1jQG2C/TQ
         NO7TYiRzSHthScgIFJzu81jP2IseGNnlKZY6q1gTzznrtCYvN8U0iGsuhDj9Sb7qsIh1
         tKLOrXfLepEFikYM/yuhkCYYgTodjczlkEuxN3GYFR3gNk6/DmKirKPaRlCEgbtsJ+RW
         uO780NEdSoPi/60NLKEigI7HQYzUh3BGXkwmuoxyrZVF7AUwqwq4znYnrW06WejOpL70
         HJ9A==
X-Gm-Message-State: ABy/qLZxJiYN2iJjWS+RWoavNQxkErH8jlT9ZtCwQ/F1MeJdUjXIbZvT
	H3WBebwkF66Od2GdXgTGy18430C4+YFXBRogW/E=
X-Google-Smtp-Source: APBJJlE9gKcyG+gtnkodbkMi0VH4klMgqF2HFZFLc7a4ZxucAYkkGrH7mVUJZ2K4anbFO7/r3WZrdg==
X-Received: by 2002:a0c:cb83:0:b0:63c:6efe:ffb0 with SMTP id p3-20020a0ccb83000000b0063c6efeffb0mr13072784qvk.65.1689704012064;
        Tue, 18 Jul 2023 11:13:32 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id t18-20020a056214155200b005dd8b9345besm894114qvw.86.2023.07.18.11.13.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:13:31 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-editables: add python3-io to RDEPENDS
Date: Tue, 18 Jul 2023 14:13:30 -0400
Message-ID: <20230718181330.2935987-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 18:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184556

editables needs the ipaddress module to function, so add python3-io to
the RDEPENDS list.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds to the RDEPENDS list so that it doesn't overwrite any existing
ones by mistake.

 meta/recipes-devtools/python/python3-editables_0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-editables_0.3.bb b/meta/recipes-devtools/python/python3-editables_0.3.bb
index b42ff06872..93fa195637 100644
--- a/meta/recipes-devtools/python/python3-editables_0.3.bb
+++ b/meta/recipes-devtools/python/python3-editables_0.3.bb
@@ -8,4 +8,8 @@ SRC_URI[sha256sum] = "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16
 
 inherit pypi python_setuptools_build_meta
 
+RDEPENDS:${PN} += "\
+        python3-io \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


