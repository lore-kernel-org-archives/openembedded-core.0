Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30900C77B7C
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 13:41:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38103.1681911707335879916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 06:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ADC21424;
	Wed, 19 Apr 2023 06:42:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 151143F6C4;
	Wed, 19 Apr 2023 06:41:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] screen: backport fix for CVE-2023-24626
Date: Wed, 19 Apr 2023 14:41:42 +0100
Message-Id: <20230419134143.1530528-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 13:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180222

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../screen/screen/signal-permission.patch     | 40 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/signal-permission=
.patch

diff --git a/meta/recipes-extended/screen/screen/signal-permission.patch =
b/meta/recipes-extended/screen/screen/signal-permission.patch
new file mode 100644
index 00000000000..77dc649090a
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/signal-permission.patch
@@ -0,0 +1,40 @@
+From e9ad41bfedb4537a6f0de20f00b27c7739f168f7 Mon Sep 17 00:00:00 2001
+From: Alexander Naumov <alexander_naumov@opensuse.org>
+Date: Mon, 30 Jan 2023 17:22:25 +0200
+Subject: fix: missing signal sending permission check on failed query me=
ssages
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
+             queryflag =3D -1;
+=20
+-          Kill(m.m.command.apid,
++          if (CheckPid(m.m.command.apid)) {
++            Msg(0, "Query attempt with bad pid(%d)!", m.m.command.apid)=
;
++          }
++          else {
++            Kill(m.m.command.apid,
+                (queryflag >=3D 0)
+                    ? SIGCONT
+                    : SIG_BYE); /* Send SIG_BYE if an error happened */
+-          queryflag =3D -1;
++            queryflag =3D -1;
++          }
+         }
+         break;
+       case MSG_COMMAND:
+--=20
+cgit v1.1
+
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-=
extended/screen/screen_4.9.0.bb
index 77e8000bf3b..235cd8c6cfc 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
            file://0001-configure-Add-needed-system-headers-in-checks.pat=
ch \
+           file://signal-permission.patch \
            "
=20
 SRC_URI[sha256sum] =3D "f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d0=
84271e0289c730f4"
--=20
2.34.1


