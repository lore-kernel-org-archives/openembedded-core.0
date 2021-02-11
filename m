Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.11816.1613064156260976209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KUd5qHx/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id b3so4958103wrj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oEO2sMziI6GPPsYyXFY1xbQ6WrAM/hLFeCLw6Apj+E4=;
        b=KUd5qHx/LfIl/yTqkaGQpjk1+hfFhP31j5x0bi5dpLeoAMh/+y29IoCfbVA2mKImzJ
         hbmNFa+QAFTcz+DgxfRASsNQiBqLfoov5JEMQ1gSSSR3zh38g7mX76A6Evq/saeALUJD
         Z50ePFi+Wmp3CrwOFOMZ8C9yGgaYaH8CC94xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oEO2sMziI6GPPsYyXFY1xbQ6WrAM/hLFeCLw6Apj+E4=;
        b=sCw2ZfScDFYN3krYiyBtoFsKg9INxrtwh/oCjx8i53boFat2w0i/6E7zYRryNE68F3
         UZ9hpySvTreaOlpaIH54ynqtsgY1cJ/S9IQMN6d+MQYj4JSdZYt6awu9C8byFbBVgAyS
         fdcXrnAqz7Y0zQaKbUGwUnHo5sAvKcejgBawefXbvWEfihrkcBH8bQW3z3N8y66p8Zgo
         BroqpG8K1sPqe+uk+RTobWuOTuS0mzCDZnUTMqpXPeMrBiQw3LV/z6UtA8QI6/3YojJg
         XuwfaBIzyqXV+IVexUN17E+cfeZx6bfvChc8GqYH4191080SgShxrd/GnOJSQH8m9ZQQ
         O70w==
X-Gm-Message-State: AOAM530Ugy46PJ6A6x2AJtt1hK96ifYJceqYW2s5bcN5lk8y4bQKo/1Q
	HkNZzPaal4+gd3LhrRCQuC95VSN3Q8g9qw==
X-Google-Smtp-Source: ABdhPJzGRpb8003Z99b/XUYVgAvLX3Bzs8/9InD/7HSaJk9BjWaGZD++DX5o4hcefPYOSXs/SggEEQ==
X-Received: by 2002:adf:8544:: with SMTP id 62mr4285173wrh.336.1613064154639;
        Thu, 11 Feb 2021 09:22:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id 36sm6727836wrj.97.2021.02.11.09.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 09:22:34 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 1/3] ports/access.c: Use EACCES, not EPERM
Date: Thu, 11 Feb 2021 17:22:31 +0000
Message-Id: <20210211172233.1887023-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The man page for access() does not allow for a return value of EPERM,
should be EACCES. Fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/unix/guts/access.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ports/unix/guts/access.c b/ports/unix/guts/access.c
index 1cc8d58..4725f49 100644
--- a/ports/unix/guts/access.c
+++ b/ports/unix/guts/access.c
@@ -21,7 +21,7 @@
 		if (buf.st_mode & 0111) {
 			return 0;
 		} else {
-			errno = EPERM;
+			errno = EACCES;
 			return -1;
 		}
 	} else {
-- 
2.27.0

