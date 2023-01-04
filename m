Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFF9C5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9362.1672830366643340608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m0cg8T1m;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d4so24593674wrw.6
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/SPkBIqOEILDduaSxJftswVmB0J1P2XKvjuvDGYQgc=;
        b=m0cg8T1ma5UDIjSPeVR+juZPP98W0pKgwZFSbVvXW4s4xWKOmjYgZaQsGAKOVf2Q2B
         sJfg8YVoxndgDOdAgmNQ2elsoIWLtdXtMP9s1Fq1qCaZ1pTAKhxOcyHHAUw8wOapCks4
         iowtAAVvT41gpdxHeHdWHU9IC6FHaDzqVX/locVFGHNM7EAdK/rx9osR19TwEdRNw/5C
         m9RMQZEEgGtftvFl8gWtiTJzCatlQ7vOxHNHmU0kRsnxLXyfPpvv4xPmNkpZMrYGkKqR
         l6MakouhREQWFurTeUtN35BG3rJ28GxvwRlg/T099p24ZWCqA6ruP01nPoaQo+RPQROE
         E7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/SPkBIqOEILDduaSxJftswVmB0J1P2XKvjuvDGYQgc=;
        b=cpKzR82XtGrb9uUMXSr2GRM8KvqJm2+PdUEQ4qgbNobBjNhuD3LeECiTFZKNE1bUci
         xE4yIMkLeseJuXvgxxC3ACRHjvTnxiikmsMu7UXJBbgux4O0DddIzdmiGEpRLWVlxh2z
         ynrNVN9bZs6ngMvBEToyvp7sDN7vxQL/EE65GTwpJ1i9NeBNEUHVni2ETW3AYzyOpB6y
         un2t/8WmqheliODPXkuW9Ilc58KKVkCmflbKbY6cl3AzcLugZfjG2XaZCXKIOy5skQFQ
         59fjcnxK+p1s2NYT55bmHwBS9+vT4ky+aH0EKShY/UA25rB3m1+q9pgym9cit+fBJ5Eh
         KxXg==
X-Gm-Message-State: AFqh2kofaI9ZFv+sZpl3elB58vsQBYcV4OevY4ltZwznf33AAaGtKlnG
	GbtKH8TzN29tx6OJbAB8zEYnIs8al8Y=
X-Google-Smtp-Source: AMrXdXs/oN9aOeiH6csyPav0KIrGnw+wcJITs34861ljre9Q76yv5RVzFuGwEshvgo8a1D+QS8+aWw==
X-Received: by 2002:a5d:444d:0:b0:242:7089:ab90 with SMTP id x13-20020a5d444d000000b002427089ab90mr27443005wrr.69.1672830408343;
        Wed, 04 Jan 2023 03:06:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 73/77] python3-jsonschema: depend on rfc3339-validator in all cases
Date: Wed,  4 Jan 2023 12:05:44 +0100
Message-Id: <20230104110548.2537259-73-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175458

This has been the case since
https://github.com/python-jsonschema/jsonschema/commit/622c7b276e01d24b5569ab27cfefb692ae91012e

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb b/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
index 392b9584a3..24cde3711c 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
@@ -19,7 +19,7 @@ PACKAGECONFIG[format] = ",,,\
     ${PYTHON_PN}-jsonpointer \
     ${PYTHON_PN}-webcolors \
     ${PYTHON_PN}-rfc3987 \
-    ${PYTHON_PN}-strict-rfc3339 \
+    ${PYTHON_PN}-rfc3339-validator \
 "
 PACKAGECONFIG[nongpl] = ",,,\
     ${PYTHON_PN}-idna \
-- 
2.30.2


