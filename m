Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TLh0V-0006iO-BR
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 23:06:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q99KrHhr006766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2012 13:53:17 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 9 Oct 2012 13:53:17 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Oct 2012 13:53:16 -0700
Message-ID: <1349815996-3767-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] chkconfig: pass CFLAGS to Makefile
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
X-List-Received-Date: Tue, 09 Oct 2012 21:06:28 -0000
Content-Type: text/plain

The environment CFLAGS is not used by the chkconfig
Makefile, so debug and optimization options are ignored.
So, we use RPM_OPT_FLAGS to pass CFLAGS into Makefile.

Upstream-Status:  Inappropriate [configuration]

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 17987a6..a9cf268 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
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



