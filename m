Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UAFuy-00079A-Er
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:29:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q8DC1P015156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 00:13:12 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 26 Feb 2013 00:13:11 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 16:14:25 +0800
Message-ID: <34981f55190c54c7fbccbb00f61bf4f6821fb0b7.1361866256.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361866256.git.kai.kang@windriver.com>
References: <cover.1361866256.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/5] opkg: save output of postinst scripts when image first boot
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
X-List-Received-Date: Tue, 26 Feb 2013 08:30:29 -0000
Content-Type: text/plain

When image feature "debug-tweaks" enabled, save output of postinstall
scripts to log file /var/log/postinstall.log when image first boot. And the
log file can be configured.

It also needs image feature "package-management" enabled. If not,
package run-postinsts will be installed and then all packages will be
configured by it. Command 'opkg configure' outputs nothing.

[YOCTO #3223]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/opkg/opkg.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 8d48006..f9c1202 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -57,13 +57,16 @@ do_install_append_class-native() {
 	fi
 }
 
+POSTLOG ?= "/var/log/postinstall.log"
+REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
+
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ]; then
 	install -d $D${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
-opkg-cl configure
+opkg-cl configure ${REDIRECT_CMD}
 rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 " > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-- 
1.7.5.4



