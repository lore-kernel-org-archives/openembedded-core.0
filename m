Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3ABB78657
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:31:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G8VXpO025055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 01:31:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 01:31:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 16 Aug 2017 04:31:17 -0400
Message-ID: <08983bf9fece08c9a119b1fa6616e117aeb98ba2.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] dhcp: 4.3.5 -> 4.3.6
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
X-List-Received-Date: Wed, 16 Aug 2017 08:31:32 -0000
Content-Type: text/plain

1. Rebase patches to 4.3.6
- define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch -> 0001
- dhcp-3.0.3-dhclient-dbus.patch -> 0002
- link-with-lcrypto.patch -> 0003
- fixsepbuild.patch -> 0004
- dhclient-script-drop-resolv.conf.dhclient.patch -> 0005
- 0001-site.h-enable-gentle-shutdown.patch -> 0006
- libxml2-configure-argument.patch -> 0007
- tweak-to-support-external-bind.patch -> 0008
- remove-dhclient-script-bash-dependency.patch -> 0009
- build-shared-libs.patch -> 0010
- Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch -> 0011

2. Drop search-for-libxml2.patch
   It is overrided by libxml2-configure-argument.patch

3. Rework dhclient-script-drop-resolv.conf.dhclient.patch and
Drop replace-ifconfig-route.patch.
vim client/scripts/linux
...
Script refresh in 2017. The aliasing code was too convoluted and needs
to go away. Migrated DHCPv4 script to ip command from iproute2 suite.
This is based on Debian script with some tweaks. ifconfig is no longer
used. Everything is done using ip tool from ip-route2.
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |   4 +-
 ...-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch} |  12 +-
 ...hclient-dbus.patch => 0002-dhclient-dbus.patch} |  97 +++++++----
 ...-lcrypto.patch => 0003-link-with-lcrypto.patch} |  20 ++-
 ...ild.patch => 0004-Fix-out-of-tree-builds.patch} |   9 +-
 ...-fix-invoke-dhclient-script-failed-on-Rea.patch |  36 ++++
 ...ch => 0006-site.h-enable-gentle-shutdown.patch} |  17 +-
 ...re-argument-to-make-the-libxml2-dependenc.patch |  42 +++++
 ...h => 0008-tweak-to-support-external-bind.patch} |  12 +-
 ...09-remove-dhclient-script-bash-dependency.patch |  28 +++
 ...red-libs.patch => 0010-build-shared-libs.patch} |  30 +++-
 ...ll-to-isc_app_ctxstart-to-not-get-signal.patch} |  10 +-
 ...dhclient-script-drop-resolv.conf.dhclient.patch |  70 --------
 .../dhcp/dhcp/libxml2-configure-argument.patch     |  38 -----
 .../remove-dhclient-script-bash-dependency.patch   |  55 ------
 .../dhcp/dhcp/replace-ifconfig-route.patch         | 188 ---------------------
 .../dhcp/dhcp/search-for-libxml2.patch             |  23 ---
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       |  20 ---
 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       |  20 +++
 19 files changed, 265 insertions(+), 466 deletions(-)
 rename meta/recipes-connectivity/dhcp/dhcp/{define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch => 0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch} (70%)
 rename meta/recipes-connectivity/dhcp/dhcp/{dhcp-3.0.3-dhclient-dbus.patch => 0002-dhclient-dbus.patch} (45%)
 rename meta/recipes-connectivity/dhcp/dhcp/{link-with-lcrypto.patch => 0003-link-with-lcrypto.patch} (68%)
 rename meta/recipes-connectivity/dhcp/dhcp/{fixsepbuild.patch => 0004-Fix-out-of-tree-builds.patch} (92%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
 rename meta/recipes-connectivity/dhcp/dhcp/{0001-site.h-enable-gentle-shutdown.patch => 0006-site.h-enable-gentle-shutdown.patch} (65%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
 rename meta/recipes-connectivity/dhcp/dhcp/{tweak-to-support-external-bind.patch => 0008-tweak-to-support-external-bind.patch} (93%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
 rename meta/recipes-connectivity/dhcp/dhcp/{build-shared-libs.patch => 0010-build-shared-libs.patch} (90%)
 rename meta/recipes-connectivity/dhcp/dhcp/{Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch => 0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch} (92%)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index db4a963..58f4a6f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1
 DEPENDS = "openssl bind"
 
 SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
-           file://define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
@@ -21,8 +20,7 @@ SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://dhclient.service \
            file://dhcpd.service file://dhcrelay.service \
            file://dhcpd6.service \
-           file://search-for-libxml2.patch "
-
+           "
 UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
similarity index 70%
rename from meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
index 32bdaf0..e5b3cf9 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
@@ -1,17 +1,21 @@
-define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
+From 7cc29144535a622fc671dc86eb1da65b0473a7c4 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 16:14:22 +0800
+Subject: [PATCH 01/11] define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
 
 Upstream-Status: Inappropriate [OE specific]
 
+Rebase to 4.3.6
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  includes/site.h | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/includes/site.h b/includes/site.h
-index d87b309..17bc40d 100644
+index b2f7fd7..280fbb9 100644
 --- a/includes/site.h
 +++ b/includes/site.h
-@@ -139,7 +139,8 @@
+@@ -149,7 +149,8 @@
  /* Define this if you want the dhcpd.conf file to go somewhere other than
     the default location.   By default, it goes in /etc/dhcpd.conf. */
  
@@ -22,5 +26,5 @@ index d87b309..17bc40d 100644
  /* Network API definitions.   You do not need to choose one of these - if
     you don't choose, one will be chosen for you in your system's config
 -- 
-1.9.1
+1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
similarity index 45%
rename from meta/recipes-connectivity/dhcp/dhcp/dhcp-3.0.3-dhclient-dbus.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
index b4a666d..6459dc0 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/dhcp-3.0.3-dhclient-dbus.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
@@ -1,9 +1,27 @@
-Upstream-Status: Inappropriate [distribution]
+From be7540d31c356e80ee02e90e8bf162b7ac6e5ba5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 14:56:56 +0800
+Subject: [PATCH 02/11] dhclient dbus
 
---- client/scripts/bsdos
-+++ client/scripts/bsdos
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
+upstream-Status: Inappropriate [distribution]
+
+Rebase to 4.3.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/bsdos   | 5 +++++
+ client/scripts/freebsd | 5 +++++
+ client/scripts/linux   | 5 +++++
+ client/scripts/netbsd  | 5 +++++
+ client/scripts/openbsd | 5 +++++
+ client/scripts/solaris | 5 +++++
+ 6 files changed, 30 insertions(+)
+
+diff --git a/client/scripts/bsdos b/client/scripts/bsdos
+index d69d0d8..095b143 100755
+--- a/client/scripts/bsdos
++++ b/client/scripts/bsdos
+@@ -45,6 +45,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
    fi
  # probably should do something with exit status of the local script
 +  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
@@ -14,10 +32,12 @@ Upstream-Status: Inappropriate [distribution]
    exit $exit_status
  }
  
---- client/scripts/freebsd
-+++ client/scripts/freebsd
-@@ -57,6 +57,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
+diff --git a/client/scripts/freebsd b/client/scripts/freebsd
+index 8f3e2a2..ad7fb44 100755
+--- a/client/scripts/freebsd
++++ b/client/scripts/freebsd
+@@ -89,6 +89,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
    fi
  # probably should do something with exit status of the local script
 +  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
@@ -28,24 +48,28 @@ Upstream-Status: Inappropriate [distribution]
    exit $exit_status
  }
  
---- client/scripts/linux
-+++ client/scripts/linux
-@@ -69,6 +69,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 5fb1612..3d447b6 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -174,6 +174,11 @@ exit_with_hooks() {
+         exit_status=$?
+     fi
+ 
++    if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
++        dbus-send --system --dest=com.redhat.dhcp \
++           --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
++           'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
++    fi
+     exit $exit_status
  }
  
---- client/scripts/netbsd
-+++ client/scripts/netbsd
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
+diff --git a/client/scripts/netbsd b/client/scripts/netbsd
+index 07383b7..aaba8e8 100755
+--- a/client/scripts/netbsd
++++ b/client/scripts/netbsd
+@@ -45,6 +45,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
    fi
  # probably should do something with exit status of the local script
 +  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
@@ -56,10 +80,12 @@ Upstream-Status: Inappropriate [distribution]
    exit $exit_status
  }
  
---- client/scripts/openbsd
-+++ client/scripts/openbsd
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
+diff --git a/client/scripts/openbsd b/client/scripts/openbsd
+index e7f4746..56b980c 100644
+--- a/client/scripts/openbsd
++++ b/client/scripts/openbsd
+@@ -45,6 +45,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
    fi
  # probably should do something with exit status of the local script
 +  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
@@ -70,10 +96,12 @@ Upstream-Status: Inappropriate [distribution]
    exit $exit_status
  }
  
---- client/scripts/solaris
-+++ client/scripts/solaris
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
+diff --git a/client/scripts/solaris b/client/scripts/solaris
+index af553b9..4a2aa69 100755
+--- a/client/scripts/solaris
++++ b/client/scripts/solaris
+@@ -26,6 +26,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
    fi
  # probably should do something with exit status of the local script
 +  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
@@ -84,3 +112,6 @@ Upstream-Status: Inappropriate [distribution]
    exit $exit_status
  }
  
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
similarity index 68%
rename from meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
index 0d0e0dd..810c7b6 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
@@ -1,24 +1,28 @@
-Author: Andrei Gherzan <andrei@gherzan.ro>
-Date:   Thu Feb 2 23:59:11 2012 +0200
+From d80bd792323dbd56269309f85b4506eb6b1b60e9 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 15 Aug 2017 15:05:47 +0800
+Subject: [PATCH 03/11] link with lcrypto
 
-From 4.2.0 final release, -lcrypto check was removed and we compile static libraries
-from bind that are linked to libcrypto. This is why i added a patch in order to add
+From 4.2.0 final release, -lcrypto check was removed and we compile
+static libraries
+from bind that are linked to libcrypto. This is why i added a patch in
+order to add
 -lcrypto to LIBS.
 
 Upstream-Status: Pending
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Rebase to 4.3.4
+Rebase to 4.3.6
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 097b0c3..726c88e 100644
+index cdfa352..44fb57e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -584,6 +584,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo() __attribute__((noreturn));
+@@ -591,6 +591,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo() __attribute__((noreturn));
  # Look for optional headers.
  AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
  
@@ -30,5 +34,5 @@ index 097b0c3..726c88e 100644
  AC_SEARCH_LIBS(socket, [socket])
  AC_SEARCH_LIBS(inet_ntoa, [nsl])
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
similarity index 92%
rename from meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
index 2f44147..7d1d867 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
@@ -1,10 +1,13 @@
-Fix out of tree builds
+From cccec0344d68dac4100b6f260ee24e7c2da9dfda Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 15:08:22 +0800
+Subject: [PATCH 04/11] Fix out of tree builds
 
 Upstream-Status: Pending
 
 RP 2013/03/21
 
-Rebase to 4.3.4
+Rebase to 4.3.6
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -93,5 +96,5 @@ index 54feedf..3990b9c 100644
  dist_sysconf_DATA = dhcpd.conf.example
  sbin_PROGRAMS = dhcpd
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch b/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
new file mode 100644
index 0000000..dd56381
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
@@ -0,0 +1,36 @@
+From 2e8ff0e4f6d39e346ea86b8c514ab4ccc78fa359 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 15:24:14 +0800
+Subject: [PATCH 05/11] dhcp-client: fix invoke dhclient-script failed on
+ Read-only file system
+
+In read-only file system, '/etc' is on the readonly partition,
+and '/etc/resolv.conf' is symlinked to a separate writable
+partition.
+
+In this situation, we create temp files 'resolv.conf.dhclient-new'
+in /tmp dir.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 3d447b6..3122a75 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -40,7 +40,7 @@ make_resolv_conf() {
+     # DHCPv4
+     if [ -n "$new_domain_search" ] || [ -n "$new_domain_name" ] ||
+        [ -n "$new_domain_name_servers" ]; then
+-        new_resolv_conf=/etc/resolv.conf.dhclient-new
++        new_resolv_conf=/tmp/resolv.conf.dhclient-new
+         rm -f $new_resolv_conf
+ 
+         if [ -n "$new_domain_name" ]; then
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
similarity index 65%
rename from meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
index 47443a5..c62b283 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
@@ -1,17 +1,22 @@
-Upstream-Status: Inappropriate [configuration]
-
-Subject: [PATCH] site.h: enable gentle shutdown
+From 01641d146e4e6bea954e4a4ee1f6230b822665b4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 15 Aug 2017 15:37:49 +0800
+Subject: [PATCH 06/11] site.h: enable gentle shutdown
 
+Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Rebase to 4.3.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  includes/site.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/includes/site.h b/includes/site.h
-index 1dd1251..abb66e4 100644
+index 280fbb9..e6c2972 100644
 --- a/includes/site.h
 +++ b/includes/site.h
-@@ -289,7 +289,7 @@
+@@ -296,7 +296,7 @@
     situations.  We plan to revisit this feature and may
     make non-backwards compatible changes including the
     removal of this define.  Use at your own risk.  */
@@ -21,5 +26,5 @@ index 1dd1251..abb66e4 100644
  /* Include old error codes.  This is provided in case you
     are building an external program similar to omshell for
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch b/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
new file mode 100644
index 0000000..43c26ea
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
@@ -0,0 +1,42 @@
+From 7107511fd209f08f9a96f8938041ae48f3295895 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 15 Aug 2017 16:17:49 +0800
+Subject: [PATCH 07/11] Add configure argument to make the libxml2 dependency
+ explicit and determinisitic.
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+Rebase to 4.3.6
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 44fb57e..8e9f509 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -611,6 +611,17 @@ AC_CHECK_FUNCS(strlcat)
+ # For HP/UX we need -lipv6 for if_nametoindex, perhaps others.
+ AC_SEARCH_LIBS(if_nametoindex, [ipv6])
+ 
++AC_ARG_WITH(libxml2,
++	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
++	with_libxml2="$withval", with_libxml2="no")
++
++if test x$with_libxml2 != xno; then
++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
++		[if test x$with_libxml2 != xauto; then
++			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
++		fi])
++fi
++
+ # check for /dev/random (declares HAVE_DEV_RANDOM)
+ AC_MSG_CHECKING(for random device)
+ AC_ARG_WITH(randomdev,
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
similarity index 93%
rename from meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
index 03c6abb..006d18a 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
@@ -1,7 +1,7 @@
-From ad7bb401f47714fc30c408853b796ce0f1c7e65f Mon Sep 17 00:00:00 2001
+From 92875f5cc44914515e50c11c503a09cec90497b2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 11 Jun 2016 22:51:44 -0400
-Subject: [PATCH] tweak to support external bind
+Subject: [PATCH 08/11] tweak to support external bind
 
 Tweak the external bind to oe-core's sysroot rather than
 external bind source build.
@@ -34,7 +34,7 @@ index 4730bb3..84d8131 100644
  AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
  	      -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
 diff --git a/client/tests/Makefile.am b/client/tests/Makefile.am
-index da69ea9..fe35e57 100644
+index 5031d0c..a8dfd26 100644
 --- a/client/tests/Makefile.am
 +++ b/client/tests/Makefile.am
 @@ -1,6 +1,6 @@
@@ -46,7 +46,7 @@ index da69ea9..fe35e57 100644
  AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
  AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
 diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
-index f8d6b0e..05cd9c1 100644
+index f6a43e4..2f98d22 100644
 --- a/common/tests/Makefile.am
 +++ b/common/tests/Makefile.am
 @@ -1,6 +1,6 @@
@@ -101,7 +101,7 @@ index 3990b9c..b5d8c2d 100644
  AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
  
 diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
-index 65a9f74..2892309 100644
+index a87c5e7..9821081 100644
 --- a/server/tests/Makefile.am
 +++ b/server/tests/Makefile.am
 @@ -1,6 +1,6 @@
@@ -113,5 +113,5 @@ index 65a9f74..2892309 100644
  AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
  AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch b/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
new file mode 100644
index 0000000..912b6d6
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
@@ -0,0 +1,28 @@
+From f3f8b7726e50e24ef3edf5fa5a17e31d39118d7e Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 15 Aug 2017 15:49:31 +0800
+Subject: [PATCH 09/11] remove dhclient-script bash dependency
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Rebase to 4.3.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 3122a75..1712d7d 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # dhclient-script for Linux. Dan Halbert, March, 1997.
+ # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
+ # No guarantees about this. I'm a novice at the details of Linux
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch b/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
similarity index 90%
rename from meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
index 0b3d6e4..f128731 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
@@ -1,9 +1,28 @@
+From 76c370a929e5ab5dbc81c2fbcf4e50f4fbc08ce9 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 15 Aug 2017 15:53:37 +0800
+Subject: [PATCH 10/11] build shared libs
+
 Upstream-Status: Pending
 
 Port patches from Fedora to build shared libs rather than static libs.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase to 4.3.6
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
+ client/Makefile.am       |  4 ++--
+ common/tests/Makefile.am | 13 +++++--------
+ configure.ac             | 12 ++----------
+ dhcpctl/Makefile.am      | 14 ++++++--------
+ omapip/Makefile.am       |  7 +++----
+ relay/Makefile.am        |  5 ++---
+ server/Makefile.am       |  7 +++----
+ server/tests/Makefile.am |  7 +++----
+ 8 files changed, 26 insertions(+), 43 deletions(-)
+
 diff --git a/client/Makefile.am b/client/Makefile.am
 index 84d8131..e776bf0 100644
 --- a/client/Makefile.am
@@ -19,7 +38,7 @@ index 84d8131..e776bf0 100644
  man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
  EXTRA_DIST = $(man_MANS)
 diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
-index 05cd9c1..ab7a5a3 100644
+index 2f98d22..8745e88 100644
 --- a/common/tests/Makefile.am
 +++ b/common/tests/Makefile.am
 @@ -15,26 +15,23 @@ ATF_TESTS += alloc_unittest dns_unittest misc_unittest ns_name_unittest
@@ -53,9 +72,9 @@ index 05cd9c1..ab7a5a3 100644
 +	-ldns -lisccfg -lisc
  
  check: $(ATF_TESTS)
- 	-cp -n $(top_srcdir)/common/tests/Atffile Atffile
+ 	@if test $(top_srcdir) != ${top_builddir}; then \
 diff --git a/configure.ac b/configure.ac
-index 1684df1..dadc3f1 100644
+index 8e9f509..bfe988a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -47,16 +47,8 @@ AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = "yes")
@@ -167,7 +186,7 @@ index b5d8c2d..d7f876d 100644
  man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
  EXTRA_DIST = $(man_MANS)
 diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
-index 2892309..056978b 100644
+index 9821081..de95872 100644
 --- a/server/tests/Makefile.am
 +++ b/server/tests/Makefile.am
 @@ -19,10 +19,9 @@ DHCPSRC = ../dhcp.c ../bootp.c ../confpars.c ../db.c ../class.c      \
@@ -184,3 +203,6 @@ index 2892309..056978b 100644
  
  ATF_TESTS =
  if HAVE_ATF
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch b/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
similarity index 92%
rename from meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
rename to meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
index 9b43f96..67bb463 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
@@ -1,8 +1,8 @@
-From e8c30bac53f8baeb80f87b445f42259cc8984fb5 Mon Sep 17 00:00:00 2001
+From 37725f3e22edb50e0ca2d1fff971321a5a4d5112 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 12 Jul 2017 03:05:13 -0400
-Subject: [PATCH] Moved the call to isc_app_ctxstart() to not get signal block
- by all threads
+Subject: [PATCH 11/11] Moved the call to isc_app_ctxstart() to not get signal
+ block by all threads
 
 Signed-off-by: Francis Dupont <fdupont@isc.org>
 
@@ -34,7 +34,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/omapip/isclib.c b/omapip/isclib.c
-index 13f0d3e..4af04b6 100644
+index ce86490..6a04345 100644
 --- a/omapip/isclib.c
 +++ b/omapip/isclib.c
 @@ -185,16 +185,6 @@ dhcp_context_create(int flags,
@@ -77,5 +77,5 @@ index 13f0d3e..4af04b6 100644
  
  #if defined (NSUPDATE)
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
deleted file mode 100644
index 96095a5..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-dhcp-client: fix invoke dhclient-script failed on Read-only file system
-
-In read-only file system, '/etc' is on the readonly partition,
-and '/etc/resolv.conf' is symlinked to a separate writable
-partition.
-
-In this situation, we should use shell variable to instead of
-temp files '/etc/resolv.conf.dhclient' and '/etc/resolv.conf.dhclient6'.
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- client/scripts/linux | 20 +++++++++-----------
- 1 file changed, 9 insertions(+), 11 deletions(-)
-
-diff --git a/client/scripts/linux b/client/scripts/linux
---- a/client/scripts/linux
-+++ b/client/scripts/linux
-@@ -27,27 +27,25 @@ ip=/sbin/ip
- 
- make_resolv_conf() {
-   if [ x"$new_domain_name_servers" != x ]; then
--    cat /dev/null > /etc/resolv.conf.dhclient
--    chmod 644 /etc/resolv.conf.dhclient
-+    resolv_conf=""
-     if [ x"$new_domain_search" != x ]; then
--      echo search $new_domain_search >> /etc/resolv.conf.dhclient
-+      resolv_conf="search ${new_domain_search}\n"
-     elif [ x"$new_domain_name" != x ]; then
-       # Note that the DHCP 'Domain Name Option' is really just a domain
-       # name, and that this practice of using the domain name option as
-       # a search path is both nonstandard and deprecated.
--      echo search $new_domain_name >> /etc/resolv.conf.dhclient
-+      resolv_conf="search ${new_domain_name}\n"
-     fi
-     for nameserver in $new_domain_name_servers; do
--      echo nameserver $nameserver >>/etc/resolv.conf.dhclient
-+      resolv_conf="${resolv_conf}nameserver ${nameserver}\n"
-     done
- 
--    mv /etc/resolv.conf.dhclient /etc/resolv.conf
-+    echo -e "${resolv_conf}" > /etc/resolv.conf
-   elif [ "x${new_dhcp6_name_servers}" != x ] ; then
--    cat /dev/null > /etc/resolv.conf.dhclient6
--    chmod 644 /etc/resolv.conf.dhclient6
-+    resolv_conf=""
- 
-     if [ "x${new_dhcp6_domain_search}" != x ] ; then
--      echo search ${new_dhcp6_domain_search} >> /etc/resolv.conf.dhclient6
-+      resolv_conf="search ${new_dhcp6_domain_search}\n"
-     fi
-     shopt -s nocasematch 
-     for nameserver in ${new_dhcp6_name_servers} ; do
-@@ -59,11 +57,11 @@ make_resolv_conf() {
-       else
- 	zone_id=
-       fi
--      echo nameserver ${nameserver}$zone_id >> /etc/resolv.conf.dhclient6
-+      resolv_conf="${resolv_conf}nameserver ${nameserver}$zone_id\n"
-     done
-     shopt -u nocasematch 
- 
--    mv /etc/resolv.conf.dhclient6 /etc/resolv.conf
-+    echo -e "${resolv_conf}" > /etc/resolv.conf
-   fi
- }
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch b/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
deleted file mode 100644
index 1435662..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Add configure argument to make the libxml2 dependency explicit and
-determinisitic.
-
-Upstream-Status: Pending
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Rebase to 4.3.4
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 726c88e..1684df1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -718,7 +718,16 @@ AC_SUBST(BINDSRCDIR)
- 
- # We need to find libxml2 if bind was built with support enabled
- # otherwise we'll fail to build omapip/test.c
--AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],)
-+AC_ARG_WITH(libxml2,
-+	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
-+	with_libxml2="$withval", with_libxml2="no")
-+
-+if test x$with_libxml2 != xno; then
-+    AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
-+                   [if test x$with_libxml2 != xauto; then
-+                        AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
-+                    fi])
-+fi
- 
- # OpenLDAP support.
- AC_ARG_WITH(ldap,
--- 
-2.8.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch b/meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch
deleted file mode 100644
index 997b9f6..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 8aed2a9ff09cb0d584ad0a7340fe3a596879d9b1 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Thu, 21 Jul 2016 19:07:02 -0700
-Subject: [PATCH] remove dhclient-script bash dependency
-
-Take the dash compatible IPv6 link-local address test from the Debian
-version of dhclient-script.
-
-Note that although "echo -e" in the OE version of dhclient-script is
-technically bash specific too, it is supported by Busybox echo when
-Busybox is configured with CONFIG_FEATURE_FANCY_ECHO enabled (which
-is the default in the OE Busybox defconfig) therefore leave as-is.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- client/scripts/linux | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/client/scripts/linux b/client/scripts/linux
-index 232a0aa..1383f46 100755
---- a/client/scripts/linux
-+++ b/client/scripts/linux
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # dhclient-script for Linux. Dan Halbert, March, 1997.
- # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
- # No guarantees about this. I'm a novice at the details of Linux
-@@ -47,11 +47,11 @@ make_resolv_conf() {
-     if [ "x${new_dhcp6_domain_search}" != x ] ; then
-       resolv_conf="search ${new_dhcp6_domain_search}\n"
-     fi
--    shopt -s nocasematch 
-     for nameserver in ${new_dhcp6_name_servers} ; do
-       # If the nameserver has a link-local address
-       # add a <zone_id> (interface name) to it.
--      if  [[ "$nameserver" =~ ^fe80:: ]]
-+      if [ "${nameserver##fe80::}" != "$nameserver" ] ||
-+         [ "${nameserver##FE80::}" != "$nameserver" ]
-       then
- 	zone_id="%$interface"
-       else
-@@ -59,7 +59,6 @@ make_resolv_conf() {
-       fi
-       resolv_conf="${resolv_conf}nameserver ${nameserver}$zone_id\n"
-     done
--    shopt -u nocasematch 
- 
-     echo -e "${resolv_conf}" > /etc/resolv.conf
-   fi
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch b/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
deleted file mode 100644
index d84df5c..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-Found this patch here:
-https://lists.isc.org/pipermail/dhcp-users/2011-January/012910.html
-
-and made some adjustments/updates to make it work with this version.
-Wasn't able to find that why this patch was not accepted by ISC DHCP developers.
-
-Upstream-Status: Pending
-
-Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
-
-Rebase to 4.3.4
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- client/scripts/linux | 82 ++++++++++++++++++++++++++++------------------------
- 1 file changed, 45 insertions(+), 37 deletions(-)
-
-diff --git a/client/scripts/linux b/client/scripts/linux
-index a02cfd9..232a0aa 100755
---- a/client/scripts/linux
-+++ b/client/scripts/linux
-@@ -101,17 +101,11 @@ fi
- if [ x$old_broadcast_address != x ]; then
-   old_broadcast_arg="broadcast $old_broadcast_address"
- fi
--if [ x$new_subnet_mask != x ]; then
--  new_subnet_arg="netmask $new_subnet_mask"
-+if [ -n "$new_subnet_mask" ]; then
-+    new_mask="/$new_subnet_mask"
- fi
--if [ x$old_subnet_mask != x ]; then
--  old_subnet_arg="netmask $old_subnet_mask"
--fi
--if [ x$alias_subnet_mask != x ]; then
--  alias_subnet_arg="netmask $alias_subnet_mask"
--fi
--if [ x$new_interface_mtu != x ]; then
--  mtu_arg="mtu $new_interface_mtu"
-+if [ -n "$alias_subnet_mask" ]; then
-+    alias_mask="/$alias_subnet_mask"
- fi
- if [ x$IF_METRIC != x ]; then
-   metric_arg="metric $IF_METRIC"
-@@ -125,9 +119,9 @@ fi
- if [ x$reason = xPREINIT ]; then
-   if [ x$alias_ip_address != x ]; then
-     # Bring down alias interface. Its routes will disappear too.
--    ifconfig $interface:0- inet 0
-+    ${ip} -4 addr flush dev ${interface} label ${interface}:0
-   fi
--  ifconfig $interface 0 up
-+  ${ip} link set dev ${interface} up
- 
-   # We need to give the kernel some time to get the interface up.
-   sleep 1
-@@ -154,25 +148,30 @@ if [ x$reason = xBOUND ] || [ x$reason = xRENEW ] || \
-   if [ x$old_ip_address != x ] && [ x$alias_ip_address != x ] && \
- 		[ x$alias_ip_address != x$old_ip_address ]; then
-     # Possible new alias. Remove old alias.
--    ifconfig $interface:0- inet 0
-+    ${ip} -4 addr flush dev ${interface} label ${interface}:0
-   fi
-   if [ x$old_ip_address != x ] && [ x$old_ip_address != x$new_ip_address ]; then
-     # IP address changed. Bringing down the interface will delete all routes,
-     # and clear the ARP cache.
--    ifconfig $interface inet 0 down
-+    ${ip} -4 addr flush dev ${interface} label ${interface}
- 
-   fi
-   if [ x$old_ip_address = x ] || [ x$old_ip_address != x$new_ip_address ] || \
-      [ x$reason = xBOUND ] || [ x$reason = xREBOOT ]; then
- 
--    ifconfig $interface inet $new_ip_address $new_subnet_arg \
--					$new_broadcast_arg $mtu_arg
-+    ${ip} -4 addr add ${new_ip_address}${new_mask} ${new_broadcast_arg} \
-+                dev ${interface} label ${interface}
-+    if [ -n "$new_interface_mtu" ]; then
-+      # set MTU
-+      ${ip} link set dev ${interface} mtu ${new_interface_mtu}
-+    fi
-     # Add a network route to the computed network address.
-     for router in $new_routers; do
-       if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
--	route add -host $router dev $interface
-+        ${ip} -4 route add ${router} dev $interface >/dev/null 2>&1
-       fi
--      route add default gw $router $metric_arg dev $interface
-+      ${ip} -4 route add default via ${router} dev ${interface} \
-+        ${metric_arg} >/dev/null 2>&1
-     done
-   else
-     # we haven't changed the address, have we changed other options           
-@@ -180,21 +179,23 @@ if [ x$reason = xBOUND ] || [ x$reason = xRENEW ] || \
-     if [ x$new_routers != x ] && [ x$new_routers != x$old_routers ] ; then
-       # if we've changed routers delete the old and add the new.
-       for router in $old_routers; do
--        route del default gw $router
-+        ${ip} -4 route delete default via ${router}
-       done
-       for router in $new_routers; do
-         if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
--	  route add -host $router dev $interface
--	fi
--	route add default gw $router $metric_arg dev $interface
-+	      ${ip} -4 route add ${router} dev $interface >/dev/null 2>&1
-+	    fi
-+        ${ip} -4 route add default via ${router} dev ${interface} \
-+          ${metric_arg} >/dev/null 2>&1
-       done
-     fi
-   fi
-   if [ x$new_ip_address != x$alias_ip_address ] && [ x$alias_ip_address != x ];
-    then
--    ifconfig $interface:0- inet 0
--    ifconfig $interface:0 inet $alias_ip_address $alias_subnet_arg
--    route add -host $alias_ip_address $interface:0
-+    ${ip} -4 addr flush dev ${interface} label ${interface}:0
-+    ${ip} -4 addr add ${alias_ip_address}${alias_mask} \
-+        dev ${interface} label ${interface}:0
-+    ${ip} -4 route add ${alias_ip_address} dev ${interface} >/dev/null 2>&1
-   fi
-   make_resolv_conf
-   exit_with_hooks 0
-@@ -204,42 +205,49 @@ if [ x$reason = xEXPIRE ] || [ x$reason = xFAIL ] || [ x$reason = xRELEASE ] \
-    || [ x$reason = xSTOP ]; then
-   if [ x$alias_ip_address != x ]; then
-     # Turn off alias interface.
--    ifconfig $interface:0- inet 0
-+    ${ip} -4 addr flush dev ${interface} label ${interface}:0
-   fi
-   if [ x$old_ip_address != x ]; then
-     # Shut down interface, which will delete routes and clear arp cache.
--    ifconfig $interface inet 0 down
-+    ${ip} -4 addr flush dev ${interface} label ${interface}
-   fi
-   if [ x$alias_ip_address != x ]; then
--    ifconfig $interface:0 inet $alias_ip_address $alias_subnet_arg
--    route add -host $alias_ip_address $interface:0
-+    ${ip} -4 addr add ${alias_ip_address}${alias_network_arg} \
-+        dev ${interface} label ${interface}:0
-+    ${ip} -4 route add ${alias_ip_address} dev ${interface} >/dev/null 2>&1
-   fi
-   exit_with_hooks 0
- fi
- 
- if [ x$reason = xTIMEOUT ]; then
-   if [ x$alias_ip_address != x ]; then
--    ifconfig $interface:0- inet 0
-+    ${ip} -4 addr flush dev ${interface} label ${interface}:0
-+  fi
-+  ${ip} -4 addr add ${new_ip_address}${new_mask} ${new_broadcast_arg} \
-+            dev ${interface} label ${interface}
-+  if [ -n "$new_interface_mtu" ]; then
-+    # set MTU
-+    ip link set dev ${interface} mtu ${new_interface_mtu}
-   fi
--  ifconfig $interface inet $new_ip_address $new_subnet_arg \
--					$new_broadcast_arg $mtu_arg
-   set $new_routers
-   if ping -q -c 1 $1; then
-     if [ x$new_ip_address != x$alias_ip_address ] && \
- 			[ x$alias_ip_address != x ]; then
--      ifconfig $interface:0 inet $alias_ip_address $alias_subnet_arg
--      route add -host $alias_ip_address dev $interface:0
-+      ${ip} -4 addr add ${alias_ip_address}${alias_mask} \
-+            dev ${interface} label ${interface}:0
-+      ${ip} -4 route add ${alias_ip_address} dev ${interface} >/dev/null 2>&1
-     fi
-     for router in $new_routers; do
-       if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
--	route add -host $router dev $interface
-+	    ${ip} -4 route add ${router} dev $interface >/dev/null 2>&1
-       fi
--      route add default gw $router $metric_arg dev $interface
-+      ${ip} -4 route add default via ${router} dev ${interface} \
-+        ${metric_arg} >/dev/null 2>&1
-     done
-     make_resolv_conf
-     exit_with_hooks 0
-   fi
--  ifconfig $interface inet 0 down
-+  ${ip} -4 addr flush dev ${interface}
-   exit_with_hooks 1
- fi
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch b/meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch
deleted file mode 100644
index a08a5b7..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-libdns requires libxml2 if bind was built with libxml2 support
-enabled. Compilation will fail for omapip/test.c in case
-lxml2 isn't used during the build. So, we add losely coupled
-search path which will pick up the lib if it is present.
-
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
-Upstream-Status: Pending
-
-diff --git a/configure.ac b/configure.ac
-index c9dc8b5..85f59be 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -602,6 +602,10 @@ no)
- esac
- AC_SUBST([libbind])
- 
-+# We need to find libxml2 if bind was built with support enabled
-+# otherwise we'll fail to build omapip/test.c
-+AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],)
-+
- # OpenLDAP support.
- AC_ARG_WITH(ldap,
-     AS_HELP_STRING([--with-ldap],[enable OpenLDAP support in dhcpd (default is no)]),
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
deleted file mode 100644
index 964d05d..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require dhcp.inc
-
-SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-            file://link-with-lcrypto.patch \
-            file://fixsepbuild.patch \
-            file://dhclient-script-drop-resolv.conf.dhclient.patch \
-            file://replace-ifconfig-route.patch \
-            file://0001-site.h-enable-gentle-shutdown.patch \
-            file://libxml2-configure-argument.patch \
-            file://tweak-to-support-external-bind.patch \
-            file://remove-dhclient-script-bash-dependency.patch \
-            file://build-shared-libs.patch \
-            file://Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
-           "
-
-SRC_URI[md5sum] = "2b5e5b2fa31c2e27e487039d86f83d3f"
-SRC_URI[sha256sum] = "eb95936bf15d2393c55dd505bc527d1d4408289cec5a9fa8abb99f7577e7f954"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
new file mode 100644
index 0000000..4634a01
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
@@ -0,0 +1,20 @@
+require dhcp.inc
+
+SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch \
+            file://0002-dhclient-dbus.patch \
+            file://0003-link-with-lcrypto.patch \
+            file://0004-Fix-out-of-tree-builds.patch \
+            file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
+            file://0006-site.h-enable-gentle-shutdown.patch \
+            file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
+            file://0008-tweak-to-support-external-bind.patch \
+            file://0009-remove-dhclient-script-bash-dependency.patch \
+            file://0010-build-shared-libs.patch \
+            file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
+           "
+
+SRC_URI[md5sum] = "afa6e9b3eb7539ea048421a82c668adc"
+SRC_URI[sha256sum] = "a41eaf6364f1377fe065d35671d9cf82bbbc8f21207819b2b9f33f652aec6f1b"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-- 
2.8.1


