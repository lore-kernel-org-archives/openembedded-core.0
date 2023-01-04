Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE36CC4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9382.1672830372763906166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cPOZ382q;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id co23so32594661wrb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvh/HSr9OKpfxgB1bqOHtiXhdbKzOFKBcl0ruOvwpRA=;
        b=cPOZ382qd3Sts1X7SXi9t5c2QN5t5hGZr9Phh6+8j81PiLR6EuBvJpObMbv3cclbb2
         LugemZYQQyd9LTzWmhGjiaeROmSYVqhIzaVktKIoPiWaneeu2Pm068BSmvGS00305DTq
         4Ppbhu9TKZ/mrScMTQTkF7+IvDoPzWKPwdPKDUxP7VUImtm1t/THlz1mP2gjFxsT/Vdk
         OFvmlZbuV7/10BiY8vrZ8BfkxcUoJjUjiNrKidhPrE4Gf1JUmOHk2f+VDKoVnP3KU7bC
         553Sq28jZH/PNu5BcW/7XfJUKGj1nFUtvzHLoPPxR3yUh18O8NfhrMvNeiz0tTqCYZFq
         qkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvh/HSr9OKpfxgB1bqOHtiXhdbKzOFKBcl0ruOvwpRA=;
        b=afom9pv9pxABhYwjdHNdQJF1pbJ5p0nRaQU53lpCpb6oQjyqzkM2guVFAWlMCIK+QX
         MJvf8fPrRhy769c1nsMvTjn9Z5AND/85+1tH4Uyv4ZaByiPeF3z8k9We+6lHLJQrKcAZ
         Hu8N//MUEDJfz7HW8OdaIUbXTI5bxfjqc5dH2OsKihz50PeMijpvZerli5TANxrDMpc4
         ihyPWiexBn0vnZHQf84fYNW+oP0v0E+4+QBHVgGYV9PAnXqTFtHT53trjvt+I5okiNOx
         Pm0vfuQII1GLPJcTEu8OIpiIvwB0scLWMwvdEtmyYwtPxWRPqUxOrS7XWV1X4TOKdFp/
         5lyg==
X-Gm-Message-State: AFqh2kprR/PemeKl8H7224zb7s7jFjF9TgA5eFFt8BmJr9wrqokN0JaY
	LcNpaDYjzOgy06nlKAIv/ywgir4n1SI=
X-Google-Smtp-Source: AMrXdXteRdcyDe1yI8usB5n0HytCYojdHIQx0zilUS4fI3sIeAcHbn0xqUDZeJnXSfhCS3jZfrKqOA==
X-Received: by 2002:adf:ed8d:0:b0:242:643e:6954 with SMTP id c13-20020adfed8d000000b00242643e6954mr30739050wro.14.1672830371241;
        Wed, 04 Jan 2023 03:06:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/77] python3-pycryptodome: upgrade 3.15.0 -> 3.16.0
Date: Wed,  4 Jan 2023 12:04:55 +0100
Message-Id: <20230104110548.2537259-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175409

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb
deleted file mode 100644
index cabe9189f2..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.15.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "9135dddad504592bcc18b0d2d95ce86c3a5ea87ec6447ef25cfedea12d6018b8"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb
new file mode 100644
index 0000000000..15ee31c66a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "0e45d2d852a66ecfb904f090c3f87dc0dfb89a499570abad8590f10d9cffb350"
+
-- 
2.30.2


