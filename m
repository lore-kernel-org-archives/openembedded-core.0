Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD1F97E422
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 05:41:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x695f67x021215
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2019 22:41:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 8 Jul 2019 22:41:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2019 13:53:28 +0800
Message-ID: <f8e0fcb43950c0c590dfe0e53e2578cb4308daf4.1562651589.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562651589.git.Qi.Chen@windriver.com>
References: <cover.1562651589.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sysstat: use service file from source codes
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
X-List-Received-Date: Tue, 09 Jul 2019 05:41:05 -0000
Content-Type: text/plain

Use service file from sysstat source codes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc             |  8 ++------
 meta/recipes-extended/sysstat/sysstat/sysstat.service | 12 ------------
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat/sysstat.service

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 4e29721..9085fcf 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -6,7 +6,6 @@ SECTION = "console/utils"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
            file://99_sysstat \
-           file://sysstat.service \
           "
 
 UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
@@ -17,9 +16,10 @@ DEPENDS += "base-passwd"
 # autotools-brokensep as this package doesn't use automake
 inherit autotools-brokensep gettext systemd upstream-version-is-even
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
 PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
 
 EXTRA_OECONF += "--disable-stripping"
 
@@ -45,10 +45,6 @@ do_install() {
 	        echo "d ${localstatedir}/log/sa - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
 	fi
-
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
-	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/sysstat/sysstat/sysstat.service b/meta/recipes-extended/sysstat/sysstat/sysstat.service
deleted file mode 100644
index aff0710..0000000
--- a/meta/recipes-extended/sysstat/sysstat/sysstat.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Resets System Activity Logs
-
-[Service]
-Type=oneshot
-RemainAfterExit=yes
-User=root
-ExecStart=@LIBDIR@/sa/sa1 --boot
-
-[Install]
-WantedBy=multi-user.target
-
-- 
1.9.1


