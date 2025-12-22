Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89F4E67497
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:43:53 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85014.1766425432151211847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=XeY98W3G;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.14, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4A9A58019F0
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:51 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.108.222.90])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 315D5801844
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766425430;
	b=LHn/bm9+vrKouNJRCIna3YFlcDDM4X9vp3xYwU+ct375MHxEyJTu0RrbbjoKmROhH5EDUI
	Jq5OckwPll6f4vYwloR0deV0AyHHU+pi4V4+ZbqxVQs4J7QqCU6tAYGjvrBaeQ9iTb/9Yo
	2f1eV407VG6i0sjCAXOZy1j5y5hDAlhpD22C3mQC0YjGgQ7SdrQGSdlleGvSRxjizm+/Rr
	fyIGlKjfcSvzDNvF3JX+Qa4XFlz4va/UOZ55Z62WBq35SYFK01PLwTjU/k6QUt2yCf+ESq
	sDqQ9yiZLQtZHluUOoc+P852RtBp8kEpmulFsSCNt/U3M8WDXMhkJwKdgcU6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766425430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=POJqnxVEwmB5SEbiNAxPQJV1AIGUebkww0/mh1e5se0=;
	b=lpjepniytHOgxo9Z4Z8vYWDsgafXSLOuyVTPX+jIALS8l2mnuwI5BfIz42RlN7wG+ee4Zb
	CUnVjVGCu1DXCUiElT4MiEsYiyUTHSNNWLbEginkcVSvfVoSDcGMaABqTU3B4IywWtNF99
	IWxywAMO6LvXBNi6NPyfK3IYIRxlQEIhU1T6VUBo8GFmS/QrvuURX9rykWQCcJCyiA6rA8
	/Ag3X2z8u1EnGEY/BuTEYvDDHS0Jtenme6NVoMUgLtpJ+XzJzjo9iNHSDJVnZgIt0oyQ4Q
	oWe+cGIhYb/qmxZmas1j/021FcFWlXNVtf511KLrQ4Fp3DryNimkvgyfZVFGNw==
ARC-Authentication-Results: i=1;
	rspamd-55cdcc6c54-rz657;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Ski-Left: 6e583e906effca4d_1766425431183_1935931976
X-MC-Loop-Signature: 1766425431183:4204080495
X-MC-Ingress-Time: 1766425431183
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.222.90 (trex/7.1.3);
	Mon, 22 Dec 2025 17:43:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7586:fd48:8d48:80a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dZlqk3dlpz1y21;
	Mon, 22 Dec 2025 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766425426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POJqnxVEwmB5SEbiNAxPQJV1AIGUebkww0/mh1e5se0=;
	b=XeY98W3GD6YYUP63OodS+CSquF0wD3IhSSwqF1Da7bMK0AHrzMbBhmBRrrszFZ3bVAM+CL
	m1RCVDxr1fIgOZLv068KkMYRlD4K0s0mAxbOok3EYed30VN+oFFn9Eg1Cv07sTJMC45iSL
	qEFfu02z67ZtCREIUmHcOgGupnpC7vfz5tM6c1vmQb0wPMHjwDCF9IgziSTvocWIbpY9Wn
	PAyKfX3Go5ngIicnGrkiFhjxrtWb4RLZtQxJSuZ3TSkKewppY4lv0U3Nmo6S/od/ZSaObB
	g9aHwg+nkj7Tz1NQemCrEHEdsCB9eFDFah+E+7rOwSADp6cRi/goOJlWTooIAQ==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 1/5] alsa-lib: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251222174336.1794730-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
References: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 17:43:46 +0000 (UTC)
X-CM-Envelope: MS4xfPm7UZZw0RWEWVPCxya1fQpP0g32XTQwpvq9uNeJyGfo4ClDdWGtfB6wqHeci0aCL3h9XJsuB2cXPu5Zoqhmdf7jMUxr/H1qlonZMmGQJhlxECDf/oQa zJgquBH9jGqflpkXR/0T6woz/WiP4u9wyiB5/ozMZmK2HHoQpPgf0DQrHkjoqWgpQ+ruAATGPANHDmhB3IMZvokr+EpwwRr1XZj8hxx2m4p1ypTVnk6UELCi 1E4s+QZxwEcDI7aOvQMsaQkleSAoL/umw9si5WosoQic1cPmgsPuUKdttP+yZjBqcqPhUhteHRucNTzv7wwpI7uiqS8dJCZr5wQ0OSmBNIol/9VZIJTxpYIZ tIwre65v
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=69498352 a=myaG3V0YOm9nx1Em8mk9ug==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=7mOBRU54AAAA:8 a=ZK44GZbxQgOimOsRIIoA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=wa9RWnbW_A1YIeRBVszw:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228320

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Include a fix from upstream that's needed with uclibc:
https://github.com/alsa-project/alsa-lib/commit/a068cf08ad67447893b707cdd=
fce31c9cafee643

Upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-lib

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...use-closefrom-instead-of-close_range.patch | 50 +++++++++++++++++++
 ...{alsa-lib_1.2.14.bb =3D> alsa-lib_1.2.15.bb} |  5 +-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm=
-use-closefrom-instead-of-close_range.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.14.bb =3D> alsa-lib_1.=
2.15.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-cl=
osefrom-instead-of-close_range.patch b/meta/recipes-multimedia/alsa/alsa-=
lib-1.2.15/0001-ucm-use-closefrom-instead-of-close_range.patch
new file mode 100644
index 0000000000..815aca8019
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-closefrom=
-instead-of-close_range.patch
@@ -0,0 +1,50 @@
+From a068cf08ad67447893b707cddfce31c9cafee643 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Date: Mon, 8 Dec 2025 23:46:17 -0500
+Subject: [PATCH] ucm: use closefrom instead of close_range
+
+From: Mike Gilbert <floppym@gentoo.org>
+
+closefrom is a library function with a fallback mechanism for when the
+kernel does not support the close_range syscall.
+
+Also check for the function properly instead of assuming it is available
+with _GNU_SOURCE defined.
+
+Closes: https://github.com/alsa-project/alsa-lib/pull/486
+Fixes: https://github.com/alsa-project/alsa-lib/issues/485
+Signed-off-by: Mike Gilbert <floppym@gentoo.org>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [a068cf08ad67447893b707cddfce31c9cafee643]
+---
+ configure.ac       | 1 +
+ src/ucm/ucm_exec.c | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8f4bd0de..f4862f64 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,7 @@ dnl Checks for library functions.
+ AC_PROG_GCC_TRADITIONAL
+ AC_CHECK_FUNCS([uselocale])
+ AC_CHECK_FUNCS([eaccess])
++AC_CHECK_DECLS([closefrom])
+=20
+ dnl Enable largefile support
+ AC_SYS_LARGEFILE
+diff --git a/src/ucm/ucm_exec.c b/src/ucm/ucm_exec.c
+index b5a22023..713039b4 100644
+--- a/src/ucm/ucm_exec.c
++++ b/src/ucm/ucm_exec.c
+@@ -259,8 +259,8 @@ int uc_mgr_exec(const char *prog)
+=20
+ 		close(f);
+=20
+-#if defined(_GNU_SOURCE)
+-		close_range(3, maxfd, 0);
++#if HAVE_DECL_CLOSEFROM
++		closefrom(3);
+ #else
+ 		for (f =3D 3; f < maxfd; f++)
+ 			close(f);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.2.15.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
index 41a42f9ecc..6ecdeefa46 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
@@ -9,8 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e=
631dd8edb7424769c7 \
                     file://src/socket.c;md5=3D285675b45e83f571c6a957fe4a=
b79c93;beginline=3D9;endline=3D24 \
                     "
=20
-SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] =3D "be9c88a0b3604367dd74167a2b754a35e142f670292ae47a=
2fdef27a2ee97a32"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://0001-ucm-use-closefrom-instead-of-close_range.patch"
+SRC_URI[sha256sum] =3D "83770841585e766a60c99fd23f8c574c22643ae0cb1f2d20=
b793c3d84eb95a8d"
=20
 inherit autotools pkgconfig
=20

