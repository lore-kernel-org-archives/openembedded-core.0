Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.32118.1608508573185167941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 15:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ty5hoHhU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id c133so8230359wme.4
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 15:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81h4ffvePWBnBck5i5aOp/dZ6KuQqRi6v/GjfWGdsGg=;
        b=Ty5hoHhU2okmRIqjeOFSfeym2wCatQpmaJyejJcJrdr2wbZqR08DTj4E+4O4yF+wbA
         M5b8ksMkLkTM0+0mVR/3ThLJ853/Q/XozIiu1FM19gZW6ee0/grmQqy87xAcVdwxnWDJ
         u7//+2xbwzu6mHUEF9Pr5gWWgfGoKpTdkNbas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81h4ffvePWBnBck5i5aOp/dZ6KuQqRi6v/GjfWGdsGg=;
        b=LCqHbxQzoSSQAusCjLvgdGmxzhD+1+q2EXRQkcPlQBozUgISJ/QnaNxPNB/vsOQmnW
         9Hfz7OBhi47qmEX2EKHjHjwpW/T9AQVBmbDAnFDXAB9Bb5vuybTU7v+GAGtg6ezesW4M
         3mka4Diyp4v59dPLNRrTuVSBbuU/RC1/6aClTX5+RM/iUqdTSpw4X++gPMVJm2v3RHCd
         5pePRsh4LlGJ3PzdupLnVB0ivNwTh7/RnadlrFoN4fBdZdd2jpGjU1q9uRmoLa5F9vaG
         pi+p2a+W41QfUKWem5Ue4385h9/nkcPp3Wi63gE6ZbEwtcbRKEL8zy9wbdw64PSMFDnC
         NHtg==
X-Gm-Message-State: AOAM532Wdvu97+aVtUzzz4qogXbLvgbPGU5/sVrSsBF5i16M6ff9uT1u
	L+Hsm47Tn4zpEo7ZwpxPHBxEwdy/84R0YQ==
X-Google-Smtp-Source: ABdhPJw9dPVGOyOcz1of1hwM4Qeaf/zIVD9UuqmUXA+YFvxoAikvsf5XdnEp7q+shJDRn9W6eQ4FHA==
X-Received: by 2002:a1c:2d8a:: with SMTP id t132mr7296136wmt.119.1608508571532;
        Sun, 20 Dec 2020 15:56:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (6.6.5.9.1.e.9.f.7.4.3.6.0.6.1.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:e160:6347:f9e1:9566])
        by smtp.gmail.com with ESMTPSA id z63sm4352086wme.8.2020.12.20.15.56.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 15:56:11 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/commands: Ensure sync can be found regardless of PATH
Date: Sun, 20 Dec 2020 23:56:09 +0000
Message-Id: <20201220235610.20778-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid command not found errors shown in selftest logs due to changes to PATH
settings which also risks intermittent problems due to IO load.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 6c1535ddfbf..a71c16ab149 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -188,7 +188,10 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=T
     # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
     # hit here rather than in bitbake shutdown.
     if sync:
+        p = os.environ['PATH']
+        os.environ['PATH'] = "/usr/bin:/bin:/usr/sbin:/sbin:" + p
         os.system("sync")
+        os.environ['PATH'] = p
 
     result.command = command
     result.status = cmd.status
-- 
2.25.1

