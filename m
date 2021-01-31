Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.23039.1612121220053031871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 11:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kk61Ptub;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id df22so505946edb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 11:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=doDIlXraN7f1c656D6Y3Zie+NtueB668IkjvG5TWzj8=;
        b=Kk61PtubQ2b1OvGk8QpDFA6MQO5Ufs9/d+I6vVW8tusPDtoxOzhrJgJdnpfgaRqdDW
         Um29M7yyj0pyH1nFc38i8L0pugnrXdXGr0SpPTepVolKWMRDLtQ5EfW91VOErwhSQT7B
         UQnLfkw9BKsYwmhAt5HSyHAKBDMX3qfPMb5mdem4K+3CkB++6ViNt8HGgjtYh1bwCVkc
         FPYcSgnAtjluqHkrxCYiiP9h3K7zTW7RPyG33uhHphVCJvXWQu62R+e7fdRwckOeSuL1
         Bq1MjWT+jV8tT9YdVVQXjC80McdHUsD/FDVT5LNUmRvS9XQzeVG9Kyr4SRXE9NUaGavF
         b7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=doDIlXraN7f1c656D6Y3Zie+NtueB668IkjvG5TWzj8=;
        b=PFU/JX9AGdWIZrfzAN9/7W5deXRB7H3cQVfiZUi8zup/7tJnUE1C9/Qc4TqOsbG3bp
         tHbB5fxw0VL1SdhKT4rjKG4fND35dQjqkilNtH4xkS7NfnVvH/xdVZ2yDp+LPb+RRpxw
         TjN6NY7m/e7HNueMszY7V2HtXoVZ+wG28hPe8XPq1mYA0MI5GVtcJ/3VfeRyKTqsXVF0
         i3QB0K2gNGzPHpmegVY8z8mkJ0w3/vm0OHbMXc1lYfdS4/ZihYwwVdyTMZ4pd1ZUpHUN
         7t8ltqk4BqRCr39e/9uIQe8MoCt6jdxlhIwTn6rFEEN3o0MhO7coyUWAsoz4t8zox1YA
         vJzw==
X-Gm-Message-State: AOAM531jkJalz5g4PzQAmgYkjOwfc56cS0aQGmh4BC5I3lPkJCghTAIF
	LqJ2vEqISaHMV8Nds3sA6z6xA2kIYIrjJA==
X-Google-Smtp-Source: ABdhPJz0MotCy27I/vftyLX7gKmewXdqXHBYqwxd0sSmf1Z92QBuJYYnEfUXofYARnmbS268GheeaA==
X-Received: by 2002:aa7:d486:: with SMTP id b6mr6879378edr.96.1612121218325;
        Sun, 31 Jan 2021 11:26:58 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.147.95])
        by smtp.gmail.com with ESMTPSA id lg21sm6922745ejb.91.2021.01.31.11.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 11:26:57 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v3] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
Date: Sun, 31 Jan 2021 14:26:48 -0500
Message-Id: <20210131192649.30005-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

added a sanity check for when PSEUDO_IGNORE_PATHS and paths under pseudo control overlap to avoid random failures generated.

[YOCTO #14193]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v3:
changed commit log
changed the conditional statement for sanity check

 meta/classes/sanity.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c6842ff549..a64d15166f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
+    # Check if PSEUDO_IGNORE_PATHS and and paths under pseudo control overlap
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    pseudo_control_dir = "${D},${PKGD},${PKGDEST},${IMAGEROOTFS},${SDK_OUTPUT}"
+    pseudocontroldir = d.getVar('pseudo_control_dir', expand=True).split(",")
+    for i in pseudoignorepaths:
+        for j in pseudocontroldir:
+            if i and j:
+                if j.startswith(i):
+                    status.addresult("a path included in PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) + " are overlapping each other, please set this path " + str(j) + " to point to a different directory. \n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.17.1

