Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E4ED3C92D
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 11:55:58 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.43981.1729511751673096884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 04:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5isMSrR;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: badganchipv@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so3390647a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729511751; x=1730116551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=d5isMSrRwqrr/vv62EOGfYMQ/xf0/+OBmJOmg7thX4RyJPdaL9sJsnqQp+gHB8tMDN
         OgpmH2uYWp3en+e0wK7l8RK6FwUOOIQ30BuaV4pTYNHg2HNkOJuRKuRhQ0Fo4hkX+Ofe
         g74hT+Wb068hAPAZPbM5yFJ+GJLhREVMEyImKW5lEzbvQpf4f8yb301d9akAKnLzo33O
         YLpI92aXmcusPJvl0KlCtBUqpa5sLGEEWFomihsYzhu7rVrFKbMO2HoyD7KLiEkCA86o
         rlIjlJmlR5bO+HjwtWBdOn7XNAUF+QH6vVkJgeDmObv3PcqLQCckvmM0rUiyRtou7wo5
         bshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511751; x=1730116551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6qY2aa8CMrtJcNNC6gkVSPRf2hmZLSi2nS+neAGT68=;
        b=EwuNvxKp6xWMMBQtVT6u6eh779w0vjVl7gTXSLexvZn7ZgIrwG7DuvyJ02zTupmRHt
         3RBLPol3xZ0XINbBygNf5Smi6rj7KEdmimXPLxgmI+G0Msd66iPqi3lg64KzsHumxhvf
         JY/hE+/X73qT07opOD2okZ7VaOXTwJj1tfPuEhXm0xIdmXuWqrZlP73TOiCOl3NgIvJ/
         U9AJc6ONRurML2RKO0cvREFHgYiI81z+GlcUcwqxI2scSlTQcoonJFAURd6UdbqXLZeZ
         xJC1B9DyxRCluZn4A884nSctWDO+0osyLsBF/PTLQ/YM/JghUQMuBfGDJqQYlhoqKGK9
         ao+Q==
X-Gm-Message-State: AOJu0YyZkreG5yfbvEb5T9SRHcrlcTjC8xdQnW5CEu9U3SQQVzBJ1p0w
	0BNl7d75bWNhH4vhoFkbaUQX5utSbdiAdt6CRqBuzsJOEWnT4VHm8crQ4b6V
X-Google-Smtp-Source: AGHT+IEkQWjlp1wO+YQUMLvwRW+7CjO3dl2U6vgySzvHOJdBC0H+8IOIrgx+E+cgZNRCJ3QjLS/OGw==
X-Received: by 2002:a05:6a21:1519:b0:1d8:a3ab:720d with SMTP id adf61e73a8af0-1d92c334b76mr18130813637.0.1729511750892;
        Mon, 21 Oct 2024 04:55:50 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.83.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d7595sm2677131b3a.110.2024.10.21.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:55:50 -0700 (PDT)
From: Pawan Badganchi <badganchipv@gmail.com>
X-Google-Original-From: Pawan Badganchi <Pawan.Badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: Aditya Tayade <Aditya.Tayade@kpit.com>
Subject: [OE-core][kirkstone][PATCH v2] e2fsprogs: removed 'sed -u' option
Date: Mon, 21 Oct 2024 17:25:39 +0530
Message-Id: <20241021115539.160260-1-Pawan.Badganchi@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 11:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206118

From: Aditya Tayade <Aditya.Tayade@kpit.com>

In embedded box, sed might be provided another providers like Busybox,
hence use generic options whenever possible.
/bin/sed -> /etc/alternatives/sed
/etc/alternatives/sed -> /bin/busybox.nosuid

Here used 'sed -u' option is not necessary, hence removed it.

Fixes below error:
sed: invalid option -- 'u'

Also added 'set -eux' option which halts execution of the script
on any failures.

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 279923db8e..1857a17189 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
 
+set -eux
 cd ./test
-SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+SKIP_SLOW_TESTS=yes ./test_script | sed -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
 rm -rf /var/volatile/tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
-- 
2.25.1


