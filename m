Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9kpu-0003Yb-Ae
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:46:10 +0200
Received: by mail-iy0-f175.google.com with SMTP id y10so2705988iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 15:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/0s5fND29hP/prgo1nFj3rniEoEHQindqslMjlGJ+eo=;
	b=FSQ4la9vhorcJ7xSuDG5m7FBMMYQ2Ul0SGy3zgR63ICPhM6i4+db7nx3Y/scMixHcP
	ufDZDIr2v73Df7BxP5Pu+BsA//46aVQTDAZ43wqhewXjmjba0grXQsVqGFa7SFItu+qU
	Shn5rJydkmywdAMYyYMCPA9G5KiWW41lo/btbKZYYDFS6kb+YDhAP6k551UKZUFvUBy3
	3cXTQRqGBqjQ6vx4dwqjFwygtDjTLdELqwWj8XlGSnVxhomv4WR6V329BYbVQJmSKDem
	M86cY5OrGN1Rxl+LsYSWYh5+F6BUpa4jzdCL4wvnyKhkORan4T0Ug+SRM1+pHn2AEzZ6
	1ilQ==
Received: by 10.50.181.200 with SMTP id dy8mr5432198igc.36.1346970827447;
	Thu, 06 Sep 2012 15:33:47 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id n5sm8157066igw.13.2012.09.06.15.33.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 15:33:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 15:32:45 -0700
Message-Id: <fe158b29057e110124cb1a7b15a57cf73395b860.1346970617.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
References: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346970617.git.raj.khem@gmail.com>
References: <cover.1346970617.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] kconfig-frontends: Create symlinks for conf and mconf
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
X-List-Received-Date: Thu, 06 Sep 2012 22:46:10 -0000

eglibc calls out mconf and conf directly so lets create
symlinks to point to their kconfig- counterparts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kconfig-frontends/kconfig-frontends_3.5.bb     |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
index 277de03..96899b8 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
@@ -11,7 +11,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf"
-PR = "r0"
+PR = "r1"
 PV = "3.5.0"
 SPIN = "0"
 SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
@@ -24,6 +24,12 @@ inherit autotools
 do_configure_prepend () {
 	mkdir -p scripts/.autostuff/m4
 }
+
+do_install_append() {
+	ln -s kconfig-conf ${D}${bindir}/conf
+	ln -s kconfig-mconf ${D}${bindir}/mconf
+}
+
 EXTRA_OECONF += "--disable-gconf --disable-qconf"
 
 # Some packages have the version preceeding the .so instead properly
-- 
1.7.9.5



