Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DCCCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:58:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35795.1779368325093595048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 05:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=smEAZacz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 02349C2C64F;
	Thu, 21 May 2026 12:59:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBF8D60495;
	Thu, 21 May 2026 12:58:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A24C5107E8B85;
	Thu, 21 May 2026 14:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779368322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pp6/gPr+goLNLEg57cDdpBzM7Z53WJafWFM+tJ9WsfQ=;
	b=smEAZaczr74rEDYK0CXYAZLDId4gh7qCsm1SycwhHeUm0gXQwRCapE/gedGMw8zsW7oXYZ
	AlKjJaYeUkpj0xlvPdjLGwHVNHdSv6pjE0sX073UMrAEWlPeGNNyxab9epd21SlEdznBFl
	fgYddZnOC92EhFYCjZQbN+tMI0A9cXxqEOSiha+ufi0c1o5FHxziRO1LSxi3HJdF/n73oi
	j6oPsTWqW0lSrOKAUNglua1Xr7kipMptyv6zq0YLX3N4D66hNjk0l569vrGAly9bnhsezf
	crtyuPppJEamzqCObXbXR77bsw77KT4OPfaYo1Coy19NmQSg/bM6XqqBTW0/3Q==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Ross.Burton@arm.com,
	alex.kanavin@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 2/5] vim-xxd: introduce new recipe for xxd
Date: Thu, 21 May 2026 14:58:25 +0200
Message-ID: <20260521125828.718050-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237509

This new recipe's main purpose is to handle xxd in the simplest way
possible, stripping it from any needless tasks and/or dependencies that
come from the fact it was originally provided by the same recipe as Vim.

Not only this recipe is faster to build, but it still provides the very
same program for both build-time and run-time, so there should be no
migration needed by the recipes depend on xxd.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-support/vim/vim-xxd_9.2.bb  | 35 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/vim/vim-xxd_9.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 24c5a9d712..dbb53c392c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -869,6 +869,7 @@ RECIPE_MAINTAINER:pn-vala =3D "Unassigned <unassigned=
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
index 0000000000..5cfacbcea6
--- /dev/null
+++ b/meta/recipes-support/vim/vim-xxd_9.2.bb
@@ -0,0 +1,35 @@
+SUMMARY =3D "Hex dump and reverse utility from the Vim source tree"
+DESCRIPTION =3D "xxd is a small utility usually distributed with Vim tha=
t creates hex dumps from binary data and can also convert hex dumps back =
to their original form."
+SECTION =3D "console/utils"
+HOMEPAGE =3D "https://www.vim.org/"
+BUGTRACKER =3D "https://github.com/vim/vim/issues"
+
+LICENSE =3D "X11 | GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "\
+    file://${COMMON_LICENSE_DIR}/X11;md5=3D87f08485cf6ba3c63a00eda8ecba7=
f1d \
+    file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd64256=
10833a22dbe6 \
+"
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


