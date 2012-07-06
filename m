Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SnEoY-0000VB-NR
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 22:07:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66JuaDn027473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 12:56:36 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 6 Jul 2012 12:56:35 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 15:06:42 -0500
Message-ID: <74546eaf77be4b767935c1668d9b03dc37ee2b39.1341605152.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341605152.git.mark.hatle@windriver.com>
References: <cover.1341605152.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] rpm: Fix PACKAGECONFIG dependencies
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
X-List-Received-Date: Fri, 06 Jul 2012 20:07:43 -0000
Content-Type: text/plain

neon requires expat to be built first

lua similarly requires expat if enabled

selinux package name should be "libselinux" (from meta-selinux).

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 8e892a8..6ef1aae 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r44"
+PR = "r45"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -129,13 +129,13 @@ PACKAGECONFIG[libelf] = "--with-libelf,--without-libelf,elfutils,"
 
 WITH_SELINUX = "--with-selinux --with-sepol --with-semanage"
 WITHOUT_SELINUX = "--without-selinux --without-sepol --without-semanage"
-PACKAGECONFIG[selinux] = "${WITH_SELINUX},${WITHOUT_SELINUX},selinux,"
+PACKAGECONFIG[selinux] = "${WITH_SELINUX},${WITHOUT_SELINUX},libselinux,"
 
 WITH_NEON = "--with-neon --with-libproxy --with-expat --without-gssapi"
 WITHOUT_NEON = "--without-neon --without-libproxy --without-expat --without-gssapi"
-PACKAGECONFIG[neon] = "${WITH_NEON},${WITHOUT_NEON},neon,"
+PACKAGECONFIG[neon] = "${WITH_NEON},${WITHOUT_NEON},neon expat,"
 
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,expat,"
 PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
 
 PACAKGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
-- 
1.7.3.4



