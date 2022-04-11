Return-Path: <lkml@jv-coder.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7304DC54F65
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 by mx.groups.io with SMTP id smtpd.web11.28970.1649680530900197086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 05:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@jv-coder.de
 header.s=dkim header.b=Y5821a6X;
 spf=pass (domain: jv-coder.de, ip: 5.9.79.73, mailfrom: lkml@jv-coder.de)
Received: from ubuntu.localdomain (unknown [188.192.100.83])
	by mail.jv-coder.de (Postfix) with ESMTPSA id 257129F943;
	Mon, 11 Apr 2022 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1649680527; bh=C3tI7vH+Gc41q5IOEXBpP75N+/4dRh3k0pMdRW5uFjA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Y5821a6XdtXoUn82i5KGI+YoM6P686SL3UxQC1z0JUa56E4oK4aJ5i8kd2NrW9i7A
	 FFaFBRqTPBOxlfrJlTwy7sGQPIQXww/PsOcbQupOETG9kwj2c7nY2U7kAe3RT1A0LS
	 dSeSVtoJQ6PLIJw7MrRv9q/JFY1Fv1SlCbRQvxko=
From: Joerg Vehlow <lkml@jv-coder.de>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Joerg Vehlow <joerg.vehlow@aox.de>
Subject: [PATCH] go: Always pass interpreter to linker
Date: Mon, 11 Apr 2022 14:35:20 +0200
Message-Id: <20220411123520.95107-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164219

From: Joerg Vehlow <joerg.vehlow@aox.de>

When gos internal linker is used, it uses hardcoded paths to the
interpreter (dynamic linker). For x86_64 this hardcoded path is
/lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker path
is /lib64/ld-linux-x86-64.so.2.
Most of the time, the internal linker is not used and binutils linker
sets the correct path, but sometimes the internal linker is used and
the resulting binary will not work on x86_64.

To ensure the path is always correct, pass  it to the linker.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 9c4c92bffd..df8d4db26d 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,4 +1,5 @@
 inherit goarch
+inherit linuxloader
=20
 GO_PARALLEL_BUILD ?=3D "${@oe.utils.parallel_make_argument(d, '-p %d')}"
=20
@@ -44,7 +45,7 @@ GO_LINKMODE ?=3D ""
 GO_LINKMODE:class-nativesdk =3D "--linkmode=3Dexternal"
 GO_LINKMODE:class-native =3D "--linkmode=3Dexternal"
 GO_EXTRA_LDFLAGS ?=3D ""
-GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFLA=
GS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} -I ${@get_linuxl=
oader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
 export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
--=20
2.25.1


