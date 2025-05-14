Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF6AC3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 22:34:14 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.461.1747262051576508656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 15:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cRDGUqln;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54EMAEtG3276311
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 17:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747260614;
	bh=Dre8Ww8p1JdE6bnkEQVGlSPSNKuEsTqc51jgg14IEcA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cRDGUqlnHkrwS9VLYLR10HtaxOJinUHL+plZw9VkZqmOv61VxljA/l8Yi1s3Bga0x
	 OqUF+LHp8GXVNTgUohbHunWMJN0V7h05R+tPSCDGuNk1L/cutY3jjsAOjso6exmB0n
	 NgxAJLWBnr9Yw3Pg5i/SN7KEFBY2lO45ytcHJevI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54EMAEJ4018459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 May 2025 17:10:14 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 17:10:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 17:10:13 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EMAB90037558;
	Wed, 14 May 2025 17:10:13 -0500
From: <rs@ti.com>
To: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv3 3/3] xserver-nodm-init: convert to virtual-emptty-conf
Date: Wed, 14 May 2025 17:09:24 -0500
Message-ID: <20250514220924.2644712-4-rs@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514220924.2644712-1-rs@ti.com>
References: <20250514220924.2644712-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 22:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216554

From: Randolph Sapp <rs@ti.com>

Convert this script package into a simple config for emptty. This is
capable of using either the root user or the underprivileged xuser
account based on the same ROOTLESS_X variable. The xuser will leverage
the nopasswdlogin session provided by emptty for automatic logins.
Runtime provide virtual-emptty-conf as we need to set parameters for the
default session.

This also gets rid of the xuser security/capability override since
emptty sets up required components as root before decending into the
specified user. This does not currently handle loading of autostart
applications in "/etc/xdg/autostart".

License-Update: GPLv2 scripts were replaced with MIT based config files
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/conf/distro/include/maintainers.inc      |   4 +-
 meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
 .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
 .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
 .../X11/Xsession.d/89xdgautostart.sh          |   7 -
 .../X11/Xsession.d/90XWindowManager.sh        |   7 -
 .../x11-common/xserver-nodm-init/Xserver      |  25 --
 .../xserver-nodm-init/capability.conf         |   2 -
 .../xserver-nodm-init/default.desktop         |   5 +
 .../xserver-nodm-init/emptty.conf.in}         |   8 +-
 .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
 .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
 .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
 .../xserver-nodm-init/xserver-nodm.service.in |  11 -
 .../x11-common/xserver-nodm-init_3.0.bb       |  57 +--
 .../user-creation/xuser-account_0.1.bb        |   3 +-
 16 files changed, 37 insertions(+), 594 deletions(-)
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13xdgbasedirs.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89xdgautostart.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90XWindowManager.sh
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
 copy meta/recipes-graphics/{wayland/weston-init/emptty.conf => x11-common/xserver-nodm-init/emptty.conf.in} (95%)
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
 delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 63158ecce0..05a64cc231 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -922,12 +922,12 @@ RECIPE_MAINTAINER:pn-xorgproto = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xprop = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xrandr = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xrestop = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xserver-nodm-init = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-xserver-nodm-init = "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-xserver-xf86-config = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xserver-xorg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xset = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xtrans = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xuser-account = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-xuser-account = "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-xvinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwayland = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwininfo = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
index 09afb1e3d1..8593be5b77 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -20,4 +20,12 @@ class XorgTest(OERuntimeTestCase):
         status, output = self.target.run(cmd)
         msg = ('Xorg does not appear to be running %s' %
               self.target.run(self.tc.target_cmds['ps'])[1])
+
+        # dump last 20 lines of emptty log in case of failure
+        log_cmd = 'tail -n 20 /var/log/emptty/7.log'
+        msg += '\n\n===== start: snippet =====\n\n'
+        msg += 'file: /var/log/emptty/7.log\n\n'
+        msg += '\n\n%s\n\n' % self.target.run(log_cmd)[1]
+        msg += '\n\n===== end: snippet =====\n\n'
+
         self.assertEqual(status, 0, msg=msg)
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
deleted file mode 100644
index 0b73127ae1..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
+++ /dev/null
@@ -1,38 +0,0 @@
-#!/bin/sh
-
-if [ -x /usr/bin/dbus-launch ]; then
-    # As this is the X session script, always start a new DBus session.
-    eval `dbus-launch --sh-syntax --exit-with-session </dev/null`
-    echo "D-BUS per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
-fi
-
-. /etc/profile
-
-if [ -f $HOME/.profile ]; then
-    . $HOME/.profile
-fi
-
-SYSSESSIONDIR=/etc/X11/Xsession.d
-
-export CLUTTER_DISABLE_MIPMAPPED_TEXT=1
-
-for SESSIONFILE in $SYSSESSIONDIR/*; do
-    set +e
-    case "$SESSIONFILE" in
-        *.sh)
-            . "$SESSIONFILE"
-            ;;
-        *.shbg)
-            "$SESSIONFILE" &
-            ;;
-        *~)
-            # Ignore backup files
-            ;;
-        *)
-            "$SESSIONFILE"
-            ;;
-    esac
-    set -e
-done
-
-exit 0
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13xdgbasedirs.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13xdgbasedirs.sh
deleted file mode 100644
index 912f79761c..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13xdgbasedirs.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-# Minimal/stub implementation of the XDG Base Directory specification.
-# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
-
-# If the runtime directory hasn't been set already (for example by systemd,
-# elogind, or pam) create a directory in TMPDIR.
-if [ -z "$XDG_RUNTIME_DIR" ]; then
-    XDG_RUNTIME_DIR=/run/user/$(id -u)
-    export XDG_RUNTIME_DIR
-fi
-
-if [ -d "$XDG_RUNTIME_DIR" ]; then
-    # If the directory exists, check the permissions and ownership
-    if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" != "$(id -u)-700" ]; then
-        echo "ERROR: $XDG_RUNTIME_DIR has incorrect permissions"
-        exit 1
-    fi
-else
-    mkdir --mode 0700 --parents "${XDG_RUNTIME_DIR}"
-fi
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89xdgautostart.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89xdgautostart.sh
deleted file mode 100644
index 3d7008ca45..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89xdgautostart.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-XDGAUTOSTART=/etc/xdg/autostart
-if [ -d $XDGAUTOSTART ]; then
-    for SCRIPT in $XDGAUTOSTART/*; do
-        CMD=`grep ^Exec= $SCRIPT | cut -d '=' -f 2`
-        $CMD &
-    done
-fi
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90XWindowManager.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90XWindowManager.sh
deleted file mode 100644
index b936dedf3b..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90XWindowManager.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-if [ -x $HOME/.Xsession ]; then
-    exec $HOME/.Xsession
-elif [ -x /usr/bin/x-session-manager ]; then
-    exec /usr/bin/x-session-manager
-else
-    exec /usr/bin/x-window-manager
-fi
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver b/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
deleted file mode 100644
index 0edbfbfc20..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-# This script is only needed to make sure /etc/X11/xserver-common
-# can affect XSERVER, ARGS & DPI: otherwise systemd could just use
-# /etc/default/xserver-nodm as EnvironmentFile and sysvinit could just
-# source the same file
-
-. /etc/profile
-
-# load default values for XSERVER, ARGS, DISPLAY...
-. /etc/default/xserver-nodm
-
-# Allow xserver-common to override ARGS, XSERVER, DPI
-if [ -e /etc/X11/xserver-common ] ; then
-    . /etc/X11/xserver-common
-    if [ ! -e $XSERVER ] ; then
-        XSERVER=$(which $XSERVER)
-    fi
-fi
-
-if [ -n "$DPI" ] ; then
-    ARGS="$ARGS -dpi $DPI"
-fi
-
-exec xinit /etc/X11/Xsession -- $XSERVER $DISPLAY $ARGS $*
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
deleted file mode 100644
index 7ab7460816..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-cap_sys_admin	@USER@
-none	*
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop b/meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
new file mode 100644
index 0000000000..3357cd9a7f
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/default.desktop
@@ -0,0 +1,5 @@
+[Desktop Entry]
+Encoding=UTF-8
+Type=Application
+Name=Default X11 Desktop
+Exec=x-session-manager
diff --git a/meta/recipes-graphics/wayland/weston-init/emptty.conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
similarity index 95%
copy from meta/recipes-graphics/wayland/weston-init/emptty.conf
copy to meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
index 1918cc02a7..406a6d1249 100644
--- a/meta/recipes-graphics/wayland/weston-init/emptty.conf
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/emptty.conf.in
@@ -11,13 +11,13 @@ PRINT_ISSUE=true
 PRINT_MOTD=true
 
 # Preselected user, if AUTOLOGIN is enabled, this user is logged in.
-DEFAULT_USER=weston
+DEFAULT_USER=@USER@
 
 # Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
 AUTOLOGIN=true
 
 # The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
-AUTOLOGIN_SESSION=Weston
+AUTOLOGIN_SESSION=Default X11 Desktop
 
 # If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
 # AUTOLOGIN_MAX_RETRY=2
@@ -41,7 +41,7 @@ VERTICAL_SELECTION=false
 #LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
 
 # Arguments passed to Xorg server.
-#XORG_ARGS=
+XORG_ARGS=@NO_CURSOR_ARG@ @BLANK_ARGS@
 
 # Allows to use dynamic motd script to generate custom MOTD.
 #DYNAMIC_MOTD=false
@@ -71,7 +71,7 @@ SESSION_ERROR_LOGGING=rotate
 #DEFAULT_XAUTHORITY=false
 
 #If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
-#ROOTLESS_XORG=false
+ROOTLESS_XORG=@ROOTLESS_X_ARG@
 
 #If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
 IDENTIFY_ENVS=false
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch b/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
deleted file mode 100644
index eff975e341..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
+++ /dev/null
@@ -1,355 +0,0 @@
-COPYING: add GPLv2 license file
-
-this is a local file recipe and the license file is missing.In order
-to pass the license checksum checking, the license file is needed. So
-this patch add the GPLv2 license file.
-
-Upstream-Status: Inappropriate [licensing]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-diff --git a/COPYING b/COPYING
-new file mode 100644
-index 0000000..d511905
---- /dev/null
-+++ b/COPYING
-@@ -0,0 +1,339 @@
-+		    GNU GENERAL PUBLIC LICENSE
-+		       Version 2, June 1991
-+
-+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
-+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ Everyone is permitted to copy and distribute verbatim copies
-+ of this license document, but changing it is not allowed.
-+
-+			    Preamble
-+
-+  The licenses for most software are designed to take away your
-+freedom to share and change it.  By contrast, the GNU General Public
-+License is intended to guarantee your freedom to share and change free
-+software--to make sure the software is free for all its users.  This
-+General Public License applies to most of the Free Software
-+Foundation's software and to any other program whose authors commit to
-+using it.  (Some other Free Software Foundation software is covered by
-+the GNU Lesser General Public License instead.)  You can apply it to
-+your programs, too.
-+
-+  When we speak of free software, we are referring to freedom, not
-+price.  Our General Public Licenses are designed to make sure that you
-+have the freedom to distribute copies of free software (and charge for
-+this service if you wish), that you receive source code or can get it
-+if you want it, that you can change the software or use pieces of it
-+in new free programs; and that you know you can do these things.
-+
-+  To protect your rights, we need to make restrictions that forbid
-+anyone to deny you these rights or to ask you to surrender the rights.
-+These restrictions translate to certain responsibilities for you if you
-+distribute copies of the software, or if you modify it.
-+
-+  For example, if you distribute copies of such a program, whether
-+gratis or for a fee, you must give the recipients all the rights that
-+you have.  You must make sure that they, too, receive or can get the
-+source code.  And you must show them these terms so they know their
-+rights.
-+
-+  We protect your rights with two steps: (1) copyright the software, and
-+(2) offer you this license which gives you legal permission to copy,
-+distribute and/or modify the software.
-+
-+  Also, for each author's protection and ours, we want to make certain
-+that everyone understands that there is no warranty for this free
-+software.  If the software is modified by someone else and passed on, we
-+want its recipients to know that what they have is not the original, so
-+that any problems introduced by others will not reflect on the original
-+authors' reputations.
-+
-+  Finally, any free program is threatened constantly by software
-+patents.  We wish to avoid the danger that redistributors of a free
-+program will individually obtain patent licenses, in effect making the
-+program proprietary.  To prevent this, we have made it clear that any
-+patent must be licensed for everyone's free use or not licensed at all.
-+
-+  The precise terms and conditions for copying, distribution and
-+modification follow.
-+
-+		    GNU GENERAL PUBLIC LICENSE
-+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-+
-+  0. This License applies to any program or other work which contains
-+a notice placed by the copyright holder saying it may be distributed
-+under the terms of this General Public License.  The "Program", below,
-+refers to any such program or work, and a "work based on the Program"
-+means either the Program or any derivative work under copyright law:
-+that is to say, a work containing the Program or a portion of it,
-+either verbatim or with modifications and/or translated into another
-+language.  (Hereinafter, translation is included without limitation in
-+the term "modification".)  Each licensee is addressed as "you".
-+
-+Activities other than copying, distribution and modification are not
-+covered by this License; they are outside its scope.  The act of
-+running the Program is not restricted, and the output from the Program
-+is covered only if its contents constitute a work based on the
-+Program (independent of having been made by running the Program).
-+Whether that is true depends on what the Program does.
-+
-+  1. You may copy and distribute verbatim copies of the Program's
-+source code as you receive it, in any medium, provided that you
-+conspicuously and appropriately publish on each copy an appropriate
-+copyright notice and disclaimer of warranty; keep intact all the
-+notices that refer to this License and to the absence of any warranty;
-+and give any other recipients of the Program a copy of this License
-+along with the Program.
-+
-+You may charge a fee for the physical act of transferring a copy, and
-+you may at your option offer warranty protection in exchange for a fee.
-+
-+  2. You may modify your copy or copies of the Program or any portion
-+of it, thus forming a work based on the Program, and copy and
-+distribute such modifications or work under the terms of Section 1
-+above, provided that you also meet all of these conditions:
-+
-+    a) You must cause the modified files to carry prominent notices
-+    stating that you changed the files and the date of any change.
-+
-+    b) You must cause any work that you distribute or publish, that in
-+    whole or in part contains or is derived from the Program or any
-+    part thereof, to be licensed as a whole at no charge to all third
-+    parties under the terms of this License.
-+
-+    c) If the modified program normally reads commands interactively
-+    when run, you must cause it, when started running for such
-+    interactive use in the most ordinary way, to print or display an
-+    announcement including an appropriate copyright notice and a
-+    notice that there is no warranty (or else, saying that you provide
-+    a warranty) and that users may redistribute the program under
-+    these conditions, and telling the user how to view a copy of this
-+    License.  (Exception: if the Program itself is interactive but
-+    does not normally print such an announcement, your work based on
-+    the Program is not required to print an announcement.)
-+
-+These requirements apply to the modified work as a whole.  If
-+identifiable sections of that work are not derived from the Program,
-+and can be reasonably considered independent and separate works in
-+themselves, then this License, and its terms, do not apply to those
-+sections when you distribute them as separate works.  But when you
-+distribute the same sections as part of a whole which is a work based
-+on the Program, the distribution of the whole must be on the terms of
-+this License, whose permissions for other licensees extend to the
-+entire whole, and thus to each and every part regardless of who wrote it.
-+
-+Thus, it is not the intent of this section to claim rights or contest
-+your rights to work written entirely by you; rather, the intent is to
-+exercise the right to control the distribution of derivative or
-+collective works based on the Program.
-+
-+In addition, mere aggregation of another work not based on the Program
-+with the Program (or with a work based on the Program) on a volume of
-+a storage or distribution medium does not bring the other work under
-+the scope of this License.
-+
-+  3. You may copy and distribute the Program (or a work based on it,
-+under Section 2) in object code or executable form under the terms of
-+Sections 1 and 2 above provided that you also do one of the following:
-+
-+    a) Accompany it with the complete corresponding machine-readable
-+    source code, which must be distributed under the terms of Sections
-+    1 and 2 above on a medium customarily used for software interchange; or,
-+
-+    b) Accompany it with a written offer, valid for at least three
-+    years, to give any third party, for a charge no more than your
-+    cost of physically performing source distribution, a complete
-+    machine-readable copy of the corresponding source code, to be
-+    distributed under the terms of Sections 1 and 2 above on a medium
-+    customarily used for software interchange; or,
-+
-+    c) Accompany it with the information you received as to the offer
-+    to distribute corresponding source code.  (This alternative is
-+    allowed only for noncommercial distribution and only if you
-+    received the program in object code or executable form with such
-+    an offer, in accord with Subsection b above.)
-+
-+The source code for a work means the preferred form of the work for
-+making modifications to it.  For an executable work, complete source
-+code means all the source code for all modules it contains, plus any
-+associated interface definition files, plus the scripts used to
-+control compilation and installation of the executable.  However, as a
-+special exception, the source code distributed need not include
-+anything that is normally distributed (in either source or binary
-+form) with the major components (compiler, kernel, and so on) of the
-+operating system on which the executable runs, unless that component
-+itself accompanies the executable.
-+
-+If distribution of executable or object code is made by offering
-+access to copy from a designated place, then offering equivalent
-+access to copy the source code from the same place counts as
-+distribution of the source code, even though third parties are not
-+compelled to copy the source along with the object code.
-+
-+  4. You may not copy, modify, sublicense, or distribute the Program
-+except as expressly provided under this License.  Any attempt
-+otherwise to copy, modify, sublicense or distribute the Program is
-+void, and will automatically terminate your rights under this License.
-+However, parties who have received copies, or rights, from you under
-+this License will not have their licenses terminated so long as such
-+parties remain in full compliance.
-+
-+  5. You are not required to accept this License, since you have not
-+signed it.  However, nothing else grants you permission to modify or
-+distribute the Program or its derivative works.  These actions are
-+prohibited by law if you do not accept this License.  Therefore, by
-+modifying or distributing the Program (or any work based on the
-+Program), you indicate your acceptance of this License to do so, and
-+all its terms and conditions for copying, distributing or modifying
-+the Program or works based on it.
-+
-+  6. Each time you redistribute the Program (or any work based on the
-+Program), the recipient automatically receives a license from the
-+original licensor to copy, distribute or modify the Program subject to
-+these terms and conditions.  You may not impose any further
-+restrictions on the recipients' exercise of the rights granted herein.
-+You are not responsible for enforcing compliance by third parties to
-+this License.
-+
-+  7. If, as a consequence of a court judgment or allegation of patent
-+infringement or for any other reason (not limited to patent issues),
-+conditions are imposed on you (whether by court order, agreement or
-+otherwise) that contradict the conditions of this License, they do not
-+excuse you from the conditions of this License.  If you cannot
-+distribute so as to satisfy simultaneously your obligations under this
-+License and any other pertinent obligations, then as a consequence you
-+may not distribute the Program at all.  For example, if a patent
-+license would not permit royalty-free redistribution of the Program by
-+all those who receive copies directly or indirectly through you, then
-+the only way you could satisfy both it and this License would be to
-+refrain entirely from distribution of the Program.
-+
-+If any portion of this section is held invalid or unenforceable under
-+any particular circumstance, the balance of the section is intended to
-+apply and the section as a whole is intended to apply in other
-+circumstances.
-+
-+It is not the purpose of this section to induce you to infringe any
-+patents or other property right claims or to contest validity of any
-+such claims; this section has the sole purpose of protecting the
-+integrity of the free software distribution system, which is
-+implemented by public license practices.  Many people have made
-+generous contributions to the wide range of software distributed
-+through that system in reliance on consistent application of that
-+system; it is up to the author/donor to decide if he or she is willing
-+to distribute software through any other system and a licensee cannot
-+impose that choice.
-+
-+This section is intended to make thoroughly clear what is believed to
-+be a consequence of the rest of this License.
-+
-+  8. If the distribution and/or use of the Program is restricted in
-+certain countries either by patents or by copyrighted interfaces, the
-+original copyright holder who places the Program under this License
-+may add an explicit geographical distribution limitation excluding
-+those countries, so that distribution is permitted only in or among
-+countries not thus excluded.  In such case, this License incorporates
-+the limitation as if written in the body of this License.
-+
-+  9. The Free Software Foundation may publish revised and/or new versions
-+of the General Public License from time to time.  Such new versions will
-+be similar in spirit to the present version, but may differ in detail to
-+address new problems or concerns.
-+
-+Each version is given a distinguishing version number.  If the Program
-+specifies a version number of this License which applies to it and "any
-+later version", you have the option of following the terms and conditions
-+either of that version or of any later version published by the Free
-+Software Foundation.  If the Program does not specify a version number of
-+this License, you may choose any version ever published by the Free Software
-+Foundation.
-+
-+  10. If you wish to incorporate parts of the Program into other free
-+programs whose distribution conditions are different, write to the author
-+to ask for permission.  For software which is copyrighted by the Free
-+Software Foundation, write to the Free Software Foundation; we sometimes
-+make exceptions for this.  Our decision will be guided by the two goals
-+of preserving the free status of all derivatives of our free software and
-+of promoting the sharing and reuse of software generally.
-+
-+			    NO WARRANTY
-+
-+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
-+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-+REPAIR OR CORRECTION.
-+
-+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
-+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
-+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
-+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-+POSSIBILITY OF SUCH DAMAGES.
-+
-+		     END OF TERMS AND CONDITIONS
-+
-+	    How to Apply These Terms to Your New Programs
-+
-+  If you develop a new program, and you want it to be of the greatest
-+possible use to the public, the best way to achieve this is to make it
-+free software which everyone can redistribute and change under these terms.
-+
-+  To do so, attach the following notices to the program.  It is safest
-+to attach them to the start of each source file to most effectively
-+convey the exclusion of warranty; and each file should have at least
-+the "copyright" line and a pointer to where the full notice is found.
-+
-+    <one line to give the program's name and a brief idea of what it does.>
-+    Copyright (C) <year>  <name of author>
-+
-+    This program is free software; you can redistribute it and/or modify
-+    it under the terms of the GNU General Public License as published by
-+    the Free Software Foundation; either version 2 of the License, or
-+    (at your option) any later version.
-+
-+    This program is distributed in the hope that it will be useful,
-+    but WITHOUT ANY WARRANTY; without even the implied warranty of
-+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+    GNU General Public License for more details.
-+
-+    You should have received a copy of the GNU General Public License along
-+    with this program; if not, write to the Free Software Foundation, Inc.,
-+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+
-+Also add information on how to contact you by electronic and paper mail.
-+
-+If the program is interactive, make it output a short notice like this
-+when it starts in an interactive mode:
-+
-+    Gnomovision version 69, Copyright (C) year name of author
-+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-+    This is free software, and you are welcome to redistribute it
-+    under certain conditions; type `show c' for details.
-+
-+The hypothetical commands `show w' and `show c' should show the appropriate
-+parts of the General Public License.  Of course, the commands you use may
-+be called something other than `show w' and `show c'; they could even be
-+mouse-clicks or menu items--whatever suits your program.
-+
-+You should also get your employer (if you work as a programmer) or your
-+school, if any, to sign a "copyright disclaimer" for the program, if
-+necessary.  Here is a sample; alter the names:
-+
-+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
-+
-+  <signature of Ty Coon>, 1 April 1989
-+  Ty Coon, President of Vice
-+
-+This General Public License does not permit incorporating your program into
-+proprietary programs.  If your program is a subroutine library, you may
-+consider it more useful to permit linking proprietary applications with the
-+library.  If this is what you want to do, use the GNU Lesser General
-+Public License instead of this License.
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
deleted file mode 100755
index 116bb278bc..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ /dev/null
@@ -1,75 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: xserver
-# Required-Start: $local_fs $remote_fs dbus
-# Required-Stop: $local_fs $remote_fs
-# Default-Start:     5
-# Default-Stop:      0 1 2 3 6
-### END INIT INFO
-
-killproc() {            # kill the named process(es)
-        pid=`/bin/pidof $1`
-        [ "$pid" != "" ] && kill $pid
-}
-
-read CMDLINE < /proc/cmdline
-for x in $CMDLINE; do
-        case $x in
-        x11=false)
-		echo "X Server disabled" 
-		exit 0;
-                ;;
-        esac
-done
-
-case "$1" in
-  start)
-       . /etc/profile
-
-       #default for USER
-       . /etc/default/xserver-nodm
-       echo "Starting Xserver"
-       if [ "$USER" != "root" ]; then
-           # setting for rootless X
-           chmod o+w /var/log
-           chmod g+r /dev/tty[0-3]
-           # hidraw device is probably needed
-           if [ -e /dev/hidraw0 ]; then
-               chmod o+rw /dev/hidraw*
-           fi
-           # Make sure that the Xorg has the cap_sys_admin capability which is
-           # needed for setting the drm master
-           if ! grep -q "^auth.*pam_cap\.so" /etc/pam.d/su; then
-               echo "auth	optional	pam_cap.so" >>/etc/pam.d/su
-           fi
-           if ! /usr/sbin/getcap $XSERVER |  grep -q cap_sys_admin; then
-               /usr/sbin/setcap cap_sys_admin+eip $XSERVER
-           fi
-       fi
-
-       # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
-       su -l -c '/etc/xserver-nodm/Xserver &' $USER
-       # Wait for the desktop to say its finished loading
-       # before loading the rest of the system
-       # dbus-wait org.matchbox_project.desktop Loaded
-  ;;
-
-  stop)
-        echo "Stopping XServer"
-        killproc xinit
-        sleep 1
-        chvt 1 &
-  ;;
-
-  restart)
-	$0 stop
-        $0 start
-  ;;
-
-  *)
-        echo "usage: $0 { start | stop | restart }"
-  ;;
-esac
-
-exit 0
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
deleted file mode 100644
index 4a9670d8d2..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
+++ /dev/null
@@ -1,7 +0,0 @@
-# common environment file for sysvinit and systemd
-
-XSERVER=/usr/bin/Xorg
-DISPLAY=:0
-ARGS=" -br -pn @BLANK_ARGS@ @NO_CURSOR_ARG@ "
-HOME=@HOME@
-USER=@USER@
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
deleted file mode 100644
index 87dc4f8fcd..0000000000
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Xserver startup without a display manager
-
-[Service]
-EnvironmentFile=/etc/default/xserver-nodm
-User=@USER@
-ExecStart=/etc/xserver-nodm/Xserver
-Restart=always
-
-[Install]
-Alias=display-manager.service
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index cd4acf8155..09b112c1ac 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -1,16 +1,10 @@
 SUMMARY = "Simple Xserver Init Script (no dm)"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SECTION = "x11"
 
-SRC_URI = "file://xserver-nodm \
-           file://Xserver \
-           file://X11 \
-           file://gplv2-license.patch \
-           file://xserver-nodm.service.in \
-           file://xserver-nodm.conf.in \
-           file://capability.conf \
-"
+SRC_URI = "file://emptty.conf.in \
+           file://default.desktop"
 
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
@@ -18,7 +12,7 @@ UNPACKDIR = "${S}"
 # Since we refer to ROOTLESS_X which is normally enabled per-machine
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit update-rc.d systemd features_check
+inherit features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 ${@oe.utils.conditional('ROOTLESS_X', '1', 'pam', '', d)}"
 
@@ -28,45 +22,26 @@ PACKAGECONFIG[blank] = ""
 PACKAGECONFIG[nocursor] = ""
 
 do_install() {
-    install -d ${D}${sysconfdir}/default
-    install xserver-nodm.conf.in ${D}${sysconfdir}/default/xserver-nodm
-    install -d ${D}${sysconfdir}/xserver-nodm
-    install Xserver ${D}${sysconfdir}/xserver-nodm/Xserver
-    install -d ${D}${sysconfdir}/X11/Xsession.d
-    install X11/Xsession.d/* ${D}${sysconfdir}/X11/Xsession.d/
-    install X11/Xsession ${D}${sysconfdir}/X11/
+    install -D -p -m0644 ${S}/emptty.conf.in ${D}${sysconfdir}/emptty/conf
+    install -D -p -m0644 ${S}/default.desktop ${D}${datadir}/xsessions/default.desktop
 
     BLANK_ARGS="${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}"
     NO_CURSOR_ARG="${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '-nocursor', '', d)}"
+    ROOTLESS_X_ARG="${@oe.utils.conditional('ROOTLESS_X', '1', 'true', 'false', d)}"
     if [ "${ROOTLESS_X}" = "1" ] ; then
-        XUSER_HOME="/home/xuser"
         XUSER="xuser"
-        install -D capability.conf ${D}${sysconfdir}/security/capability.conf
-        sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capability.conf
     else
-        XUSER_HOME=${ROOT_HOME}
         XUSER="root"
     fi
-    sed -i "s:@HOME@:${XUSER_HOME}:; s:@USER@:${XUSER}:; s:@BLANK_ARGS@:${BLANK_ARGS}:" \
-        ${D}${sysconfdir}/default/xserver-nodm
-    sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/default/xserver-nodm
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${S}/xserver-nodm.service.in ${D}${systemd_system_unitdir}/xserver-nodm.service
-        sed -i "s:@USER@:${XUSER}:" ${D}${systemd_system_unitdir}/xserver-nodm.service
-    fi
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-        install -d ${D}${sysconfdir}/init.d
-        install xserver-nodm ${D}${sysconfdir}/init.d
-    fi
+    sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/emptty/conf
+    sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/emptty/conf
+    sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/conf
+    sed -i "s:@ROOTLESS_X_ARG@:${ROOTLESS_X_ARG}:" ${D}${sysconfdir}/emptty/conf
 }
 
-RDEPENDS:${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account libcap libcap-bin', '', d)}"
-
-INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
-SYSTEMD_SERVICE:${PN} = "xserver-nodm.service"
+FILES:${PN} = "${sysconfdir}/emptty/conf \
+               ${datadir}/xsessions/default.desktop"
 
+RDEPENDS:${PN} = "emptty xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account libcap libcap-bin', '', d)}"
+RPROVIDES:${PN} += "virtual-emptty-conf"
 RCONFLICTS:${PN} = "xserver-common (< 1.34-r9) x11-common"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 80a429c6d3..57caccac4b 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -25,7 +25,8 @@ FILES:${PN} = "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--create-home \
-                       --groups video,tty,audio,input,shutdown,disk \
+                       --groups video,tty,audio,input,shutdown,disk,nopasswdlogin \
                        --user-group xuser"
+GROUPADD_PARAM:${PN} = "-r nopasswdlogin"
 
 ALLOW_EMPTY:${PN} = "1"
-- 
2.49.0


