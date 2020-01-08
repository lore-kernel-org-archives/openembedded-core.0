Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 047D47FF62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 16:49:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 20so3223686wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HyghRgxaEX04LbUEm7TG8WpR8+u8q4EPBUic5go5Z9k=;
	b=Jub9+c+vRQs525D/H6wC13zxCNgv59QhMbqb3kO5gUArYPDPMydRgU4Z6AN/DIBARt
	0diqyCGrZY7tPAdhuMdvcxBWwR/cWfX3ZXce2fQENbqHQ2o3UZZGP+VXyf4mEQHZrkwJ
	oPLxoxePmhw5U5JIOdvFT+I7ZWDoxl2ChllClNSLTkFQAonCJn+xzkNrFXM+plne1JgR
	kqfjJXZsW9NbvMqdfXp+8fqLURl62RsgyGUGBb+XNTVk3lKrWEElNJqdJhEZCSvWPuhm
	arl94dei37/U61BZHjrqvMNRqUbxBYh5MP4k4wvO9yiGK+kw2ONvrwXOz+23yD8gvU6C
	pcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HyghRgxaEX04LbUEm7TG8WpR8+u8q4EPBUic5go5Z9k=;
	b=edFtF+svRm5AhyicBUcdaFmDBavhW11v/rEkPWAaW5/apd02f6DSkHMobzqYHM9keF
	7hhS8YG/UhNiQga1VZ49BQUgzIbeS6SRB4Iyyz27J78X0laa4JoLqlTtlp6ApCTVjWHD
	TvUWWj7TT/2p0J1PnWBCPde1+m8zEq6xZD1AURs4ozsBwL7ZnOe1mSK1zumcsKlOv3ey
	+h+PPUYaoHxav9pM2QcRj1S40U1FxBiGexgJbLfXqFx+FbrEJvrAOLHi8Ky+sNgQklyE
	3a2QWmwBHm9YQKHIk5NqJtC8dCvftxGA7zi/c5v1+t2nB224NQCUWz05vVr5xCSjCNqe
	mzkA==
X-Gm-Message-State: APjAAAUDKSwHQTh0f6yFu9hfYi5B0rie0Vn/MrL3gFMPTaWgZ/tWpJbR
	/LoKPfze8zRzyR5ZjLYO31PtlnjAGRY=
X-Google-Smtp-Source: APXvYqx5U60RmoCs44u0t2Sl8STQGOjO4YRr0ypLz7eRt9rvFa0SilcEMgdOXu8Ag7koS4H5qzX9Sg==
X-Received: by 2002:a05:600c:294:: with SMTP id
	20mr4855015wmk.97.1578502161479; 
	Wed, 08 Jan 2020 08:49:21 -0800 (PST)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it.
	[217.133.17.98]) by smtp.gmail.com with ESMTPSA id
	x10sm4653569wrv.60.2020.01.08.08.49.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 08:49:20 -0800 (PST)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 17:48:55 +0100
Message-Id: <20200108164855.25762-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] cups: fix crossscripts
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
X-List-Received-Date: Wed, 08 Jan 2020 16:49:21 -0000
Content-Transfer-Encoding: 8bit

Fix crossscripts to report the correct "serverbin" value.
While the packaged "cups-config --serverbin" reported
"/usr/libexec/cups" the crossscripts version reported
"/usr/lib/cups", causing packaging issues when building for example
cups-filters.
Also fix FILES_${PN} to use ${libexecdir}; previously it was working
just because "${libexecdir}/*" was part of the default values in
bitbake.conf.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-extended/cups/cups.inc | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b94bc1d412..34982819b9 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -84,12 +84,7 @@ do_install () {
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
 
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps', '', d)}"
-FILES_${PN} += "${libdir}/cups/backend \
-		${libdir}/cups/cgi-bin \
-		${libdir}/cups/filter \
-		${libdir}/cups/monitor \
-		${libdir}/cups/notifier \
-		${libdir}/cups/daemon \
+FILES_${PN} += "${libexecdir}/cups/ \
 	       "
 
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
@@ -107,5 +102,5 @@ CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
 
 SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
-	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libdir}/cups:'
+	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libexecdir}/cups:'
 }
-- 
2.21.0


