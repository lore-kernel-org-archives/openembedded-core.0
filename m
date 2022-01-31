Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03350C433FE
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 13:54:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.32521.1643637251859209829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABBEED6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572263F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 05:54:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] core-image-sato-sdk: allocate more memory when in qemu
Date: Mon, 31 Jan 2022 13:54:06 +0000
Message-Id: <20220131135408.2857460-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 13:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161125

Compiling code is memory-intensive, especially kernel modules like the
SystemTap probes, so give the VM 768MB of RAM.  Using 1GB appears to
cause PCI error, interestingly.

Hopefully this solves the intermittent failures caused by OOMs during
the SystemTap test.

[ YOCTO #14673 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/images/core-image-sato-sdk.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recip=
es-sato/images/core-image-sato-sdk.bb
index b52de0def02..afab473b52c 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -10,3 +10,6 @@ IMAGE_FEATURES +=3D "dev-pkgs tools-sdk \
=20
 IMAGE_INSTALL +=3D "kernel-devsrc"
=20
+# Compiling stuff, specifically SystemTap probes, can require lots of me=
mory
+# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14673
+QB_MEM =3D "-m 768"
--=20
2.25.1


