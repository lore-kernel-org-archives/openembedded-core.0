Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C062BC433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.52892.1638136787199360093
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fA7BGei1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id n26so14669008pff.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gnn/srbpCVl83Dz87Fcy8Lc4hMltSgFaVeXWl5Xa05Q=;
        b=fA7BGei17VXMFyO4/MR/aen6QRS79DjDm5QKzCVHDjXkl23G1IN3ay3dyYdqieXhXU
         Muji0e3qXmIOO78k3xOJiaie0Pin8M9Ua5vlNHo7L+mQYPsOZo246KViWI6pPR6lImWe
         x2P/rRUed/kRmqUKC6qjnCcO2bWDGi5p6yxbB0udZh7/g5bVgRW1uFb9EBzbMBLQJGP+
         zOXc6qqY7k6gw10bcIfWRPYSjQn0lXlffGdbL/1sh5dTp9hwGlTbxJz583y+Aj031sXz
         asdbOwxuv4J1Bgmj7RLhMFzk6FSFL41McOqRSlUQ4ESOrzn77XgKmo/8RmfLGW8XjeT3
         ocsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gnn/srbpCVl83Dz87Fcy8Lc4hMltSgFaVeXWl5Xa05Q=;
        b=1g6hE7IGkz+E/0akgmlSIMLeZKXPtwanSnQ10h1U26/+NNoyqjWUMoUK8FdAREuo27
         Y6Z9hMTcy6P6nx4zVJyln3ciOqr6flMuMmGTZWLZqBhSzfvBZkBUiH8EpGCvmEm8U/yo
         XSD3nJ1s5ITbVVQ7Xkd0S/NswoTudwg33gGA5vUgueWggAcJR46HBtBm7JO2Q9F93L5Q
         sAV2d7upj4g6+Sf94r+cooF1fGv3RJa5QzYZQ7mB8C++xarKihR4M2znvg1aUGYm5zg1
         W8jgzUzdKs2dvUNg4DlsPZlXlqSNbjJN2iQKbMtGd6hNL3pHUm/YQqhFmrh+BJPdRE03
         rekA==
X-Gm-Message-State: AOAM530+9zXR2N9Kmren6TBGE4kFi1aH8o93BX0+yZNCL8Mb9MenwN5Y
	EgqjqOxHqb3dlpTbwgOQ+zDxXQKH+xRYrjTOmdI=
X-Google-Smtp-Source: 
 ABdhPJyHOFmd5d/sr3npmgK9i52SztJ/ZP57nPTo0t0GAY4v2ROGO3iW8qpfvLmInJtjX3Igs8WYFg==
X-Received: by 2002:a65:614d:: with SMTP id o13mr31816199pgv.10.1638136786035;
        Sun, 28 Nov 2021 13:59:46 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/42] libdnf: Backport bugfix for upgrade calc
Date: Sun, 28 Nov 2021 11:57:47 -1000
Message-Id: 
 <fbc919b53fccc03686f4492d335fa169cc02399f.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158917

From: Jate Sujjavanich <jatedev@gmail.com>

Mark goal.upgrade with sltr as targeted

This allows a bugfix in dnf to work

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...job-goal.upgrade-with-sltr-as-target.patch | 58 +++++++++++++++++++
 .../libdnf/libdnf_0.28.1.bbappend             |  3 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0040-Mark-job-goal.upgrade-with-sltr-as-target.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf_0.28.1.bbappend

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
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bbappend b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bbappend
new file mode 100644
index 0000000000..569a77496d
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0040-Mark-job-goal.upgrade-with-sltr-as-target.patch"
-- 
2.25.1


