Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web08.8282.1606991726640269630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 02:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 32CFC60199;
	Thu,  3 Dec 2020 10:35:25 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
From: "Jack Mitchell" <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Kai <kai.kang@windriver.com>,
	Jack Mitchell <ml@embed.me.uk>
Subject: [PATCH 2/3] systemd-conf: add PACKAGECONFIG to enable/disable auto ethernet DHCP
Date: Thu,  3 Dec 2020 10:35:01 +0000
Message-Id: <20201203103502.192240-2-ml@embed.me.uk>
In-Reply-To: <20201203103502.192240-1-ml@embed.me.uk>
References: <20201203103502.192240-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Allow distros which include other network managers to disable the
auto DHCP setup of interfaces in systemd-networkd.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 meta/recipes-core/systemd/systemd-conf_246.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-conf_246.1.bb b/meta/recip=
es-core/systemd/systemd-conf_246.1.bb
index d9ec023bfd..944b56ff82 100644
--- a/meta/recipes-core/systemd/systemd-conf_246.1.bb
+++ b/meta/recipes-core/systemd/systemd-conf_246.1.bb
@@ -5,6 +5,9 @@ DefaultTimeoutStartSec setting."
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
=20
+PACKAGECONFIG ??=3D "dhcp-ethernet"
+PACKAGECONFIG[dhcp-ethernet] =3D ""
+
 SRC_URI =3D "\
     file://journald.conf \
     file://logind.conf \
@@ -17,7 +20,10 @@ do_install() {
 	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journ=
ald.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.=
conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.=
conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/netwo=
rk/80-wired.network
+
+        if ${@bb.utils.contains('PACKAGECONFIG', 'dhcp-ethernet', 'true'=
, 'false', d)}; then
+		install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/netw=
ork/80-wired.network
+        fi
 }
=20
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa28=
67be31759c1b52
--=20
2.29.2

