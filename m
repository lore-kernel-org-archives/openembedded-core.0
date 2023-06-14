Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72F7C001B1
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.7342.1686734966837049221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hC88K4Ri;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9827bd8e0afso31437066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734965; x=1689326965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lJif0+XMhaB2vI5QrfxL0ZmQ5H3yC41E65c+7TH4As=;
        b=hC88K4RiHmgnKytqEhQZLEjhSAaIBdxCXOHizBYB47LJ6+TM21M5S8X24dVPMjQVcv
         GcpfNmXM1kZt9smbMutB2yQeT7UEO5rPMax6Pi20Be9ky2eI/kA++6CjvcXrApxAKWn5
         1f1gZbizAoPd/iP0B+GF8PMFWLYZ6dXJ96zEOJ7Wy4dRGl7RVZZWAFNwJEYSC3pgCM6T
         6/3HOKVQNlpAXwpV0tn/VU5DSnWOF93wu0sztr8kogz1SWSUMo5P5YnySewwm6r0mP+c
         +cN8W+AHYUJRCE1ql5WJlYJPFQkyHjdScDk3Kx4qPyK+BJkfxQIow+i9uxFI2ojoAU+c
         X/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734965; x=1689326965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lJif0+XMhaB2vI5QrfxL0ZmQ5H3yC41E65c+7TH4As=;
        b=hByzH8oj5jJSb3LfuRlGwH/apvgJOYtXYjS7CLKgxhFneJD1nt4dQHOWPT0AS0XTzL
         G3MZTALTaE/zlK4c3jnlv0W0Fp/NLtGpZbeIQq9/SIQSR8e8Rpsmjxm30wWCPNZPLLrS
         s9JDArxHHz0TlJbDDk137IR6D80RkHE3qC1h6IAMDoAe9BeA5Y5/j/THWnfXuyaSMJMW
         uMFEvjhNfHlm++xAA/wJM6uMFdU2rnQgPJcfaa9N4ePcSNBlyvtfsKMg9msYv6W21/m3
         wtzDqlvQOfU3NK8dmH7uKtG6CMJH6SsiF1FdP6H4Vgn0LAgxjS46xzKYfJcqRUB9bSAr
         RhYA==
X-Gm-Message-State: AC+VfDwYGRmthzhZM/hVqGPGG9ClqZbBUi2WdQREa+lS5M6rjtfShPSV
	eVKVXRWr43DS1eyFwPKg7yMtp9BsyTI=
X-Google-Smtp-Source: ACHHUZ6c7PQZGhC53sd8LwjCbfck9edIjZz3NeOWsdkX65fUy4t+t5Bb7e51R1gH8CxsElJqRTVo5A==
X-Received: by 2002:a17:907:e93:b0:97e:32f:3b54 with SMTP id ho19-20020a1709070e9300b0097e032f3b54mr13372986ejc.19.1686734964991;
        Wed, 14 Jun 2023 02:29:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/55] apmd: remove recipe and apm MACHINE_FEATURE
Date: Wed, 14 Jun 2023 11:28:26 +0200
Message-Id: <20230614092918.4065570-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182748

APM has been obsolete for a very long time, and debian no longer
packages it or carries the source tarball.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../conf/distro/include/default-providers.inc |   1 -
 meta/conf/distro/include/maintainers.inc      |   1 -
 meta/recipes-bsp/apmd/apmd/apmd.service       |   7 -
 meta/recipes-bsp/apmd/apmd/apmd_proxy         |  91 ------------
 meta/recipes-bsp/apmd/apmd/apmd_proxy.conf    |  16 ---
 meta/recipes-bsp/apmd/apmd/default            |   8 --
 meta/recipes-bsp/apmd/apmd/init               |  51 -------
 meta/recipes-bsp/apmd/apmd/legacy.patch       | 133 ------------------
 meta/recipes-bsp/apmd/apmd/libtool.patch      |  41 ------
 meta/recipes-bsp/apmd/apmd/linkage.patch      |  53 -------
 meta/recipes-bsp/apmd/apmd/unlinux.patch      |  25 ----
 meta/recipes-bsp/apmd/apmd/wexitcode.patch    |  26 ----
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb        |  85 -----------
 .../packagegroups/packagegroup-base.bb        |   7 -
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb |   2 -
 .../matchbox-session-sato/session             |   1 -
 .../matchbox-session-sato_0.1.bb              |   2 +-
 17 files changed, 1 insertion(+), 549 deletions(-)
 delete mode 100644 meta/recipes-bsp/apmd/apmd/apmd.service
 delete mode 100644 meta/recipes-bsp/apmd/apmd/apmd_proxy
 delete mode 100644 meta/recipes-bsp/apmd/apmd/apmd_proxy.conf
 delete mode 100644 meta/recipes-bsp/apmd/apmd/default
 delete mode 100755 meta/recipes-bsp/apmd/apmd/init
 delete mode 100644 meta/recipes-bsp/apmd/apmd/legacy.patch
 delete mode 100644 meta/recipes-bsp/apmd/apmd/libtool.patch
 delete mode 100644 meta/recipes-bsp/apmd/apmd/linkage.patch
 delete mode 100644 meta/recipes-bsp/apmd/apmd/unlinux.patch
 delete mode 100644 meta/recipes-bsp/apmd/apmd/wexitcode.patch
 delete mode 100644 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 3a4e989c1f9..d18173c7449 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -24,7 +24,6 @@ PREFERRED_PROVIDER_virtual/make-native ?= "make-native"
 # Default virtual runtime providers
 #
 VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
-VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 VIRTUAL-RUNTIME_base-utils ?= "busybox"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b06ae43dac9..823fb5b9001 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -38,7 +38,6 @@ RECIPE_MAINTAINER:pn-alsa-tools = "Michael Opdenacker <michael.opdenacker@bootli
 RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-bsp/apmd/apmd/apmd.service b/meta/recipes-bsp/apmd/apmd/apmd.service
deleted file mode 100644
index ffab82334f9..00000000000
--- a/meta/recipes-bsp/apmd/apmd/apmd.service
+++ /dev/null
@@ -1,7 +0,0 @@
-[Unit]
-Description=Advanced Power Management daemon
-After=remote-fs.target
-
-[Service]
-EnvironmentFile=-@SYSCONFDIR@/default/apmd
-ExecStart=@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
diff --git a/meta/recipes-bsp/apmd/apmd/apmd_proxy b/meta/recipes-bsp/apmd/apmd/apmd_proxy
deleted file mode 100644
index c48ee4e5d5f..00000000000
--- a/meta/recipes-bsp/apmd/apmd/apmd_proxy
+++ /dev/null
@@ -1,91 +0,0 @@
-#!/bin/sh
-# 
-# apmd_proxy - program dispatcher for APM daemon
-#
-# Written by Craig Markwardt (craigm@lheamail.gsfc.nasa.gov) 21 May 1999
-# Modified for Debian by Avery Pennarun
-#
-# This shell script is called by the APM daemon (apmd) when a power
-# management event occurs.  Its first and second arguments describe the
-# event.  For example, apmd will call "apmd_proxy suspend system" just
-# before the system is suspended.
-#
-# Here are the possible arguments:
-#
-# start              - APM daemon has started
-# stop               - APM daemon is shutting down
-# suspend critical   - APM system indicates critical suspend (++)
-# suspend system     - APM system has requested suspend mode
-# suspend user       - User has requested suspend mode
-# standby system     - APM system has requested standby mode 
-# standby user       - User has requested standby mode
-# resume suspend     - System has resumed from suspend mode
-# resume standby     - System has resumed from standby mode
-# resume critical    - System has resumed from critical suspend
-# change battery     - APM system reported low battery
-# change power       - APM system reported AC/battery change
-# change time        - APM system reported time change (*)
-# change capability  - APM system reported config. change (+)
-#
-# (*) - APM daemon may be configured to not call these sequences
-# (+) - Available if APM kernel supports it.
-# (++) - "suspend critical" is never passed to apmd from the kernel,
-#   so we will never see it here.  Scripts that process "resume
-#   critical" events need to take this into account.
-#
-# It is the proxy script's responsibility to examine the APM status
-# (via /proc/apm) or other status and to take appropriate actions.
-# For example, the script might unmount network drives before the
-# machine is suspended.
-#
-# In Debian, the usual way of adding functionality to the proxy is to
-# add a script to /etc/apm/event.d.  This script will be called by
-# apmd_proxy (via run-parts) with the same arguments.
-#
-# If it is important that a certain set of script be run in a certain
-# order on suspend and in a different order on resume, then put all
-# the scripts in /etc/apm/scripts.d instead of /etc/apm/event.d and
-# symlink to these from /etc/apm/suspend.d, /etc/apm/resume.d and
-# /etc/apm/other.d using names whose lexicographical order is the same
-# as the desired order of execution.
-#
-# If the kernel's APM driver supports it, apmd_proxy can return a non-zero
-# exit status on suspend and standby events, indicating that the suspend
-# or standby event should be rejected.
-#
-# *******************************************************************
-
-set -e
-
-# The following doesn't yet work, because current kernels (up to at least
-# 2.4.20) do not support rejection of APM events.  Supporting this would
-# require substantial modifications to the APM driver.  We will re-enable
-# this feature if the driver is ever modified.       -- cph@debian.org
-#
-#SUSPEND_ON_AC=false
-#[ -r /etc/apm/apmd_proxy.conf ] && . /etc/apm/apmd_proxy.conf
-#
-#if [ "${SUSPEND_ON_AC}" = "false" -a "${2}" = "system" ] \
-#	&& on_ac_power >/dev/null; then
-#    # Reject system suspends and standbys if we are on AC power
-#    exit 1  # Reject (NOTE kernel support must be enabled)
-#fi
-
-if [ "${1}" = "suspend" -o "${1}" = "standby" ]; then
-    run-parts -a "${1}" -a "${2}" /etc/apm/event.d
-    if [ -d /etc/apm/suspend.d ]; then
-        run-parts -a "${1}" -a "${2}" /etc/apm/suspend.d
-    fi
-elif [ "${1}" = "resume" ]; then
-    if [ -d /etc/apm/resume.d ]; then
-        run-parts -a "${1}" -a "${2}" /etc/apm/resume.d
-    fi
-    run-parts -a "${1}" -a "${2}" /etc/apm/event.d
-else
-    run-parts -a "${1}" -a "${2}" /etc/apm/event.d
-    if [ -d /etc/apm/other.d ]; then
-        run-parts -a "${1}" -a "${2}" /etc/apm/other.d
-    fi
-fi
-
-exit 0
diff --git a/meta/recipes-bsp/apmd/apmd/apmd_proxy.conf b/meta/recipes-bsp/apmd/apmd/apmd_proxy.conf
deleted file mode 100644
index 751145c522c..00000000000
--- a/meta/recipes-bsp/apmd/apmd/apmd_proxy.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-# /etc/apm/apmd_proxy.conf: configuration file for apmd.
-#
-# This file is managed by debconf when installing or reconfiguring the
-# package.  It is generated by merging the answers gathered by debconf
-# into the template file "/usr/share/apmd/apmd_proxy.conf".
-
-# The following doesn't yet work, because current kernels (up to at least
-# 2.4.20) do not support rejection of APM events.  Supporting this would
-# require substantial modifications to the APM driver.  We will re-enable
-# this feature if the driver is ever modified.       -- cph@debian.org
-#
-# Set the following to "false" if you want to reject system suspend or
-# system standby requests when the computer is running on AC power.
-# Otherwise set this to "true".  Such requests are never rejected when
-# the computer is running on battery power.
-#SUSPEND_ON_AC=true
diff --git a/meta/recipes-bsp/apmd/apmd/default b/meta/recipes-bsp/apmd/apmd/default
deleted file mode 100644
index 4b7965abf85..00000000000
--- a/meta/recipes-bsp/apmd/apmd/default
+++ /dev/null
@@ -1,8 +0,0 @@
-#
-# Default for /etc/init.d/apmd
-#
-
-# As apmd can be called with arguments, we use the following variable
-# to store them, e.g., APMD="-w 5 -p 2".
-# See the manual page apmd(8) for details.
-APMD="--proxy-timeout 30"
diff --git a/meta/recipes-bsp/apmd/apmd/init b/meta/recipes-bsp/apmd/apmd/init
deleted file mode 100755
index c0b41aa9d17..00000000000
--- a/meta/recipes-bsp/apmd/apmd/init
+++ /dev/null
@@ -1,51 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          apmd
-# Required-Start:    $remote_fs
-# Required-Stop:     $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: Advanced Power Management daemon
-### END INIT INFO
-
-# Source function library.
-. /etc/init.d/functions
-
-PATH=/bin:/usr/bin:/sbin:/usr/sbin
-
-[ -f /etc/default/rcS ] && . /etc/default/rcS
-[ -f /etc/default/apmd ] && . /etc/default/apmd
-
-case "$1" in
-    start)
-	echo -n "Starting advanced power management daemon: "
-	start-stop-daemon -S -x /usr/sbin/apmd -- \
-		-P /etc/apm/apmd_proxy $APMD
-	if [ $? = 0 ]; then
-	    echo "apmd."
-	else
-	    echo "(failed.)"
-	fi
-	;;
-    stop)
-	echo -n "Stopping advanced power management daemon: "
-	start-stop-daemon -K \
-		-x /usr/sbin/apmd
-	echo "apmd."
-	;;
-    status)
-	status /usr/sbin/apmd;
-	exit $?
-	;;
-    restart|force-reload) 
-	$0 stop
-	$0 start
-	exit
-	;;
-    *)
-	echo "Usage: /etc/init.d/apmd {start|stop|status|restart|force-reload}"
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta/recipes-bsp/apmd/apmd/legacy.patch b/meta/recipes-bsp/apmd/apmd/legacy.patch
deleted file mode 100644
index 88713118057..00000000000
--- a/meta/recipes-bsp/apmd/apmd/legacy.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 3595933d221f0ba836917debc0776b8723972ec9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 11 Aug 2015 17:40:50 +0300
-Subject: [PATCH 1/3] Patch with fixes provided by Debian.
-
-This patch is taken from
-ftp://ftp.debian.org/debian/pool/main/a/apmd/apmd_3.2.2-15.debian.tar.xz
-
-Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile |  2 +-
- apm.c    |  3 ++-
- apm.h    |  9 +++++++++
- apmd.c   | 15 ++++++++-------
- 4 files changed, 20 insertions(+), 9 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index bf346d9..92fc0fd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -43,7 +43,7 @@ DESTDIR=
- 
- CC=gcc
- CFLAGS=-O -g
--XTRACFLAGS=-Wall -pipe -I. -I/usr/src/linux/include \
-+XTRACFLAGS=-Wall -pipe -I. -I/usr/src/linux/include -I/usr/X11R6/include \
- 		-I/usr/src/linux-2.2/include -I /usr/src/linux-2.0/include \
- 		-DVERSION=\"$(VERSION)\" \
- 		-DDEFAULT_PROXY_NAME=\"$(PROXY_DIR)/apmd_proxy\"
-diff --git a/apm.c b/apm.c
-index b21c057..0359b1c 100644
---- a/apm.c
-+++ b/apm.c
-@@ -219,12 +219,13 @@ int main(int argc, char **argv)
- 		}
- 	}
- 													    
--
-+#if 0
-     if (!(i.apm_flags & APM_32_BIT_SUPPORT))
-     {
- 	fprintf(stderr, "32-bit APM interface not supported\n");
- 	exit(1);
-     }
-+#endif
- 
-     if (verbose && (i.apm_flags & 0x10))
- 	printf("APM BIOS Power Management is currently disabled\n");
-diff --git a/apm.h b/apm.h
-index fb24dfd..824cc06 100644
---- a/apm.h
-+++ b/apm.h
-@@ -20,6 +20,13 @@
-  * $Id: apm.h,v 1.7 1999/07/05 22:31:11 apenwarr Exp $
-  * 
-  */
-+#ifndef _APM_H
-+#define _APM_H 1
-+
-+#ifndef __KERNEL_STRICT_NAMES
-+#define __KERNEL_STRICT_NAMES
-+#endif
-+
- #include <linux/apm_bios.h>
- #include <sys/types.h>
- 
-@@ -93,3 +100,5 @@ extern int apm_reject(int fd);
- #else
- #define apm_reject(fd)   (-EINVAL)
- #endif
-+
-+#endif
-diff --git a/apmd.c b/apmd.c
-index 49ed3a1..560f536 100644
---- a/apmd.c
-+++ b/apmd.c
-@@ -343,7 +343,7 @@ static int call_proxy(apm_event_t event)
- 		/* parent */
- 		int status, retval;
- 		ssize_t len;
--		time_t time_limit;
-+		time_t countdown;
- 
- 		if (pid < 0) {
- 			/* Couldn't fork */
-@@ -356,8 +356,9 @@ static int call_proxy(apm_event_t event)
- 		/* Capture the child's output, if any, but only until it terminates */
- 		close(fds[1]);
- 		fcntl(fds[0], F_SETFL, O_RDONLY|O_NONBLOCK);
--		time_limit = time(0) + proxy_timeout;
-+		countdown = proxy_timeout;
- 		do {
-+			countdown -= 1;
- 			while ((len = read(fds[0], line, sizeof(line)-1)) > 0) {
- 				line[len] = 0;
- 				APMD_SYSLOG(LOG_INFO, "+ %s", line);
-@@ -372,16 +373,16 @@ static int call_proxy(apm_event_t event)
- 				goto proxy_done;
- 			}
- 				
--			sleep(1);
-+			while (sleep(1) > 0) ;
- 		} while (
--			(time(0) < time_limit)
-+			(countdown >= 0)
- 			|| (proxy_timeout < 0)
- 		);
- 
- 		APMD_SYSLOG(LOG_NOTICE, "Proxy has been running more than %d seconds; killing it", proxy_timeout);
- 
- 		kill(pid, SIGTERM);
--		time_limit = time(0) + 5;
-+		countdown = 5;
- 		do {
- 			retval = waitpid(pid, &status, WNOHANG);
- 			if (retval == pid)
-@@ -392,9 +393,9 @@ static int call_proxy(apm_event_t event)
- 				goto proxy_done;
- 			}
- 
--			sleep(1);
-+			while (sleep(1) > 0) ;
- 
--		} while (time(0) < time_limit);
-+		} while (countdown >= 0);
- 
- 		kill(pid, SIGKILL);
- 		status = __W_EXITCODE(0, SIGKILL);
--- 
-2.1.4
-
diff --git a/meta/recipes-bsp/apmd/apmd/libtool.patch b/meta/recipes-bsp/apmd/apmd/libtool.patch
deleted file mode 100644
index fd0a952890d..00000000000
--- a/meta/recipes-bsp/apmd/apmd/libtool.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d5dde7ca91a5aed273d8fe269e1a5194e85c8c79 Mon Sep 17 00:00:00 2001
-From: Scott Garman <scott.a.garman@intel.com>
-Date: Tue, 13 Jul 2010 16:46:46 +0800
-Subject: [PATCH] apmd: upgrade to 3.2.2-14
-
-Add by RP to address "unable to infer tagged configuration" error:
-   commit 35de05e61b88c0808a5e885bb0efdf420555d5ad
-   Author: Richard Purdie <rpurdie@rpsys.net>
-   Date:   Sun Jun 1 16:13:38 2008 +0000
-
-   apmd: Use libtool --tag options to avoid problems with libtool 2.2.4 (from poky)
-
-However I didn't see same issue with current libtool-2.2.10. Also per my understanding,
-the default tag, if not specified, falls back to CC. So disable it from patching, but
-keep it here. If we encounter similar issue in the future, we could then push upstream
-
-Comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-16
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 92fc0fd..8e283dc 100644
---- a/Makefile
-+++ b/Makefile
-@@ -59,8 +59,8 @@ RANLIB=ranlib
- #LDFLAGS=-s
- 
- LIBTOOL=libtool --quiet
--LT_COMPILE = $(LIBTOOL) --mode=compile $(CC)
--LT_LINK = $(LIBTOOL) --mode=link $(CC)
-+LT_COMPILE = $(LIBTOOL) --tag=CC --mode=compile $(CC)
-+LT_LINK = $(LIBTOOL)  --tag=CC --mode=link $(CC)
- LT_INSTALL = $(LIBTOOL) --mode=install install
- LT_CLEAN = $(LIBTOOL) --mode=clean rm
- 
diff --git a/meta/recipes-bsp/apmd/apmd/linkage.patch b/meta/recipes-bsp/apmd/apmd/linkage.patch
deleted file mode 100644
index 3d32c49cd27..00000000000
--- a/meta/recipes-bsp/apmd/apmd/linkage.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-When building use the libtool intermediate .lo files instead of explicitly using
-the .o files. Under libtool foo.lo is the libtool intermediate wrapper, foo.o is
-a static build, and .libs/foo.o is a shared build.
-
-If static libraries have been disabled globally then libtool won't generate them
-and explicit references to foo.o won't be satisfied.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/Makefile b/Makefile
-index bb695c6..5f60146 100644
---- a/Makefile
-+++ b/Makefile
-@@ -28,7 +28,7 @@ endif
- 
- .SUFFIXES:
- 
--OBJS=apmlib.o
-+OBJS=apmlib.lo
- EXES=apm apmd xapm apmsleep
- HEADERS=apm.h
- 
-@@ -66,22 +66,22 @@ all: $(EXES)
- 
- $(OBJS): $(HEADERS)
- 
--%.o: %.c
-+%.lo: %.c
- 	$(LT_COMPILE) -c $(CPPFLAGS) $(CFLAGS) $(XTRACFLAGS) $<
- 
--%: %.o $(LIBAPM)
-+%: %.lo $(LIBAPM)
- 	$(LT_LINK) -o $@ $< $(LDFLAGS) $(LIBAPM)
- 
--xapm.o: xapm.c
-+xapm.lo: xapm.c
- 	$(LT_COMPILE) -c $(CPPFLAGS) $(CFLAGS) $(XTRACFLAGS) -DNARROWPROTO $<
- 
--apmd: apmd.o
-+apmd: apmd.lo
- 
--apmsleep: apmsleep.o
-+apmsleep: apmsleep.lo
- 
--apmexists: apmexists.o
-+apmexists: apmexists.lo
- 
--xapm: xapm.o $(LIBAPM)
-+xapm: xapm.lo $(LIBAPM)
- 	$(LT_LINK) -o $@ $< $(LDFLAGS) $(LIBAPM) $(XLDFLAGS) $(XLIBS)
- 
- $(LIBAPM): apmlib.lo
diff --git a/meta/recipes-bsp/apmd/apmd/unlinux.patch b/meta/recipes-bsp/apmd/apmd/unlinux.patch
deleted file mode 100644
index ec8206cf174..00000000000
--- a/meta/recipes-bsp/apmd/apmd/unlinux.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-copy OE commit message here:
-   commit 9456cdc1cf43e3ba9e6d88c63560c1b6fdee4359
-   Author: Michael Krelin <hacker@klever.net>
-   Date:   Tue May 29 12:27:45 2007 +0000
-
-   apmd: prevent build from interferring with host kernel headers. Closes #1257
-
-comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-13
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- apmd-3.2.2.orig/Makefile
-+++ apmd-3.2.2/Makefile
-@@ -43,8 +43,7 @@
- 
- CC=gcc
- CFLAGS=-O -g
--XTRACFLAGS=-Wall -pipe -I. -I/usr/src/linux/include -I/usr/X11R6/include \
--		-I/usr/src/linux-2.2/include -I /usr/src/linux-2.0/include \
-+XTRACFLAGS=-Wall -pipe -I. \
- 		-DVERSION=\"$(VERSION)\" \
- 		-DDEFAULT_PROXY_NAME=\"$(PROXY_DIR)/apmd_proxy\"
- LDFLAGS=
diff --git a/meta/recipes-bsp/apmd/apmd/wexitcode.patch b/meta/recipes-bsp/apmd/apmd/wexitcode.patch
deleted file mode 100644
index c5faa85fa7f..00000000000
--- a/meta/recipes-bsp/apmd/apmd/wexitcode.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Define non-posix W* funcitons
-
-C libraries like musl dont define them
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: apmd-3.2.2.orig/apmd.c
-===================================================================
---- apmd-3.2.2.orig.orig/apmd.c
-+++ apmd-3.2.2.orig/apmd.c
-@@ -55,6 +55,14 @@
- #define MINIMUM_RATE_CALC_TIME  120
- #endif
- 
-+#ifndef _POSIX_SOURCE
-+
-+#define	__WCOREFLAG  0200
-+#define __WCOREDUMP(x)  (_W_INT(x) & __WCOREFLAG)
-+#define	__W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
-+
-+#endif
-+
- /*
-  * For the verbosity level feature to be useful,
-  * we rely on the fact that syslog.h assigns adjacent
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
deleted file mode 100644
index 92c35c98969..00000000000
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "Utilities for Advanced Power Management"
-DESCRIPTION = "The Advanced Power Management (APM) support provides \
-access to battery status information and a set of tools for managing \
-notebook power consumption."
-HOMEPAGE = "http://apenwarr.ca/apmd/"
-SECTION = "base"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://apm.h;beginline=6;endline=18;md5=7d4acc1250910a89f84ce3cc6557c4c2"
-DEPENDS = "libtool-cross"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/a/${BPN}/${BPN}_3.2.2.orig.tar.gz;name=tarball \
-           file://legacy.patch \
-           file://libtool.patch \
-           file://unlinux.patch \
-           file://wexitcode.patch \
-           file://linkage.patch \
-           file://init \
-           file://default \
-           file://apmd_proxy \
-           file://apmd_proxy.conf \
-           file://apmd.service"
-
-SRC_URI[tarball.md5sum] = "b1e6309e8331e0f4e6efd311c2d97fa8"
-SRC_URI[tarball.sha256sum] = "7f7d9f60b7766b852881d40b8ff91d8e39fccb0d1d913102a5c75a2dbb52332d"
-
-# for this package we're mostly interested in tracking debian patches,
-# and not in the upstream version where all development has effectively stopped
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apmd/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>((\d+\.*)+)-((\d+\.*)+))\.(diff|debian\.tar)\.(gz|xz)"
-
-S = "${WORKDIR}/apmd-3.2.2.orig"
-
-inherit update-rc.d systemd
-
-INITSCRIPT_NAME = "apmd"
-INITSCRIPT_PARAMS = "defaults"
-
-SYSTEMD_SERVICE:${PN} = "apmd.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-do_compile() {
-	# apmd doesn't use whole autotools. Just libtool for installation
-	oe_runmake apm apmd
-}
-
-do_install() {
-	install -d ${D}${sysconfdir}
-	install -d ${D}${sysconfdir}/apm
-	install -d ${D}${sysconfdir}/apm/event.d
-	install -d ${D}${sysconfdir}/apm/other.d
-	install -d ${D}${sysconfdir}/apm/suspend.d
-	install -d ${D}${sysconfdir}/apm/resume.d
-	install -d ${D}${sysconfdir}/apm/scripts.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sbindir}
-	install -d ${D}${bindir}
-	install -d ${D}${libdir}
-	install -d ${D}${datadir}/apmd
-	install -d ${D}${includedir}
-
-	install -m 4755 ${S}/.libs/apm ${D}${bindir}/apm
-	install -m 0755 ${S}/.libs/apmd ${D}${sbindir}/apmd
-	install -m 0755 ${WORKDIR}/apmd_proxy ${D}${sysconfdir}/apm/
-	install -m 0644 ${WORKDIR}/apmd_proxy.conf ${D}${datadir}/apmd/
-	install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/apmd
-	oe_libinstall -so libapm ${D}${libdir}
-	install -m 0644 apm.h ${D}${includedir}
-
-	sed -e 's,/usr/sbin,${sbindir},g; s,/etc,${sysconfdir},g;' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/apmd
-	chmod 755 ${D}${sysconfdir}/init.d/apmd
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/apmd.service ${D}${systemd_system_unitdir}/
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/apmd.service
-}
-
-PACKAGES =+ "libapm apm"
-
-FILES:libapm = "${libdir}/libapm${SOLIBS}"
-FILES:apm = "${bindir}/apm*"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index d60e1774712..eeb26ca5880 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -16,7 +16,6 @@ PACKAGES = ' \
             \
             ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
@@ -52,7 +51,6 @@ RDEPENDS:packagegroup-base = "\
     packagegroup-machine-base \
     \
     module-init-tools \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'apm', 'packagegroup-base-apm', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'packagegroup-base-acpi', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'keyboard', 'packagegroup-base-keyboard', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'phone', 'packagegroup-base-phone', '',d)} \
@@ -149,11 +147,6 @@ SUMMARY:packagegroup-base-acpi = "ACPI support"
 RDEPENDS:packagegroup-base-acpi = "\
     acpid"
 
-SUMMARY:packagegroup-base-apm = "APM support"
-RDEPENDS:packagegroup-base-apm = "\
-    ${VIRTUAL-RUNTIME_apm} \
-    apmd"
-
 SUMMARY:packagegroup-base-ext2 = "ext2 filesystem support"
 RDEPENDS:packagegroup-base-ext2 = "\
     e2fsprogs-e2fsck \
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index b71d1e5cd95..83425f60fe1 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "gtk+3 startup-notification dbus dbus-glib dbus-glib-native"
 DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
-DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 # The startup-notification requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -28,7 +27,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
-EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "--with-battery=apm", "",d)}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
index 3a70574af9d..61fea510545 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
@@ -22,7 +22,6 @@ matchbox-desktop &
 START_APPLETS=showdesktop,windowselector
 END_APPLETS=$KEYBOARD_APPLET,systray,startup-notify,notify
 END_APPLETS=battery,$END_APPLETS # feature-acpi
-END_APPLETS=battery,$END_APPLETS # feature-apm
 END_APPLETS=clock,$END_APPLETS
 END_APPLETS=openmoko-panel-gsm,$END_APPLETS # feature-phone
 
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 020e211ea59..49bf30ee5ea 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -26,7 +26,7 @@ FILES:${PN} += "${datadir}/themes/Sato/index.theme"
 
 do_install() {
 	# This is the set of machine features that the script has markers for
-	FEATURES="acpi apm phone"
+	FEATURES="acpi phone"
 	SCRIPT="${S}/sedder"
 	rm -f $SCRIPT
 	touch $SCRIPT
-- 
2.30.2


