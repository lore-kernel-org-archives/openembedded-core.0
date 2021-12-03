Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EB5C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:53 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.15351.1638555712667709351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kBhODLhE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 200so3893580pga.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w/gdB5JDMHLf8crVSfbvyO7O846ecd/Xx0VlbKdSJo0=;
        b=kBhODLhE4XP7KHWS/Ixd5Ic1Q/7dTQ9hSsh5t8rF7MYdurs2aqZ9FgR+HOG9dcxnkV
         iggFXTwTgJRswU5tK0n4mmumWHl5B7hIjiJHAwXukee84NDmdkeUmeMjj4rHaKUE0say
         67jNEyM2DlrmUTIvaz2z4AlUG7g+GggK1tv5BdOwcNAQvXMJOBReGVwvCu3fTk967fxJ
         +CkSyVFU+eWYmdY2gtQfFZH4m/fZv50KnMjCHum1mm4hmagahIO21VRHRCKWhTDP/h4C
         pCExsvU3PbE0O5vVEbL5kanIKv42U0Kz1+++Egu/+rSRe2XFHjjaE+pKEjzVDrW27W4e
         0SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w/gdB5JDMHLf8crVSfbvyO7O846ecd/Xx0VlbKdSJo0=;
        b=VzGNrZrnbUgYWKGQYi1SyV9DNKiMFUsrvpaFzkzGQ7fkfc7+Y24HXIVqu3h1Mpd3Ew
         k6Q6hrD34PTnHiS/htjEoLc+KzPWJ41Sx75c1O6Pz9/7ogrJEF/qg73c2VsMQwTZaHXc
         VBslBPEnGqdFiAQ04oLk/hr26kD4UMk3b3d97Tb6n4DKR3hKLXcDXskZchPgOY3e7JpR
         bdEIFGs2nCZtOSvL3p7OVSE4HN1nJkukVs1+QubjSedpEVtsf4S+BdxC99vo/4f2XLp7
         XcitQrgXO2ERZYOhZp+GBMGp7+xo5iLFHNv9qc05ads1ehkGCpuRTxjvN6MBwjFNTt+v
         APfg==
X-Gm-Message-State: AOAM530hpEax7Lmz6pxUj2uUIL7wOsDyjJ63BySrOPO/j8rbj640MKgp
	v4YtLzH60anc60RzL5YIRp4Pu2Gi318Z/MuDR0U=
X-Google-Smtp-Source: 
 ABdhPJyxy0hXni7l+1FJvYwaAHl/Uxh8cJyh0sDgQ9btmcovpztOCyaJFsJ7cUdY7Czz6LzRYvC6dA==
X-Received: by 2002:a05:6a00:cd0:b0:49f:b198:97a5 with SMTP id
 b16-20020a056a000cd000b0049fb19897a5mr20960451pfv.80.1638555711669;
        Fri, 03 Dec 2021 10:21:51 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/18] libdnf: Backport bugfix for upgrade calc
Date: Fri,  3 Dec 2021 08:18:58 -1000
Message-Id: 
 <19b86d1569bb56facecc03e2694d5ad1f54b5db4.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159138

From: Jate Sujjavanich <jatedev@gmail.com>

Mark goal.upgrade with sltr as targeted

This allows a bugfix in dnf to work

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


