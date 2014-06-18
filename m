Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 328616FE01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 02:37:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5I2b1pg027327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 19:37:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Jun 2014 19:37:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 10:38:13 +0800
Message-ID: <3ebd3ff83d9683478295f2c187e6fceb2ab7d698.1403059033.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1403059033.git.Qi.Chen@windriver.com>
References: <cover.1403059033.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] udev: remove udev-utils, add 'udevadm' to udev package
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
X-List-Received-Date: Wed, 18 Jun 2014 02:37:07 -0000
Content-Type: text/plain

Previously, the udev package only RRECOMMENDS udev-utils package,
but its init script in the udev package really relies on the
'udevadm' command to work properly. As a result, if 'NO_RECOMMENDATIONS'
is set to '1', errors occur at system start-up.

The udev-utils package only contains one file, that is /bin/udevadm.
So it's better that we remove the udev-utils package and move the
'udevadm' command to the udev package.

[YOCTO #6388]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev.inc |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index f9d544e..11204aa 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -47,7 +47,7 @@ EXTRA_OECONF = "--disable-introspection \
                 --without-systemdsystemunitdir \
                "
 
-PACKAGES =+ "udev-utils udev-cache"
+PACKAGES =+ "udev-cache"
 PACKAGES =+ "libudev"
 PACKAGES =+ "libgudev"
 
@@ -57,8 +57,8 @@ INITSCRIPT_PARAMS_udev = "start 04 S ."
 INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
-FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit ${nonarch_base_libdir}/udev"
-RRECOMMENDS_${PN} += "udev-utils udev-cache"
+FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit ${nonarch_base_libdir}/udev ${bindir}/udevadm"
+RRECOMMENDS_${PN} += "udev-cache"
 
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
@@ -73,8 +73,6 @@ FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
-FILES_udev-utils = "${bindir}/udevadm"
-
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
-- 
1.7.9.5


