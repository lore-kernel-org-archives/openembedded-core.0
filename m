Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 1E76B6D092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:54:26 +0000 (UTC)
Received: from [98.142.64.238] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1Vbm9C-0004C0-8s for openembedded-core@lists.openembedded.org;
	Thu, 31 Oct 2013 06:54:27 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.6/8.14.6) with ESMTP id
	r9V6s7du005528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:54:15 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.64.238
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX19dvUZgZNozBVTMTniMBsQpShTCype2+Bk=
From: blloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 01:54:04 -0500
Message-Id: <2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1383197850.git.blloyd@familyhonor.net>
References: <cover.1383197850.git.blloyd@familyhonor.net>
In-Reply-To: <cover.1383197850.git.blloyd@familyhonor.net>
References: <cover.1383197850.git.blloyd@familyhonor.net>
Subject: [PATCH 1/1] Enhancements to allow core file debugging to work properly from devices
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
X-List-Received-Date: Thu, 31 Oct 2013 06:54:26 -0000

gdb includes a script to make generating core files trivial.  Add a package to allow inclusion of this script in images.  GDB also requires symbols that are usually stripped from the threads library to properly generate a core dump.  Therefore, ensure when gdb is installed the necessary debug file is also present so gdb is fully functional.

Signed-off-by: blloyd <blloyd@familyhonor.net>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----
 meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 6954954..02eef85 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -61,8 +61,10 @@ do_install_append() {
 	rm -rf ${D}${datadir}/locale
 }
 
-RRECOMMENDS_gdb_append_linux = " glibc-thread-db "
-RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db "
-RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db "
-RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db "
-
+# Unfortunately, for gdb multi-threading to function reliably it must have the eglibc debug symbols
+# which are a part of the eglibc-dev package.  So we have added a dependency on that here.
+RRECOMMENDS_gdb_append_linux = " glibc-thread-db eglibc-dev "
+RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
+RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db eglibc-dev "
+RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
+RDEPENDS_gcore_append = " gdb "
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 3321a24..9bf0e86 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -10,5 +10,12 @@ SRC_URI += "file://kill_arm_map_symbols.patch \
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
 
 # cross-canadian must not see this
-PACKAGES =+ "gdbserver"
+PACKAGES =+ "gdbserver gcore"
 FILES_gdbserver = "${bindir}/gdbserver"
+FILES_gcore = "${bindir}/gcore"
+
+do_install_append() {
+  # When trying to find what went wrong with a program, a core dump can be very helpful
+  # Go ahead and make it easier to get one when we have gdb on the system
+  install -m 0755 ${S}/gdb/gdb_gcore.sh ${D}${bindir}/gcore
+}
-- 
1.8.1.4


