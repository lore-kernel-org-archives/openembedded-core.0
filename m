Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TG2Kg-0002sx-Fw
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:39:55 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TG28L-0004FF-Bv
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:27:09 +0200
Message-ID: <1348467891.4444.250.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Sep 2012 07:24:51 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH v2] util-linux: Ensure that ${sbindir} is respected
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 06:39:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The configure script uses a hard-coded value for ${usrsbin_execdir},
which is the path that we know as ${sbindir}.  Adjust configure to take
this from the environment if it's set there, and have do_configure()
pass it in.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
v2: now with correct header on new patch

 meta/recipes-core/util-linux/util-linux.inc        |    4 +++-
 .../util-linux/util-linux/configure-sbindir.patch  |   18 ++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    3 ++-
 3 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/configure-sbindir.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 79e0608..2c5267f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,7 +38,9 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --enable-kill --enable-last --enable-mesg --enable-partx \
                 --enable-raw --enable-rdev --enable-reset --disable-login-utils \
                 --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
-                --enable-libuuid --enable-libblkid --enable-fsck --without-udev"
+                --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
+		usrsbin_execdir='${sbindir}' \
+"
 
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
new file mode 100644
index 0000000..f1f5ef4
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -0,0 +1,18 @@
+util-linux: take ${sbindir} from the environment if it is set there
+
+Signed-off-by: Phil Blundell <pb@pbcl.net>
+Upstream-Status: Inappropriate [configuration]
+
+--- util-linux-2.21.2/configure.ac~	2012-09-22 09:29:12.354215377 +0100
++++ util-linux-2.21.2/configure.ac	2012-09-22 16:47:14.713628946 +0100
+@@ -67,7 +67,9 @@
+ usrbin_execdir='${exec_prefix}/bin'
+ AC_SUBST([usrbin_execdir])
+ 
+-usrsbin_execdir='${exec_prefix}/sbin'
++if [ -z "$usrsbin_execdir" ]; then
++   usrsbin_execdir='${exec_prefix}/sbin'
++fi
+ AC_SUBST([usrsbin_execdir])
+ 
+ usrlib_execdir='${exec_prefix}/'$libdirname
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
index 6ef3163..e8f00fc 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r2"
+PR = "r3"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -8,6 +8,7 @@ LICENSE_${PN}-lscpu = "GPLv3+"
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \
+	    file://configure-sbindir.patch \
 "
 
 SRC_URI[md5sum] = "b75b3cfecb943f74338382fde693c2c3"
-- 
1.7.9





