Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UGFm9-0001o3-RI
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 22:33:27 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B3F14D22B2;
	Thu, 14 Mar 2013 22:16:41 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 22:16:34 +0100
Message-Id: <1363295794-26683-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] nss-myhostname: add 0.3 version
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
X-List-Received-Date: Thu, 14 Mar 2013 21:33:28 -0000

1

Meta-linaro layer had own netbase.bbappend which took care of adding
MACHINE name to /etc/hosts to get it resolvable.

Koen Kooi pointed to nss-myhostname as better solution. Tested, works
fine so I add it for other users.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../nss-myhostname/nss-myhostname_0.3.bb           | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
new file mode 100644
index 0000000..d5ed084
--- /dev/null
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "plugin for the GNU Name Service Switch (NSS) functionality of \
+the GNU C Library (glibc) providing host name resolution for the locally \
+configured system hostname as returned by gethostname(2)."
+HOMEPAGE = "http://0pointer.de/lennart/projects/nss-myhostname/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
+SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
+
+inherit autotools
+
+pkg_postinst_${PN} () {
+	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
+		-i $D/etc/nsswitch.conf
+}
+
+pkg_prerm_${PN} () {
+	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+		-e '/^hosts:/s/\s*myhostname//' \
+		-i $D/etc/nsswitch.conf
+}
-- 
1.8.1.2



