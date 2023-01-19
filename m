Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4443C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 12:10:20 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web11.43785.1674130215973532577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 04:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@yadro.com header.s=mta-01 header.b=DP2CVE7Y;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id D5E8E341857
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:10:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mta-01; bh=VWedk2Y6wTMVjsQWuDxrGmeSLfj6fe+DydrzAL4Zu48=; b=
	DP2CVE7Yh/wWz7Za2GGbckejg+56PQH5a0To3O2dWWl8A+pGA3ISuRExFA/wi9jZ
	S2kX+R6FvkFSZ+Xd+bJXqJv4ryh7wKt48H0RKFs57Jft9FhblbjoS4iAzXDgNJiN
	MmW8aC+Hx1zfRuqB67JTm1q2XvA8aXKPuIdg/evYuYo=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id CAE64341835
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:10:12 +0300 (MSK)
Received: from localhost.localdomain (172.22.3.38) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 19 Jan
 2023 15:10:12 +0300
From: <s.zhmylev@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] meson: use TRANSLATED_TARGET_ARCH in cross builds
Date: Thu, 19 Jan 2023 15:10:02 +0300
Message-ID: <20230119121002.15819-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.3.38]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 12:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176135

From: Sergei Zhmylev <s.zhmylev@yadro.com>

TARGET_ARCH for most of x86_64 machines sets additional
-march parameter in meson configuration, which is not supported
during build and several meson recipes fail.  The patch makes
meson.bbclass use TRANSLATED_TARGET_ARCH instead of TARGET_ARCH
in order to properly set -march for cross builds.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 meta/classes-recipe/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 48688bed75..65fd80fc7e 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -97,7 +97,7 @@ endian =3D '${@meson_endian('HOST', d)}'
 [target_machine]
 system =3D '${@meson_operating_system('TARGET_OS', d)}'
 cpu_family =3D '${@meson_cpu_family('TARGET_ARCH', d)}'
-cpu =3D '${TARGET_ARCH}'
+cpu =3D '${TRANSLATED_TARGET_ARCH}'
 endian =3D '${@meson_endian('TARGET', d)}'
 EOF
=20
--=20
2.37.2



