Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 34BC8606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:06:21 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 63so616908lfv.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 05:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google; h=from:to:subject:date:message-id;
	bh=gDwBc3bniUQDIWwU2Rj0RiQE2zJziZ1xiuKKp3IBlHw=;
	b=T+eQBLxiPXaRlYYf1bNghrHyTPEW8iXpCbsstWn+LrUdmNDcSZ9g/p2KEz3iasLLQJ
	aC5UWBhbjKpSdfsOnAWjNpsJMnjHAN6PFdog4BKpoFZp3breZBWG2zoLeOq664CLx+l7
	TdDLMh2piP0Vbt9VIwVueslouGrckhBsaFQUSFYUiZwbV4/OzkgPjH6F4NAU4+VxsHV0
	W5zkaDV4FKafaUk7t3AUtC9LVTn2TFq1ideo+ZYhqFra2lGV+S11igNc2R5zMBw2fjJS
	ZbCiatV62gC5Y0SaFmkrgCVsRq9eVSWIa85PCuQ1Tqio3MRT9+g03ut62FX3VaR70yut
	i+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gDwBc3bniUQDIWwU2Rj0RiQE2zJziZ1xiuKKp3IBlHw=;
	b=PVjK2595sb0vPVNph2nGGee3d354YaqhG9QhmKkC7L+T0dEFTEAyVB/Yi+n+RMEpHU
	DH5z8eZqolBSTKc5MCKfGUZy/kMrAU++Bf7EMV9b4w+id3Q72vOyz2TaqgtBpIx8SqNs
	29/ymE58VrbeGaOKCucsgB2Jje4ztvNPnk+IM0CX1Mcex719Bm9fsj+FcYGUhrKXY1H5
	PxhaOCQkj192QQY2C6JTKPpEQHYATjYPZH/cn9aAbHRKwdNy+DY57b+w8ndq6GM17Jr4
	MyNeVeIQ7qiRPiZluNsim2+8sMnqFiGhiNIgtzCr5YMFYlhE6PLJ9dSbv81KLyZ8uWyZ
	gprQ==
X-Gm-Message-State: AKwxytfn8ftmC8iRYstaXRFjV7gGD6X1FFn34nw9DXAwOrjLNyjm+3cI
	/UJtK43wU8yUWXEhInEid4U+7aWzgz0=
X-Google-Smtp-Source: AH8x2252Pbl2G6IBMDAD2eD6euNr/dbP+mvoAxrMfY/ImH9nt7+M121boJL1e64Pweuaqn5CHNiAUw==
X-Received: by 10.25.33.70 with SMTP id h67mr7759472lfh.128.1516971982540;
	Fri, 26 Jan 2018 05:06:22 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	z20sm152618ljb.71.2018.01.26.05.06.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 05:06:21 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jan 2018 14:06:19 +0100
Message-Id: <1516971979-31262-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] systemd: Make sure that resolv.conf points to writable area in R/O rootfs.
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
X-List-Received-Date: Fri, 26 Jan 2018 13:06:22 -0000

Normally we want systemd to populate it at runtime, but when we have a
read-only root filesystem we can't, so do it during the build.

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
Signed-off-by: Marcin Pasinski <marcin.pasinski@mender.io>
---
 meta/recipes-core/systemd/systemd_234.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 4132cdf..7d61a53 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -273,6 +273,9 @@ do_install() {
 	else
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
+		if ${@bb.utils.contains('IMAGE_FEATURES', 'read-only-rootfs', 'true', 'false', d)}; then
+			ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv.conf
+		fi
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 
@@ -471,6 +474,12 @@ CONFFILES_${PN} = "${sysconfdir}/machine-id \
                 ${sysconfdir}/systemd/system.conf \
                 ${sysconfdir}/systemd/user.conf"
 
+FILES_MAYBE_RESOLV_CONF = "${@bb.utils.contains('PACKAGECONFIG', 'resolved', \
+                               bb.utils.contains('IMAGE_FEATURES', 'read-only-rootfs', \
+                                   '${sysconfdir}/resolv.conf', \
+                                   '', d), \
+                               '', d)}"
+
 FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
@@ -487,6 +496,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/xdg/ \
                 ${sysconfdir}/init.d/README \
                 ${sysconfdir}/resolv-conf.systemd \
+                ${FILES_MAYBE_RESOLV_CONF} \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-- 
2.7.4


