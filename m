Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.5351.1605279182624825654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uWh3DDiA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 62so7233153pgg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oenyuLhLJjJTUj5KjdpDE5l+KzmeVTJqR5pPmq9oz4A=;
        b=uWh3DDiAhn5+eZmPtRuj7uDq+cQv39eUU9FoJyonZRtmX+L/+LZBExiiqv2JwyyH2j
         Z5yebsAaUPhQ66jSBisIMIgZEpF61SMHfe8jpd/Eca26r1OSY2r7VBedhSRPCgauqXrQ
         MW6eZiPXq9caLpCtovAcwqHWGSaSJ4bqhfKkwA6d+5Op+o2FfDcXNKDztYNRX4NXO3hl
         JHDsTXgwzkkwwn5AerOYapzEfs8Y5iDyKnxmPUsXyy4X5TnxTt19/P/QmlmoXBwt+ooM
         cc5/zCFP59201CCPgzXzh9I1/6GZTBqJuVEzmj0JgNtmLrsS8avRbWgC858fCkhBvaht
         ZQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oenyuLhLJjJTUj5KjdpDE5l+KzmeVTJqR5pPmq9oz4A=;
        b=i5mFtCbtLGNOJEJsRDPT63Gfd343uD+/0Y3/Vtjoxkki4z0crSeyNx8QYNfl7ZEZnh
         xYKUv43XO0XvqENCKpqyYDgp9nFjjDskNumeW3oBRKpJdm82o8Sc/6kbAcj555nFYu6p
         Rf0bk/QPPfhnlByAmzlhbYk4cLpkac5hVp+fsuIRzTXyYYr5Tuip+V44R3EcPiNh20ra
         /UsldfmkdMVJXI3U/U67DCHFMqJmk2mzAXb3ZCVltBjEVlJMmhskVIL9ob6t6/tbJP+y
         dMFgmPjSRysGqYzGm4JFxvBG9zET2m9QtMnpU+pr0dC8UwWWq7JRHMcQKL4ZqzTqKY9S
         Daqw==
X-Gm-Message-State: AOAM5336kd+5msSxpOERm2m46GnPlVJvNWD917QmqNZtFQy1S9qci1kG
	w3INYlevyQlfEb2d01CZlQx7ZelwAk3J0Lwb
X-Google-Smtp-Source: ABdhPJwwQc5bKUogbBZh/3a0KXsiQZlv1iVDw1ph8ENmUmNxvLeImJgZ5iEz1Cbe4OuVYXCaHy/GWA==
X-Received: by 2002:a63:c749:: with SMTP id v9mr2338185pgg.451.1605279181752;
        Fri, 13 Nov 2020 06:53:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/18] systemd: udev SECLABEL{selinux} crash fix
Date: Fri, 13 Nov 2020 04:52:14 -1000
Message-Id: <fde72d75175d2a258e5095addd73d3da0998fc3f.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: akash hadke <akash.hadke@kpit.com>

Adding SECLABEL{selinux}="some value" causes systemd-udev
to crash.
So applied below available patch to fix the issue.

systemd-udev-seclabel-options-crash-fix.patch

Link: https://github.com/systemd/systemd/commit/0335d110afc08baf47d76b7011ce02510dfdd524.patch
Signed-off-by: akash hadke <akash.hadke@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...temd-udev-seclabel-options-crash-fix.patch | 30 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.3.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch b/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
new file mode 100644
index 0000000000..27b2b60fad
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
@@ -0,0 +1,30 @@
+From 0335d110afc08baf47d76b7011ce02510dfdd524 Mon Sep 17 00:00:00 2001
+From: Valery0xff <valery.chernous@gmail.com>
+Date: Wed, 11 Mar 2020 02:20:36 +0200
+Subject: [PATCH] udev: fix SECLABEL{selinux} issue (#15064)
+
+Add SECLABEL{selinux}="some value" cause udevadm crash
+systemd-udevd[x]: Worker [x] terminated by signal 11 (SEGV)
+ 
+It happens since 25de7aa7b90 (Yu Watanabe 2019-04-25 01:21:11 +0200)
+when udev rules processing changed to token model. Yu forgot store
+attr to SECLABEL token so fix it.
+---
+ src/udev/udev-rules.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/0335d110afc08baf47d76b7011ce02510dfdd524.patch]
+---
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index b9b350d1ef..b990f68e93 100644
+--- a/src/udev/udev-rules.c
++++ b/src/udev/udev-rules.c
+@@ -921,7 +921,7 @@ static int parse_token(UdevRules *rules, const char *key, char *attr, UdevRuleOp
+                         op = OP_ASSIGN;
+                 }
+ 
+-                r = rule_line_add_token(rule_line, TK_A_SECLABEL, op, value, NULL);
++                r = rule_line_add_token(rule_line, TK_A_SECLABEL, op, value, attr);
+         } else if (streq(key, "RUN")) {
+                 if (is_match || op == OP_REMOVE)
+                         return log_token_invalid_op(rules, key);
diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 850d64e8b0..64e3b18333 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://CVE-2020-13776.patch \
+           file://systemd-udev-seclabel-options-crash-fix.patch \
            "
 
 # patches needed by musl
-- 
2.17.1

