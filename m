Return-Path: <maanyagoenka@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3684C47DB3
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 02:57:38 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7094.1706756253289023184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 18:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=jJQfDwRF;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: maanyagoenka@linux.microsoft.com)
Received: from maanya-vm-20.i32zew0cey2u1cyshmh12embkc.xx.internal.cloudapp.net (unknown [20.115.210.253])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7DCDE206FCC1;
	Wed, 31 Jan 2024 18:57:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7DCDE206FCC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1706756252;
	bh=356zHELsGq1cpa9aMarr9bpFEBv6jcOv79/e08Uxtaw=;
	h=From:To:Cc:Subject:Date:From;
	b=jJQfDwRF/9KnvyWuNoEqt9IynJihp25SDCtOjijUHhBxTFVz2wGM2w34+qeMcFNgK
	 ZewMnaMu5BVRvB/u8pJb3itt8Dm4oL+5c9DEz0GtMa1K/0GPQhBkjkVoB03D4At7jl
	 8IH7g4ENCtun4XYA+HwEFY0zwtZXUoHlKl8lTrDo=
From: Maanya Goenka <maanyagoenka@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: alhe@linux.microsoft.com,
	Maanya Goenka <maanyagoenka@microsoft.com>
Subject: [PATCH] bash: nativesdk-sdk-provides-dummy RPROVIDES bash for nativesdk already so usrmerge should not
Date: Thu,  1 Feb 2024 02:56:20 +0000
Message-Id: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 02:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194547

From: Maanya Goenka <maanyagoenka@microsoft.com>

The package nativesdk-sdk-provides-dummy already provides /bin/sh and /bi=
n/bash
so we prevent re-including them with the usrmerge distro feature to avoid=
 conflicts.

Signed-off-by: Maanya Goenka <maanyagoenka@microsoft.com>
Signed-off-by : Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/recipes-extended/bash/bash.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/=
bash/bash.inc
index 18874a0e24..94972294d3 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -128,4 +128,6 @@ PACKAGE_BEFORE_PN +=3D "${PN}-loadable"
 RDEPENDS:${PN}-loadable +=3D "${PN}"
 FILES:${PN}-loadable +=3D "${libdir}/bash/*"
=20
-RPROVIDES:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge'=
, '/bin/sh /bin/bash', '', d)}"
+# Limit the RPROVIDES here to class target so that if usrmerge is added =
to the host, it does not also include bash and sh;
+# this is needed because the package 'nativesdk-sdk-provides-dummy' alre=
ady provides /bin/sh and /bin/bash and we do not want any conflicting RPR=
OVIDES
+RPROVIDES:${PN}:append:class-target =3D " ${@bb.utils.contains('DISTRO_F=
EATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
--=20
2.25.1


