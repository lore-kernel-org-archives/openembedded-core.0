Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QwsnM-0003NN-39
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 11:33:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7Q9SxYf001798
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 02:28:59 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 26 Aug 2011 02:28:58 -0700
Message-ID: <49f8f9a5fd900d9ae64d1bb347ab0117efa434a1.1314345568.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1314345568.git.xiaofeng.yan@windriver.com>
References: <cover.1314345568.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 26 Aug 2011 15:29:12 +0800
Date: Fri, 26 Aug 2011 17:29:44 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eglibc-locale.inc: Add eglibc-binaries, eglibc-localedatas, eglibc-gconvs and eglibc-charmps to variable PACKAGE
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
X-List-Received-Date: Fri, 26 Aug 2011 09:33:49 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

There are no locales resources in an lsb image because the locale resources were splitted from eglibc-package.inc \
and putted into a new file "eglibc-locale.inc". So the above variables lost their function in eglibc-package.inc and
caused no locale resources in an lsb image. The purpose of moving the above variables from eglibc-package.inc to \
eglibc-locale.inc is to make the above variables to take effect.

eglibc-binaries include packages "eglibc-binary-*"
eglibc-localedatas include packages "eglibc-localedata-*"
eglibc-gconvs include packages "eglibc-gconv-*"
eglibc-charmaps include packages "eglibc-charmap-*"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc  |   20 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc |   20 --------------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index b8107ee..9424ff5 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -39,6 +39,26 @@ PACKAGES_DYNAMIC = "locale-base-* \
                     eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
                     glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
 
+# Create a eglibc-binaries package
+ALLOW_EMPTY_${BPN}-binaries = "1"
+PACKAGES += "${BPN}-binaries"
+RRECOMMENDS_${BPN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-binary") != -1])}"
+
+# Create a eglibc-charmaps package
+ALLOW_EMPTY_${BPN}-charmaps = "1"
+PACKAGES += "${BPN}-charmaps"
+RRECOMMENDS_${BPN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-charmap") != -1])}"
+
+# Create a eglibc-gconvs package
+ALLOW_EMPTY_${BPN}-gconvs = "1"
+PACKAGES += "${BPN}-gconvs"
+RRECOMMENDS_${BPN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-gconv") != -1])}"
+
+# Create a eglibc-localedatas package
+ALLOW_EMPTY_${BPN}-localedatas = "1"
+PACKAGES += "${BPN}-localedatas"
+RRECOMMENDS_${BPN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-localedata") != -1])}"
+
 DESCRIPTION_localedef = "eglibc: compile locale definition files"
 
 # eglibc-gconv is dynamically added into PACKAGES, thus
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 5308bb9..37f9f25 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -22,26 +22,6 @@ PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
 
-# Create a eglibc-binaries
-ALLOW_EMPTY_${PN}-binaries = "1"
-PACKAGES += "${PN}-binaries"
-RRECOMMENDS_${PN}-binaries =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-binary") != -1])}"
-
-# Create a eglibc-charmaps package 
-ALLOW_EMPTY_${PN}-charmaps = "1"
-PACKAGES += "${PN}-charmaps"
-RRECOMMENDS_${PN}-charmaps =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-charmap") != -1])}"
-
-# Create a eglibc-gconvs package 
-ALLOW_EMPTY_${PN}-gconvs = "1"
-PACKAGES += "${PN}-gconvs"
-RRECOMMENDS_${PN}-gconvs =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-gconv") != -1])}"
-
-# Create a eglibc-localedatas package 
-ALLOW_EMPTY_${PN}-localedatas = "1"
-PACKAGES += "${PN}-localedatas"
-RRECOMMENDS_${PN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-localedata") != -1])}"
-
 RPROVIDES_${PN} = "glibc${PKGSUFFIX}"
 RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
 RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
-- 
1.7.0.4



