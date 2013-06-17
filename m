Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34D2B6A9B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:49:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5H5nd1N007971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 22:49:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 16 Jun 2013 22:49:37 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 13:49:30 +0800
Message-ID: <f98bc9b27eabf194c2652719f6abd37fe3b9d015.1371447869.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371447869.git.Qi.Chen@windriver.com>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 4/9] busybox: enable to list suid and non-suid app configs
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
X-List-Received-Date: Mon, 17 Jun 2013 05:49:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patch, written by Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
adds the ability to busybox to list configuration items of suid apps
and non-suid apps separately.

`make busybox.cfg.suid' generates a file containing config items of the
suid apps.

'make busybox.cfg.nosuid' generates a file containing config items of
the non-suid apps.

This patch helps to separate busybox into two binaries, the suid one and
the non-suid one.

[YOCTO #4207]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...usybox-list-suid-and-non-suid-app-configs.patch |  179 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    3 +-
 2 files changed, 181 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-list-suid-and-non-suid-app-configs.patch

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-list-suid-and-non-suid-app-configs.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-list-suid-and-non-suid-app-configs.patch
new file mode 100644
index 0000000..753a044
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-list-suid-and-non-suid-app-configs.patch
@@ -0,0 +1,179 @@
+Make busybox have the ability to list configuration items regarding suid
+apps and non-suid apps separately.
+
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Mon, 17 Jun 2013 11:06:05 +0800
+Subject: [PATCH V2] busybox: list suid and non-suid app configs
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ Makefile.custom            |    4 ++++
+ applets/busybox.mksuid     |   53 ++++++++++++++++++++++++++++++++++++++++++++
+ include/applets.src.h      |    9 +++++++-
+ scripts/kconfig/confdata.c |   24 ++++++++++++++++----
+ 4 files changed, 85 insertions(+), 5 deletions(-)
+ create mode 100644 applets/busybox.mksuid
+
+diff --git a/Makefile.custom b/Makefile.custom
+index 6da79e6..a276d6f 100644
+--- a/Makefile.custom
++++ b/Makefile.custom
+@@ -4,6 +4,10 @@
+ 
+ busybox.links: $(srctree)/applets/busybox.mkll $(objtree)/include/autoconf.h include/applets.h
+ 	$(Q)-$(SHELL) $^ >$@
++busybox.cfg.suid: $(srctree)/applets/busybox.mksuid $(objtree)/include/autoconf.h include/applets.h
++	$(Q)-SUID="yes" $(SHELL) $^ > $@
++busybox.cfg.nosuid: $(srctree)/applets/busybox.mksuid $(objtree)/include/autoconf.h include/applets.h
++	$(Q)-SUID="DROP" $(SHELL) $^ > $@
+ 
+ .PHONY: install
+ ifeq ($(CONFIG_INSTALL_APPLET_SYMLINKS),y)
+diff --git a/applets/busybox.mksuid b/applets/busybox.mksuid
+new file mode 100644
+index 0000000..e11a7a1
+--- /dev/null
++++ b/applets/busybox.mksuid
+@@ -0,0 +1,53 @@
++#!/bin/sh
++# Make list of configuration variables regarding suid handling
++
++# input $1: full path to autoconf.h
++# input $2: full path to applets.h
++# input $3: full path to .config
++# output (stdout): list of CONFIG_ that do or may require suid
++
++# If the environment variable SUID is not set or set to DROP,
++# lists all config options that do not require suid permissions.
++# Otherwise, lists all config options for applets that DO or MAY require
++# suid permissions.
++
++# Maintainer: Bernhard Reutner-Fischer
++
++export LC_ALL=POSIX
++export LC_CTYPE=POSIX
++
++CONFIG_H=${1:-include/autoconf.h}
++APPLETS_H=${2:-include/applets.h}
++DOT_CONFIG=${3:-.config}
++
++case ${SUID:-DROP} in
++    [dD][rR][oO][pP]) USE="DROP" ;;
++    *) USE="suid" ;;
++esac
++
++$HOSTCC -E -DMAKE_SUID -include $CONFIG_H $APPLETS_H |
++  awk -v USE=${USE} '
++    /^SUID[ \t]/{
++      if (USE == "DROP") {
++        if ($2 != "BB_SUID_DROP") next
++      } else {
++        if ($2 == "BB_SUID_DROP") next
++      }
++      cfg = $NF
++      gsub("\"", "", cfg)
++      cfg = substr(cfg, 8)
++      s[i++] = "CONFIG_" cfg
++      s[i++] = "CONFIG_FEATURE_" cfg "_.*"
++    }
++    END{
++      while (getline < ARGV[2]) {
++        for (j in s) {
++          if ($0 ~ "^" s[j] "=y$") {
++            sub(/=.*/, "")
++            print
++            if (s[j] !~ /\*$/) delete s[j] # can drop this applet now
++          }
++        }
++      }
++    }
++' - $DOT_CONFIG
+diff --git a/include/applets.src.h b/include/applets.src.h
+index 02b995b..8386c84 100644
+--- a/include/applets.src.h
++++ b/include/applets.src.h
+@@ -52,6 +52,12 @@ s     - suid type:
+ # define APPLET_NOEXEC(name,main,l,s,name2)  LINK l name
+ # define APPLET_NOFORK(name,main,l,s,name2)  LINK l name
+ 
++#elif defined(MAKE_SUID)
++# define APPLET(name,l,s)                    SUID s l name
++# define APPLET_ODDNAME(name,main,l,s,name2) SUID s l name
++# define APPLET_NOEXEC(name,main,l,s,name2)  SUID s l name
++# define APPLET_NOFORK(name,main,l,s,name2)  SUID s l name
++
+ #else
+   static struct bb_applet applets[] = { /*    name, main, location, need_suid */
+ # define APPLET(name,l,s)                    { #name, #name, l, s },
+@@ -414,7 +420,8 @@ IF_YES(APPLET_NOFORK(yes, yes, BB_DIR_USR_BIN, BB_SUID_DROP, yes))
+ IF_GUNZIP(APPLET_ODDNAME(zcat, gunzip, BB_DIR_BIN, BB_SUID_DROP, zcat))
+ IF_ZCIP(APPLET(zcip, BB_DIR_SBIN, BB_SUID_DROP))
+ 
+-#if !defined(PROTOTYPES) && !defined(NAME_MAIN_CNAME) && !defined(MAKE_USAGE)
++#if !defined(PROTOTYPES) && !defined(NAME_MAIN_CNAME) && !defined(MAKE_USAGE) \
++    && !defined(MAKE_LINKS) && !defined(MAKE_SUID)
+ };
+ #endif
+ 
+diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
+index bd2d70e..303df0b 100644
+--- a/scripts/kconfig/confdata.c
++++ b/scripts/kconfig/confdata.c
+@@ -474,7 +474,11 @@ int conf_write(const char *name)
+ 						fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
+ 						/* bbox */
+ 						fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
+-						fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
++						fprintf(out_h, "#ifdef MAKE_SUID\n");
++						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
++						fprintf(out_h, "#else\n");
++						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
++						fprintf(out_h, "#endif\n");
+ 						fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
+ 					}
+ 					break;
+@@ -506,7 +510,11 @@ int conf_write(const char *name)
+ 					fputs("\"\n", out_h);
+ 					/* bbox */
+ 					fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
+-					fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
++					fprintf(out_h, "#ifdef MAKE_SUID\n");
++					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
++					fprintf(out_h, "#else\n");
++					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
++					fprintf(out_h, "#endif\n");
+ 					fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
+ 				}
+ 				break;
+@@ -518,7 +526,11 @@ int conf_write(const char *name)
+ 						fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
+ 						/* bbox */
+ 						fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
+-						fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
++						fprintf(out_h, "#ifdef MAKE_SUID\n");
++						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
++						fprintf(out_h, "#else\n");
++						fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
++						fprintf(out_h, "#endif\n");
+ 						fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
+ 					}
+ 					break;
+@@ -532,7 +544,11 @@ int conf_write(const char *name)
+ 					fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
+ 					/* bbox */
+ 					fprintf(out_h, "#define ENABLE_%s 1\n", sym->name);
+-					fprintf(out_h, "#define IF_%s(...) __VA_ARGS__\n", sym->name);
++					fprintf(out_h, "#ifdef MAKE_SUID\n");
++					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__ \"CONFIG_%s\"\n", sym->name, sym->name);
++					fprintf(out_h, "#else\n");
++					fprintf(out_h, "# define IF_%s(...) __VA_ARGS__\n", sym->name);
++					fprintf(out_h, "#endif\n");
+ 					fprintf(out_h, "#define IF_NOT_%s(...)\n", sym->name);
+ 				}
+ 				break;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 3ff8a88..a2e762d 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -36,7 +36,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-sulogin-empty-root-password.patch \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg"
+           file://login-utilities.cfg \
+           file://busybox-list-suid-and-non-suid-app-configs.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
-- 
1.7.9.5


