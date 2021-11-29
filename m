Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258CAC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:10:16 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.62207.1638198615032432757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g+F+T/4e;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id 132so23111043qkj.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sEGePhvxlBliRPK1DNzLek2qYg+EL3bTmVqIpUgBBS4=;
        b=g+F+T/4ecyXi2uyEhYUN8Ta41LTXYH7yI6mGvo8CJhfuXQd+315llDs7qaUa0Y/wkO
         upuWfSoAW2NCWTTwkPN4jzBRzF6X26GApU4OsMwbBLVRX/EMn1IjxXLRdUNg1qs8cNV7
         psVvSK+sYZDZaalrn0i/Nu9Hr355Gus5cYu6UhEbN5OtwcznBvcGUiYrJlug3U/p/+9n
         HbDI77EdBXAUqgbia/lpQVeNtHXbw610+q1/KyyL8LfQrT8p0pAp3v78A8WqHNcQqXAr
         ed3ZugXOp432Ekn0L9N19K7fjlhgoPfunwNmtjhGcXtN4TXxMxkXTO9EzIfRTNsb9iwE
         V61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sEGePhvxlBliRPK1DNzLek2qYg+EL3bTmVqIpUgBBS4=;
        b=gn9Gq+Zyc4cp5IDbdrbOZjCPNXLJ8v8Q/HW8cW/+bAotGLf5TZ95sNOsD+vQ4sTUE0
         sZbWcUrWRWkZ2uWQDnlX5V7GCy+3lQ3vBM8KMr6pWqQ18mc8apo2+y4YsnsCe5XL3O1w
         7xAJiE8ehLkmDAMsd3bOLpEC6gLSUYVS6J6IBbf2QWC9FJUVNU/gPEwOw3oCi4jP/tFc
         a1pMblBrh9oxwsKiGZx36MdQHoTVBcunW4ItYOThFSRzCj2fTXKjAVk6sMOREzHTpf3k
         C+pAw5+6+45aFC+Oeet684jmOD71FWvSFPkdUJgO3YF5zbtwCCUDjHk7XzRkM7rF5wnW
         v6hQ==
X-Gm-Message-State: AOAM531cn4h6ZJIA8jxoGCeN88n6nTmlbOqAS8OSJqSmrvyEort6FgzI
	Qj+68X0SLd+l47EdbcXGwdgu2HLugf0=
X-Google-Smtp-Source: 
 ABdhPJy05dvgifydMezSiLaq0cjFg8d+uQjDg0i5bZHhiR4iiXgvprlZV+0ZFrKL63+GKP50vFK5tg==
X-Received: by 2002:a05:620a:2229:: with SMTP id
 n9mr38953632qkh.155.1638198613893;
        Mon, 29 Nov 2021 07:10:13 -0800 (PST)
Received: from localhost.localdomain ([71.220.185.242])
        by smtp.gmail.com with ESMTPSA id
 o126sm8264677qke.11.2021.11.29.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 07:10:13 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [dunfell][PATCH v2 1/2] libdnf: Backport bugfix for upgrade calc
Date: Mon, 29 Nov 2021 15:10:10 +0000
Message-Id: <20211129151011.81253-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:10:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158951

Mark goal.upgrade with sltr as targeted

This allows a bugfix in dnf to work

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 ...job-goal.upgrade-with-sltr-as-target.patch | 58 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0040-Mark-job-goal.upgrade-with-sltr-as-target.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0040-Mark-job-goal.upgrade-with-sltr-as-target.patch b/meta/recipes-devtools/libdnf/libdnf/0040-Mark-job-goal.upgrade-with-sltr-as-target.patch
new file mode 100644
index 0000000000..61d255581b
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0040-Mark-job-goal.upgrade-with-sltr-as-target.patch
@@ -0,0 +1,58 @@
+From b4c5a3312287f31a2075a235db846ff611586d2c Mon Sep 17 00:00:00 2001
+From: Jaroslav Mracek <jmracek@redhat.com>
+Date: Tue, 3 Sep 2019 11:01:23 +0200
+Subject: [PATCH] Mark job goal.upgrade with sltr as targeted
+
+It allows to keep installed packages in upgrade set.
+
+It also prevents from reinstalling of modified packages with same NEVRA.
+
+
+Backport commit b4c5a3312287f31a2075a235db846ff611586d2c from
+https://github.com/rpm-software-management/libdnf
+
+This bug is present in oe-core's dnf
+
+Remove changes to spec file from upstream
+
+Upstream-Status: Backport
+Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
+---
+ libdnf.spec          | 4 ++--
+ libdnf/goal/Goal.cpp | 2 +-
+ libdnf/goal/Goal.hpp | 6 ++++--
+ 3 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/libdnf/goal/Goal.cpp b/libdnf/goal/Goal.cpp
+index b69be19..a38cbb4 100644
+--- a/libdnf/goal/Goal.cpp
++++ b/libdnf/goal/Goal.cpp
+@@ -767,7 +767,7 @@ void
+ Goal::upgrade(HySelector sltr)
+ {
+     pImpl->actions = static_cast<DnfGoalActions>(pImpl->actions | DNF_UPGRADE);
+-    sltrToJob(sltr, &pImpl->staging, SOLVER_UPDATE);
++    sltrToJob(sltr, &pImpl->staging, SOLVER_UPDATE|SOLVER_TARGETED);
+ }
+ 
+ void
+diff --git a/libdnf/goal/Goal.hpp b/libdnf/goal/Goal.hpp
+index f33dfa2..d701317 100644
+--- a/libdnf/goal/Goal.hpp
++++ b/libdnf/goal/Goal.hpp
+@@ -86,8 +86,10 @@ public:
+     /**
+     * @brief If selector ill formed, it rises std::runtime_error()
+     *
+-    * @param sltr p_sltr: It should contain only upgrades with obsoletes otherwise it can try to
+-    * reinstall installonly packages.
++    * @param sltr p_sltr: It contains upgrade-to packages and obsoletes. The presence of installed
++    * packages prevents reinstalling packages with the same NEVRA but changed contant. To honor repo
++    * priority all relevant packages must be present. To upgrade package foo from priority repo, all
++    * installed and available packages of the foo must be in selector plus obsoletes of foo.
+     */
+     void upgrade(HySelector sltr);
+     void userInstalled(DnfPackage *pkg);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index fb7fc80758..39858ad401 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=master;protoco
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-include-stdexcept-for-runtime_error.patch \
            file://fix-deprecation-warning.patch \
+           file://0040-Mark-job-goal.upgrade-with-sltr-as-target.patch \
            "
 
 SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
-- 
2.25.1


