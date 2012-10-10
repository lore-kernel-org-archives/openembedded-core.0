Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TM4mp-0000lJ-9Z
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 00:29:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9AMGiuK000543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 15:16:44 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 10 Oct 2012 15:16:44 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Oct 2012 15:16:43 -0700
Message-ID: <1349907403-11447-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH v2] chkconfig: pass CFLAGS to Makefile
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
X-List-Received-Date: Wed, 10 Oct 2012 22:29:55 -0000
Content-Type: text/plain

The environment CFLAGS is not used by the chkconfig
Makefile, so debug and optimization options are ignored.
So, we use RPM_OPT_FLAGS to pass CFLAGS into Makefile.

Upstream-Status:  Inappropriate [configuration]

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 17987a6..a27a4ba 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
@@ -21,7 +21,10 @@ SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f182712
 
 inherit autotools gettext
 
-EXTRA_OEMAKE += 'MANDIR="${mandir}" BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
+# Makefile uses RPM_OPT_fLAGS to construct CFLAGS
+#
+EXTRA_OEMAKE += 'RPM_OPT_FLAGS="${CFLAGS}" MANDIR="${mandir}" \
+                 BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
 
 do_install_append() {
     mkdir -p ${D}/etc/chkconfig.d
-- 
1.7.3.4



