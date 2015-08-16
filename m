Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED74606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 18:20:56 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so92179817pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C6Y1VLSE6pckw+HOy0FE9y4ss6lopJcMcMXZREaQOSU=;
	b=PwM9NiNM9oWHfIqbOpp5DiAGWppASS7h34stuSjMTZYSh9r2hP1vc8K05ZBVkol70Y
	o49z+MKhlpkTefivNCGFaTs7L+r8FpXC4CJ1DlAA/1O4c12Z0/ny3/8RM18knI69e3SC
	BhYAPOXrzgmry3hjnH4YReKqSqWMIW1eE6g5ZZuP7E5AX0MJQz/HyhXCQOnksCzLdxIS
	TDUnFMg2bRpCVlLF5MSKvv8efa6vi63O+Bj+dy7EabbdInzxb3eEQuoJhqVAtVhnl32j
	Y06ooJcnd+fvO8OSA90Ev8ZmI6mi54peJoXyMxG1Cz0PryiBwuA/NWPvcGhFscbwQFi1
	D7hA==
X-Received: by 10.66.191.196 with SMTP id ha4mr3704414pac.119.1439749256966;
	Sun, 16 Aug 2015 11:20:56 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	s13sm12053365pdi.70.2015.08.16.11.20.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 11:20:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2015 11:30:01 -0700
Message-Id: <1439749803-26868-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/3] guile: Specify directories to find proper libunistring, libgmp and libltdl
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
X-List-Received-Date: Sun, 16 Aug 2015 18:21:00 -0000

Just when building on host which doesnt have libunistring on host guile
fails the following configure test

| configure: error: GNU libunistring is required, please install it.
| Configure failed. The contents of all config.log files follows to aid
debugging

The reason is that its looking for libunistring dev files on build
system, so lets point the configure into target sysroot, similar issue
exist for libgmp, libltdl detection as well, fixed thusly

Get rid of trailing whitespaces while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/guile/guile_2.0.11.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index ea9017b..71f696e 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -11,7 +11,7 @@ DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for Extensions,\
 HOMEPAGE = "http://www.gnu.org/software/guile/"
 SECTION = "devel"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch \
@@ -26,7 +26,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-#           file://opensuse/guile-turn-off-gc-test.patch 
+#           file://opensuse/guile-turn-off-gc-test.patch
 
 SRC_URI[md5sum] = "03f1bce1a4983076d955003472306a13"
 SRC_URI[sha256sum] = "aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c69103e2"
@@ -43,6 +43,10 @@ RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
 
 EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix --without-libreadline-prefix', ''][bb.data.inherits_class('native',d)]}"
 
+EXTRA_OECONF_append_class-target = " --with-libunistring-prefix=${STAGING_LIBDIR} \
+                                     --with-libgmp-prefix=${STAGING_LIBDIR} \
+                                     --with-libltdl-prefix=${STAGING_LIBDIR}"
+
 do_configure_prepend() {
 	mkdir -p po
 }
-- 
2.5.0


