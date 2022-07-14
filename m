Return-Path: <ripastri@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ADBC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 23:51:22 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.759.1657842678472390384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 16:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=kA2swMoT;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: ripastri@linux.microsoft.com)
Received: from leda.corp.microsoft.com (unknown [50.35.98.180])
	by linux.microsoft.com (Postfix) with ESMTPSA id B069A20FD0C6;
	Thu, 14 Jul 2022 16:51:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B069A20FD0C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657842677;
	bh=TiVY8ADKAWwzghlF5xRomqqsLIcHgcpZx6gsZ7hY+vs=;
	h=From:To:Cc:Subject:Date:From;
	b=kA2swMoTUHhAsdx6ZVC7Skh7d4s6+I4DRuta00rg+RRa/KltL5iZx/YNxLTubnqq1
	 KrNHbi/u7exUBFJH9dryVlYmpBzEsdhlYqdl9OtPkdfX7Zn1KBQkAfDWrprHIgVIUP
	 M+QBbcyVYPK5FiHTy7fZKj+Wbf3+oop9CS2K6Tes=
From: Richard Pastrick <ripastri@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: alhe@linux.microsoft.com
Subject: [kirkstone][PATCH 1/2] cargo_common.bbclass: enable bitbake vendoring
 for externalsrc
Date: Thu, 14 Jul 2022 16:51:02 -0700
Message-Id: <20220714235103.75188-1-ripastri@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 23:51:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168052

From: Chanho Park <chanho61.park@samsung.com>

To support crate:// fetcher on externalsrc, we need to remove "-z
${EXTERNALSRC} check of bitbake vendoring. It is possible to disable
vendoring by CARGO_DISABLE_BITBAKE_VENDORING =3D "1" if externalsrc-ed
project does not want to enablt it.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Pastrick <ripastri@linux.microsoft.com>
---
 meta/classes/cargo_common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_commo=
n.bbclass
index 90fad75415..39f32829fd 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -45,7 +45,7 @@ cargo_common_do_configure () {
 	directory =3D "${CARGO_VENDORING_DIRECTORY}"
 	EOF
=20
-	if [ -z "${EXTERNALSRC}" ] && [ ${CARGO_DISABLE_BITBAKE_VENDORING} =3D =
"0" ]; then
+	if [ ${CARGO_DISABLE_BITBAKE_VENDORING} =3D "0" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
=20
 		[source.crates-io]
--=20
2.25.1


