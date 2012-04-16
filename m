Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJvEj-0000RM-Dt
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:21:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GNC7oa015295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:12:07 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 16:12:07 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:16:28 -0500
Message-ID: <fc20df64d67aeeeab8529a0eaa4e0159b38a9dbe.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 15/17] sysvinit: Use update-alternatives in a different way
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
X-List-Received-Date: Mon, 16 Apr 2012 23:21:34 -0000
Content-Type: text/plain

Change from using a single update-alternative class entry for "init"
to using ALTERNATIVE_LINKS for the majority of the items.  Then use
the manual entries for the outliers like init and pidof.

End result is the same package behavior, plus proper dependencies in
the resulting package.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |   44 ++++++-----------------
 1 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index d3e430c..22ca24f 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r6"
+PR = "r7"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
@@ -27,10 +27,15 @@ B = "${S}/src"
 
 inherit update-alternatives
 
-ALTERNATIVE_NAME = "init"
-ALTERNATIVE_LINK = "${base_sbindir}/init"
-ALTERNATIVE_PATH = "${base_sbindir}/init.sysvinit"
-ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE_PRIORITY = "200"
+ALTERNATIVE_LINKS  = "${base_bindir}/mountpoint ${base_sbindir}/halt ${base_sbindir}/reboot"
+ALTERNATIVE_LINKS += "${base_sbindir}/runlevel ${base_sbindir}/shutdown ${base_sbindir}/poweroff"
+ALTERNATIVE_LINKS += "${bindir}/last ${bindir}/mesg ${bindir}/wall"
+
+# The following two are setup manually.
+#   init because it has a different priority
+#   pidof because it is in a split package
+MANUAL_ALTERNATIVE_LINKS = "${base_sbindir}/init ${base_bindir}/pidof"
 
 PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
 FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
@@ -66,40 +71,15 @@ do_install () {
 		ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
 	done
 	mv                 ${D}${base_sbindir}/init               ${D}${base_sbindir}/init.${BPN}
-	mv ${D}${base_bindir}/mountpoint ${D}${base_bindir}/mountpoint.${BPN}
 	mv ${D}${base_bindir}/pidof ${D}${base_bindir}/pidof.${BPN}
-	mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${BPN}
-	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${BPN}
-	mv ${D}${base_sbindir}/runlevel ${D}${base_sbindir}/runlevel.${BPN}
-	mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${BPN}
-	mv ${D}${base_sbindir}/poweroff ${D}${base_sbindir}/poweroff.${BPN}
-	mv ${D}${bindir}/last ${D}${bindir}/last.${BPN}
-	mv ${D}${bindir}/mesg ${D}${bindir}/mesg.${BPN}
-	mv ${D}${bindir}/wall ${D}${bindir}/wall.${BPN}
 }
 
 pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/mountpoint mountpoint mountpoint.${BPN} 200
-	update-alternatives --install ${base_sbindir}/halt halt halt.${BPN} 200
-	update-alternatives --install ${base_sbindir}/reboot reboot reboot.${BPN} 200
-	update-alternatives --install ${base_sbindir}/runlevel runlevel runlevel.${BPN} 200
-	update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${BPN} 200
-	update-alternatives --install ${base_sbindir}/poweroff poweroff poweroff.${BPN} 200
-	update-alternatives --install ${bindir}/last last last.${BPN} 200
-	update-alternatives --install ${bindir}/mesg mesg mesg.${BPN} 200
-	update-alternatives --install ${bindir}/wall wall wall.${BPN} 200
+	update-alternatives --install ${base_sbindir}/init init init.${BPN} 50
 }
 
 pkg_prerm_${PN} () {
-	update-alternatives --remove mountpoint mountpoint.${BPN}
-	update-alternatives --remove halt halt.${BPN}
-	update-alternatives --remove reboot reboot.${BPN}
-	update-alternatives --remove runlevel runlevel.${BPN}
-	update-alternatives --remove shutdown shutdown.${BPN}
-	update-alternatives --remove poweroff poweroff.${BPN}
-	update-alternatives --remove last last.${BPN}
-	update-alternatives --remove mesg mesg.${BPN}
-	update-alternatives --remove wall wall.${BPN}
+	update-alternatives --remove init init.${BPN}
 }
 
 pkg_postinst_sysvinit-pidof () {
-- 
1.7.3.4



