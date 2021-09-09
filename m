Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.584.1631201778557303475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 08:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iDVTSn14;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id y132so1667758wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iNuRzNEw2FmAbIa+85qORM6lBZa+0T+ikXTTBdsOPLM=;
        b=iDVTSn14//65aLAWczgrLPjRQQdQxDDY1r4OAC1HFiYcAHrjSDMOqQkesRAwDINpKw
         VoDDg3nveDKz0soQvRLA7ogYAfXjddLWrdjxyEKCrTYLrI4s4n2GQzREcYvGcZlKt7kL
         E1vahBmcMBLw0DaJuO7ZRaj2yqMrhFQ0rP8ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iNuRzNEw2FmAbIa+85qORM6lBZa+0T+ikXTTBdsOPLM=;
        b=ypzUt2wvxpfFeGyuJfx1T8qu6XZfIOhZuVXJRUA0TbRO24xTux+45SYBgpS0UNi5Tk
         2wy97cDskLDj7SmgI1mMl3zqeJe2VrqYFA6hf+cME0LgQ/bXbIE9/n1VMUJCKIfZHE1r
         luLuji3EgYgCiTkVK0VYGnlbtiBh2dIilHw+MgNFL1bI1Ou+nWdA4XikgNBkUNC91izJ
         jdMAY71jH64lhEz7l/L/OtFV8yhh3dIY9F4jgDodo09pY2JrpkPmVMNs9Qpwf6Dquz+G
         3hy65wwAQDZ0JQo6z05wDv3LgApnk2uQBLVYXvCmJUOqSsP/8eSytb7aEzkBN+4PstAQ
         3l+Q==
X-Gm-Message-State: AOAM530Tsmd6OlzoSKVtDkcIX649f/KJeXxEbYadjKebhWdD4dghZkaV
	1Shwzf0r25Zl5isEb7emAqSB42K2WSPB0bo2
X-Google-Smtp-Source: ABdhPJzd4Wg4/dauI7VuJKqpj4Z8QisHmXBEYf35F0ElrRRWHx6HS/eDyYTzEY2cVWsnFMQS0a6z0g==
X-Received: by 2002:a1c:238a:: with SMTP id j132mr3658661wmj.185.1631201777074;
        Thu, 09 Sep 2021 08:36:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a4a5:76db:a94c:ced7])
        by smtp.gmail.com with ESMTPSA id d29sm2245173wrc.6.2021.09.09.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:36:16 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net,
	Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Subject: [PATCH 3/6] pseudo_client: Do not pass null argument to pseudo_diag()
Date: Thu,  9 Sep 2021 16:36:11 +0100
Message-Id: <20210909153614.1225570-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>

Fixes the following warning:

 pseudo_client.c: In function ‘pseudo_root_path’:
 pseudo_client.c:848:17: warning: ‘%s’ directive argument is null [-Wformat-overflow=]
   848 |                 pseudo_diag("couldn't allocate absolute path for '%s'.\n",
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   849 |                         path);
       |                         ~~~~~

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 pseudo_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_client.c b/pseudo_client.c
index 579db33..2583bca 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -846,7 +846,7 @@ pseudo_root_path(const char *func, int line, int dirfd, const char *path, int le
 	pseudo_magic();
 	if (!rc) {
 		pseudo_diag("couldn't allocate absolute path for '%s'.\n",
-			path);
+			path ? path : "null");
 	}
 	pseudo_debug(PDBGF_CHROOT, "root_path [%s, %d]: '%s' from '%s'\n",
 		func, line,
-- 
2.32.0

