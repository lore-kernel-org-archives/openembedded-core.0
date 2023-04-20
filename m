Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003FEC77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 06:55:16 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2218.1681973710162687818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 23:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=LHEU2XuQ;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so633521b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681973709; x=1684565709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HO35TZ3MyFkHfaxFVKM1ZzodfceB1ss0HVZtawpI0L4=;
        b=LHEU2XuQlmfu6WFzSx1e1BCNC8YwPPGyvS3dIIhbK5hyzBdKLhXRI+TMwUS4IWW+TU
         5Mpwr9eSPM+wDQGoUUufRW4gg6j2prb3ORcHvYQtNkbrSs7CG2JmAgoAFOAq8NQwRNPW
         HXl0KgOi3wR/TBlkagtHHDp2RPyX/YPPTfpB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681973709; x=1684565709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HO35TZ3MyFkHfaxFVKM1ZzodfceB1ss0HVZtawpI0L4=;
        b=az+ek8G+0k21GZnoVI4rPrYZEznaj4f+LfImc9UhP054nYl+ebQawn4p7EPw4QVGYs
         XvqzirKODTQpBOUQpti8I042KMdnoF3ty/3kuBXpkJRyQ3zbUeAfkquWIYINY2XoyPIY
         lSDifdVq9HWQ7QY9s5UH5FcSDuNRRNxPznAHy3ONF0lQnDbXflLJSbIcalXVKqEVAo8L
         OUzm2Rv1bC01hz7aR4H+LL1h+ieGBULcwDQzLGgc5hvoYIelCSv5jr3PWaDpFJ8XpQoA
         dR7K5As97qMNjaiOM2hOMEMp4WiJBjkRGzHSZ216ajK4uCsFW6x9CY4umJx/3eTBFP60
         DTrg==
X-Gm-Message-State: AAQBX9dDhAnwTIWlLYfnw6Hbf8z0ZFirJh1VmGQHL+rz+xpxQFhQpKAp
	pw9BWT3YCzif3DUj3w+F6P7SGVcHkS/p9H1btPk=
X-Google-Smtp-Source: AKy350YH8Jo8d7igUf8B6kR6ZHM3gCPcY3ITgwIclw4CNHptGfdK8P/Uerw2e/1a/zD1NnwR/gTXew==
X-Received: by 2002:a05:6a00:2355:b0:63b:8ddc:2e0c with SMTP id j21-20020a056a00235500b0063b8ddc2e0cmr139794pfj.32.1681973709260;
        Wed, 19 Apr 2023 23:55:09 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.130])
        by smtp.gmail.com with ESMTPSA id x4-20020aa784c4000000b0063d238b1e4bsm497351pfn.160.2023.04.19.23.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:55:08 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 20 Apr 2023 12:25:03 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] screen: CVE-2023-24626 allows sending SIGHUP to arbitrary PIDs
Date: Thu, 20 Apr 2023 12:25:02 +0530
Message-Id: <20230420065502.77030-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 06:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180237

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/screen.git/commit/?id=e9ad41bfedb4537a6f0de20f00b27c7739f168f7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../screen/screen/CVE-2023-24626.patch        | 40 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.8.0.bb  |  1 +
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
diff --git a/meta/recipes-extended/screen/screen_4.8.0.bb b/meta/recipes-extended/screen/screen_4.8.0.bb
index fe640c262b..c4faa27023 100644
--- a/meta/recipes-extended/screen/screen_4.8.0.bb
+++ b/meta/recipes-extended/screen/screen_4.8.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://CVE-2021-26937.patch \
+           file://CVE-2023-24626.patch \
           "
 
 SRC_URI[md5sum] = "d276213d3acd10339cd37848b8c4ab1e"
-- 
2.25.1


