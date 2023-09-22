Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F30CE7A88
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 22:20:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.10141.1695421253865437945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 15:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B938140CB5;
	Fri, 22 Sep 2023 22:20:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLkQ0VVS_xHw; Fri, 22 Sep 2023 22:20:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D82940CB1;
	Fri, 22 Sep 2023 22:20:51 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3F2AC163CAC;
	Fri, 22 Sep 2023 18:20:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH 2/2] spdx: use TOOLCHAIN_OUTPUTNAME for SDK filename prefix
Date: Fri, 22 Sep 2023 22:20:43 +0000
Message-Id: <20230922222043.36032-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922222043.36032-1-denis@denix.org>
References: <20230922222043.36032-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 22:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188139

Replace SDK_NAME with TOOLCHAIN_OUTPUTNAME when naming SDK host and
target SPDX archives.

In most cases TOOLCHAIN_OUTPUTNAME is almost identical to SDK_NAME,
but sometimes custom meta-toolchain recipes have some variations and
populate_sdk_base.bbclass already uses TOOLCHAIN_OUTPUTNAME to name
corresponding host and target manifests:

SDK_HOST_MANIFEST =3D "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manif=
est"
SDK_TARGET_MANIFEST =3D "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.m=
anifest"

To match the naming convention, also use TOOLCHAIN_OUTPUTNAME here
for naming SPDX archives as well, resulting in:

${TOOLCHAIN_OUTPUTNAME}-host.spdx.tar.zst
${TOOLCHAIN_OUTPUTNAME}-target.spdx.tar.zst

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
index a2b96da61a..885f07a1f8 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -986,7 +986,7 @@ def sdk_combine_spdx(d, sdk_type):
     from pathlib import Path
     from oe.sdk import sdk_list_installed_packages
=20
-    sdk_name =3D d.getVar("SDK_NAME") + "-" + sdk_type
+    sdk_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + "-" + sdk_type
     sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
     sdk_spdxid =3D oe.sbom.get_sdk_spdxid(sdk_name)
     sdk_packages =3D sdk_list_installed_packages(d, sdk_type =3D=3D "tar=
get")
--=20
2.25.1


