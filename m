Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.208.1616082590952177853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 08:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jto7zLyq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id 61so6040783wrm.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lsY9h0ZVvFqfyoXtUGFPVO2z+jy9qgGGGA/BjkmabcI=;
        b=jto7zLyqRu2GWfNSan0Bl64U8NUROPNGEVyke3brY6jhVKxs0seuEHYtu3oEmbkBDm
         dWhgdn8ZCZBZD+DVGh3d4lyoUPodLED0/hL1cnOeH4Yz30m/2HfTIO7sgjZ5QPyKHDBg
         DV/kqqUvMEl0drjqXL+BKglCzYFtrZmZ7+vFaUO7wmcyX+Ylse98CDluoI7xA27WcRjo
         k1x/oGGYMYIV3pWfhkXXQFfX1is1HWSthW+L1WgLLNh4Su8YcJ/hKTa71hkdYOJ7Iq7y
         kmE3S0OpJxCR3UeT6V4ZXg/X1Lk/E21uTwUEOzNXmptwA+ZiLN0SCPbFl6o9Cf82f2bf
         bSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lsY9h0ZVvFqfyoXtUGFPVO2z+jy9qgGGGA/BjkmabcI=;
        b=JRMys46esyCNkl6vFz3lqcsCCsIgbd5I0EE/h55QieLmZqR7kBxoP0GzSTBMVtlHT+
         eA+AkTHm1jqaGfC9dmJT0KmI2BJM3SbYodvnU8GjqaUcS18UkN7Y31++0ei7z3KeaSAE
         OOkGbHMWPRI7cked6rBXPxA/OihLrAkIdF73GYZyZ5v/VQVn94/Gj2MfQMH6jXxikJq5
         8CdrCmz0QbOtAqa2xRdytH/+m8stJVMofblhzreBDLv7bs88J4jRNQ2gia2oS8HWFY+p
         CDT34luIpSdD/8IZ2G/raUfEZeT/BE05+yvbKig44H0dDY183UmYvyR8h3xuP2xSAPgA
         ajqw==
X-Gm-Message-State: AOAM532GPpEMwKQb1r4lz0N/Ie4ATd5LRJ1Yo0J1Ra1Rvuu4eAfJoEUR
	c0QQf3Hy0GKTEyhHkNbauM1QY2nArJlDpQ==
X-Google-Smtp-Source: ABdhPJyZWiAFCDgsvv6LeZTdpTowSIxWmgh+gAAy0Cz3HKrWUS7RDrWpBCo57VCDZ/eos/ncMGmzKw==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr9979909wrm.321.1616082589139;
        Thu, 18 Mar 2021 08:49:49 -0700 (PDT)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.38.8])
        by smtp.gmail.com with ESMTPSA id w11sm3449905wrv.88.2021.03.18.08.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 08:49:48 -0700 (PDT)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dorinda Bassey <dorindabassey@gmail.com>
Subject: [PATCH] devshell.bbclass: Exceptions displayed within devpyshell
Date: Thu, 18 Mar 2021 16:49:40 +0100
Message-Id: <20210318154940.31606-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Dorinda Bassey <dorindabassey@gmail.com>

If you type something into devpyshell, an exception should be triggered,
but that exception isn't printed out because it is not being flushed out
of the buffer. This patch fixes that issue.

[YOCTO #12156]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/classes/devshell.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index fdf7dc100f..76dd0b42ee 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -128,6 +128,7 @@ def devpyshell(d):
                     more = i.runsource(source, "<pyshell>")
                     if not more:
                         buf = []
+                    sys.stderr.flush()
                     prompt(more)
             except KeyboardInterrupt:
                 i.write("\nKeyboardInterrupt\n")
-- 
2.17.1

