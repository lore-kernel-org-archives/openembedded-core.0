Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46239762B4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EEXTKi021220 for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:33:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FdzsKPrIl080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:33:29 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EEXNkN021215
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 14:33:24 GMT
Message-ID: <1455460403.16142.405.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Feb 2016 14:33:23 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] gdb: Rationalise PACKAGECONFIG
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
X-List-Received-Date: Sun, 14 Feb 2016 14:33:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Having two separate PACKAGECONFIG defaults and settings in two separate
files is confusing. Move all to the common inc file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 06272a9..0d28ee4 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -45,6 +45,8 @@ EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x --disable-werror \
 PACKAGECONFIG ??= "readline"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
+PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
 GDBPROPREFIX = "--program-prefix=''"
 
diff --git a/meta/recipes-devtools/gdb/gdb_7.10.1.bb b/meta/recipes-devtools/gdb/gdb_7.10.1.bb
index cd52e27..f897e12 100644
--- a/meta/recipes-devtools/gdb/gdb_7.10.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.10.1.bb
@@ -3,10 +3,6 @@ require gdb-${PV}.inc
 
 inherit python-dir
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python,python python-codecs"
-PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
-
 do_configure_prepend() {
 	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
 		cat > ${WORKDIR}/python << EOF



