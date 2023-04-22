Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C505C77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:55:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.10324.1682178904265425835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HWkl4YBT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1a677dffb37so27912185ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178903; x=1684770903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMPnC5HK7Q8zQY9dcJ7VzfVHBf59pKM4g7Vvw4DJt20=;
        b=HWkl4YBTgvqJzJfr3XBtl6n4J9F8mngwXc6sPKdvQox66gAhW+OtVZ/3yIBgeDvsfl
         5uz/57ALQmgW5nZ9bMkifJVfPyYh255cBEGn6sj8ty56e/dbEMn33dUfmTfnhPIQvGeD
         3ZbaBM5Qx65uymOMasP5CT7bgYLR4nqRhVYKftg94YE4XDN3Vx7A98/jXEh5kbAIq10U
         A6DLhSymmVh/gxTwiPh8veNdL08nP03qzr/e9BQV20eySTqbIea0HplAV7MniVTQX0x1
         CkRC04QM0hPGLGWiJulgJT5wrcrxIJXLNOYMPpNoZzlhM7PdWsND5u2aFWBA+bTjDWc8
         Qeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178903; x=1684770903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMPnC5HK7Q8zQY9dcJ7VzfVHBf59pKM4g7Vvw4DJt20=;
        b=ef9tzOKWGpQcGQTQNS9t2mfD3tiP+UJt/icQ6iL2Wgd7HNcSMByEFQ5ZfmgGG2DElU
         s0CSC6drvi/Zmsm+kWUHlsMHHl6fwFh14jhjfJvisvOQVvZxGK4lAq1I9mBl2vJc7LIJ
         T9sT5lRgGFS3U1o4gqTui7FFJWrxonjYnJwgABWEbdXMyUOoiwjOjnD8gB37tHKqN8S6
         LQtdf8leVXrA6WYJW3okddKPvd3C+qYaspahOCaJSSqeodGoVJGzJ8WthgiwyE0rbkMe
         nJuQkwwAHWMsMGQ29Lov4ZLGLvl3uOwN4llc0koK5wywriJ+O0EdX4ZjM4juBhB5sFVL
         vG/A==
X-Gm-Message-State: AAQBX9d1nrLNvJpBYtsmugYNoTSVUd5YSHyj9Zg3/rLj5+WZXPU+qH9w
	eDF2eErR+/rmJXfrJDqZLPj60gUeVqg9Qvb8jyw=
X-Google-Smtp-Source: AKy350Z7qtK2kCwoQIZK+y6Utc+ZemKhr91PRGChY0kMkiTUUNvYypWwPzdW4LPooYg3BsBGjtNHzQ==
X-Received: by 2002:a17:902:e886:b0:1a1:f0cb:1055 with SMTP id w6-20020a170902e88600b001a1f0cb1055mr10663937plg.28.1682178903289;
        Sat, 22 Apr 2023 08:55:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.55.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:55:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] screen: CVE-2023-24626 allows sending SIGHUP to arbitrary PIDs
Date: Sat, 22 Apr 2023 05:54:39 -1000
Message-Id: <cf6348b5778c9409fc330808effc69e9939e6857.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180309

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/screen.git/commit/?id=e9ad41bfedb4537a6f0de20f00b27c7739f168f7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


