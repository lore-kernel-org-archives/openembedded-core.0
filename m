Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06BDC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 12:53:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.26031.1644411199520942828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 04:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 045D81FB
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Feb 2022 04:53:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D96A3F73B
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Feb 2022 04:53:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cmake: stop FetchContent from fetching content
Date: Wed,  9 Feb 2022 12:53:15 +0000
Message-Id: <20220209125315.3177811-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 12:53:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161554

CMake includes a FetchContent module, which will download further
source code at configure time.  With the network isolation this will now
fail, but as not all environments support network isolation we can tell
cmake to not download either for extra safety.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 92b9197c487..fac7bbca7a3 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -189,6 +189,7 @@ cmake_do_configure() {
 	  -DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=3D1 \
 	  -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=3DON \
+	  -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
 	  ${EXTRA_OECMAKE} \
 	  -Wno-dev
 }
--=20
2.25.1


