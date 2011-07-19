Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4V-000266-6j
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:59 +0200
Received: by mail-iy0-f175.google.com with SMTP id 12so2181793iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xI26TPzK4tKUrv6SgfSGNKQEu18Qol96dE4REaUA5uE=;
	b=UlHIhKlIqsL62foAM1X7e2sbuhUDSMOZQYVG1kzae2uxQYGJM2eub5ajImRIUvVhtr
	rrVlNpc1GMldhbBLLGVi5FB/pc84Sy2Sx7/TYOqbvaA+aKr61vJeccTwh30HAJTVSZEs
	m8ZVUHux9T5o+onYmg+guw73rqq1Px+J+0TxA=
Received: by 10.231.112.150 with SMTP id w22mr6530849ibp.61.1311034676663;
	Mon, 18 Jul 2011 17:17:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:30 -0700
Message-Id: <3335d84281983d1a461e44259bac31817b705b70.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 11/16] powertop: Add lintl to linker commandline on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 00:22:00 -0000

intl support is not inbuilt into libc like glibc
so we have to link it explicitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/powertop/powertop_1.13.bb |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb b/meta/recipes-kernel/powertop/powertop_1.13.bb
index 472a2bb..b08f65c 100644
--- a/meta/recipes-kernel/powertop/powertop_1.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_1.13.bb
@@ -11,16 +11,19 @@ DEPENDS = "virtual/libintl ncurses"
 # powertop 1.13 needs lspci
 RDEPENDS_${PN} = "pciutils"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
-           file://stub_out_the_ncurses_calls_in_dump_mode.patch"
+           file://stub_out_the_ncurses_calls_in_dump_mode.patch \
+          "
 
 SRC_URI[md5sum] = "78aa17c8f55178004223bf236654298e"
 SRC_URI[sha256sum] = "2bc866089496877dd26d2d316ad5763ab8ecb5e28aefba44bc5d355dcdc58d98"
 
 CFLAGS += "${LDFLAGS}"
-EXTRA_OEMAKE = "VERSION=\"${PV}\""
+EXTRA_OEMAKE = "VERSION=\"${PV}\" EXTRA_LIBS=${EXTRA_LIBS}"
+
+EXTRA_LIBS_libc-uclibc = "-lintl"
 
 inherit update-alternatives
 ALTERNATIVE_NAME = "powertop"
@@ -30,7 +33,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 do_configure() {
 	# We do not build ncurses with wide char support
-	sed -i -e "s/lncursesw/lncurses/" ${S}/Makefile
+	sed -i -e 's:lncursesw:lncurses ${EXTRA_LIBS}:g' ${S}/Makefile
 }
 
 do_install() {
-- 
1.7.4.1



