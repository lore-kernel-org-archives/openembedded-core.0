Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C52C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:54:02 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.830.1652295239093955579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWDD41oh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.210.172,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pf1-f172.google.com with SMTP id j6so2719965pfe.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tABpULqrMeXXdWIzfc+DXhrb1qpwHCMm6CNQylj1334=;
        b=bWDD41ohxqIYGQIN6vKbmtsdCFNb/RnvZGoonr3OiE3EAuIsJ/aq+TU3rxuhmxJBSw
         PVM5vjy3bsPBVQkU2Twy8MUkZoSIfgMGCDTRKunnEmBx5hLzdjL8HpJlxeTl56GVTX/q
         NuFphIzGomedE17cIQigjO15j3n3hxrVTZnAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tABpULqrMeXXdWIzfc+DXhrb1qpwHCMm6CNQylj1334=;
        b=QZv5ulp8Y7NFsxADDIgQnAoKncVzlzbEehu7y6yhbSoa6Ue4hWJOuDo1B+4DTQRagR
         fAhlflpIAaNWqNHXzASrzkhs0Uambcfwrpu9Ln3yrRwUxaaeRtEztW9docL1Jm+Ep+/c
         UieKhjp/E4PGzke0j3BGmgr4HIba+86sfqZYIa+wSMWh+xSVcvsVoQQMsdpghEhey+4n
         6RqgGuCiIORWNmVj7ZKlhT0FtpV9eYQ8IFmKf6XDfKGIhVuHStankcrAwlq1hELvixfw
         nd9vk7TFqSPiNESu5ASHKKP5h+WK+JSrE9qS1mbWd3nISTdDmW4BliCJrTyZ9Vb9UTLz
         sAnA==
X-Gm-Message-State: AOAM5312fIc7HxRwHxohHk57GjGbl+O2O07eUmAurQAxB4+IEczjyDEb
	flPys/d8R1g4TwZUahc81YUqXm2zizeu6Q==
X-Google-Smtp-Source: 
 ABdhPJzQjtEkM1QeGI/JZwxMRxpAJCyjOnJ7wt6Z1pdgS7hdhJi0w72JNcMj4+wQim874TBzcXoAsw==
X-Received: by 2002:a05:6a00:17a3:b0:50e:b37:c52 with SMTP id
 s35-20020a056a0017a300b0050e0b370c52mr26745027pfg.25.1652295238260;
        Wed, 11 May 2022 11:53:58 -0700 (PDT)
Received: from localhost.localdomain (97-115-89-234.ptld.qwest.net.
 [97.115.89.234])
        by smtp.gmail.com with ESMTPSA id
 201-20020a6216d2000000b004fa743ba3f9sm2140572pfw.2.2022.05.11.11.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:53:57 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH 2/2] scripts/autobuilder-worker-prereq-tests: add
 additional limit testing
Date: Wed, 11 May 2022 11:52:53 -0700
Message-Id: <20220511185253.14604-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511185253.14604-1-mhalstead@linuxfoundation.org>
References: <20220511185253.14604-1-mhalstead@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:54:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165522

Check that open file and user process limits are greater than or equal to what
the autobuilder uses.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index 3956349b30..572227dccd 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -51,6 +51,21 @@ if (( $WATCHES < 65000 )); then
     echo 'Need to increase watches (echo fs.inotify.max_user_watches=65536 | sudo tee -a /etc/sysctl.conf'
     exit 1
 fi
+OPEN_FILES=$(ulimit -n)
+if (( $OPEN_FILES < 65535 )); then
+    echo 'Increase maximum open files in /etc/security/limits.conf'
+    echo '*            soft    nofile           131072'
+    echo '*            hard    nofile           131072'
+    exit 1
+fi
+MAX_PROCESSES=$(ulimit -u)
+if (( $MAX_PROCESSES < 514542 )); then
+    echo 'Increase maximum user processes in /etc/security/limits.conf'
+    echo '*            hard    nproc           515294'
+    echo '*            soft    nproc           514543'
+    exit 1
+fi
+
 mkdir -p tmp/deploy/images/qemux86-64
 pushd tmp/deploy/images/qemux86-64
 if [ ! -e core-image-minimal-qemux86-64.ext4 ]; then
-- 
2.36.1


