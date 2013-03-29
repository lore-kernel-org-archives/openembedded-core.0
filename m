Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULYJe-0005qm-Os
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 13:21:54 +0100
Received: by mail-ea0-f173.google.com with SMTP id k11so190605eaj.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=HGvxc9k7E+Dm5QxXrvvt4frt6JkmjCi70owW7ek/Je0=;
	b=HLlYXCcv/tKp66dm6+yG/stYr0XMsobox8M30h/rdvrmdIXlfEB95sPZ56gDh5VJdK
	1d7OxJUbJsacmb6BeDNzdDOfkeC5220v1QokrGQ80I1c3i02UsYH+AAroAOWaZTpt1rs
	QR3U94WlFMTbhBk61JMl2Tu0UqYHyKl1Za3uEFIIZT384eTZq1+mH7Qd9yxilb33JLNu
	C15rBwhpYaj5vz2IUKkd0AyRWIm/UVUfH7dwZSKBU64bmqPUuLQP/lpJ1aKIGVxfOBOg
	zxGgM7HQWKold61JcUKjvd2FtIuY3t0ljF00BDRamjzBkhSE8eBcHobxrXo5de0g9rg9
	BRmQ==
X-Received: by 10.15.43.132 with SMTP id x4mr7201419eev.31.1364558690761;
	Fri, 29 Mar 2013 05:04:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u44sm3654082eel.7.2013.03.29.05.04.49
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 05:04:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 13:04:51 +0100
Message-Id: <1364558691-1012-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] systemd: Add new package systemd-kernel-install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 12:21:54 -0000

From: Khem Raj <raj.khem@gmail.com>

Package additional directories e.g. /etc/kernel and /usr/lib/kernel

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_199.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 74b14af..ba1d133 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -114,7 +114,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -130,6 +130,10 @@ FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
                               ${systemd_unitdir}/system/systemd-vconsole-setup.service \
                               ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
 
+FILES_${PN}-kernel-install = "${bindir}/kernel-install \
+                              ${sysconfdir}/kernel/ \
+                              ${exec_prefix}/lib/kernel \
+                             "
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
 
 CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
-- 
1.8.1.5



