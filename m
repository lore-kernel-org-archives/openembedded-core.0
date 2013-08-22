Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9C561DDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg901001260; Thu, 22 Aug 2013 12:42:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ce8O4fG8jfyG; Thu, 22 Aug 2013 12:42:16 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg8KJ001231
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:09 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5b-0001iq-K8; Thu, 22 Aug 2013 12:30:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:50 +0100
Message-Id: <1377171000-6469-18-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 18/28] gcc-runtime: Fold common configuration into gcc-configure-runtime.inc
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:28 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-configure-runtime.inc | 5 +++++
 meta/recipes-devtools/gcc/gcc-runtime_4.7.bb        | 4 ----
 meta/recipes-devtools/gcc/gcc-runtime_4.8.bb        | 4 ----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index f89ca6b..2ff8561 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -7,6 +7,11 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=${STAGING_DIR_TARGET} \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+
+EXTRA_OECONF += "--disable-libunwind-exceptions"
+EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
+
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
 #  ?
 # libiberty
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
index fbaf057..c16d27e 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb
@@ -2,7 +2,3 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-configure-runtime.inc
 require gcc-package-runtime.inc
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
-
-EXTRA_OECONF += "--disable-libunwind-exceptions"
-EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb
index fbaf057..c16d27e 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.8.bb
@@ -2,7 +2,3 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-configure-runtime.inc
 require gcc-package-runtime.inc
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
-
-EXTRA_OECONF += "--disable-libunwind-exceptions"
-EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
-- 
1.8.1.2


