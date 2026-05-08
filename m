Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D57CD37B5
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 21:40:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.670.1778276438655926543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 14:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=XyulgKGU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2AF68C5DC71
	for <openembedded-core@lists.openembedded.org>; Fri,  8 May 2026 21:41:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1491605D0;
	Fri,  8 May 2026 21:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4F5F10819DD3;
	Fri,  8 May 2026 23:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778276436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IwWjBD6MyQtJ7P5r+d1EVb9dXJPR5t3/1SG6vNzmMdg=;
	b=XyulgKGUjBG9mpRBL+eFv1Ie/e1SwSH5sw7rXQby6vmy5V4UkkwPgPX5by+jGxGtt2Gcli
	wVdNy5EZgeupB5kViNNZ+w6bOe/yGn4H2pzje0GBuDT83QLqjaHY/FVbxUzEZ88CiOi1OH
	idWwN2tcqTlCpPolQRVRLm8Xx2sbPpy2fvtPbc198Cac6Mpijt1SQrYEh1zoOIWOVLdYDC
	NRJw8X3h1mzSHkdVsVx1ZjTNjL4INuiNILkZlx+vdGTO4iDbPojIlkdB9tu8nCB0ZoS09m
	+oG9hJZfrjsJSrykOo2PSk0tUf4pOztszLb+s/kZDpK80OeX35zMTawkvkjzWg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 2/4] vim-xxd: introduce new recipe for xxd
Date: Fri,  8 May 2026 23:40:18 +0200
Message-ID: <20260508214020.2488025-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 21:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236743

This new recipe's main purpose is to handle xxd in the simplest way
possible, stripping it from any needless tasks and/or dependencies that
come from the fact it was originally provided by the same recipe as Vim.

Not only this recipe is faster to build, but it still provides the very
same program for both build-time and run-time, so there should be no
migration needed by the recipes depend on xxd.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-support/vim/vim-xxd_9.2.bb  | 29 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/vim/vim-xxd_9.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index f98305e930..7d45bfaf65 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -871,6 +871,7 @@ RECIPE_MAINTAINER:pn-vala =3D "Unassigned <unassigned=
@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-valgrind =3D "Mingli Yu <mingli.yu@windriver.com>"
 RECIPE_MAINTAINER:pn-vim =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vim-tiny =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
+RECIPE_MAINTAINER:pn-vim-xxd =3D "Jo=C3=A3o Marcos Costa <joaomarcos.cos=
ta@bootlin.com>"
 RECIPE_MAINTAINER:pn-virglrenderer =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-volatile-binds =3D "Chen Qi <Qi.Chen@windriver.com>=
"
 RECIPE_MAINTAINER:pn-vte =3D "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/vim/vim-xxd_9.2.bb b/meta/recipes-suppo=
rt/vim/vim-xxd_9.2.bb
new file mode 100644
index 0000000000..d876efec4e
--- /dev/null
+++ b/meta/recipes-support/vim/vim-xxd_9.2.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "Hex dump and reverse utility from the Vim source tree"
+DESCRIPTION =3D "xxd is a small utility usually distributed with Vim tha=
t creates hex dumps from binary data and can also convert hex dumps back =
to their original form."
+SECTION =3D "console/utils"
+HOMEPAGE =3D "https://www.vim.org/"
+BUGTRACKER =3D "https://github.com/vim/vim/issues"
+
+require vim-sources.inc
+
+inherit update-alternatives
+
+PROVIDES +=3D "xxd"
+
+do_compile() {
+    cd  ${S}/src/xxd;
+    oe_runmake xxd
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 src/xxd/xxd ${D}${bindir}
+}
+
+RPROVIDES:${PN} +=3D "xxd"
+
+ALTERNATIVE:${PN} =3D "xxd"
+ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
+ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


