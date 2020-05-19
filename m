Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6345.1589862983780772183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 21:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 314CE40C06;
	Tue, 19 May 2020 04:36:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iby0Pg45GaDA; Tue, 19 May 2020 04:36:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1870C40A9E;
	Tue, 19 May 2020 04:36:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 96DB017316F;
	Tue, 19 May 2020 00:36:21 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] populate_sdk_base: do not overwrite ld.so.conf in nativesdk
Date: Tue, 19 May 2020 00:36:21 -0400
Message-Id: <1589862981-21386-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Commit 7ec84a463ad4c45aee9cd2cbc75b43e5aab5cd18 has moved creation of ld.so.conf
from buildtools-tarball.bb to create_sdk_files() in populate_sdk_base.bbclass.
But since create_sdk_files() is an SDK_POSTPROCESS_COMMAND, creating ld.so.conf
can potentially overwrite existing file already provided by a nativesdk package.
Use append instead to avoid overwriting existing file.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 990505e..83c3448 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -189,7 +189,7 @@ fakeroot create_sdk_files() {
        mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
        echo '${SDKPATHNATIVE}${libdir_nativesdk}
 ${SDKPATHNATIVE}${base_libdir_nativesdk}
-include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
+include /etc/ld.so.conf' >> ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 }
 
 python check_sdk_sysroots() {
-- 
2.7.4

