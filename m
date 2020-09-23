Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.9752.1600854473646105939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 02:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08N9kbhu009334
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 02:47:18 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Sep
 2020 02:47:08 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross@burtonini.com>, <ricardo@foundries.io>
Subject: [PATCH 3/4] dhcpcd: add dhcpcd user to support priviledge separation
Date: Wed, 23 Sep 2020 17:45:47 +0800
Message-ID: <20200923094548.13448-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923094548.13448-1-yi.zhao@windriver.com>
References: <20200923094548.13448-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

The dhcpcd enables privsep by default. It requires a user added to the
system. Add dhcpcd user and group to support it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
index 557e15128e..4344841b54 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2cb9666"
 
-inherit pkgconfig autotools-brokensep systemd
+inherit pkgconfig autotools-brokensep systemd useradd
 
 SYSTEMD_SERVICE_${PN} = "dhcpcd.service"
 
@@ -33,10 +33,16 @@ EXTRA_OECONF = "--enable-ipv4 \
                 --runstatedir=/run \
                "
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system -d ${localstatedir}/lib/${BPN} -M -s /bin/false -U dhcpcd"
+
 do_install_append () {
     # install systemd unit files
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/dhcpcd*.service ${D}${systemd_unitdir}/system
+
+    chmod 700 ${D}${localstatedir}/lib/${BPN}
+    chown dhcpcd:dhcpcd ${D}${localstatedir}/lib/${BPN}
 }
 
 FILES_${PN}-dbg += "${libdir}/dhcpcd/dev/.debug"
-- 
2.17.1

