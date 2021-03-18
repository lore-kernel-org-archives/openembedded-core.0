Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web11.8853.1616073784992968656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 06:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185, mailfrom: stefan@datenfreihafen.org)
Received: from localhost.localdomain.datenfreihafen.local (p200300e9d726e18c86f1a29d92cfccbf.dip0.t-ipconnect.de [IPv6:2003:e9:d726:e18c:86f1:a29d:92cf:ccbf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 7A37EC074A;
	Thu, 18 Mar 2021 14:22:52 +0100 (CET)
From: "Stefan Schmidt" <stefan@datenfreihafen.org>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell] [PATCH] systemd-conf: do not ask for DHCP if configured on kernel command line
Date: Thu, 18 Mar 2021 14:22:37 +0100
Message-Id: <20210318132237.7266-1-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Stefan Schmidt <stefan.schmidt@huawei.com>

In cases where we configure the IP address and more on the kernel
command line with ip=3D we should not ask for DHCP with systemd-networkd
later on. We have such a setup with our runqemu script.

With this match in place we can also deploy this unit on qemu systems.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c4981e740c0e630200dbc77c9e3dfd3e43b790b)
---
 meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
 meta/recipes-core/systemd/systemd-conf_244.3.bb      | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/=
recipes-core/systemd/systemd-conf/wired.network
index ff807ba31f..34c20fcb24 100644
--- a/meta/recipes-core/systemd/systemd-conf/wired.network
+++ b/meta/recipes-core/systemd/systemd-conf/wired.network
@@ -1,6 +1,7 @@
 [Match]
 Name=3Den* eth*
 KernelCommandLine=3D!nfsroot
+KernelCommandLine=3D!ip
=20
 [Network]
 DHCP=3Dyes
diff --git a/meta/recipes-core/systemd/systemd-conf_244.3.bb b/meta/recip=
es-core/systemd/systemd-conf_244.3.bb
index d9ec023bfd..9b797a91f4 100644
--- a/meta/recipes-core/systemd/systemd-conf_244.3.bb
+++ b/meta/recipes-core/systemd/systemd-conf_244.3.bb
@@ -23,9 +23,6 @@ do_install() {
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa28=
67be31759c1b52
 do_install_append_qemuall() {
 	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}=
/system.conf.d/01-${PN}.conf
-
-	# Do not install wired.network for qemu bsps
-	rm -rf ${D}${systemd_unitdir}/network
 }
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--=20
2.30.2

