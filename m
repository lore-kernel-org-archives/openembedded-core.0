Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1E0973D18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOWmv025055
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:32 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:23 -0700
Message-ID: <4d927e9b793d17d4b4d2eadaa13a639877dae704.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] libuser: 0.60 -> 0.61
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2015 11:24:32 -0000
Content-Type: text/plain

Removed fixsepbuild.patch since it is not needed any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libuser/libuser/fixsepbuild.patch              |   35 --------------------
 .../libuser/{libuser_0.60.bb => libuser_0.61.bb}   |    6 ++--
 2 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-extended/libuser/libuser/fixsepbuild.patch
 rename meta/recipes-extended/libuser/{libuser_0.60.bb => libuser_0.61.bb} (85%)

diff --git a/meta/recipes-extended/libuser/libuser/fixsepbuild.patch b/meta/recipes-extended/libuser/libuser/fixsepbuild.patch
deleted file mode 100644
index 893ca14..0000000
--- a/meta/recipes-extended/libuser/libuser/fixsepbuild.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Fix out of tree build errors and parallel make issues. The mkdir commands 
-can race each other. The srcdir variable is a complete path so a ../ prefix makes
-no sense.
-
-Upstream-Status: Pending
-
-RP 2013/03/21
-
-Index: libuser-0.58/docs/Makefile.am
-===================================================================
---- libuser-0.58.orig/docs/Makefile.am	2012-11-07 18:25:58.000000000 -0800
-+++ libuser-0.58/docs/Makefile.am	2013-03-22 23:32:06.843518069 -0700
-@@ -8,14 +8,14 @@
- 
- all: sgml/libuser.txt sgml/libuser.html
- 
--libuser.conf.5: $(srcdir)/libuser.conf.5.in Makefile
-+libuser.conf.5: $(abs_srcdir)/libuser.conf.5.in Makefile
- 	sed 's,@sysconfdir\@,$(sysconfdir),g' \
--		< $(srcdir)/libuser.conf.5.in > $@
-+		< $(abs_srcdir)/libuser.conf.5.in > $@
- 
--sgml/libuser.txt: $(srcdir)/sgml/libuser.sgml
--	[ -d sgml ] || mkdir sgml
--	cd sgml; sgml2txt ../$(srcdir)/sgml/libuser.sgml
-+sgml/libuser.txt: $(abs_srcdir)/sgml/libuser.sgml
-+	[ -d sgml ] || mkdir sgml || true
-+	cd sgml; sgml2txt $(abs_srcdir)/sgml/libuser.sgml
- 
--sgml/libuser.html: $(srcdir)/sgml/libuser.sgml
--	[ -d sgml ] || mkdir sgml
--	cd sgml; sgml2html ../$(srcdir)/sgml/libuser.sgml
-+sgml/libuser.html: $(abs_srcdir)/sgml/libuser.sgml
-+	[ -d sgml ] || mkdir sgml || true
-+	cd sgml; sgml2html $(abs_srcdir)/sgml/libuser.sgml
diff --git a/meta/recipes-extended/libuser/libuser_0.60.bb b/meta/recipes-extended/libuser/libuser_0.61.bb
similarity index 85%
rename from meta/recipes-extended/libuser/libuser_0.60.bb
rename to meta/recipes-extended/libuser/libuser_0.61.bb
index e6316ef..f2b9ddb 100644
--- a/meta/recipes-extended/libuser/libuser_0.60.bb
+++ b/meta/recipes-extended/libuser/libuser_0.61.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 SECTION = "base"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
-           file://fixsepbuild.patch"
+           "
 
-SRC_URI[md5sum] = "5c549724999ccca65ceaaecc4eb8cb98"
-SRC_URI[sha256sum] = "b1f73408ebfee79eb01a47c5879a2cdef6a00b75ee24870de7df1b816ff483eb"
+SRC_URI[md5sum] = "d977dc59161272c1491edd9ca7ba22f2"
+SRC_URI[sha256sum] = "0a114a52446e12781e2ffdf26f59df0d14e7809c7db5e551d3cf61c4e398751d"
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
 
-- 
1.7.9.5


