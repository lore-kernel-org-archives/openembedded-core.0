Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76B1C77B76
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.80357.1682431080800771002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BxooMaFa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso4874873b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431080; x=1685023080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKpb5bsnBjs6C7VqGr9AURaYvzHAWsOVK5Zv6puQESA=;
        b=BxooMaFa25ZoLy9sKQxEmoPnUlYNDAhC81aU3xj4OqCkbCRrCZU+w39sFNvTTokjVo
         OXUotYTbUOG1wTL7uvzVBSgy/fGr/T3y88EcPEgAm6r5cfZFuFEC7xsu4trDSRWEtMj/
         gm3YrkZf73ZhiuzJ9G5IIBllprVrnIJrUMfgUN8h4U+Wml7ZZ2X2X0EmCwF78bSviZ5i
         YUiuq/ul1FdFOVkJ+dAA6a7IuGfPAUf+/IBv4Z5arGQ7Ls1OJDPAPOd5yFCabQwrfRzF
         dQImE+/yLd9FJRRWFoN6LW4auzHsael6nkwAouuS6rbFwa/6CBiDicMdqtXEyGIiktB/
         WAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431080; x=1685023080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKpb5bsnBjs6C7VqGr9AURaYvzHAWsOVK5Zv6puQESA=;
        b=lfsvRC760gQ3NW5qzgM6/dPas2v45ap90x2l0noWbVq+kJ01hg0jSvaXTw2S7KpjZS
         PGyNP1vUVtVBanfAugqHxRReTdBPKHsA4tz/xQdrvgrXIMDHTmPxoY6kn0G7VPuWfWi7
         Rt4O41ST4iAX2/b9JUmUc/6Dxs5w34hzpfxVsWn4ipv2t2WFFQBXR9mTJIecl9mFbZdY
         uFK71ZUg5Uxwx6XEf4flEn3rX+YsqdNMXnMJt/PgRKBOER3u/plQT1wN+ScDuP48nIws
         PRjD+7S8vJuTx7mzBIT4VfugtChX586CbMK8qolcScInBkIO7RiafRu9XxSd83mA5saR
         mDRA==
X-Gm-Message-State: AAQBX9djMs3SLziJeUR/bXnrufm552q90ZfBAzPdopnIJ1oW2+u/LC1q
	1EIVBikcoEpjYPiA0skicbq/gJulC2ktVV6ISG4=
X-Google-Smtp-Source: AKy350YPoT8Xott/jWIgH737YuMxL7ku1WlIV31VGI7fNBRnJfi/US04oXPkueUWUdawab/CzJ2s1g==
X-Received: by 2002:a05:6a20:1443:b0:f0:827f:4aff with SMTP id a3-20020a056a20144300b000f0827f4affmr23559263pzi.0.1682431079646;
        Tue, 25 Apr 2023 06:57:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.57.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:57:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/10] screen: backport fix for CVE-2023-24626
Date: Tue, 25 Apr 2023 03:57:34 -1000
Message-Id: <c72eb91464b1a0792f87e6321bbdd02f0012ffd7.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180378

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 05c7f446ca790f3695d04665aad118e42b7a52be)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../screen/screen/signal-permission.patch     | 40 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/signal-permission.patch

diff --git a/meta/recipes-extended/screen/screen/signal-permission.patch b/meta/recipes-extended/screen/screen/signal-permission.patch
new file mode 100644
index 0000000000..77dc649090
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/signal-permission.patch
@@ -0,0 +1,40 @@
+From e9ad41bfedb4537a6f0de20f00b27c7739f168f7 Mon Sep 17 00:00:00 2001
+From: Alexander Naumov <alexander_naumov@opensuse.org>
+Date: Mon, 30 Jan 2023 17:22:25 +0200
+Subject: fix: missing signal sending permission check on failed query messages
+
+Signed-off-by: Alexander Naumov <alexander_naumov@opensuse.org>
+
+CVE: CVE-2023-24626
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/socket.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/socket.c b/src/socket.c
+index 147dc54..54d8cb8 100644
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
+cgit v1.1
+
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index 77e8000bf3..235cd8c6cf 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://0001-configure-Add-needed-system-headers-in-checks.patch \
+           file://signal-permission.patch \
            "
 
 SRC_URI[sha256sum] = "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4"
-- 
2.34.1


