Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.35724.1608531484456441333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 22:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CN1cUhGo;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 15so5739227pgx.7
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5whyaCwbfTevr/PY8GQkeMeOP337GPH5h2ted4qg3CY=;
        b=CN1cUhGoQ3Pk7t7v2S24XpG5ByyLfUSp+0bWNAdQxfGgxT1mhTSa3m/GW/542Xeyup
         UrdgQKL2yU84/BEgdu4jnJBQrvvya3nqe/Zy6AN9VZSwjJd+OICqEsZUAw3/QP+Ae1gz
         bi9G/t/3gizvtaMX8Rzs1W9g/D8CkgFGXJ1qom+Kys+dceBZLeBEe8eHFWN4qiSZ0dy+
         I5QU34XJfAYBc4RYjQN+pG7Sf6b7+ZlxZm+MY6dZm/rOgH8eFXgQDZfctzhZN5hk4Suy
         86WTYHVn2ts9jPJnDZghV9csVzL2wnqEWP3ri1NfNeufeWI4fQTcJMbTE/dPZNFESfEk
         PY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5whyaCwbfTevr/PY8GQkeMeOP337GPH5h2ted4qg3CY=;
        b=Np2DYJ0/Gem32tRgHcF9A4M/4cVvkBi92/mjAZS5Yz0UVaDTsnUKB69E4aGW9pw72c
         59Zr+LIMqtqim9BnzsyuL9K02jr4jYPTvvXBLdzlKGFCJCrDurH9tsfUQBlxHp+a3n5r
         xxVqHmT6G/lJqo5ptFggIiH6x2tMqb5om35/sNnMBIpgolS7VvppvJsuuoJyl4D1Ixs1
         1iUDw2aYaYkY3lDfBUCjnEILdZYeH1tTXAZ0H71EpN4dcQ8/hStN5qf4qVjOnV2VaZnG
         yaqW+k9bfEtT+gfQPr8nyxGAN2TdtPcXgbiLle3zg2B9rZhyVx/4faFmTIOzqjNWy/Ti
         US7w==
X-Gm-Message-State: AOAM533xxTbjjDN/AqZG6NEoAUWls53kbOMo2DiWVwF/TqdFkbJaWKkh
	092gb5Gf3BcVfINHvpyOsAiZm5mWwCE+uw==
X-Google-Smtp-Source: ABdhPJybi1I5FjDe4Q1b6OGUWD16+dT/EVaqhRmWHWBBEYpDrFR4okxrEt9k3BbP2c+dlqOVxJDS/g==
X-Received: by 2002:aa7:9d81:0:b029:19d:ca64:3c62 with SMTP id f1-20020aa79d810000b029019dca643c62mr14374965pfq.16.1608531483725;
        Sun, 20 Dec 2020 22:18:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d89e])
        by smtp.gmail.com with ESMTPSA id er23sm13906556pjb.12.2020.12.20.22.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 22:18:03 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ltp: Fix ltp-pan crash on 32bit arches using 64bit time_t
Date: Sun, 20 Dec 2020 22:18:01 -0800
Message-Id: <20201221061801.2540487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ltp-pan crashes on riscv32/musl due to shorter width assigned to time_t
in printf format

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...an-Use-long-long-int-to-print-time_t.patch | 33 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20200930.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch
new file mode 100644
index 0000000000..381ac417ca
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-pan-Use-long-long-int-to-print-time_t.patch
@@ -0,0 +1,33 @@
+From 6c2085badea7b461245837c452a0d3d8a8c2afff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Dec 2020 22:09:28 -0800
+Subject: [PATCH] ltp-pan: Use long long int to print time_t
+
+Some newer 32bit architectures ( e.g. riscv32 ) uses 64bit time_t so
+using %ld is not sufficient to print time_t, this also fixes a crash in
+ltp-pan on riscv32
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/ltp/patch/20201221061415.2540216-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pan/ltp-pan.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
+index 8b9fbe5594..54b7cb8f26 100644
+--- a/pan/ltp-pan.c
++++ b/pan/ltp-pan.c
+@@ -1389,8 +1389,8 @@ static void write_test_start(struct tag_pgrp *running, int no_kmsg)
+ 	if (!strcmp(reporttype, "rts")) {
+ 
+ 		printf
+-		    ("%s\ntag=%s stime=%ld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
+-		     "<<<test_start>>>", running->cmd->name, running->mystime,
++		    ("%s\ntag=%s stime=%lld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
++		     "<<<test_start>>>", running->cmd->name, (long long)running->mystime,
+ 		     running->cmd->cmdline, "", "exit", "<<<test_output>>>");
+ 	}
+ 	fflush(stdout);
+-- 
+2.29.2
+
diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
index 7acf15b360..e3c49fbf53 100644
--- a/meta/recipes-extended/ltp/ltp_20200930.bb
+++ b/meta/recipes-extended/ltp/ltp_20200930.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0001-Add-more-musl-exclusions.patch \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://0001-ltp-pan-Use-long-long-int-to-print-time_t.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.29.2

