Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.4509.1605955846860841541
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2020 02:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ItsWPdR3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id r17so13543075wrw.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2020 02:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sxk832Fi4beJoOiVZPV6FSKThKC0q1k7BaqAvADCf0I=;
        b=ItsWPdR3IiWrtSh9/1NpFvUVPXwrzA+jOhdT1FdwRuuTNPk9V2OpPopoHunGMIqaiW
         5/9Vmq/xBSeW2y1DGHsrHILS9F8nTYk3QBpGuft5FpBu6jBmV+QR24QwC/C5yGLVmGsC
         +8q/xLRIgEO5c6RNv4Ag2DFSrSBY5p+ywCi8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sxk832Fi4beJoOiVZPV6FSKThKC0q1k7BaqAvADCf0I=;
        b=lpu6LF7qv1gWljswCNaB5H4A/QA3lgHmx6I+ARf+qNySkKGjWcbmBZpnhAPTvxG8sz
         3btRMKHOba+nJxvN38hl+3nVaeLl8MV4IMHZLHeekMFWduIflJUXcpEc2uPu8BCcq/tG
         1E3/XmNxszSXPlgkUCeoRtoy7I9XvAeO7KEnbw+lQuCt6FTjn1+dOFsUiQYiePDxKJbv
         7N+TOu186as4HPi79A/jmxjv2TpLSr6mggbWhHX4Ti8mycNzcYyhTP/gBlSuwHyJ2FW/
         bLdT+iwts7nnIEhWeIG9JLVuXBjaHDG/ZNyYzoL7zFReZZpOlqaeHGSDli/mHypNjbtb
         KyKw==
X-Gm-Message-State: AOAM533CzpGflN9P7DL8G91t2S7QiLzGP7JkrEElNV/t63+DlJBmo5vy
	zaNeeoMgTGn5Y2WxmF8XK+4rZZZPtxmE/A==
X-Google-Smtp-Source: ABdhPJyRWvD1o0AWYXDh0FqhVU7J8pwU8B+XN8ktf24pCjdGmTlr/OtETqFMy6D+LED6oLkdzreuew==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr21832389wrt.358.1605955845073;
        Sat, 21 Nov 2020 02:50:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id f16sm8342218wrp.66.2020.11.21.02.50.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 02:50:44 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/commands: Fix compatibility with python 3.9
Date: Sat, 21 Nov 2020 10:50:43 +0000
Message-Id: <20201121105043.1208940-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python 3.9 dropped isAlive() so use the preferred is_alive().

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 8059cbce3e1..6c1535ddfbf 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -125,11 +125,11 @@ class Command(object):
 
     def stop(self):
         for thread in self.threads:
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.terminate()
             # let's give it more time to terminate gracefully before killing it
             thread.join(5)
-            if thread.isAlive():
+            if thread.is_alive():
                 self.process.kill()
                 thread.join()
 
-- 
2.25.1

