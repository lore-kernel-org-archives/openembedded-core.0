Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6EB60670
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 19:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 367DA208DE;
	Tue,  9 Jan 2018 19:04:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id eL_euw5tf7Yg; Tue,  9 Jan 2018 19:04:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1688420189;
	Tue,  9 Jan 2018 19:04:27 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9C82F163205;
	Tue,  9 Jan 2018 14:04:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jan 2018 14:04:25 -0500
Message-Id: <1515524665-54864-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] bash: ptest dependency on locale should honor virtual/libc-locale
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 19:04:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

meta/conf/distro/include/tclibc-glibc.inc weakly assigns PREFERRED_PROVIDER
for virtual/libc-locale to glibc-locale, but allows adjusting it if needed.
Hence, bash should not depend on glibc-locale directly, but instead use this
virtual/libc-locale variable.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-extended/bash/bash.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 89c35bd..9c2b065 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -25,7 +25,7 @@ RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make"
 
-DEPENDS_append_libc-glibc = " glibc-locale"
+DEPENDS_append_libc-glibc = " virtual/libc-locale"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-fr-fr locale-base-de-de"
 
 USERADD_PACKAGES = "${PN}-ptest"
-- 
2.7.4


