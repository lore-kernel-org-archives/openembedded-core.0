Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.8435.1601441652472632671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 21:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n/TmU/4m;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id o25so354059pgm.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 21:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=05mYwLbsJPrc4/QJyerhRt3xK3FXhTlO2hROemlwzVg=;
        b=n/TmU/4mJaJDQ5CuBxuV8uJ9oLowCAZAKYDl/lX4h50mQVS1lhyE9ZBkPN/bWJaN0F
         OCag+OY5pAN42s7BHKOm/FxajvZOOmsDJVbUUlVWAbkqBgBypJwJTTD/0uxdPfml81hp
         2iANyXBhfnisPQ4I94vMf1jJaVE0M1TYnAKOWYJP3rbG7TbW+Ghx/RIqffoRtkO2fPTx
         eMWTzFs3LfYj8R7SshMw4zKh0RtH6HV4lghU+nCHZaLVzXS/5rTdOOGkAcwnBc1EzJgs
         VlLRe6lZuvHDf9c42xcN1KUbicLWfnYF8FOUCPJK8GynsQFCG2fbdDHm0liMlUH5nQYB
         hZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=05mYwLbsJPrc4/QJyerhRt3xK3FXhTlO2hROemlwzVg=;
        b=fwzVyzsP4VYtJJtd+Faa8YCDdEMAcTiFDz2YgQ3K7PD++hZqVvy6ZA4vq3qPvExgEi
         TMb9H6Reg53C9XMxt+Yi7MgWzRQbn4yP4iICWivip8aXhV6vP2hPRu/SLdOj93c+qqzv
         l45gQ7H2eEZuebFGo2EFWpfyjcyWI6/onVsC/JtfVBUpJV9em6COV2v2h6rIx0/ETreJ
         j+NMrRh5JRn8rXd1x7x2Gq2GlfSNIAoPyncOIk81TXO45bVEZ1Y6CiW/LJ/dc3Z/x3ZM
         eX3ezagcFUSrAziGv75LJ0LMq3xswhv76N/USFBZMelnhA3bvFWbocnadDfqz8kb3e3b
         Kz0g==
X-Gm-Message-State: AOAM530FGgU9cQHfrZBEjOq8R7/0rCN8O76YmLEzcIfYN+JmwnWpB4ET
	RkHbV+NqicEiW6fQz5u/i7LvScQYlKPEsg==
X-Google-Smtp-Source: ABdhPJzXfr1FhYwxoWDFND+xWd8MscVgF/wJ0+WBYsdjkGhwKZAEwtvHwJqewGpEVHqKeFPV4PCorQ==
X-Received: by 2002:a65:6106:: with SMTP id z6mr761295pgu.433.1601441651717;
        Tue, 29 Sep 2020 21:54:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0:923a:5c32:ada4:3e27])
        by smtp.gmail.com with ESMTPSA id b10sm458681pgm.64.2020.09.29.21.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 21:54:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Use ROOTPREFIX without suffixed slash in systemd.pc.in
Date: Tue, 29 Sep 2020 21:54:09 -0700
Message-Id: <20200930045409.2301174-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-ROOTPREFIX-without-suffixed-slash.patch | 37 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_246.6.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
new file mode 100644
index 0000000000..622a4108bb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
@@ -0,0 +1,37 @@
+From 58860e0f248576a80ff2af256ba42713c186ae93 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Sep 2020 18:01:41 -0700
+Subject: [PATCH] systemd.pc.in: use ROOTPREFIX without suffixed slash
+
+This complements the commit
+https://github.com/poettering/systemd/commit/b612c26ceb9f56af0271fc9f07c1724d2d260a8a
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/core/systemd.pc.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+--- a/src/core/systemd.pc.in
++++ b/src/core/systemd.pc.in
+@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_di
+ tmpfiles_dir=${prefix}/lib/tmpfiles.d
+ tmpfilesdir=${tmpfiles_dir}
+ 
+-sysusers_dir=${rootprefix}/lib/sysusers.d
++sysusers_dir=${prefix}/lib/sysusers.d
+ sysusersdir=${sysusers_dir}
+ 
+-sysctl_dir=${rootprefix}/lib/sysctl.d
++sysctl_dir=${prefix}/lib/sysctl.d
+ sysctldir=${sysctl_dir}
+ 
+-binfmt_dir=${rootprefix}/lib/binfmt.d
++binfmt_dir=${prefix}/lib/binfmt.d
+ binfmtdir=${binfmt_dir}
+ 
+-modules_load_dir=${rootprefix}/lib/modules-load.d
++modules_load_dir=${prefix}/lib/modules-load.d
+ modulesloaddir=${modules_load_dir}
+ 
+ catalog_dir=${prefix}/lib/systemd/catalog
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.6.bb
index c1424a1474..9215adf8dc 100644
--- a/meta/recipes-core/systemd/systemd_246.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
+           file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            "
 
 # patches needed by musl
-- 
2.28.0

