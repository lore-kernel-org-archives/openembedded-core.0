Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.28724.1612149790384598364
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 19:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hTyrU1ut;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id 7so15026174wrz.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 19:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MYvSeNnWNQxJDc5yisVzHGD7ihaNAGTpQ/o16Fj/yzA=;
        b=hTyrU1ut92C6as/laxNkQ2dJWijwCVpflUQm4rXznefzEDw6j/F/WUjIiFOEmjqOQx
         m0cRJ4aGnOzworsbcJPuwjDlcgRZaWXC2TL8TwH/S2X+mhj9qk2FCE+ZF1D0Q3VZ3Rn7
         1tUi6PvhLTlXikNe+FaBSeq830QMkTMa2ANBOygOmT2FiPvvkzk0YEqjHHCqJ+kWTp8m
         x0/+m+Uq5MJeUmgNQbY4938+EkB2pJm59gRS/X/AK2tmOtaA6Izc/cVMN3QSkexstRsm
         tWgMohtIHDEZjoK16SEf+Bu57dB/y4DnL7PfoGDi7awfL5xDpCqNSaEAx4ugR6bxW37d
         aBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MYvSeNnWNQxJDc5yisVzHGD7ihaNAGTpQ/o16Fj/yzA=;
        b=NiosoxxjhE6hbRNzd+1DfwW998RFW0xZSlCV0oWP6q5eez3ac3pf2I1rbAMgSM3VHA
         Gk6kqEyI4f5DC4Ja6moDIilHKPjCoaUWwmUd1iwSzCjyxjAxTaRl38J4IaAdF2Jviyxq
         OmEQgI84elByK5/KboFfPUscxHw7Gmi3fxn9LYqwBfmHfuwLME2H+THxBChBakyeLwh/
         0GwErKV578FepcqJx2MMYxj76uJZEUtaAQ5tO9QxrMEROAeVJXk7iuGNhttUjg0Uo4Zm
         +0+FwLsJ4Kg1KFA8GNmKT4Yv0VCzo2vKiw414Qo4/Z3MaBf3NhGaexg9xx21n+wAFBAY
         3FLQ==
X-Gm-Message-State: AOAM533yA9+iSbuFSWLUt2DAi8yV+M34iRtSu0ov6DDOCCkQIcWbN5bT
	2CHDNsuTEu0AxXNWwMCYLc6tdIwmmy0RjA==
X-Google-Smtp-Source: ABdhPJzjCYDSi5KALcuISPWiXheM5E7GcbmbX2vl5OEi8V99tezJhvNee+HmzN/uSKosPn+nYNVMtA==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr15808946wrr.93.1612149788618;
        Sun, 31 Jan 2021 19:23:08 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.13])
        by smtp.gmail.com with ESMTPSA id 192sm21301540wme.27.2021.01.31.19.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 19:23:08 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v4] sanity.bbclass: Check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
Date: Sun, 31 Jan 2021 22:22:56 -0500
Message-Id: <20210201032256.28989-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added a sanity check for when PSEUDO_IGNORE_PATHS and paths under pseudo control overlap to avoid random failures generated.

[YOCTO #14193]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v4:
-Edited pseudocontroldir variable
-Changed error log

 meta/classes/sanity.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c6842ff549..485173ab48 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
+    # Check if PSEUDO_IGNORE_PATHS and and paths under pseudo control overlap
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    pseudo_control_dir = "${D},${PKGD},${PKGDEST},${IMAGEROOTFS},${SDK_OUTPUT}"
+    pseudocontroldir = d.expand(pseudo_control_dir).split(",")
+    for i in pseudoignorepaths:
+        for j in pseudocontroldir:
+            if i and j:
+                if j.startswith(i):
+                    status.addresult("A path included in PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) + " overlap and this will break pseudo permission and ownership tracking. Please set the path " + str(j) + " to a different directory which does not overlap with pseudo controlled directories. \n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.17.1

