Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF03C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:28:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17757.1676910500631369894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A600FEC;
	Mon, 20 Feb 2023 08:29:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C64403F703;
	Mon, 20 Feb 2023 08:28:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] less: backport the fix for CVE-2022-46663
Date: Mon, 20 Feb 2023 16:28:15 +0000
Message-Id: <20230220162817.180458-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177438

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../less/files/CVE-2022-46663.patch           | 28 +++++++++++++++++++
 meta/recipes-extended/less/less_608.bb        |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/less/files/CVE-2022-46663.patch

diff --git a/meta/recipes-extended/less/files/CVE-2022-46663.patch b/meta=
/recipes-extended/less/files/CVE-2022-46663.patch
new file mode 100644
index 00000000000..20f9d89ed86
--- /dev/null
+++ b/meta/recipes-extended/less/files/CVE-2022-46663.patch
@@ -0,0 +1,28 @@
+CVE: CVE-2022-46663
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a78e1351113cef564d790a730d657a321624d79c Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Fri, 7 Oct 2022 19:25:46 -0700
+Subject: [PATCH] End OSC8 hyperlink on invalid embedded escape sequence.
+
+---
+ line.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/line.c b/line.c
+index 236c49ae..cba7bdd1 100644
+--- a/line.c
++++ b/line.c
+@@ -633,8 +633,8 @@ ansi_step(pansi, ch)
+ 		/* Hyperlink ends with \7 or ESC-backslash. */
+ 		if (ch =3D=3D '\7')
+ 			return ANSI_END;
+-		if (pansi->prev_esc && ch =3D=3D '\\')
+-			return ANSI_END;
++		if (pansi->prev_esc)
++            return (ch =3D=3D '\\') ? ANSI_END : ANSI_ERR;
+ 		pansi->prev_esc =3D (ch =3D=3D ESC);
+ 		return ANSI_MID;
+ 	}
diff --git a/meta/recipes-extended/less/less_608.bb b/meta/recipes-extend=
ed/less/less_608.bb
index f411a8fb53f..f907a8159cc 100644
--- a/meta/recipes-extended/less/less_608.bb
+++ b/meta/recipes-extended/less/less_608.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237=
af26da5dc08a4e440464 \
 DEPENDS =3D "ncurses"
=20
 SRC_URI =3D "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz=
 \
+           file://CVE-2022-46663.patch \
 	  "
=20
 SRC_URI[sha256sum] =3D "a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d4=
1ec079685a6ac209"
--=20
2.34.1


