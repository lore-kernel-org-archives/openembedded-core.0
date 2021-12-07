Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD00C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.66645.1638882430261674054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ym+AWw6w;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so2229835wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=Ym+AWw6wqwdg5RXlt9umcuSukcBy/ZwQhmULR4dhiYFrxqT0qLrhUhT8YE0KelUQmZ
         G6UsDs3gcC7GHQWhUYy1uJ4W+c/3QAxyLJWvAQuKlE1t3cgI3/E74eKBW0PKB9AxiHPk
         Whoyqae0LVJjOhM3auYl7glS1NkPrXa+aNDV0wZYgoh+rvP/NvFav3P4RW15HwhP8OHZ
         BWpjJLpot73IHcvokxZGkJJlLG29e1ZL1537nXZ/2BfeXA39unr7SvBnOQgfw6mbQT8x
         6UqlBvZi1gD0I8MKrdXIqhAIMWG3FAWwFJGXBWds/szGXMOpLvCHnCVA4xkBoe83ARIS
         9JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=b7w2DUsXeyAzs7ROjwRy4PH5OQZdXsKc2c5XubcyGEWivFhsaC3hvfvZ1C2xabW1BQ
         ZYsVmwyRyGvuLfHC32383jElaU2tiEPV0LHRy5QTmomW8v5m89UDq99Bn4ZpQVkufSPm
         gfuJU23OMpolfqNOxfLatnYlcyOWiG1psVh2Kuf9/OzKLcYXqCPhy2Z06YBIfcckYeDe
         VRBza6dCV/XP5Pnq+y4MBMVRX6Xyb+JyRi4QKGO60BM5m6VPsonkOV62GycXv177fdjE
         X6RrYrpKKBcsDxWi39LXIlY2N994pLlZDjULFQTZChH0Nf6B+muIDl8Y3e2/6inpPCSB
         udRQ==
X-Gm-Message-State: AOAM531dl2pdbgYUNcP7cByDoNi6hQTD306owT9M8TqzEayGl1/l10E/
	G0mL8iTIStonq7RXbQKBaWdF9br+M9ODqg==
X-Google-Smtp-Source: 
 ABdhPJzdLEOdl76gWMAcjFVSryBC14EsUxpj4gyfYlm5mH1dIfSMgsCcwRQ5dSw38Gd5/mJ5Ge2++A==
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr6852750wmq.22.1638882428683;
        Tue, 07 Dec 2021 05:07:08 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/16] insane.bbclass: do not hardcode oe-core path in
 upstream-status check
Date: Tue,  7 Dec 2021 14:06:48 +0100
Message-Id: <20211207130703.3196805-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159287

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..8a47da5a09 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1176,7 +1176,9 @@ python do_qa_patch() {
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
+       match_oecore = oecore_re.search(fullpath)
+       if not match_oecore:
            continue
 
        content = open(fullpath, encoding='utf-8', errors='ignore').read()
-- 
2.20.1


