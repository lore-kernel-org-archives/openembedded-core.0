Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFFFC7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 16:24:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.369.1682526280675105408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 09:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=T7lNiMOF;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63d4595d60fso44498551b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682526280; x=1685118280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1CpMGSXryOd2vmEKc1ljM5QeiDvALO0qNm26xyveDFM=;
        b=T7lNiMOFwmau/Re0XkNIUs95q9LEGcTPy98LodSMlPnyFpZ948zbrZIt3ySN1+T4td
         pTR9rhm/H0X3Ls+cjECMiWa9xtULKlReuZ8Hk2/pPZKXEI2NrFgKWSRGAXtO4mg25/uX
         4IohyJ6okybZsLCoQaIPdzM2b/YRIQ2S5m84e/cOxTtBVaPdut6/IYLC7X03R/fnvO4s
         1O1fL0MqDmwPanYewEIWKF0J2sXBNCoO8yDkdeUYgYOfpu6Q4+szflCFoAK8ULZkUhAv
         BQG2vURioXqwDpeLYkAUDlgOBdFeptXLJqn6d/WBQDLIfaw6jZ8Lh9gfDDvia7T6M8GY
         Ce/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682526280; x=1685118280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CpMGSXryOd2vmEKc1ljM5QeiDvALO0qNm26xyveDFM=;
        b=bjjejGKmpVN/FnspJ8e/d3OkbpbTh0nfRU3qAh4T+teUPyoYOhSwDxpks9LtdZVuBC
         yKeCJbLaeYz7HGoH641BQtC+Fj6qX3yHLEr0dva9ER65FTUDENBC4w//ljx9AEVtw/ft
         4UW6y81Y2jSRI/JmXZFds9mFSrr1g+FIOYOyF5uU85ki7mXAxzB0LeqqHoRJVYjdwWXz
         twfD2gJT2OSMUG47DMFq4g+9Mi2DPp1HRQDazO+1APLBhugPDMuXYfVk1R2gsOPeAzEP
         1XUXjY18XmTjcr34FTUIyQsIFIqSsrTio8Srv4XAz3h77QoOf4RnMbA3bc/HJaRj7F6f
         toXA==
X-Gm-Message-State: AC+VfDy6evyHyVWHq/jl0NN/o6EpAZWzaPKHli25XK2lelID05j6kiEe
	T7rbnvsknu1kJ3l/97ffFHLGyqun2utnaw==
X-Google-Smtp-Source: ACHHUZ54+juXeqa6wxkP1VyOWAsugIkmhUeXd+atMG+J0/F4X1Qsm9JxXOAN5Huzh5mj/LulfQOl5g==
X-Received: by 2002:a17:90a:5585:b0:247:4fe5:f09c with SMTP id c5-20020a17090a558500b002474fe5f09cmr3661103pji.15.1682526279295;
        Wed, 26 Apr 2023 09:24:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5002])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ad10600b00244938da9b9sm3621103pju.31.2023.04.26.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 09:24:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Wed, 26 Apr 2023 09:24:36 -0700
Message-Id: <20230426162436.1510056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 16:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180448

Brings the following changes

* b928c723 fix return value of wmemcmp for extreme wchar_t values
* 4724793f fix wide printf numbered argument buffer overflow
* c1b42c4a wait4: fix missing rusage on x32 due to wrong success condition
* 9b12982d semtimedop: fix timespec kernel ABI mismatch for 32-bit timeouts on x32
* 6d322159 getopt: fix null pointer arithmetic ub
* 35e98311 nftw: fix use of uninitialized struct stat
* 7c410472 fix inadvertently static local var in dynlink get_lfs64
* 77327ed0 dns: check length field in tcp response message

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 531f337e82..036ac948b2 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1d5750b95c06913a1f18a995481276d698d20fae"
+SRCREV = "b928c7234f62c35a9b4927586ff4c3cbf6e513b5"
 
 BASEVER = "1.2.3"
 
-- 
2.40.1


