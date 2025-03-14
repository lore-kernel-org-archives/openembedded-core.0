Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17246C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 00:30:21 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2847.1741912213329450167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 17:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qzeUOrDy;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E0Tu9c2012055
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Mar 2025 19:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741912196;
	bh=TcoRehO8t03nERIr6l6IUfZMKaINMWxClKfSF4FzUUo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qzeUOrDywex5Too4K7dfukbUAwaR+NJWgyk2Yww4b9eSB+bp8Vv3HPwnavYEXzG4/
	 1ISKfvAZAGoz1HCyhZTqNrghPFp/DfgnLzeCSPV3jrEJZ5lbHa1fJGgqKqzSipiMp2
	 +2jn82mzB20+aYzZTs1Dg4MI/mmPyjUF1wQTQIhM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0TuTP023204;
	Thu, 13 Mar 2025 19:29:56 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 19:29:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 19:29:55 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E0TtAx061940;
	Thu, 13 Mar 2025 19:29:55 -0500
From: <rs@ti.com>
To: <otavio.salvador@ossystems.com.br>, <alex.kanavin@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [PATCH] bzip2: add libbz2.so.1.0 link for compat
Date: Thu, 13 Mar 2025 19:29:34 -0500
Message-ID: <20250314002937.672768-3-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314002937.672768-1-rs@ti.com>
References: <20250314002937.672768-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212809

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
index 78138d1543..02d81e7069 100644
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


