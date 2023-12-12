Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DA9C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:09:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2357.1702390159587843776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC4F6143D;
	Tue, 12 Dec 2023 06:10:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D12963F738;
	Tue, 12 Dec 2023 06:09:18 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 9/9] util-linux: ensure gtkdocize isn't called
Date: Tue, 12 Dec 2023 14:08:20 +0000
Message-Id: <20231212140820.2900963-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212140820.2900963-1-ross.burton@arm.com>
References: <20231212140820.2900963-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192202

From: Ross Burton <ross.burton@arm.com>

autoreconf will see that the configure.ac uses gtk-doc and will call
gtkdocize, but we can't actually build the documentation due to
dependency loops so forcibly tell autoreconf not to do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index 952a680a849..5592c14b732 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -39,3 +39,6 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
            "
=20
 SRC_URI[sha256sum] =3D "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e38=
99e1f05a59a1531f"
+
+# gtk-doc is not enabled as it requires xmlto which requires util-linux
+EXTRA_AUTORECONF +=3D "--exclude=3Dgtkdocize"
--=20
2.34.1


