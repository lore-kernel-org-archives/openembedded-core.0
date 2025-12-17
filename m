Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B550D65C7B
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 16:05:58 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18130.1765987553070777333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=W03s7/F1;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.14, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5EF8D541B0E
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:52 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-108-123-201.trex-nlb.outbound.svc.cluster.local [100.108.123.201])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4969954083F
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765987550;
	b=PYy16m18BjFs4MLDp3g6t3jAbaxt/QIc5nmHxn+QzWmFLx9NSr/pBRB8SJuI0/katCnQiP
	Mbtbc4sGdBYHdIkQ4Y7Xcci7LuQxC/HxtNfxbXnKW4Gb96szeNz/2PD09y5RMKxmf/GE/G
	zcdz+IbpZ28K68HQsboOnxhMx42GAQs1XE9nNlNorIGMeulUmmHDoLQn3JHqk5QStc+j9l
	1GuHcrwyxmGlUjdzQJF5B7g33YwVyeGBNaAZxHUTG0HG5S+lrt6uuip+zr7VrDvqNjV/81
	ixKhoTXmMUqZftrjcd1GhCYBsyqVUiJnvcEI9xsBc/dw4hYGG2NSYZ4LVs5S5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765987550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=POJqnxVEwmB5SEbiNAxPQJV1AIGUebkww0/mh1e5se0=;
	b=brgbK9wVdPrvvX6x2FRVXWJunafy9HLgEGW7GTHB496Mqd7YqBqYKAhRgVCKLt6eqaYFt9
	//qLxTAw2pqAxI6qv46qTjFhckYDiqATHG9/heNh0pGvJwK6QNczTzTJR0A2BVF8eombxE
	6kyIvKIFl7usjynrY+NfKQsKRj9zDVbnkybWUGdKi06EhCEYCLkwVmlPJC+Wjp0x1GepaP
	9CrCUbKJDixq/GtxqW8zWlRKwBfjJJVYTA8fNEnJu/OZn6fkQfuHpymZXjkJGvXAIBlg7P
	naH+ntxdOCGAJEcBMa5I0iK3DBAWosHBIJuW8Y/xWwRpH+NP2GqqTKcxlJ/FhA==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-69dlj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Quick-Celery: 532547f926bbd38b_1765987550864_929400120
X-MC-Loop-Signature: 1765987550864:1159074051
X-MC-Ingress-Time: 1765987550864
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.123.201 (trex/7.1.3);
	Wed, 17 Dec 2025 16:05:50 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWdv03Yddz1xss;
	Wed, 17 Dec 2025 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765987548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POJqnxVEwmB5SEbiNAxPQJV1AIGUebkww0/mh1e5se0=;
	b=W03s7/F1DIWsu/9sk4q/oPoJEt/w1rSto9kTK0cyIjLmwkQxwGvj1Q2nZf21eAxHothKNV
	+xtFKLF4TOe5stXPc9bJUSjCJmiBsD9DOMu83tO8X9lpEhl1uqxefjLwH9yIWBk7iXg43K
	790i9Ej6Sh2q+WarGMr5je1eMCAqLsd2hx6buZo/2w1qWVTQlzUmTXH2H7DmCqdycZriob
	SZLlu1dUoCT7QQrxR9HAfNjzBl84/JMGRKU9sD+Hw99/tJsyxxWo3sXSmzDAVFnd9jCrtt
	6qE32MQ9BSjuh+enuyy6g39hVFII9hwTmoT+6R3Fz9sHKmuBQ3+idxcqcqE5Dg==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 1/5] alsa-lib: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217160533.600164-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
References: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 16:05:48 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=6942d4dc a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=7mOBRU54AAAA:8 a=ZK44GZbxQgOimOsRIIoA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=wa9RWnbW_A1YIeRBVszw:22
X-CM-Envelope: MS4xfDGJ58PKScmCciVRf9gghsSvQRKcee5Xp8vfZb+JEP2CTy7Sn99FJesEAtiW+nTA+gSx+dAARCbzSFH22lxpgyboalmqcS/fiew6liQbwpR6GkblM04z fqyB0x6A8O+DZNvZBfRexNdhQ4r1RV+ailPd2ohDw2rvw1CvbmAg7YfuT/LJRbg44XSn4HTiGlYrMzLVTbPu+TIfjJfoAXBhXpmENU+zfvlEt6uGdtg8svWf qbwW9Vj5HIlGB6BxkTh1JqAo1M0KaEuZUg+CGS7aI+WLcIoCrNNa3RL5xs7vnBFPB5nVC2WQauv+5k+fHuhDVPeS7A+z8zM6RyCrOew8Xlb/wiHTFXdX4xl/ JCn9IoEC
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228070

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

