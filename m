Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAC3C6FA9E
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.3926.1676835071799349989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BhsA7bMY;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bx23so836209wrb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHFtDdAt7ABWPyOWjyhwFsLrYMdXSf2OWjrF5fMUvUg=;
        b=BhsA7bMY/uSYoPvBKMdyopqvEpmq7p8xzdjUv/rdzScuOIxJyMXtwfCT0KIGmSqlSQ
         a8lv93YJbuGHnvCPO9MheJJ9ukRNAfgS75duQ3XwEQ5zlQuhFLj5knphFpU+rEPfvHYX
         D0cCVe21ZEFT97m4WIN69msHHUlmLI3Xg5pn6L6XQC4BRgfK8Xu5PwW/kjfQtD6LBLHJ
         2PJgoLO+LIN03Th5ooXnBmyshYLQQnbFtBma542ce7VxkzkiB1o1fxUCdnvtEqyIS/LY
         5xNAtoaNODC+8sydFWFHOvVEMFjpT9/Q28QkM9b8SX4/Tp4bQAfImSE85oD9PO3ZQqdp
         wLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHFtDdAt7ABWPyOWjyhwFsLrYMdXSf2OWjrF5fMUvUg=;
        b=yuZEUT+XX2w8lB+J4LG3ejFN26EgodbgIuEy+mN4MSJZL5kfLzWNppvzOzEgxZFdoc
         BTjsKZ9225pHyxEYcSMWwwoCUEE4oObZO/asq++wtpJWxm4XDUNzjcxtbsZs0SA0lL3a
         6R3cBmtgQrGk+zducnz1oMTSwa12nyOwawkC0LZlIrW2P5R/VOdQq0jt8Nr9LSCcgIPt
         hdNJXNdCMHat34la0rBKv6XccKuNrGeljv1d8YJp3Xj5APsVTTeFvXmhBAJdxsMDiyEz
         jFUl50NNn8PWkiGCENuDKYAA0UECPxxI2La02c0TYARRm/LWeSeU17mtuAxhMYKMn9RB
         CnTg==
X-Gm-Message-State: AO0yUKXkJ1d5LA2Tb43TJ/T22UllFTAN1HkULQEwbI6pNzHnGYAzlcM/
	epqJZ4zL5Ngs1BKYLMY22U6Rd/kfGjM=
X-Google-Smtp-Source: AK7set/cNS4vfG6B3bJTuQCstHAIdBNTaZZZePjGFYC+FOreUzuxixraO5tAkdNEhT2pkb3g+yRLxQ==
X-Received: by 2002:a5d:6687:0:b0:2c5:5bc0:e7af with SMTP id l7-20020a5d6687000000b002c55bc0e7afmr1471845wru.3.1676835080775;
        Sun, 19 Feb 2023 11:31:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/39] vala: upgrade 0.56.3 -> 0.56.4
Date: Sun, 19 Feb 2023 20:30:46 +0100
Message-Id: <20230219193101.338397-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177367

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/vala/vala_0.56.3.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.4.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.3.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.4.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.3.bb b/meta/recipes-devtools/vala/vala_0.56.3.bb
deleted file mode 100644
index 83f61e5b2f..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.3.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "e1066221bf7b89cb1fa7327a3888645cb33b604de3bf45aa81132fd040b699bf"
diff --git a/meta/recipes-devtools/vala/vala_0.56.4.bb b/meta/recipes-devtools/vala/vala_0.56.4.bb
new file mode 100644
index 0000000000..32fa81a08b
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.4.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "862c41d938543ed3d8d86c8219a61087797193defee8da0c50caf49993c66b6a"
-- 
2.30.2


