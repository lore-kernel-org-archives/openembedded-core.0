Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZoNN-0003NC-Sk
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 20:11:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5NI81MJ004004
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:08:01 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 23 Jun 2011 11:08:01 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2011 13:19:33 -0500
Message-ID: <201d7ca44c14e02cea03d56674d39a98116a0d8e.1308852888.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308852888.git.mark.hatle@windriver.com>
References: <cover.1308852888.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 7/9] gnome-doc-utils: Fix the owner/group on select files
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
X-List-Received-Date: Thu, 23 Jun 2011 18:11:38 -0000
Content-Type: text/plain

All of the files in ${datadir}/xml/gnome/xslt were being given the uid/gid
of the build user.  Fix this for the target case, avoid it in the native.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    3 +++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index b541753..62893ea 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -9,6 +9,9 @@ EXTRA_OECONF = "--disable-scrollkeeper"
 do_install_append() {
 	mkdir -p  ${D}${datadir}/xml/gnome/xslt/
 	cp -pPr ${S}/xslt/* ${D}${datadir}/xml/gnome/xslt/
+
+	echo ${PATH}
+	chown -R root:root ${D}
 }
 
 FILES_${PN} += "${datadir}/xml*"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index e7bf6e9..d85697f 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://xsltproc_nonet.patch"
 
-- 
1.7.3.4



