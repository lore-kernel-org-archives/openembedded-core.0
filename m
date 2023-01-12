Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4BDC61DB3
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 21:33:30 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web10.69323.1673559199770509655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 13:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@yadro.com header.s=mta-01 header.b=nLcnjFgH;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id E4EEE341418
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 00:33:16 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mta-01; bh=KHxcFrADoqYh9niSDJsxmTj/fLZkFIxygw9hf5mkDFE=; b=
	nLcnjFgHXRk+IZCcxzS55+aaOXfQKLvHk1eJZdgLN8uv5530kuY+hoqr22ciq0De
	/vfVJ6q79UZ9uAl0LRHQVETUBD+aVh/3bcPsAFRUb2GMcILn+sgsoPA+oIB6Ceg9
	lUzi3dVXU5W+5fmCLYzRIicWICo8Vtbf43k+VnjHgK0=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id D71AF34140B
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 00:33:16 +0300 (MSK)
Received: from localhost.localdomain (10.178.120.250) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 13 Jan 2023 00:33:16 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] package_rpm: allow arch overriding
Date: Fri, 13 Jan 2023 00:33:01 +0300
Message-ID: <20230112213301.11768-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.178.120.250]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 21:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175806

From: Sergei Zhmylev <s.zhmylev@yadro.com>

Currently arch is being calculated from either MACHINE_ARCH or
TUNE_PKGARCH.  Some recipes do override PACKAGE_ARCH intentionally.
This commit makes possible to override ARCH for RPM packages
separately in order to simplify common rpm naming conformance.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 meta/classes-global/package_rpm.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
index 85d0bd7fce..3fb7466778 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -678,6 +678,10 @@ python do_package_rpm () {
     bb.utils.mkdirhier(pkgwritedir)
     os.chmod(pkgwritedir, 0o755)
=20
+    rpm_arch_override =3D d.getVar("RPM_ARCH_OVERRIDE")
+    if package_arch !=3D "noarch" and rpm_arch_override:
+        pkgarch =3D rpm_arch_override
+
     cmd =3D rpmbuild
     cmd =3D cmd + " --noclean --nodeps --short-circuit --target " + pkga=
rch + " --buildroot " + pkgd
     cmd =3D cmd + " --define '_topdir " + workdir + "' --define '_rpmdir=
 " + pkgwritedir + "'"
--=20
2.37.2



