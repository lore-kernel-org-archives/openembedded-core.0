Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.308.1584983851721701151
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFeNCz1h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id d198so247332wmd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6V0S8LLKnSgNRxOkdaMeEobY763usBn+XJGGUs6CzoE=;
        b=MFeNCz1hUcAxd5bT1+ba/W0Mg5iAV7QoYNu19PAm3ias9RU2mY50040RPu3czgBxSX
         0Fz5qrCPpKeclMDz9stmjlTON1yEbjTxvZ5cNwA2Lvk+JWngiTFuR3JTebHJ42lhkHI9
         deymRziZ62TdJfLynFqeBM+AiYNTz9+hOcJmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6V0S8LLKnSgNRxOkdaMeEobY763usBn+XJGGUs6CzoE=;
        b=KoVi1a2RVHLwutEDWDkankgvbTrqfgPWCKTLWTkTF8L1dwLk3291xtnsYqUuGOnlLA
         a51UD1GljIyP45+xFw56zBwwakI0Gp8ShjQlImawsMOAkGtmZfQQ6BWT6AAT9QQ3DGEh
         yoM1O5QO5t6l0vPMAWwJn8vzB5E3LzZVWC1+N9xyLZK3I93p9/zISoASaABSSkz5b3AX
         ds858FiR2KWIy6MpqWyWWeqngzVdNtZCkvrALkMxly1Aie9S4tsUpTUQfgRJ17VsL+7f
         i34OoczqwJYgOiGSvfUkj1PqFw3kxJUtlml6S2YTHVBAwVRPG7brqz2t9rQvACdCl2Yt
         K4OQ==
X-Gm-Message-State: ANhLgQ3ao4lzq7+O5DLLtfu+0R/Z/qNz4LkxMDQooTVMSInveqKV6eDP
	MxnGNjU0Qmj7WFi2HdKmxAdgw7wPjQc=
X-Google-Smtp-Source: ADFU+vsgWWY4U6uxwkW+yCn2sIfzU6ykBCOheguQT6mDsPe4sLlt/cG68hYN4aPlYqwMGtzAtMgVOA==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr294092wmf.85.1584983847970;
        Mon, 23 Mar 2020 10:17:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l8sm313896wmj.2.2020.03.23.10.17.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:17:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/qemurunner: Don't print a warning for harmless exception
Date: Mon, 23 Mar 2020 17:17:25 +0000
Message-Id: <20200323171725.435004-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323171725.435004-1-richard.purdie@linuxfoundation.org>
References: <20200323171725.435004-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Printing a warning for something which is harmless just causes the
people monitoring the autobuilder more work. Silently ignore this race.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index ed74ea8fadf..7ae309845a2 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -430,7 +430,8 @@ class QemuRunner:
             try:
                 os.remove(self.qemu_pidfile)
             except FileNotFoundError as e:
-                self.logger.warning('qemu pidfile is no longer present')
+                # We raced, ignore
+                pass
         if self.monitorpipe:
             self.monitorpipe.close()
 
-- 
2.25.1

