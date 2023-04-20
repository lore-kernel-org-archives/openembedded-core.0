Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390DC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 08:48:47 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.3457.1681980518590047757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 01:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hfpaocbG;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b5c830d5eso653436b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 01:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681980518; x=1684572518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AonCfHgnvkgRc5BMZhIPlusbPIF0IhC9y2n042VAK0o=;
        b=hfpaocbGnHO6708M/w/0VVg5Mnc+E1uhRpbuHyQHrKU6KU6Mv6N3DSOUUWB3EXHScz
         r7WazBFqDdoPk1s8xyPBVE7BJwKwh8BqoAUf5YUlyn+BPlEwG1+okOR3OEBf2ZJcckIR
         1OU1nQCwdOn0IGklHbNtYyPF2iSdP9MQe3+9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681980518; x=1684572518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AonCfHgnvkgRc5BMZhIPlusbPIF0IhC9y2n042VAK0o=;
        b=ksF2KF01DGGK1clLwcrWKj8xfPMxZwyApn/YD8mLgeBJajJJqC8zPHCI7hSK5gfMPS
         POfsr57Rp6RymQM54nLp8sV46JEOx25BnNbGGqYAxZEB4MywvuAPRYGr683DRBhQ+xuH
         EDtFi/v9GuMitI0UwOTv1TRAWajXgxubD6Cq+DDlvkxlZdYqJBQGGBSwA/4mpw2ggsmW
         r8FqzOuYcIjLr71xVVR6P1k3TfUs7tRDqERS2efjVSTGnne7HtSxhDBr32FwNo3YnPI+
         ZEEkvT0Togmz1CmnhPqKUGqUxDF32/qy+X6kw2WNiEaNM1/Ir/MK3EzvyJjBy9j4ltss
         x+Ug==
X-Gm-Message-State: AAQBX9ddDGyTcnJqHH2vLGUZDeW6nBEuaS4Qkra9mz9WyKhQbhhA3PHf
	eQtGqBt+Qg5av+xG59/bOQSV/05/gk2wre+MGaY=
X-Google-Smtp-Source: AKy350ZXgvX04j/1p/RFPDi1ove7H/6e0V02Pgs7f53BmAAVsUE6D2iSBsk5XOWZB9/eAhb7aVnHeQ==
X-Received: by 2002:a05:6a00:2305:b0:63d:287f:fdf5 with SMTP id h5-20020a056a00230500b0063d287ffdf5mr530426pfh.27.1681980517814;
        Thu, 20 Apr 2023 01:48:37 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.130])
        by smtp.gmail.com with ESMTPSA id o76-20020a62cd4f000000b0063d6666ee4csm763687pfg.34.2023.04.20.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 01:48:37 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 20 Apr 2023 14:18:32 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] screen: CVE-2023-24626 allows sending SIGHUP to arbitrary PIDs
Date: Thu, 20 Apr 2023 14:18:30 +0530
Message-Id: <20230420084830.101561-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 08:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180240

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/screen.git/commit/?id=e9ad41bfedb4537a6f0de20f00b27c7739f168f7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../screen/screen/CVE-2023-24626.patch        | 40 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2023-24626.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2023-24626.patch b/meta/recipes-extended/screen/screen/CVE-2023-24626.patch
new file mode 100644
index 0000000000..73caf9d81b
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2023-24626.patch
@@ -0,0 +1,40 @@
+From e9ad41bfedb4537a6f0de20f00b27c7739f168f7 Mon Sep 17 00:00:00 2001
+From: Alexander Naumov <alexander_naumov@opensuse.org>
+Date: Mon, 30 Jan 2023 17:22:25 +0200
+Subject: fix: missing signal sending permission check on failed query messages
+
+Signed-off-by: Alexander Naumov <alexander_naumov@opensuse.org>
+
+CVE: CVE-2023-24626
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/screen.git/commit/?id=e9ad41bfedb4537a6f0de20f00b27c7739f168f7]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ socket.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/socket.c b/socket.c
+index bb68b35..9d87445 100644
+--- a/socket.c
++++ b/socket.c
+@@ -1285,11 +1285,16 @@ ReceiveMsg()
+           else
+             queryflag = -1;
+ 
+-          Kill(m.m.command.apid,
++          if (CheckPid(m.m.command.apid)) {
++            Msg(0, "Query attempt with bad pid(%d)!", m.m.command.apid);
++          }
++          else {
++            Kill(m.m.command.apid,
+                (queryflag >= 0)
+                    ? SIGCONT
+                    : SIG_BYE); /* Send SIG_BYE if an error happened */
+-          queryflag = -1;
++            queryflag = -1;
++          }
+         }
+         break;
+       case MSG_COMMAND:
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index b36173b8de..19070d87d8 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
+           file://CVE-2023-24626.patch \
           "
 
 SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
-- 
2.25.1


