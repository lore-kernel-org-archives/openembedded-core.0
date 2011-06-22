Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZTN9-0004Qj-SS
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 21:46:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MJgOj0019339
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 12:42:24 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 12:42:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 14:53:48 -0500
Message-ID: <0197f06f6109c8f42ff57e37801cff3c51ef2da9.1308771739.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308771739.git.mark.hatle@windriver.com>
References: <cover.1308771739.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 33/40] sysstat: Avoid stripping binaries (v3)
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
X-List-Received-Date: Wed, 22 Jun 2011 19:46:00 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc       |    3 +++
 meta/recipes-extended/sysstat/sysstat_10.0.0.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 4756016..2936f96 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -9,6 +9,8 @@ SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
 
 inherit autotools gettext
 
+EXTRA_OEMAKE += 'LFLAGS=""'
+
 do_install() {
 	autotools_do_install
 
@@ -25,6 +27,7 @@ pkg_postinst_${PN} () {
 
 
 FILES_${PN} += "${libdir}/sa"
+FILES_${PN}-dbg += "${libdir}/sa/.debug/"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 LDFLAGS_append_libc-uclibc = " -lintl"
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.0.bb b/meta/recipes-extended/sysstat/sysstat_10.0.0.bb
index fd003d9..2faac32 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.0.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.0.bb
@@ -2,7 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r1"
+PR = "r2"
 
 
 
-- 
1.7.3.4



