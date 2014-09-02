Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5FEF712AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsSXu010822
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:54:03 +0800
Message-ID: <5123efea6de54165a5f4859ca54d6dac0b65bfd4.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/26] at: inherit update-rc.d to handle sysv init script
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:27 -0000
Content-Type: text/plain

Inherit update-rc.d.bbclass to handle sysv init script.
Also make the 'at' daemon start in runlevel 2,3,4,5 instead of S.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/at/at/{S99at => atd.init} |  0
 meta/recipes-extended/at/at_3.1.15.bb           | 11 ++++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/at/at/{S99at => atd.init} (100%)

diff --git a/meta/recipes-extended/at/at/S99at b/meta/recipes-extended/at/at/atd.init
similarity index 100%
rename from meta/recipes-extended/at/at/S99at
rename to meta/recipes-extended/at/at/atd.init
diff --git a/meta/recipes-extended/at/at_3.1.15.bb b/meta/recipes-extended/at/at_3.1.15.bb
index 1080df4..0c37d6d 100644
--- a/meta/recipes-extended/at/at_3.1.15.bb
+++ b/meta/recipes-extended/at/at_3.1.15.bb
@@ -20,7 +20,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://posixtm.c \
     file://posixtm.h \
     file://file_replacement_with_gplv2.patch \
-    file://S99at \
+    file://atd.init \
     file://atd.service \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
@@ -37,7 +37,10 @@ EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-atspool=/var/spool/at/spool \
                  ac_cv_header_security_pam_appl_h=${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} "
 
-inherit autotools-brokensep systemd
+inherit autotools-brokensep systemd update-rc.d
+
+INITSCRIPT_NAME = "atd"
+INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE_${PN} = "atd.service"
 
@@ -51,9 +54,7 @@ do_install () {
 	oe_runmake -e "IROOT=${D}" install
 
 	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/rcS.d
-	install -m 0755    ${WORKDIR}/S99at		${D}${sysconfdir}/init.d/atd
-	ln -sf ../init.d/atd ${D}${sysconfdir}/rcS.d/S99at
+	install -m 0755    ${WORKDIR}/atd.init		${D}${sysconfdir}/init.d/atd
 
 	# install systemd unit files
 	install -d ${D}${systemd_unitdir}/system
-- 
1.9.1


