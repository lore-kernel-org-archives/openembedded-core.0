Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF21D5B145
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3022.1765620156338785008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jj5f+yT3;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2956d816c10so23692675ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620154; x=1766224954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVQcEuYB54MyGo4uk1Si139oEsfiIJnhjNn874AEfA4=;
        b=jj5f+yT34wxHE5nLlluFfAoSW1P5ujrYNk+Na7ZSVyyrFAh7siSwHquwKmD9qxm92e
         N+sVtqN/Bc2ycyQqsWF+rWYIOrMyvgbBeHmzhb9UBN7AOh3MC144kF3LSpI13J6e/zJB
         MlCsPGuZmE1DBxaJRSkbbsxlePRIvHIv9vcSroxbVvjEsHqd+amB1EiQH0EP5prt4PAg
         FQTbi0n+CRt41hLjOiTSvqCuV4yWi3T9rGu6yB9lO6zQxqCjRvyMkYLIskZQ55guiUY1
         YpcK+I6tMbHqfLe6SkfBS0xeETFSXz8HAdzJT73zUChJTnMSKRg0uYyFQp9I7DSS0+kQ
         7qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620154; x=1766224954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVQcEuYB54MyGo4uk1Si139oEsfiIJnhjNn874AEfA4=;
        b=A6Fh4D5kOfgmuE6gfFBjlR4aV6IUt6rZwWKY/qd/Fqa0PoKJ7NM5DuBIMdm9/1P44F
         hBONOC6kOVsqH2WEc8BpjPCbe7lmdnhXLhq2T09+OUV2p7jNNkbEnL4Vg37bOgsZdacs
         UR1T0cVKOLdwxSJIePkRDKJ5gHxIiHzlxfj0KvMhM32hc2tyhDg5lcu0FsY14rAAWlL7
         KRifIP3hCSl3+EkJ1s/TF3QYFVCyUFuAnoUtQH1XkmX2SmvBfITwc3pPHT7YPr6HVamc
         hv/C37fmT9n/S5r64pLlI3fJMwya+GHuLVyqab72MiALYpzzC+Rc/XxuorKEgrOF6G1/
         xicA==
X-Gm-Message-State: AOJu0YxtBK1uVVKCBEoh6+/UgbHkyXFz/EqMAodBgGe2DBSHUUXIiW6b
	UxEABcwHsBQw1nQVa3nDt3RAsZr1oSEO3TIUD61sK5tpH8fricWTCuURTHjTOM6u
X-Gm-Gg: AY/fxX5McMDk9gAjSftSI7xHeBGactQwWvm3xk9cDYvAhz0pgLuWic0VJ+iseVtq61A
	C+SJkviNxK0Mfji5Piqlr54m3xkjP0ExQr355yOFCnuGsvVDYNTSGfCANHlkyN0pADcQVughiC4
	KKFQ7LlyB5emZ8iM1mk1HllFxcP3nSd3zqZ4voh9TPGbjLJbJho+iRB4PdU9jk/gzJKRFAdC6DV
	FVPfhFJBjzJr+YPnlg5BU4vWJHzI2WhoYkpF60omNLP6un0k9aOC+5KprG507uHtAaoLCfREmBQ
	XFJGUrLC3puOkXmvmrRD5IpQLtJXijYtutMRE+ALu1BefqfqoNlzaxnzqlHDGF2vP2l9HJHZ/0z
	UlVh8vBTHS5Z1/mkSfg9DfB+9yF8kQSH9dWUPG1WAAbakxud8t8GehKagr4atOU1svVsINYMjeb
	N3qpLc37F6AwsLdQpBWtIMxaNn
X-Google-Smtp-Source: AGHT+IEGNwD7/kghnejno+2lMEjPKhcl1k1vUYfrTfjeqpWj31CLRNKtW50a9jB/iXT4nLrIFzM2Nw==
X-Received: by 2002:a17:903:990:b0:297:e1e1:beb1 with SMTP id d9443c01a7336-29f23b50d54mr48631155ad.16.1765620154181;
        Sat, 13 Dec 2025 02:02:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][PATCH 62/67] libnotify: upgrade 0.8.6 -> 0.8.7
Date: Sat, 13 Dec 2025 15:29:26 +0530
Message-ID: <20251213095931.2571498-62-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227680

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://gitlab.gnome.org/GNOME/libnotify/-/blob/0.8.7/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7d845bacbb56af078e59c030f92861523cc513a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
index 6ff7ee4be1..1bea8ae319 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c5540aaefb60e1d63b1c587c05f2284ebe72ece7d0c0e5e4a778cfd5844b6b58"
+SRC_URI[archive.sha256sum] = "4be15202ec4184fce1ac15997ece5530d2be32fe9573875aeb10e3b573858748"
 
 EXTRA_OEMESON = "-Dman=false"
 

