Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FBF107BCCC
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:26:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19880.1773419160925675557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C69176A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:25:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1326E3F7BD
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:25:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] shadow: fix build with GCC 10
Date: Fri, 13 Mar 2026 16:25:55 +0000
Message-ID: <20260313162555.2289507-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233064

Fix the build with GCC 10 which otherwise fails due to function parameter=
s
being unnamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../shadow/files/prototypes.patch             | 38 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.19.4.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/prototypes.patch

diff --git a/meta/recipes-extended/shadow/files/prototypes.patch b/meta/r=
ecipes-extended/shadow/files/prototypes.patch
new file mode 100644
index 00000000000..dfdfc9b47a8
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/prototypes.patch
@@ -0,0 +1,38 @@
+Give unused function arguments names as GCC 10 will fail otherwise.
+
+This is a continuation of a PR that has been merged upstream[1] but
+this merged after expiry.c[2] and logout.c[3] were removed.
+
+[1] shadow cb0ec030 ("Fix build failure on hosts with gcc 10")
+[2] shadow 2bb1b984 ("*/: expiry(1): Remove program")
+[3] shadow eec97ce4 ("Remove unused `logoutd` utility")
+
+Upstream-Status: Inappropriate [code no longer exists upstream]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/src/expiry.c b/src/expiry.c
+index 8da89bd..0abf011 100644
+--- a/src/expiry.c
++++ b/src/expiry.c
+@@ -37,7 +37,7 @@ static void process_flags (int argc, char **argv);
+  * catch_signals - signal catcher
+  */
+ static void
+-catch_signals(int)
++catch_signals(MAYBE_UNUSED int _1)
+ {
+ 	_exit (10);
+ }
+diff --git a/src/logoutd.c b/src/logoutd.c
+index c87b75c..09a24b3 100644
+--- a/src/logoutd.c
++++ b/src/logoutd.c
+@@ -116,7 +116,7 @@ static void send_mesg_to_tty (int tty_fd)
+  *	off from the system.
+  */
+ int
+-main(int argc, char *[])
++main(int argc, char *argv[])
+ {
+ 	pid_t  pid;
+=20
diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes=
-extended/shadow/shadow_4.19.4.bb
index 7bc7f745555..9fe6a27e411 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -14,6 +14,7 @@ GITHUB_BASE_URI =3D "https://github.com/shadow-maint/sh=
adow/releases"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}'=
, '', d)} \
            file://useradd \
+		   file://prototypes.patch \
            "
=20
 SRC_URI:append:class-target =3D " \
--=20
2.43.0


