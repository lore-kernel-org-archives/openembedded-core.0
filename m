Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RszWK-0001aq-W0
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 17:28:41 +0100
Received: by wgbdt11 with SMTP id dt11so183189wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 08:20:28 -0800 (PST)
Received: by 10.180.108.232 with SMTP id hn8mr5650045wib.16.1328199628022;
	Thu, 02 Feb 2012 08:20:28 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id q2sm670099wiy.7.2012.02.02.08.20.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 08:20:26 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 18:20:17 +0200
Message-Id: <1328199617-1195-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Thu, 02 Feb 2012 16:29:04 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

1. Update to 4.2.3-P2
2. From 4.2.0 final release, -lcrypto check was removed and we compile static libraries
from bind that are linked to libcrypto. This is why i added a patch in order to add
-lcrypto to LIBS.
---
 .../dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch |   86 ----------------
 .../dhcp/dhcp-4.2.0/fix-client-path.patch          |   23 -----
 .../dhcp/dhcp-4.2.0/fix-external-bind.patch        |  103 --------------------
 .../dhcp/dhcp-4.2.0/fixincludes.patch              |   12 ---
 .../dhcp/dhcp-4.2.0/noattrmode.patch               |   21 ----
 meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h   |   21 ----
 .../dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch   |   86 ++++++++++++++++
 .../dhcp/dhcp-4.2.3-P2/fix-external-bind.patch     |  103 ++++++++++++++++++++
 .../dhcp/dhcp-4.2.3-P2/fixincludes.patch           |   12 +++
 .../dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch     |   15 +++
 .../dhcp/dhcp-4.2.3-P2/noattrmode.patch            |   21 ++++
 .../recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h |   21 ++++
 meta/recipes-connectivity/dhcp/dhcp.inc            |    2 +-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |   12 ---
 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb    |   12 +++
 15 files changed, 271 insertions(+), 279 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
deleted file mode 100644
index b4a666d..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Upstream-Status: Inappropriate [distribution]
-
---- client/scripts/bsdos
-+++ client/scripts/bsdos
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
---- client/scripts/freebsd
-+++ client/scripts/freebsd
-@@ -57,6 +57,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
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
- }
- 
---- client/scripts/netbsd
-+++ client/scripts/netbsd
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
---- client/scripts/openbsd
-+++ client/scripts/openbsd
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
---- client/scripts/solaris
-+++ client/scripts/solaris
-@@ -47,6 +47,11 @@
-     . /etc/dhcp/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
deleted file mode 100644
index 97ed0d9..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-CLIENT_PATH is the only environment when executing dhclient-script,
-without this patch, dhclient-script won't run properly because it
-invokes ifconfig and route
-
-Upstream-Status: Inappropriate [configuration]
-
-7/28/2010 - qhe
-
-diff -ru dhcp-4.1.1-P1.orig//client/Makefile.am dhcp-4.1.1-P1/client/Makefile.am
---- dhcp-4.1.1-P1.orig//client/Makefile.am	2010-07-29 13:20:05.000000000 +0800
-+++ dhcp-4.1.1-P1/client/Makefile.am	2010-07-29 13:28:14.000000000 +0800
-@@ -10,9 +10,9 @@
- EXTRA_DIST = $(man_MANS)
- 
- dhclient.o: dhclient.c
--	$(COMPILE) -DCLIENT_PATH='"$(sbindir)"' \
-+	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):$(base_sbindir):$(bindir):$(base_bindir)"' \
- 		   -DLOCALSTATEDIR='"$(localstatedir)"' -c dhclient.c
- 
- dhc6.o: dhc6.c
--	$(COMPILE) -DCLIENT_PATH='"$(sbindir)"' \
-+	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):$(base_sbindir):$(bindir):$(base_bindir)"' \
- 		   -DLOCALSTATEDIR='"$(localstatedir)"' -c dhc6.c
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
deleted file mode 100644
index 4f11655..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-Upstream-Status: Pending
-
-11/30/2010
---with-libbind=PATH is available but not used by Makefile,
-this patch is to allow building with external bind
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 928d926..cd17af8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -21,7 +21,7 @@ EXTRA_DIST = RELNOTES LICENSE \
- 	     util/bindvar.sh \
- 	     bind/Makefile bind/bind.tar.gz bind/version.tmp 
- 
--SUBDIRS = bind includes tests common dst omapip client dhcpctl relay server
-+SUBDIRS = includes tests common dst omapip client dhcpctl relay server
- 
- nobase_include_HEADERS = dhcpctl/dhcpctl.h
- 
-diff --git a/client/Makefile.am b/client/Makefile.am
-index 77ed055..5a77f2d 100644
---- a/client/Makefile.am
-+++ b/client/Makefile.am
-@@ -5,7 +5,7 @@ dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
- 		   scripts/netbsd scripts/nextstep scripts/openbsd \
- 		   scripts/solaris scripts/openwrt
- dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--		 ../bind/lib/libdns.a ../bind/lib/libisc.a
-+		 $(libbind)/libdns.a $(libbind)/libisc.a
- man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
- EXTRA_DIST = $(man_MANS)
- 
-diff --git a/configure.ac b/configure.ac
-index ff832aa..60d342c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -500,6 +500,7 @@ no)
- 	libbind="$use_libbind"
- 	;;
- esac
-+AC_SUBST([libbind])
- 
- # OpenLDAP support.
- AC_ARG_WITH(ldap,
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index 61049be..85aefa3 100644
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
-@@ -6,10 +6,10 @@ EXTRA_DIST = $(man_MANS)
- 
- omshell_SOURCES = omshell.c
- omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	        ../bind/lib/libdns.a ../bind/lib/libisc.a
-+	        $(libbind)/libdns.a $(libbind)/libisc.a
- 
- libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
- 
- cltest_SOURCES = cltest.c
- cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	       ../bind/lib/libdns.a ../bind/lib/libisc.a
-\ No newline at end of file
-+	       $(libbind)/libdns.a $(libbind)/libisc.a
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index 595950a..17f2233 100644
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
-@@ -10,5 +10,5 @@ man_MANS = omapi.3
- EXTRA_DIST = $(man_MANS)
- 
- svtest_SOURCES = test.c
--svtest_LDADD = libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
-+svtest_LDADD = libomapi.a $(libbind)/libdns.a $(libbind)/libisc.a
- 
-diff --git a/relay/Makefile.am b/relay/Makefile.am
-index d8757ca..a7885da 100644
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
-@@ -3,7 +3,7 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
- sbin_PROGRAMS = dhcrelay
- dhcrelay_SOURCES = dhcrelay.c
- dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--		 ../bind/lib/libdns.a ../bind/lib/libisc.a
-+		 $(libbind)/libdns.a $(libbind)/libisc.a
- man_MANS = dhcrelay.8
- EXTRA_DIST = $(man_MANS)
- 
-diff --git a/server/Makefile.am b/server/Makefile.am
-index cdfaf47..d2c254b 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -8,8 +8,8 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
- 
- dhcpd_CFLAGS = $(LDAP_CFLAGS)
- dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--	      ../dhcpctl/libdhcpctl.a ../bind/lib/libdns.a \
--	      ../bind/lib/libisc.a
-+	      ../dhcpctl/libdhcpctl.a $(libbind)/libdns.a \
-+	      $(libbind)/libisc.a
- 
- man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
- EXTRA_DIST = $(man_MANS)
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
deleted file mode 100644
index e33c9dd..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Pending
-
---- dhcp-3.0.2/common/tr.c~compile	2005-10-13 14:23:37.000000000 +0200
-+++ dhcp-3.0.2/common/tr.c	2005-10-13 14:23:45.000000000 +0200
-@@ -39,6 +39,7 @@
- #include "includes/netinet/udp.h"
- #include "includes/netinet/if_ether.h"
- #include "netinet/if_tr.h"
-+#include <asm/types.h>
- #include <sys/time.h>
- 
- /*
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
deleted file mode 100644
index 5c635e8..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Backport
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- dhcp-3.0.1/includes/dhcpd.h~compile
-+++ dhcp-3.0.1/includes/dhcpd.h
-@@ -306,9 +306,9 @@
- #	define EPHEMERAL_FLAGS		(MS_NULL_TERMINATION | \
- 					 UNICAST_BROADCAST_HACK)
- 
--	binding_state_t __attribute__ ((mode (__byte__))) binding_state;
--	binding_state_t __attribute__ ((mode (__byte__))) next_binding_state;
--	binding_state_t __attribute__ ((mode (__byte__))) desired_binding_state;
-+	binding_state_t binding_state;
-+	binding_state_t next_binding_state;
-+	binding_state_t desired_binding_state;
- 	
- 	struct lease_state *state;
- 
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h
deleted file mode 100644
index 2289554..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * define config file location in ${S}/includes/site.h
- * still need to take care of installation path (${sysconfdir}/dhcpd.conf)
- *
- * 7/22/2010 - qhe
- */
-
-/* Define this if you want DNS update functionality to be available. */
-
-#define NSUPDATE
-
-/* Define this if you aren't debugging and you want to save memory
-   (potentially a _lot_ of memory) by allocating leases in chunks rather
-   than one at a time. */
-
-#define COMPACT_LEASES
-
-
-/* local */
-#define _PATH_DHCPD_CONF     "/etc/dhcp/dhcpd.conf"
-#define _PATH_DHCLIENT_CONF  "/etc/dhcp/dhclient.conf"
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch
new file mode 100644
index 0000000..b4a666d
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch
@@ -0,0 +1,86 @@
+Upstream-Status: Inappropriate [distribution]
+
+--- client/scripts/bsdos
++++ client/scripts/bsdos
+@@ -47,6 +47,11 @@
+     . /etc/dhcp/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=com.redhat.dhcp \
++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
++  fi
+   exit $exit_status
+ }
+ 
+--- client/scripts/freebsd
++++ client/scripts/freebsd
+@@ -57,6 +57,11 @@
+     . /etc/dhcp/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=com.redhat.dhcp \
++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
++  fi
+   exit $exit_status
+ }
+ 
+--- client/scripts/linux
++++ client/scripts/linux
+@@ -69,6 +69,11 @@
+     . /etc/dhcp/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=com.redhat.dhcp \
++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
++  fi
+   exit $exit_status
+ }
+ 
+--- client/scripts/netbsd
++++ client/scripts/netbsd
+@@ -47,6 +47,11 @@
+     . /etc/dhcp/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=com.redhat.dhcp \
++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
++  fi
+   exit $exit_status
+ }
+ 
+--- client/scripts/openbsd
++++ client/scripts/openbsd
+@@ -47,6 +47,11 @@
+     . /etc/dhcp/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=com.redhat.dhcp \
++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
++  fi
+   exit $exit_status
+ }
+ 
+--- client/scripts/solaris
++++ client/scripts/solaris
+@@ -47,6 +47,11 @@
+     . /etc/dhcp/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=com.redhat.dhcp \
++      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
++  fi
+   exit $exit_status
+ }
+ 
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch
new file mode 100644
index 0000000..4f11655
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch
@@ -0,0 +1,103 @@
+Upstream-Status: Pending
+
+11/30/2010
+--with-libbind=PATH is available but not used by Makefile,
+this patch is to allow building with external bind
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 928d926..cd17af8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -21,7 +21,7 @@ EXTRA_DIST = RELNOTES LICENSE \
+ 	     util/bindvar.sh \
+ 	     bind/Makefile bind/bind.tar.gz bind/version.tmp 
+ 
+-SUBDIRS = bind includes tests common dst omapip client dhcpctl relay server
++SUBDIRS = includes tests common dst omapip client dhcpctl relay server
+ 
+ nobase_include_HEADERS = dhcpctl/dhcpctl.h
+ 
+diff --git a/client/Makefile.am b/client/Makefile.am
+index 77ed055..5a77f2d 100644
+--- a/client/Makefile.am
++++ b/client/Makefile.am
+@@ -5,7 +5,7 @@ dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
+ 		   scripts/netbsd scripts/nextstep scripts/openbsd \
+ 		   scripts/solaris scripts/openwrt
+ dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-		 ../bind/lib/libdns.a ../bind/lib/libisc.a
++		 $(libbind)/libdns.a $(libbind)/libisc.a
+ man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
+ EXTRA_DIST = $(man_MANS)
+ 
+diff --git a/configure.ac b/configure.ac
+index ff832aa..60d342c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -500,6 +500,7 @@ no)
+ 	libbind="$use_libbind"
+ 	;;
+ esac
++AC_SUBST([libbind])
+ 
+ # OpenLDAP support.
+ AC_ARG_WITH(ldap,
+diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
+index 61049be..85aefa3 100644
+--- a/dhcpctl/Makefile.am
++++ b/dhcpctl/Makefile.am
+@@ -6,10 +6,10 @@ EXTRA_DIST = $(man_MANS)
+ 
+ omshell_SOURCES = omshell.c
+ omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	        ../bind/lib/libdns.a ../bind/lib/libisc.a
++	        $(libbind)/libdns.a $(libbind)/libisc.a
+ 
+ libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
+ 
+ cltest_SOURCES = cltest.c
+ cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	       ../bind/lib/libdns.a ../bind/lib/libisc.a
+\ No newline at end of file
++	       $(libbind)/libdns.a $(libbind)/libisc.a
+diff --git a/omapip/Makefile.am b/omapip/Makefile.am
+index 595950a..17f2233 100644
+--- a/omapip/Makefile.am
++++ b/omapip/Makefile.am
+@@ -10,5 +10,5 @@ man_MANS = omapi.3
+ EXTRA_DIST = $(man_MANS)
+ 
+ svtest_SOURCES = test.c
+-svtest_LDADD = libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
++svtest_LDADD = libomapi.a $(libbind)/libdns.a $(libbind)/libisc.a
+ 
+diff --git a/relay/Makefile.am b/relay/Makefile.am
+index d8757ca..a7885da 100644
+--- a/relay/Makefile.am
++++ b/relay/Makefile.am
+@@ -3,7 +3,7 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
+ sbin_PROGRAMS = dhcrelay
+ dhcrelay_SOURCES = dhcrelay.c
+ dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-		 ../bind/lib/libdns.a ../bind/lib/libisc.a
++		 $(libbind)/libdns.a $(libbind)/libisc.a
+ man_MANS = dhcrelay.8
+ EXTRA_DIST = $(man_MANS)
+ 
+diff --git a/server/Makefile.am b/server/Makefile.am
+index cdfaf47..d2c254b 100644
+--- a/server/Makefile.am
++++ b/server/Makefile.am
+@@ -8,8 +8,8 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
+ 
+ dhcpd_CFLAGS = $(LDAP_CFLAGS)
+ dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-	      ../dhcpctl/libdhcpctl.a ../bind/lib/libdns.a \
+-	      ../bind/lib/libisc.a
++	      ../dhcpctl/libdhcpctl.a $(libbind)/libdns.a \
++	      $(libbind)/libisc.a
+ 
+ man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
+ EXTRA_DIST = $(man_MANS)
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch
new file mode 100644
index 0000000..e33c9dd
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch
@@ -0,0 +1,12 @@
+Upstream-Status: Pending
+
+--- dhcp-3.0.2/common/tr.c~compile	2005-10-13 14:23:37.000000000 +0200
++++ dhcp-3.0.2/common/tr.c	2005-10-13 14:23:45.000000000 +0200
+@@ -39,6 +39,7 @@
+ #include "includes/netinet/udp.h"
+ #include "includes/netinet/if_ether.h"
+ #include "netinet/if_tr.h"
++#include <asm/types.h>
+ #include <sys/time.h>
+ 
+ /*
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
new file mode 100644
index 0000000..42a584a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
@@ -0,0 +1,15 @@
+Index: dhcp-4.2.3-P2-r0/dhcp-4.2.3-P2/configure.ac
+===================================================================
+--- dhcp-4.2.3-P2.orig/configure.ac	2012-02-02 18:04:20.843023196 +0200
++++ dhcp-4.2.3-P2/configure.ac	2012-02-02 17:58:16.000000000 +0200
+@@ -456,6 +456,10 @@
+ # Look for optional headers.
+ AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
+ 
++# find an MD5 library
++AC_SEARCH_LIBS(MD5_Init, [crypto])
++AC_SEARCH_LIBS(MD5Init, [crypto])
++
+ # Solaris needs some libraries for functions
+ AC_SEARCH_LIBS(socket, [socket])
+ AC_SEARCH_LIBS(inet_ntoa, [nsl])
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch
new file mode 100644
index 0000000..5c635e8
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Backport
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+--- dhcp-3.0.1/includes/dhcpd.h~compile
++++ dhcp-3.0.1/includes/dhcpd.h
+@@ -306,9 +306,9 @@
+ #	define EPHEMERAL_FLAGS		(MS_NULL_TERMINATION | \
+ 					 UNICAST_BROADCAST_HACK)
+ 
+-	binding_state_t __attribute__ ((mode (__byte__))) binding_state;
+-	binding_state_t __attribute__ ((mode (__byte__))) next_binding_state;
+-	binding_state_t __attribute__ ((mode (__byte__))) desired_binding_state;
++	binding_state_t binding_state;
++	binding_state_t next_binding_state;
++	binding_state_t desired_binding_state;
+ 	
+ 	struct lease_state *state;
+ 
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h
new file mode 100644
index 0000000..2289554
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h
@@ -0,0 +1,21 @@
+/*
+ * define config file location in ${S}/includes/site.h
+ * still need to take care of installation path (${sysconfdir}/dhcpd.conf)
+ *
+ * 7/22/2010 - qhe
+ */
+
+/* Define this if you want DNS update functionality to be available. */
+
+#define NSUPDATE
+
+/* Define this if you aren't debugging and you want to save memory
+   (potentially a _lot_ of memory) by allocating leases in chunks rather
+   than one at a time. */
+
+#define COMPACT_LEASES
+
+
+/* local */
+#define _PATH_DHCPD_CONF     "/etc/dhcp/dhcpd.conf"
+#define _PATH_DHCLIENT_CONF  "/etc/dhcp/dhclient.conf"
diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index be256ce..051190f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=bb6fd41f5895b67088ebea61ad365
 
 DEPENDS = "bind"
 
-SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-${PV}.tar.gz \
+SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://site.h \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
deleted file mode 100644
index a3a560b..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require dhcp.inc
-
-PR = "r5"
-
-SRC_URI += "file://fixincludes.patch \
-            file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-            file://fix-client-path.patch \
-            file://fix-external-bind.patch \
-           "
-
-SRC_URI[md5sum] = "83abd7c4f9c24d8dd024ca5a71380c0a"
-SRC_URI[sha256sum] = "6260d43423e4c406ba63cd7199502a395e952b13c80a955026c4b82a4e9d4943"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
new file mode 100644
index 0000000..24b50ba
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
@@ -0,0 +1,12 @@
+require dhcp.inc
+
+PR = "r0"
+
+SRC_URI += "file://fixincludes.patch \
+            file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
+            file://fix-external-bind.patch \
+            file://link-with-lcrypto.patch \
+           "
+
+SRC_URI[md5sum] = "14f57fd580d01633d0fad4809007a801"
+SRC_URI[sha256sum] = "5cf7ae2cad9c4ca0103748b2476ec8ea78484e408f8fe597e4e0a4afb051b469"
-- 
1.7.5.4



