Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Stgqz-00064c-FA
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:16:53 +0200
Received: by mail-yw0-f47.google.com with SMTP id j56so6244858yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wY7f2a7jcGfPQty5sQCcpfvaJBkmGSiHwW7y3Tkh12E=;
	b=DLsfIKOWrwZcWL09TaqhHWHzrtC19TZJtiMouP/53y9DwwUyrcbwr488nU7d2RgLhz
	MEF1Cb5B7jgxUaFVt8MtR22Cl8zkCcxwUmzYVdlSWEcQVS46eIG9rsd7B6P9zJjJi072
	lzf5jOR7wNoS1LcQwEUY7TJN5+QFsJXRe4LXbduKf41Stb0PUAuglf0AjnNGSm9cixby
	d6i48hVZmwBki046KLhUVvsVpd25+/3tWqBD0sLMcIuE7Z/4vB5sDiWp2Ispy7R6U5l9
	IuNj9tbJO6JMQbufUw+IVL8sDG1ITGQ8QeePAnEYgfcvx1oIMyVy8lWSy66qp0stgpxO
	3L2A==
Received: by 10.66.73.202 with SMTP id n10mr5324772pav.80.1343142323896;
	Tue, 24 Jul 2012 08:05:23 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sh3sm12332139pbc.16.2012.07.24.08.05.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 08:05:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:04:22 -0700
Message-Id: <415cd03b209661f67b202bbad5bccf96eb56138c.1343142062.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
References: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
In-Reply-To: <cover.1343142062.git.raj.khem@gmail.com>
References: <cover.1343142062.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] eglibc-initial: Fix build failure due to missing limits.h
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
X-List-Received-Date: Tue, 24 Jul 2012 15:16:53 -0000

We have had these things in place to overcome a limitation
from our gcc-initial-cross not staging a self sufficient
limits.h. Now thats fixed we do reset TOOLCHAIN_OPTIONS
to point to sysroot where linux kernel headers are staged
and not the bootstrap sysroot which will infact be popuated
by eglibc-initial itself.

Secondly we dont need to set CPPFLAGS specially as we
are doing that in eglibc.inc so we override that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-initial.inc     |    1 +
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb |    9 ++++++---
 meta/recipes-core/eglibc/eglibc_2.16.bb         |    2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 9062516..1020e40 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -8,6 +8,7 @@ PACKAGES_DYNAMIC = ""
 
 STAGINGCC = "gcc-cross-initial"
 STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
index 787c762..f6b09ac 100644
--- a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
@@ -1,6 +1,9 @@
 require eglibc_${PV}.bb
 require eglibc-initial.inc
 
-do_configure_prepend () {
-        unset CFLAGS
-}
+# main eglibc recipes muck with TARGET_CPPFLAGS to point into
+# final target sysroot but we
+# are not there when building eglibc-initial
+# so reset it here
+
+TARGET_CPPFLAGS = ""
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index b76d943..fc3d82b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "19383"
 
 DEPENDS += "gperf-native"
-PR = "r1"
+PR = "r2"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.9.5



