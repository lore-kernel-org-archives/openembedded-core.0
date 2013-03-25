Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UK1yW-0002ho-0S
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 08:37:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2P7KnZd021405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 00:20:49 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Mar 2013 00:20:48 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 15:22:18 +0800
Message-ID: <47ae8648840c30e4a9f5dab2b9cb09db905747be.1364196012.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1364196012.git.kai.kang@windriver.com>
References: <cover.1364196012.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/1] opkg: create run-scripts file conditionally
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
X-List-Received-Date: Mon, 25 Mar 2013 07:37:50 -0000
X-List-Received-Date: Mon, 25 Mar 2013 07:37:50 -0000
Content-Type: text/plain

When build sato sdk image, opkg will be installed to image even the
image package type is set to RPM. This causes the script file
run-postinsts installed by rpm will be overwrited by opkg.

Judge the image package type and don't create run-scripts file when
package type is not ipk.

[YOCTO #3223]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/opkg/opkg.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index f9c1202..bc80cb0 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -59,10 +59,16 @@ do_install_append_class-native() {
 
 POSTLOG ?= "/var/log/postinstall.log"
 REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
+PKGTYPE = "${@d.getVar('IMAGE_PKGTYPE', True)}"
 
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ]; then
+	# if installed to a rpm/deb based image, don't create run-postinsts file
+	if [ "x${PKGTYPE}" != "xipk" ]; then
+		exit 0
+	fi
+
 	install -d $D${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
-- 
1.7.5.4



