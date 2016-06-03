Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8987741E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 11:39:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2016 04:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994503161"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 04:39:39 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 424526A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 05:27:07 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 14:39:51 +0300
Message-Id: <1464953991-4125-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
References: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] db: update to 6.2.23
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
X-List-Received-Date: Fri, 03 Jun 2016 11:39:40 -0000

6.0.30 -> 6.2.23

Disable atomicsupport as db fails to build with built-in atomic functions.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/db/{db_6.0.30.bb => db_6.2.23.bb} | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)
 rename meta/recipes-support/db/{db_6.0.30.bb => db_6.2.23.bb} (86%)

diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.2.23.bb
similarity index 86%
rename from meta/recipes-support/db/db_6.0.30.bb
rename to meta/recipes-support/db/db_6.2.23.bb
index 50a469b..f53811e 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.2.23.bb
@@ -24,8 +24,8 @@ SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
             file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch;patchdir=.. \
            "
 
-SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
-SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
+SRC_URI[md5sum] = "9da126afb937a48171ff1e569ce67cf1"
+SRC_URI[sha256sum] = "47612c8991aa9ac2f6be721267c8d3cdccf5ac83105df8e50809daea24e95dc7"
 
 # Exclude NC versions which lack AES encryption
 UPSTREAM_CHECK_REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
@@ -70,21 +70,10 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
 
 #configuration - set in local.conf to override
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
-DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
+DB6_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql --disable-atomicsupport"
 
 EXTRA_OECONF = "${DB6_CONFIG} --enable-shared --enable-cxx --with-sysroot"
 
-# Override the MUTEX setting here, the POSIX library is
-# the default - "POSIX/pthreads/library".
-# Don't ignore the nice SWP instruction on the ARM:
-# These enable the ARM assembler mutex code
-ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
-MUTEX = ""
-MUTEX_arm = "${ARM_MUTEX}"
-MUTEX_armeb = "${ARM_MUTEX}"
-EXTRA_OECONF += "${MUTEX}"
-EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
-
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
 CONFIG_SITE = ""
-- 
2.4.0


