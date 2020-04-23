Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6939.1587651136545047607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 07:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zq9G8zpX;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id b11so7023978wrs.6
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qGtHUEVWs8+QUgC6YF023YuAAAxjwR6CSMshyv1WP8o=;
        b=Zq9G8zpXgmq0XGC6JcoSIBecfTWqYI7VJ99VE94/I/DGtdkxsUc/zAgSijBylgapxW
         zSooF9IqlPRuT9lrJxgXtLkQdJ5Q9hzV/FIxSLPPx90gyop+4dKdK4PSixz0jnuvFDym
         2QCcZOwFJE79x4MTJ9xRN/iZGiyM5+fbGDJ/vBW0kN33gkWbf4nWFLrLc2C3aDNVcjgH
         xCRg0Shdkozup/0B2qW2MY1KU4OQM9Kl6XB0jTk6HgnkrVqpbv+xwqpy/PwPjnRrka6b
         jFhlpuutoGe2zMKubE/OKxSBGOzO8LkizbxOlA664Nwe5Juy3r+fWpOIm6wQURRG6F6b
         Qqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qGtHUEVWs8+QUgC6YF023YuAAAxjwR6CSMshyv1WP8o=;
        b=WlCoJHTKlytjud2rfusRiQaGC8JT5I7ZeOGSankKAMemDtPeDzE9zBX+qIfDqlvZzU
         4OFtjwAZuB2B500DoX/NLmTLEX6hK9oh2kOGqMOa1p/b3/Ms6Q/UdmHJvZm6X5QCFFy8
         K8dFucVNSVyCt2+s96u+Sw9ezujsNLdj4C6UV/raNCF5JwwQW/srjGyQ2VpAueQJ9gVZ
         zLS7HzFodTjx/zyTiGTH4dBKeWOjZMSp+SWWgwin2TcCBk2gkg0zZ7h0hLivr8mcYile
         TkFMBfsbe4fHgxhF4+cXgfzOTha4r7/+VHonyHoCwt8r21wM/Lb4RqQuO84Lp1vNy03p
         KEOg==
X-Gm-Message-State: AGi0PubiNopg6cPTuw0aFppoto8Rlc0PpZFdV328V8WxX9QmGoSW2cvX
	wuBkVm1BFR4udVyxLB6xCNHi9N0V
X-Google-Smtp-Source: APiQypIDTqsbIdgrG36AFIbLfNA1V8M/TMz/LrT0ACT8z9HAJXezCWsX4EvadsLCGQ/Ju5qtVjl0Ew==
X-Received: by 2002:a5d:4301:: with SMTP id h1mr5323480wrq.144.1587651134816;
        Thu, 23 Apr 2020 07:12:14 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id a125sm3854726wme.3.2020.04.23.07.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 07:12:13 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 2/6] rngd-tools: Install as part of sysinit.target
Date: Thu, 23 Apr 2020 15:12:05 +0100
Message-Id: <20200423141209.82595-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423141209.82595-1-alex.kiernan@gmail.com>
References: <20200423141209.82595-1-alex.kiernan@gmail.com>

rngd.service has a constraint of Before=sysinit.target, installing as
part of multi-user.target is an odd choice as unless it's pulled in by a
different dependency, an other target would not start it.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2: None

 meta/recipes-support/rng-tools/rng-tools/rngd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index aaaaa290742a..084322ac40aa 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -10,4 +10,4 @@ EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
 ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=sysinit.target
-- 
2.17.1

