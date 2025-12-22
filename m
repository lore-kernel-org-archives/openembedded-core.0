Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F8DE6917C
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87661.1766434080221174563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNE096MZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b713c7096f9so710115766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434078; x=1767038878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHfeG3y699asaodFRmVyZOXyH67ZzCSkxjB2wkWskrU=;
        b=YNE096MZxx3C5ZIZzoP+Yr4GsnLUWEcISlB45OIpBc42m++KIuGy2Wml+AHJN1WIIO
         3XAqAblU46RQYgUGAqCEC3ZZdwjjK+XPiUtKOENGgnt6wIYUbjeAjNxSO6I1VtMbMsUq
         z3+Z3k7AUSSxhIrMcNLpY9PHtjIoNMfjb+GjlL8dEZy2hBr2j0gpSaqQ8oQjBChZbQmT
         92wC+ToKQ6ANZJsrzEOpu24yKEaSwk5Yxz9X9WlsgqL7tob4NFAZtFDFS0zvq/OYos3T
         0RebJChuwNjchM7P2r3y1m+LLgcKFVnqXGmrcS9dN1s756OTNIuwh7vCfsr0WDxGSnFU
         LowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434078; x=1767038878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHfeG3y699asaodFRmVyZOXyH67ZzCSkxjB2wkWskrU=;
        b=K0uJnm+NW6iW/e/gpXSvBZauMJlh3oWCyCPHT+lEJBwcrYWPdxg3QZ9o1co0vl2r7j
         QDwcJpGnBJ7YEf7kqxwoQB8h/xsakf12zroUyT1i1vYC6rIAKftDE+/cmZW6/6PCtQdh
         rsjq6xuz17UvbPSrcRwiPzVpmzzsSp8YkoA9JspY6LahsPnkrTMLKxpTKhIWyGKLc8EU
         o8wU+S+ALbuKmOKpA05nc3G74n9zE+/4p/55HQjZkWt1tBtnmDZvaffj/e5ggpEAjCfr
         n9nI1b+R4tHqvAE/ZhC+qg26SwQtj4BxsC+5DfNAQM+n8EkkE6d87yzhczkxVircY98v
         mRjA==
X-Gm-Message-State: AOJu0YzY7N+z8r+uJrC3mR5rzYGlPuz9VqDG3l0eDaMWUjfqeMWfZssB
	jvxsVA8LFQvmTZUdLoTqzOeZZtShFlliJERu86Th83WbwC9YrHXDjE79F8rgwA==
X-Gm-Gg: AY/fxX6KMmbyHFJgCg/OAkjjiLKcpWtWrl4OSDyo0AfcnumlpP2KCFULNXCrPT8d5A+
	5iSLhX1hSUoZEK+ZsvNEft3ZOFAGaPe0hJ0gawjLFmiVmarCxUkiKuLxWH5tQGNmP9plrL6RqIz
	KAGKoey3UvUDM/WSRAAjlWal71grjWp3T5Qh3hEgUzFWyOugu531Zxy3z4//N83aqdlB/yT+90Q
	vKu4q2Vv6RDMb7cwe3yiIGPHS7oZUvidyFAkLKEQHHgsFzn0+r+ca0u1lj25xOVkFfmDFRJ3DU/
	S2VSp7sDbxSrR7+g15UZPEu6/wtwocAR5QLPJhGHYxNDjAScqGoZPNCmgg/hdWWdsmZKQ1bmkxE
	ektSJQ/aAouTLkiQtIn/fQVQqThMXRZo+NzX4KTJp5/ylcqxlMCk3h75uT/tKI0Ey/MYZFLFuZ5
	/zoi4wxmC/fMWogAnOs6djxo7hrM40j9XvAqEeyArTJcYVpMU=
X-Google-Smtp-Source: AGHT+IHj/r5rvbsrvw8hi3mMFSSDfGqskW4/H5uAat81gNetx9T9cDjgPGqc4uVNDViZHtneYgOhmg==
X-Received: by 2002:a17:907:72ca:b0:b7a:18ba:a63 with SMTP id a640c23a62f3a-b8036f2ab43mr1151628366b.19.1766434077885;
        Mon, 22 Dec 2025 12:07:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 019/114] hwdata: upgrade 0.399 -> 0.402
Date: Mon, 22 Dec 2025 21:06:01 +0100
Message-ID: <20251222200739.2278706-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228344

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.402.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.402.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.399.bb b/meta/recipes-support/hwdata/hwdata_0.402.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.399.bb
rename to meta/recipes-support/hwdata/hwdata_0.402.bb
index 81dede96ea..826c9b2e32 100644
--- a/meta/recipes-support/hwdata/hwdata_0.399.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.402.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "7ba0e54565843faee300ca885699e4c42ed674b2"
+SRCREV = "d263c183dd429bbe1572a91a8cf180e84b8341c6"
 
 inherit allarch
 
-- 
2.47.3


