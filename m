Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaBMG-0008Cd-Js
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 20:44:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OIeNAu007277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 11:40:23 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 24 Jun 2011 11:40:22 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 13:40:15 -0500
Message-ID: <bcf1e9168c3cb6b236da24a18a8c7df26088dede.1308940765.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308940765.git.mark.hatle@windriver.com>
References: <cover.1308940765.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/4] gcc: Fix file ownership
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
X-List-Received-Date: Fri, 24 Jun 2011 18:44:01 -0000
Content-Type: text/plain

Most of the files that end up in the gcc include dir and other
misc files scattered throughout the install get the build users
uid and gid.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    1 +
 meta/recipes-devtools/gcc/gcc-package-sdk.inc      |    2 ++
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    2 ++
 meta/recipes-devtools/gcc/libgcc_4.5.1.bb          |    2 ++
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 ++
 5 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index 339a3c8..34bfaeb 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -37,6 +37,7 @@ do_install () {
 		cd ${B}/$d/
 		oe_runmake 'DESTDIR=${D}' install
 	done
+	chown -R root:root ${D}
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index 23b9a48..7db7c52 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -48,5 +48,7 @@ do_install () {
 	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
 		ln -sf ${bindir}/${TARGET_PREFIX}$t $dest$t
 	done
+
+	chown -R root:root ${D}
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index afbcf0d..43e2bd5 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -101,4 +101,6 @@ do_install () {
 	ln -sf g++ c++
 	ln -sf gcc cc
 	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${bindir}/cpp
+
+	chown -R root:root ${D}
 }
diff --git a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
index b6cf268..b0523c7 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
@@ -36,6 +36,8 @@ do_install () {
 	else
 		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
 	fi
+
+	chown -R root:root ${D}
 }
 
 do_package_write_ipk[depends] += "virtual/libc:do_package"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index b6cf268..b0523c7 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -36,6 +36,8 @@ do_install () {
 	else
 		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
 	fi
+
+	chown -R root:root ${D}
 }
 
 do_package_write_ipk[depends] += "virtual/libc:do_package"
-- 
1.7.3.4



