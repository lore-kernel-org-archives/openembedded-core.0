Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47BFC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 03:14:27 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.1454.1637723666375539284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 19:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jSbcsDhV;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: jatedev@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id p19so1289419qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 19:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdlwD+3474zzbtHRdtYYtZ7bZ+M91xrci5DPiR6FIK0=;
        b=jSbcsDhVx3Kd2PkpT8tOHDTfojnoF/t68fJydQeA5sWngri5Il9g8wxfZcG9f2zTH/
         RXogfHDq9rWx/5P8mkq0vlcZKOkRC9lsrzk3xSjvInoIbqYW7IDNH023I+4OmaM/Qy+g
         qvWjEafsorNrW1FPlsf7TjsJKWL8s614kD/COkNjFrvhJKJREwTZi6Yn+OZEQ0aqwJWl
         SWnRLOfAQgwlxCcie5sK9c/2skPwdjcYbcgqzkQ1Mjwd3ERS2Bb6byZ7uU4I74DiyaoV
         hHnvoTz2lOUyCPN+QVCs++kzLQ/HaVIO4dDp4lrdRJkPMfbU1WOy/cMXuS5UzSLS9eY6
         UehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdlwD+3474zzbtHRdtYYtZ7bZ+M91xrci5DPiR6FIK0=;
        b=rdeRS4plnNkt38Xp8kNkaDD0wIuV7jlVuNzetCFRiJ4Mg329D0ISSUZIKzXGh7N4bm
         EcU18Ad1tHvFCuAQiG/J+HVZkcdYMunViY0eoKLt1Zij+OwfdPRB1IDefK7ZdVXU3w1I
         1Q6D0lGg0k2F5CRRFkbO2ZWRhOQbBxzJzFjnv/IzloyGAix3MdpI9yCE9kZIjf9RJ3fR
         GKKmgkoCQHZs8n8t81vU168MvrxPHgL5VzmuP9iwimXLZODZ77fslkcc6OMwLK+rO85U
         OstCr+mDeGgs9cfWAALQfjQjFDTNyLDXPAP6c1prJXHsvg4+Sm+KY1iNbZ7PsTPXpUj3
         u2wA==
X-Gm-Message-State: AOAM533veGoMqUIVQ7+7++G6gmp2IFbWcZkvnBNFThEsIgKC/X9WDZr0
	8ykxEUG6v/NJuBcAr2fxdy0T2Y9c0jE=
X-Google-Smtp-Source: 
 ABdhPJwDKNzH1l6OTO++nvgzJUcthxVjS/3CmrWTTxxHuwjWnhSHhZ7FcnrG3yVCsmQubDnHLQfCCA==
X-Received: by 2002:a05:622a:11c9:: with SMTP id
 n9mr3073526qtk.385.1637723665200;
        Tue, 23 Nov 2021 19:14:25 -0800 (PST)
Received: from localhost.localdomain ([71.220.185.242])
        by smtp.gmail.com with ESMTPSA id
 k85sm6992009qke.134.2021.11.23.19.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 19:14:24 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [PATCH 1/2] libdnf: Backport bugfix for upgrade calc
Date: Wed, 24 Nov 2021 03:14:22 +0000
Message-Id: <20211124031423.76384-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 03:14:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158650

Mark goal.upgrade with sltr as targeted

This allows a bugfix in dnf to work

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
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


