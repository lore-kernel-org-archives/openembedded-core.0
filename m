Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R67zj-0002DV-FE
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:36:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8KLVTiK018526
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 14:31:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Sep 2011 14:31:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 16:33:37 -0500
Message-ID: <d3b9b3b03fcf51db6107b6df717916e339d0c965.1316553828.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316553828.git.mark.hatle@windriver.com>
References: <cover.1316553828.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/7] Add a run-time dependency that eglibc support GNU_HASH
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
X-List-Received-Date: Tue, 20 Sep 2011 21:36:48 -0000
Content-Type: text/plain

RPM checks to see if binaries require GNU_HASH, if they do it adds
an automatic dependency of "rtld(GNU_HASH)".  We need to satisfy
this dependency, and we do it by providing rtld(GNU_HASH) in the
package(s) that provide a runtime-linker.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    3 ++-
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 469e02d..519a49c 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -22,7 +22,8 @@ PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
 
-RPROVIDES_${PN} = "glibc${PKGSUFFIX}"
+# The ld.so in this eglibc supports the GNU_HASH
+RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
 RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
 RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
 RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index a71c4d4..a9d208b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r23"
+PR = "r24"
 
 SRCREV = "14158"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index b2da697..b549496 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r14"
+PR = "r15"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.7.3.4



