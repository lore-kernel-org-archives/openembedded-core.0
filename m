Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D2F566FEF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 13:57:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 17 Feb 2016 05:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,460,1449561600"; d="scan'208";a="887187466"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2016 05:56:54 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 46CFC6A4004
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 06:44:44 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 16:00:19 +0200
Message-Id: <1455717619-25687-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] avahi: update to version 0.6.32
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
X-List-Received-Date: Wed, 17 Feb 2016 13:57:03 -0000

0.6.31 -> 0.6.32

a. Switched to the new repository hosted in github.
b. Removed the following Upstreamed/Backported patches
   1. 0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
   2. 0001-avahi-fix-avahi-status-command-error-prompt.patch
   3. avahi_fix_install_issue.patch
   4. fix_for_automake_1.12.x.patch
   5. out-of-tree.patch
   6. reuseport-check.patch
c. Added UPSTREAM_CHECK_URI

[YOCTO #7553]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../{avahi-ui_0.6.31.bb => avahi-ui_0.6.32.bb}     |   6 +-
 meta/recipes-connectivity/avahi/avahi.inc          |  14 +-
 .../avahi/{avahi_0.6.31.bb => avahi_0.6.32.bb}     |   6 +-
 ...arnings-about-invalid-packets-Fixes-lathi.patch | 158 ---------------------
 ...ahi-fix-avahi-status-command-error-prompt.patch |  52 -------
 .../avahi/files/avahi_fix_install_issue.patch      |  32 -----
 .../avahi/files/fix_for_automake_1.12.x.patch      |  34 -----
 .../avahi/files/out-of-tree.patch                  |  32 -----
 .../avahi/files/reuseport-check.patch              |  30 ----
 9 files changed, 8 insertions(+), 356 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.31.bb => avahi-ui_0.6.32.bb} (94%)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.31.bb => avahi_0.6.32.bb} (81%)
 delete mode 100644 meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/out-of-tree.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/reuseport-check.patch

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
similarity index 94%
rename from meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
rename to meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
index 604ee9e..aafb52e 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
@@ -12,10 +12,8 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 PACKAGECONFIG ??= "python"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python-native python"
 
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
-SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
+SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
+SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
 
 DEPENDS += "avahi gtk+ libglade"
 
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 3d22e4c..faa8ee8 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -7,28 +7,21 @@ configuration from the link-local 169.254.0.0/16 range without the need for a ce
 server.'
 AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://avahi.org"
-BUGTRACKER = "http://avahi.org/report"
+BUGTRACKER = "https://github.com/lathiat/avahi/issues"
 SECTION = "network"
 
 # major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r11"
-
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
-SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
+SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
           file://00avahi-autoipd \
           file://99avahi-autoipd \
           file://initscript.patch \
-          file://avahi_fix_install_issue.patch \
-          file://fix_for_automake_1.12.x.patch \
-          file://out-of-tree.patch \
-          file://0001-avahi-fix-avahi-status-command-error-prompt.patch \
-          file://reuseport-check.patch \
-          file://0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch \
           "
+UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
 
 USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
 USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
@@ -53,6 +46,7 @@ EXTRA_OECONF = "--disable-introspection \
              --disable-qt4 \
              --disable-python \
              --disable-doxygen-doc \
+             --disable-manpages \
              ${EXTRA_OECONF_SYSVINIT} \
              ${EXTRA_OECONF_SYSTEMD} \
              ${AVAHI_GTK} \
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
similarity index 81%
rename from meta/recipes-connectivity/avahi/avahi_0.6.31.bb
rename to meta/recipes-connectivity/avahi/avahi_0.6.32.bb
index 5d796a2..6670106 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
@@ -12,10 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
-SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
+SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
+SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
 
 DEPENDS += "intltool-native"
 
diff --git a/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch b/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
deleted file mode 100644
index 25a0a0e..0000000
--- a/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From de7cde877e4daa5d9d4fb5b1a349299eaa94969d Mon Sep 17 00:00:00 2001
-From: Trent Lloyd <trent@lloyd.id.au>
-Date: Sat, 10 Oct 2015 06:20:46 +0800
-Subject: [PATCH] Don't log warnings about invalid packets (Fixes
- lathiat/avahi#10)
-
-Various invalid packets would generate a warning, in particular
-Windows 10 generates response packets with no answer records and
-generally seemingly empty.  Unsure why at this stage.
-
-This results in spamming syslog quite a lot on busy networks,
-similar issues like this have occured over time due to changes
-in various operating systems and specs (e.g. Avahi #284, #282)
-
-Rather than just disable this single message or case, I have
-pre-emptively turned the majority of these bad packet messages
-into debug messages.  They can still be output on production
-builds if reuqired using the --debug option (no rebuild required).
-
-External References:
-https://bugs.launchpad.net/ubuntu/+source/avahi/+bug/1342400
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=794145
-https://bugzilla.redhat.com/show_bug.cgi?id=1240711
-
-Pulled from git://github.com/lathiat/avahi de7cde87, which
-is slated for avahi 0.6.32.
-
-Signed-off-by: Brad Mouring <brad.mouring@ni.com>
-Upstream-Status: Backport
-
----
- avahi-core/server.c | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/avahi-core/server.c b/avahi-core/server.c
-index e87f035..a2cb19a 100644
---- a/avahi-core/server.c
-+++ b/avahi-core/server.c
-@@ -587,7 +587,7 @@ static void handle_query_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInterfac
-         int unicast_response = 0;
- 
-         if (!(key = avahi_dns_packet_consume_key(p, &unicast_response))) {
--            avahi_log_warn(__FILE__": Packet too short or invalid while reading question key. (Maybe a UTF-8 problem?)");
-+            avahi_log_debug(__FILE__": Packet too short or invalid while reading question key. (Maybe a UTF-8 problem?)");
-             goto fail;
-         }
- 
-@@ -615,7 +615,7 @@ static void handle_query_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInterfac
-             int unique = 0;
- 
-             if (!(record = avahi_dns_packet_consume_record(p, &unique))) {
--                avahi_log_warn(__FILE__": Packet too short or invalid while reading known answer record. (Maybe a UTF-8 problem?)");
-+                avahi_log_debug(__FILE__": Packet too short or invalid while reading known answer record. (Maybe a UTF-8 problem?)");
-                 goto fail;
-             }
- 
-@@ -632,7 +632,7 @@ static void handle_query_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInterfac
-             int unique = 0;
- 
-             if (!(record = avahi_dns_packet_consume_record(p, &unique))) {
--                avahi_log_warn(__FILE__": Packet too short or invalid while reading probe record. (Maybe a UTF-8 problem?)");
-+                avahi_log_debug(__FILE__": Packet too short or invalid while reading probe record. (Maybe a UTF-8 problem?)");
-                 goto fail;
-             }
- 
-@@ -669,7 +669,7 @@ static void handle_response_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInter
-         int cache_flush = 0;
- 
-         if (!(record = avahi_dns_packet_consume_record(p, &cache_flush))) {
--            avahi_log_warn(__FILE__": Packet too short or invalid while reading response record. (Maybe a UTF-8 problem?)");
-+            avahi_log_debug(__FILE__": Packet too short or invalid while reading response record. (Maybe a UTF-8 problem?)");
-             break;
-         }
- 
-@@ -901,13 +901,13 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
- 
-     if (!(i = avahi_interface_monitor_get_interface(s->monitor, iface, src_address->proto)) ||
-         !i->announcing) {
--        avahi_log_warn("Received packet from invalid interface.");
-+        avahi_log_debug("Received packet from invalid interface.");
-         return;
-     }
- 
-     if (port <= 0) {
-         /* This fixes RHBZ #475394 */
--        avahi_log_warn("Received packet from invalid source port %u.", (unsigned) port);
-+        avahi_log_debug("Received packet from invalid source port %u.", (unsigned) port);
-         return;
-     }
- 
-@@ -924,7 +924,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
-         from_local_iface = originates_from_local_iface(s, iface, src_address, port);
- 
-     if (avahi_dns_packet_check_valid_multicast(p) < 0) {
--        avahi_log_warn("Received invalid packet.");
-+        avahi_log_debug("Received invalid packet.");
-         return;
-     }
- 
-@@ -940,7 +940,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
- 
-             if ((avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_ANCOUNT) != 0 ||
-                  avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_NSCOUNT) != 0)) {
--                avahi_log_warn("Invalid legacy unicast query packet.");
-+                avahi_log_debug("Invalid legacy unicast query packet.");
-                 return;
-             }
- 
-@@ -956,19 +956,19 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
-         char t[AVAHI_ADDRESS_STR_MAX];
- 
-         if (port != AVAHI_MDNS_PORT) {
--            avahi_log_warn("Received response from host %s with invalid source port %u on interface '%s.%i'", avahi_address_snprint(t, sizeof(t), src_address), port, i->hardware->name, i->protocol);
-+            avahi_log_debug("Received response from host %s with invalid source port %u on interface '%s.%i'", avahi_address_snprint(t, sizeof(t), src_address), port, i->hardware->name, i->protocol);
-             return;
-         }
- 
-         if (ttl != 255 && s->config.check_response_ttl) {
--            avahi_log_warn("Received response from host %s with invalid TTL %u on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), ttl, i->hardware->name, i->protocol);
-+            avahi_log_debug("Received response from host %s with invalid TTL %u on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), ttl, i->hardware->name, i->protocol);
-             return;
-         }
- 
-         if (!is_mdns_mcast_address(dst_address) &&
-             !avahi_interface_address_on_link(i, src_address)) {
- 
--            avahi_log_warn("Received non-local response from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
-+            avahi_log_debug("Received non-local response from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
-             return;
-         }
- 
-@@ -976,7 +976,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
-             avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_ANCOUNT) == 0 ||
-             avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_NSCOUNT) != 0) {
- 
--            avahi_log_warn("Invalid response packet from host %s.", avahi_address_snprint(t, sizeof(t), src_address));
-+            avahi_log_debug("Invalid response packet from host %s.", avahi_address_snprint(t, sizeof(t), src_address));
-             return;
-         }
- 
-@@ -992,12 +992,12 @@ static void dispatch_legacy_unicast_packet(AvahiServer *s, AvahiDnsPacket *p) {
-     assert(p);
- 
-     if (avahi_dns_packet_check_valid(p) < 0 || avahi_dns_packet_is_query(p)) {
--        avahi_log_warn("Received invalid packet.");
-+        avahi_log_debug("Received invalid packet.");
-         return;
-     }
- 
-     if (!(slot = find_slot(s, avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_ID)))) {
--        avahi_log_warn("Received legacy unicast response with unknown id");
-+        avahi_log_debug("Received legacy unicast response with unknown id");
-         return;
-     }
- 
--- 
-2.6.4
-
diff --git a/meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch b/meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch
deleted file mode 100644
index 7590df7..0000000
--- a/meta/recipes-connectivity/avahi/files/0001-avahi-fix-avahi-status-command-error-prompt.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f774ac25f436a782ccccc4dbe68378a684596799 Mon Sep 17 00:00:00 2001
-From: Lu Chong <Chong.Lu@windriver.com>
-Date: Thu, 7 Nov 2013 14:36:28 +0800
-Subject: [PATCH] avahi: fix avahi status command error prompt
-
-service --status-all command will display wrong status for avahi-daemon.
-This commit fix this error prompt and make service display right status
-for avahi-daemon.
-
-Upstream-Status: Pending
-
-Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
----
- initscript/debian/avahi-daemon.in |   14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/initscript/debian/avahi-daemon.in b/initscript/debian/avahi-daemon.in
-index 4793b46..49ec358 100755
---- a/initscript/debian/avahi-daemon.in
-+++ b/initscript/debian/avahi-daemon.in
-@@ -153,7 +153,15 @@ d_reload() {
- #       Function that check the status of the daemon/service.
- #
- d_status() {
--    $DAEMON -c && echo "$DESC is running" || echo "$DESC is not running"
-+    $DAEMON -c
-+    status=$?
-+    if [ $status = 0 ]; then
-+        echo "$DESC is running"
-+        return 0
-+    else
-+        echo "$DESC is not running"
-+        return 3
-+    fi
- }
- 
- case "$1" in
-@@ -182,9 +190,9 @@ case "$1" in
-         d_status
- 	;;
-     *)
--        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|reload}" >&2
-+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload|reload|status}" >&2
-         exit 1
-         ;;
- esac
- 
--exit 0
-+exit $?
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch b/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
deleted file mode 100644
index 32f20ec..0000000
--- a/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-
-Fixes this install issue
-#| /bin/sh: line 0: cd: /srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/avahi-0.6.31-r3.0/image//usr/bin: No such file or directory
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/03
-
-Index: avahi-0.6.31/avahi-utils/Makefile.am
-===================================================================
---- avahi-0.6.31.orig/avahi-utils/Makefile.am
-+++ avahi-0.6.31/avahi-utils/Makefile.am
-@@ -54,6 +54,7 @@ avahi_set_host_name_CFLAGS = $(AM_CFLAGS
- avahi_set_host_name_LDADD = $(AM_LDADD) ../avahi-client/libavahi-client.la ../avahi-common/libavahi-common.la
- 
- install-exec-local:
-+	$(MKDIR_P) $(DESTDIR)/$(bindir) && \
- 	cd $(DESTDIR)/$(bindir) && \
- 		rm -f avahi-resolve-host-name avahi-resolve-address avahi-browse-domains avahi-publish-address avahi-publish-service && \
- 		$(LN_S) avahi-resolve avahi-resolve-host-name && \
-Index: avahi-0.6.31/avahi-utils/Makefile.in
-===================================================================
---- avahi-0.6.31.orig/avahi-utils/Makefile.in
-+++ avahi-0.6.31/avahi-utils/Makefile.in
-@@ -906,6 +906,7 @@ uninstall-am: uninstall-binPROGRAMS
- 
- 
- @HAVE_DBUS_TRUE@install-exec-local:
-+@HAVE_DBUS_TRUE@	$(MKDIR_P) $(DESTDIR)/$(bindir) && \
- @HAVE_DBUS_TRUE@	cd $(DESTDIR)/$(bindir) && \
- @HAVE_DBUS_TRUE@		rm -f avahi-resolve-host-name avahi-resolve-address avahi-browse-domains avahi-publish-address avahi-publish-service && \
- @HAVE_DBUS_TRUE@		$(LN_S) avahi-resolve avahi-resolve-host-name && \
diff --git a/meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch b/meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
deleted file mode 100644
index 0fc4c29..0000000
--- a/meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-autoamke 1.12.x has depricated use of mkdir_p , and recommends use of MKDIR_P
-instead. Fixed the automake files accordingly to avoid warning-errors.
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/09
-
-
-Index: avahi-0.6.31/avahi-daemon/Makefile.am
-===================================================================
---- avahi-0.6.31.orig/avahi-daemon/Makefile.am
-+++ avahi-0.6.31/avahi-daemon/Makefile.am
-@@ -169,7 +169,7 @@ xmllint:
- 	done
- 
- install-data-local:
--	test -z "$(localstatedir)/run" || $(mkdir_p) "$(DESTDIR)$(localstatedir)/run"
-+	test -z "$(localstatedir)/run" || $(MKDIR_P) "$(DESTDIR)$(localstatedir)/run"
- 
- update-systemd:
- 	curl http://cgit.freedesktop.org/systemd/plain/src/sd-daemon.c > sd-daemon.c
-Index: avahi-0.6.31/avahi-autoipd/Makefile.am
-===================================================================
---- avahi-0.6.31.orig/avahi-autoipd/Makefile.am
-+++ avahi-0.6.31/avahi-autoipd/Makefile.am
-@@ -76,7 +76,7 @@ dhcliententerdir = $(sysconfdir)/dhcp/dh
- dhclientexitdir = $(sysconfdir)/dhcp/dhclient-exit-hooks.d
- 
- install-exec-hook: dhclient-exit-hook dhclient-enter-hook
--	$(mkdir_p) $(DESTDIR)$(dhcliententerdir) $(DESTDIR)$(dhclientexitdir)
-+	$(MKDIR_P) $(DESTDIR)$(dhcliententerdir) $(DESTDIR)$(dhclientexitdir)
- 	$(INSTALL) dhclient-enter-hook $(DESTDIR)$(dhcliententerdir)/avahi-autoipd
- 	$(INSTALL) dhclient-exit-hook $(DESTDIR)$(dhclientexitdir)/avahi-autoipd
- 
diff --git a/meta/recipes-connectivity/avahi/files/out-of-tree.patch b/meta/recipes-connectivity/avahi/files/out-of-tree.patch
deleted file mode 100644
index 43476cd..0000000
--- a/meta/recipes-connectivity/avahi/files/out-of-tree.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From a62dc95d75691ea4aefa86d8bbe54c62afd78ff6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 17 Sep 2013 12:27:36 +0100
-Subject: [PATCH] build-sys: fix out-of-tree builds without xmltoman
-
-If manpages are enabled but xmltoman isn't present, out-of-tree builds fail
-because it checks inside the build directory for the pre-generated manpages.
-
-Fix this by using $srcdir when looking for files inside the source directory.
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9debce2..047c7ae 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1021,7 +1021,7 @@ if test x$manpages = xyes ; then
-     fi
- 
-     if test x$have_xmltoman = xno -o x$xmltoman = xno; then
--        if ! test -e man/avahi-daemon.8 ; then
-+        if ! test -e $srcdir/man/avahi-daemon.8 ; then
-             AC_MSG_ERROR([*** xmltoman was not found or was disabled, it is required to build the manpages as they have not been pre-built, install xmltoman, pass --disable-manpages or dont pass --disable-xmltoman])
-             exit 1
-         fi
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/avahi/files/reuseport-check.patch b/meta/recipes-connectivity/avahi/files/reuseport-check.patch
deleted file mode 100644
index bb81c2c..0000000
--- a/meta/recipes-connectivity/avahi/files/reuseport-check.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix avahi-daemon when running on kernel < 3.9 (patch taken from Ubuntu).
-
-Upstream-Status: Pending (unmaintained upstream)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Description: SO_REUSEPORT may not exist in running kernel
- When userspace defines SO_REUSEPORT we will attempt to enable socket
- port number reuse.  However if the running kernel does not support
- this call it will fail preventing daemon startup.  If this call is
- present but fails ENOPROTOOPT then we know that actually the kernel
- does not support it and we should continue as if we did not have the
- call at all.  (LP: #1228204)
- .
- This patch could be removed from the debian package after jessie release.
-Author: Andy Whitcroft <apw@canonical.com>
-
-Index: avahi-0.6.31/avahi-core/socket.c
-===================================================================
---- avahi-0.6.31.orig/avahi-core/socket.c	2013-09-20 16:36:50.000000000 +0100
-+++ avahi-0.6.31/avahi-core/socket.c	2013-09-20 16:38:23.781863644 +0100
-@@ -177,7 +177,8 @@
-     yes = 1;
-     if (setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &yes, sizeof(yes)) < 0) {
-         avahi_log_warn("SO_REUSEPORT failed: %s", strerror(errno));
--        return -1;
-+        if (errno != ENOPROTOOPT)
-+            return -1;
-     }
- #endif
- 
-- 
2.4.0


