Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402F4C54E58
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 00:19:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8237.1710548387746463052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 17:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AA2ehRCA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42G0Ji61084377;
	Fri, 15 Mar 2024 19:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710548384;
	bh=ufK9UxCZOpXVDkNV9jN2gXqvQp4oDdvEXYKXgRdOC9U=;
	h=From:To:CC:Subject:Date;
	b=AA2ehRCAEP218QDi87OLAwcboRGrXV13xcdFhf7Rus61pqJ5F1GOo48/gG8A7OE/L
	 BZYnJqjANj8v4dfB78Etfa3WfkGmvvqzSQUi/sf99wyjaU6vK45gnPKdIt3X6Yz8X+
	 6NEfiSdcW/y5pX9RGZDJlm4nII6tgF80x5kvEIo0=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42G0JiWL036370
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Mar 2024 19:19:44 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 15
 Mar 2024 19:19:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 15 Mar 2024 19:19:44 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42G0JheR104379;
	Fri, 15 Mar 2024 19:19:43 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] bzip2: add libbz2.so.1.0 link for compat
Date: Fri, 15 Mar 2024 19:19:43 -0500
Message-ID: <20240316001943.3733687-1-rs@ti.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 00:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197252

From: Randolph Sapp <rs@ti.com>

Add a link from libbz2.so.1.0 to libbz2.so.${PV} for compatibility with
other distributions.

A handfull of distributions are still using the "Makefile-libbz2_so" to
generate libbz2 and bzip2-shared. This creates a library with a soname
of "libbz2.so.1.0". This library link is not provide by default in
autotools builds so add one here as Gentoo does now [1].

This has been addressed upstream already, but there hasn't been a stable
release since then [2].

[1] https://bugs.gentoo.org/338321
[2] https://gitlab.com/bzip2/bzip2/-/merge_requests/42

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 4e3a06f240..4453171701 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -62,6 +62,11 @@ do_install_ptest () {
 	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
 }
 
+# add the following link for cross-distro compatibility
+do_install:append () {
+	ln -s libbz2.so.${PV} "${D}${libdir}/libbz2.so.1.0"
+}
+
 FILES:libbz2 = "${libdir}/lib*${SOLIBS}"
 
 RDEPENDS:${PN}-ptest += "make bash"
-- 
2.44.0


