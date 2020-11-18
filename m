Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.1335.1605740096429419720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 14:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=08eSEUZX;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 39D3D246E7;
	Wed, 18 Nov 2020 22:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605740095;
	bh=y+NAc514qUDahhC/VvfFEbc0hr6oqPymbc9ILrQxQ1c=;
	h=From:To:Cc:Subject:Date:From;
	b=08eSEUZXgZe1b8sOq/d7tfYvyXxdkJYYRE5OUb39qB+cKZlA/dW2fIBSOX9Fv31IS
	 vghWEPqE2XGBwk2ue+JJvvaD+p+S6NPAFb+toggFM9+qJH+aef/fW1gaCsYgrJe4ku
	 fKJYmqOky71Xs+r2ZFejZmDug75yM20l0eq8JgeA=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v2] volatile-binds: add /srv to mount and install
Date: Wed, 18 Nov 2020 22:54:50 +0000
Message-Id: <20201118225450.10241-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

We are installing a service to volatile mount /srv
directory but we are not creating it on the target.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index b273293e9a8..3c8b18291e6 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -35,7 +35,7 @@ def volatile_systemd_services(d):
 
 SYSTEMD_SERVICE_${PN} = "${@volatile_systemd_services(d)}"
 
-FILES_${PN} += "${systemd_unitdir}/system/*.service"
+FILES_${PN} += "${systemd_unitdir}/system/*.service ${servicedir}"
 
 do_compile () {
     while read spec mountpoint; do
@@ -64,6 +64,7 @@ do_compile[dirs] = "${WORKDIR}"
 
 do_install () {
     install -d ${D}${base_sbindir}
+    install -d ${D}${servicedir}
     install -m 0755 mount-copybind ${D}${base_sbindir}/
 
     install -d ${D}${systemd_unitdir}/system
-- 
2.17.1

