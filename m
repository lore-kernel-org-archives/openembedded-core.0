Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.1113.1605739038164036899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 14:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=LaeFN5zB;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1E2192468D;
	Wed, 18 Nov 2020 22:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605739037;
	bh=2hgEdCsx4+gy4QYIttmBotogGu4atMuy+/I1TiT+/54=;
	h=From:To:Cc:Subject:Date:From;
	b=LaeFN5zB5DBuu+Wn+cCV0Jx8sz5jHXRRqmy99ivIx7yUR1E9TH0T5+/y3RPIeGugg
	 +g+vqwsbUv5koncgHhTORGpJDzXj4sfd4vsBoTaAjAnQNZkzUev3CC/SGKLGoypuFF
	 sCMlWVEBT4yebAwryOzX986s1ffXobgi6vIC9L0w=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] volatile-binds: add /srv to mount and install
Date: Wed, 18 Nov 2020 22:37:08 +0000
Message-Id: <20201118223708.9664-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

We are installing a service to volatile mount /srv
directory but we are not creating it on the target.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index b273293e9a8..08bda6d14bc 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -36,6 +36,7 @@ def volatile_systemd_services(d):
 SYSTEMD_SERVICE_${PN} = "${@volatile_systemd_services(d)}"
 
 FILES_${PN} += "${systemd_unitdir}/system/*.service"
+FILES_${PN}_append = " ${servicedir}"
 
 do_compile () {
     while read spec mountpoint; do
@@ -64,6 +65,7 @@ do_compile[dirs] = "${WORKDIR}"
 
 do_install () {
     install -d ${D}${base_sbindir}
+    install -d ${D}${servicedir}
     install -m 0755 mount-copybind ${D}${base_sbindir}/
 
     install -d ${D}${systemd_unitdir}/system
-- 
2.17.1

