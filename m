Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id C5D976A9BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 20:26:11 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so3937910eek.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ffA41Ynkvu6L7mKp39a10MeO4StVsxt+MwmnkQkOv/U=;
	b=KivpjXYMh+d3HE4cxO64ctsU7oExpx0IiIxnAXXNO2xAgpims+OJe9ZoF+GTcw1mCd
	r1bDP0RJ8U5jgUkXufr1arF/aW6vMXIX9/FN1np14wRvwqu+RcL4/FrTQ82oEXwhRnCJ
	StsCCFQkiHYnEggptGDD/LFr/tSMZRTGb0AQ8kwKWMpvubOUHV2nwy0OUaOK3OCbePRQ
	cpZvz44XruVPDIIBKk+Xlg3w2/ft2ReaQtbQg1dO8jzJih1m0j5PH2tMQPKuZqspxg1B
	9PrbOTK9dRkIRcP+Bw/1Anwk8QzAxM9C5encQCe8YcO4fN0wCqqCKA5dpP6huIXoF0Ww
	GM3Q==
X-Received: by 10.14.1.136 with SMTP id 8mr15995643eed.106.1370982370871;
	Tue, 11 Jun 2013 13:26:10 -0700 (PDT)
Received: from s42.loc (91-119-112-246.dynamic.xdsl-line.inode.at.
	[91.119.112.246])
	by mx.google.com with ESMTPSA id y2sm32660025eeu.2.2013.06.11.13.26.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 13:26:10 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1UmV8q-0005qz-DZ; Tue, 11 Jun 2013 22:26:08 +0200
Date: Tue, 11 Jun 2013 22:26:08 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130611202607.GA22231@mx.loc>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<1760eefec11e9a25b4fb20375105c64c82b82227.1370585547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1760eefec11e9a25b4fb20375105c64c82b82227.1370585547.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: qingtao.cao@windriver.com, Denys Vlasenko <vda.linux@googlemail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] busybox: add the ability to split the busybox binary
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
X-List-Received-Date: Tue, 11 Jun 2013 20:26:12 -0000
X-Groupsio-MsgNum: 40499
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2013 at 02:13:58PM +0800, Qi.Chen@windriver.com wrote:
>From: Chen Qi <Qi.Chen@windriver.com>
>
>This patch enables us to split the busybox into two binaries, one
>containing suid applications, and the other containing nosuid apps.
>
>Add a variable, BUSYBOX_SPLIT_SUID, to control whether to split the
>busybox binary into two parts. We default it to "1" to enable the
>splitting, but users could still override it to disable the splitting.
>After all, busybox has no internal support for this suid apps splitting,
>so there might be users out there who want just one busybox binary.
>
>Add a configuration file, suid_config_list, to control which applications
>should be splitted into the suid binary. The list is first obtained from
>the information in include/applets.h. Some extra config items are also
>added to the list as they are related to the suid apps. I choose to use
>a configuration file here because if some config item is missed, we could
>add it to the list easily.
>
>[YOCTO #4207]
>
>Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>---
> .../busybox/busybox-1.20.2/suid_config_list        |   48 +++++++++
> meta/recipes-core/busybox/busybox.inc              |  104 +++++++++++++++-----
> meta/recipes-core/busybox/busybox_1.20.2.bb        |    3 +-
> 3 files changed, 127 insertions(+), 28 deletions(-)
> create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/suid_config_list
>
>diff --git a/meta/recipes-core/busybox/busybox-1.20.2/suid_config_list b/meta/recipes-core/busybox/busybox-1.20.2/suid_config_list
>new file mode 100644
>index 0000000..16a0b76
>--- /dev/null
>+++ b/meta/recipes-core/busybox/busybox-1.20.2/suid_config_list
>@@ -0,0 +1,48 @@
>+# This file lists all config items which are related to suid apps in busybox.
>+# The following list is obtained with the command below (splitted into two lines for readability).
>+# for i in `grep -E "APPLET.*BB_SUID_((MAYBE|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP |
>+# cut -f 3 -d '(' | cut -f 1 -d ','`; do grep -i -E "config_(feature_|)$i(_| )" .config; done | cut -d' ' -f2
>+CONFIG_PING
>+CONFIG_PING6
>+CONFIG_CRONTAB
>+CONFIG_FINDFS
>+CONFIG_LOGIN
>+CONFIG_LOGIN_SESSION_AS_CHILD
>+CONFIG_LOGIN_SCRIPTS
>+CONFIG_MOUNT
>+CONFIG_FEATURE_MOUNT_FAKE
>+CONFIG_FEATURE_MOUNT_VERBOSE
>+CONFIG_FEATURE_MOUNT_HELPERS
>+CONFIG_FEATURE_MOUNT_LABEL
>+CONFIG_FEATURE_MOUNT_NFS
>+CONFIG_FEATURE_MOUNT_CIFS
>+CONFIG_FEATURE_MOUNT_FLAGS
>+CONFIG_FEATURE_MOUNT_FSTAB
>+CONFIG_FEATURE_MOUNT_LOOP
>+CONFIG_FEATURE_MOUNT_LOOP_CREATE
>+CONFIG_PASSWD
>+CONFIG_FEATURE_PASSWD_WEAK_CHECK
>+CONFIG_SU
>+CONFIG_FEATURE_SU_SYSLOG
>+CONFIG_FEATURE_SU_CHECKS_SHELLS
>+CONFIG_TRACEROUTE
>+CONFIG_FEATURE_TRACEROUTE_VERBOSE
>+CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE
>+CONFIG_FEATURE_TRACEROUTE_USE_ICMP
>+CONFIG_TRACEROUTE6
>+CONFIG_VLOCK
>+CONFIG_WALL
>+
>+# The following list is obtained by examining the Config.in file in busybox manually.
>+# These config items are also related to suid apps.
>+CONFIG_FEATURE_FANCY_PING
>+CONFIG_FEATURE_SHADOWPASSWDS
>+CONFIG_USE_BB_PWD_GRP
>+CONFIG_USE_BB_SHADOW
>+CONFIG_USE_BB_CRYPT
>+CONFIG_USE_BB_CRYPT_SHA
>+CONFIG_PAM
>+CONFIG_FEATURE_NOLOGIN
>+CONFIG_FEATURE_SECURETTY
>+CONFIG_CRYPTPW
>+CONFIG_CHPASSWD
>diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>index 99d4e99..9984c5a 100644
>--- a/meta/recipes-core/busybox/busybox.inc
>+++ b/meta/recipes-core/busybox/busybox.inc
>@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
> 
> SECTION = "base"
> 
>+# Whether to split the suid apps into a seperate binary
>+BUSYBOX_SPLIT_SUID ?= "1"
>+
> export EXTRA_CFLAGS = "${CFLAGS}"
> export EXTRA_LDFLAGS = "${LDFLAGS}"
> 
>@@ -136,19 +139,52 @@ do_configure () {
> 
> do_compile() {
> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>-	oe_runmake busybox_unstripped
>-	cp busybox_unstripped busybox
>+	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
>+	# split the .config into two parts, and make two busybox binaries

cat .config > .config-oe-full
# it would be nice to 'for s in suid nosuid'
# but that would mean operating on ${s}_config_list which bitbake (IIRC)
# ruins. Better rename the files to config_list.suid to be able to loop.
#
for s in suid nosuid; do
  egrep ^CONFIG_ ${WORKDIR}/config_list.$s | while read i; do
    grep -w "$i" .config
  done > .config.$s

  # populate the config, default everything else to no
  KCONFIG_ALLCONFIG=config.$s make allnoconfig
  oe_runmake busybox_unstripped busybox.links
  mv busybox_unstripped busybox.$s
  mv busybox.links busybox.links.$s
done
cat .config-oe-full > .config

I would much prefer to make the generation of the suid cfg stuff more
robust. Could you live with the attached helper thing (untested)?
That would make it a prepended oe_runmake busybox.applets.suid to
generate the list busybox.applets.suid. If that suits your needs we can
apply it to busybox for general use..
The other possibility is, obviously, to fit all this in busybox' build
itself, but given that we do have a seemingly working, bugless suid
handling this might be better suited to be dealt with by the user as you
suggest here.

Thoughts?
thanks,
>+		cp .config .config.orig
>+		oe_runmake allnoconfig
>+		cp .config .config.allno
>+		for item in `grep 'CONFIG_' ${WORKDIR}/suid_config_list`; do
>+			echo "# $item is not set" >> .config.nosuid.tmp
>+			grep -w "$item" .config.orig >> .config.suid.tmp
>+		done
>+		merge_config.sh -m .config.orig .config.nosuid.tmp
>+		cp .config .config.nosuid
>+		merge_config.sh -m .config.allno .config.suid.tmp
>+		cp .config .config.suid
>+
>+		# compile with no suid apps
>+		cp .config.nosuid .config
>+		oe_runmake busybox_unstripped
>+		cp busybox_unstripped busybox.nosuid
>+		oe_runmake busybox.links
>+		cp busybox.links busybox.links.nosuid
>+
>+		# compile with suid apps
>+		cp .config.suid .config
>+		oe_runmake busybox_unstripped
>+		cp busybox_unstripped busybox.suid
>+		oe_runmake busybox.links
>+		cp busybox.links busybox.links.suid
>+
>+		# copy .config.orig back to .config, because the install process may check this file
>+		cp .config.orig .config
>+
>+		# cleanup
>+		rm .config.orig .config.nosuid.tmp .config.allno .config.suid.tmp .config.nosuid .config.suid
>+	else
>+		oe_runmake busybox_unstripped
>+		cp busybox_unstripped busybox
>+		oe_runmake busybox.links
>+	fi
> }
> 
> do_install () {
>-	oe_runmake busybox.links
> 	if [ "${prefix}" != "/usr" ]; then
>-		sed "s:^/usr/:${prefix}/:" busybox.links > busybox.links.new
>-		mv busybox.links.new busybox.links
>+		sed -i "s:^/usr/:${prefix}/:" busybox.links*
> 	fi
> 	if [ "${base_sbindir}" != "/sbin" ]; then
>-		sed "s:^/sbin/:${base_sbindir}/:" busybox.links > busybox.links.new
>-		mv busybox.links.new busybox.links
>+		sed "s:^/sbin/:${base_sbindir}/:" busybox.links*
> 	fi
> 
> 	install -d ${D}${sysconfdir}/init.d
>@@ -157,12 +193,21 @@ do_install () {
> 		# Install /bin/busybox, and the /bin/sh link so the postinst script
> 		# can run. Let update-alternatives handle the rest.
> 		install -d ${D}${base_bindir}
>-		if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
>-			install -m 4755 ${B}/busybox ${D}${base_bindir}
>+		if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
>+			install -m 4755 ${B}/busybox.suid ${D}${base_bindir}
>+			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
>+			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
>+			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
>+			ln -sf busybox.nosuid ${D}${base_bindir}/sh
> 		else
>-			install -m 0755 ${B}/busybox ${D}${base_bindir}
>+			if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
>+				install -m 4755 ${B}/busybox ${D}${base_bindir}
>+			else
>+				install -m 0755 ${B}/busybox ${D}${base_bindir}
>+			fi
>+			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>+			ln -sf busybox ${D}${base_bindir}/sh
> 		fi
>-		ln -sf busybox ${D}${base_bindir}/sh
> 	else
> 		install -d ${D}${base_bindir} ${D}${base_sbindir}
> 		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
>@@ -181,6 +226,7 @@ do_install () {
> 		if [ -f ${D}/linuxrc.${BPN} ]; then
> 			mv ${D}/linuxrc.${BPN} ${D}/linuxrc
> 		fi
>+		install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
> 	fi
> 
> 	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
>@@ -217,7 +263,6 @@ do_install () {
>                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
>                fi
> 	fi
>-	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
> 
>     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>         install -d ${D}${systemd_unitdir}/system
>@@ -248,22 +293,27 @@ python do_package_prepend () {
> 
>     dvar = d.getVar('D', True)
>     pn = d.getVar('PN', True)
>-    f = open('%s/etc/busybox.links' % (dvar), 'r')
>-
>-    if os.path.exists('%s/bin/busybox' % (dvar)):
>-        d.setVar('ALTERNATIVE_TARGET', "/bin/busybox")
>-
>-    for alt_link_name in f:
>-        alt_link_name = alt_link_name.strip()
>-        alt_name = os.path.basename(alt_link_name)
>-
>-        # Match coreutils
>-        if alt_name == '[':
>-            alt_name = 'lbracket'
> 
>-        d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
>-        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
>-    f.close()
>+    def set_alternative_vars(links, target):
>+        f = open('%s%s' % (dvar, links), 'r')
>+        for alt_link_name in f:
>+            alt_link_name = alt_link_name.strip()
>+            alt_name = os.path.basename(alt_link_name)
>+            # Match coreutils
>+            if alt_name == '[':
>+                alt_name = 'lbracket'
>+            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
>+            d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
>+            if os.path.exists('%s%s' % (dvar, target)):
>+                d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
>+        f.close()
>+        return
>+
>+    if os.path.exists('%s/etc/busybox.links' % (dvar)):
>+        set_alternative_vars("/etc/busybox.links", "/bin/busybox")
>+    else:
>+        set_alternative_vars("/etc/busybox.links.nosuid", "/bin/busybox.nosuid")
>+        set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.suid")
> }
> 
> pkg_prerm_${PN} () {
>diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
>index 3ff8a88..511f1f8 100644
>--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
>+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
>@@ -36,7 +36,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>            file://busybox-sulogin-empty-root-password.patch \
>            file://inetd.conf \
>            file://inetd \
>-           file://login-utilities.cfg"
>+           file://login-utilities.cfg \
>+           file://suid_config_list"
> 
> SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
> SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
>-- 
>1.7.9.5
>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core

--EeQfGwPcQSOJBaQU
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-buildsys-Add-helper-to-list-suid-applets.patch"

From f2fd4b0cd08860c1e81f03516faef2b489b2a794 Mon Sep 17 00:00:00 2001
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 11 Jun 2013 22:08:22 +0200
Subject: [PATCH] buildsys: Add helper to list suid applets

Add a helper script that lists all applets that do NOT drop suid
privileges.

Some setups prefer to build two busybox binaries, one that is suid which
contains all applets that do or may require suid privileges, and a
second one for all the rest (which drops suid). To ease splitting these
two binaries, generate a list of CONFIG_ items for the suid binary.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 Makefile.custom            |    5 ++++-
 applets/busybox.mksuid     |   39 +++++++++++++++++++++++++++++++++++++++
 include/applets.src.h      |    9 ++++++++-
 scripts/kconfig/confdata.c |   24 ++++++++++++++++++++----
 4 files changed, 71 insertions(+), 6 deletions(-)
 create mode 100755 applets/busybox.mksuid

diff --git a/Makefile.custom b/Makefile.custom
index 6da79e6..41c351f 100644
--- a/Makefile.custom
+++ b/Makefile.custom
@@ -3,7 +3,10 @@
 # ==========================================================================
 
 busybox.links: $(srctree)/applets/busybox.mkll $(objtree)/include/autoconf.h include/applets.h
-	$(Q)-$(SHELL) $^ >$@
+	$(Q)-$(SHELL) $^ > $@
+
+busybox.applets.suid: $(srctree)/applets/busybox.mksuid $(objtree)/include/autoconf.h include/applets.h
+	$(Q)-$(SHELL) $^ > $@
 
 .PHONY: install
 ifeq ($(CONFIG_INSTALL_APPLET_SYMLINKS),y)
diff --git a/applets/busybox.mksuid b/applets/busybox.mksuid
new file mode 100755
index 0000000..4235d89
--- /dev/null
+++ b/applets/busybox.mksuid
@@ -0,0 +1,39 @@
+#!/bin/sh
+# Make busybox list of applets that do NOT drop suid permissions
+
+# input $1: full path to autoconf.h
+# input $2: full path to applets.h
+# input $3: full path to .config
+# output (stdout): list of CONFIG_ that do or may require suid
+
+# Maintainer: Bernhard Reutner-Fischer
+
+export LC_ALL=POSIX
+export LC_CTYPE=POSIX
+
+CONFIG_H=${1:-include/autoconf.h}
+APPLETS_H=${2:-include/applets.h}
+DOT_CONFIG=${3:-.config}
+$HOSTCC -E -DMAKE_SUID -include $CONFIG_H $APPLETS_H |
+  awk '
+    /^SUID[ \t]/{
+      if ($2 == "BB_SUID_DROP") next
+      cfg = $NF
+      gsub("\"", "", cfg)
+      cfg = substr(cfg, 8)
+      s[i++] = "CONFIG_" cfg
+      s[i++] = "CONFIG_FEATURE_" cfg "_.*"
+    }
+    END{
+      while (getline < ARGV[2]) {
+        for (j in s) {
+          if ($0 ~ "^" s[j] "=y$") {
+            sub(/=.*/, "")
+            print
+            if (s[j] !~ /\*$/) delete s[j] # can drop this applet now
+          }
+        }
+      }
+    }
+' - $DOT_CONFIG
+
diff --git a/include/applets.src.h b/include/applets.src.h
index 00172b1..aa319bb 100644
--- a/include/applets.src.h
+++ b/include/applets.src.h
@@ -52,6 +52,12 @@ s     - suid type:
 # define APPLET_NOEXEC(name,main,l,s,name2)  LINK l name
 # define APPLET_NOFORK(name,main,l,s,name2)  LINK l name
 
+#elif defined(MAKE_SUID)
+# define APPLET(name,l,s)                    SUID s l name
+# define APPLET_ODDNAME(name,main,l,s,name2) SUID s l name
+# define APPLET_NOEXEC(name,main,l,s,name2)  SUID s l name
+# define APPLET_NOFORK(name,main,l,s,name2)  SUID s l name
+
 #else
   static struct bb_applet applets[] = { /*    name, main, location, need_suid */
 # define APPLET(name,l,s)                    { #name, #name, l, s },
@@ -415,7 +421,8 @@ IF_YES(APPLET_NOFORK(yes, yes, BB_DIR_USR_BIN, BB_SUID_DROP, yes))
 IF_GUNZIP(APPLET_ODDNAME(zcat, gunzip, BB_DIR_BIN, BB_SUID_DROP, zcat))
 IF_ZCIP(APPLET(zcip, BB_DIR_SBIN, BB_SUID_DROP))
 
-#if !defined(PROTOTYPES) && !defined(NAME_MAIN_CNAME) && !defined(MAKE_USAGE)
+#if !defined(PROTOTYPES) && !defined(NAME_MAIN_CNAME) && !defined(MAKE_USAGE) \
+	&& !defined(MAKE_LINKS) && !defined(MAKE_SUID)
 };
 #endif
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index bd2d70e..303df0b 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -474,7 +474,11 @@ int conf_write(const char *name)
 						fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
 						/* bbox */
 						fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
-						fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
+						fprintf(out_h, "#ifdef MAKE_SUID\n");
+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
+						fprintf(out_h, "#else\n");
+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
+						fprintf(out_h, "#endif\n");
 						fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
 					}
 					break;
@@ -506,7 +510,11 @@ int conf_write(const char *name)
 					fputs("\"\n", out_h);
 					/* bbox */
 					fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
-					fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
+					fprintf(out_h, "#ifdef MAKE_SUID\n");
+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
+					fprintf(out_h, "#else\n");
+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
+					fprintf(out_h, "#endif\n");
 					fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
 				}
 				break;
@@ -518,7 +526,11 @@ int conf_write(const char *name)
 						fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
 						/* bbox */
 						fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
-						fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
+						fprintf(out_h, "#ifdef MAKE_SUID\n");
+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
+						fprintf(out_h, "#else\n");
+						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
+						fprintf(out_h, "#endif\n");
 						fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
 					}
 					break;
@@ -532,7 +544,11 @@ int conf_write(const char *name)
 					fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
 					/* bbox */
 					fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
-					fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
+					fprintf(out_h, "#ifdef MAKE_SUID\n");
+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
+					fprintf(out_h, "#else\n");
+					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
+					fprintf(out_h, "#endif\n");
 					fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
 				}
 				break;
-- 
1.7.10.4


--EeQfGwPcQSOJBaQU--
