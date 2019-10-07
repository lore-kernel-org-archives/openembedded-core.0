Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A68FD7E468
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 19:38:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r3so16705985wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 12:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ClHUq6k51nIhWQIw1R9XSpTm220SsJ1iAiBeVj3Ovk8=;
	b=qSAoTRVeXQTZ1VrTFC4pGZhcaQPZdRqAY9X/dpsOETxGcS1yyyzs6Pj32zlGm0BObb
	MQokvSQzvImUT0l/ubb/DJzELAwdGZqBKqltpwLvUj6Mh8lHwQcWvvd5ZttYw2ROCRNw
	9lloapVNU069iERy34nsyr4NrOmL4APu/vQX+7hJhhv2fLgArssfb6QjGjkhGgPSM9OY
	HLKhpAPeOI9dI55HHwFurxdAjzbqH8E/ozn5DZsk/lJ/PR/N2PGhnWNj0y/XZiPg4ff5
	gZp0lvXnDRKiObvNRA+uZIuypgop90N96RTHhywETiaEDNdyVdIyA08dcwqo6869tBPj
	nu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ClHUq6k51nIhWQIw1R9XSpTm220SsJ1iAiBeVj3Ovk8=;
	b=bGw/QLqIxeljfkMMjkGgoFNOWixekD+dioM0HvME7uBcdaljIqXkUAgG0VUdIOl9nE
	/cpWK4tP9SdT3eZSMaf6khviCLe64+6jBPPmQEJGoDdh2hiyfW4jy6+Gh8mE3iHFjnqP
	og0cbqLUkT2bE1TYGVGe5SjTbk+Y2XbMIRatI3Bhgc7VFagygcLjrb+4wzYBFpf+YeTo
	wvQug7wsssxWlwWDoX+UZi/GuZ+aHK+/XKa5y+Jp7nLFs6sz/vZ4SXMvciTBj0oTeEjc
	MaPUAQmhvQOZzQgs2hAw9GNSkjXjnurYz2FvcK7vKQPRQs8LCqpMtpHz2adAgukjb0h/
	Vnlw==
X-Gm-Message-State: APjAAAVu2MWyvAVr9kCwi/vlndscK8mbyqBhT3W6fWq3/hiRP/+npLFj
	5ElhThcMcd82+K+jY6CReafkiigQfOI=
X-Google-Smtp-Source: APXvYqy9Wz+T3/EjzcQGYYvrHAY+8JlVUPqM4Z067qUnhqlZxK2l7VHDkWq1f9vpxkJ6inW73QG6zg==
X-Received: by 2002:adf:ea0d:: with SMTP id q13mr939214wrm.111.1570477088993; 
	Mon, 07 Oct 2019 12:38:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a10sm17356942wrm.52.2019.10.07.12.38.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 12:38:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 20:38:04 +0100
Message-Id: <20191007193805.13219-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd: don't install systemd-hwdb-update.service
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
X-List-Received-Date: Mon, 07 Oct 2019 19:38:09 -0000
Content-Transfer-Encoding: 8bit

This service file is designed to do first-boot initialisation of the udev hwdb
database, but the condition logic to fire it is suboptimal: it can fire if not
needed, and can also not fire if needed.  Specifically it will always fire on
first boot, even though as part of rootfs generation we build the hwdb database.
On slow machines this can take a significant amount of time, the pathological
case being qemumips where the service can time out after 90 seconds of
processing.

Other distributions have also noticed this problem (specifically, at least
Debian and Clear) and solve it by using traditional postinst scripts to generate
the hwdb (which we already do) and deleting the service file (which we don't).

Finish the fix and improve boot times across all boards by deleting the service
file.

[ YOCTO #13581 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_243.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index b9097593f17..a4a744ce9ba 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -297,13 +297,10 @@ do_install() {
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
-}
 
-do_install_append () {
-	# Mips qemu is extremely slow, allow more time for the hwdb update
-	# This is a workaround until https://github.com/systemd/systemd/issues/13581 is resolved
-	[ ! -e ${D}${systemd_unitdir}/system/systemd-hwdb-update.service ] ||
-		sed -i -e s#TimeoutSec=90s#TimeoutSec=180s# ${D}${systemd_unitdir}/system/systemd-hwdb-update.service
+    # We use package postinsts for the hwdb update, as the update service is
+    # easily triggered for no reason and will slow down boots.
+    find ${D} -name systemd-hwdb-update.service -delete
 }
 
 python populate_packages_prepend (){
-- 
2.20.1


