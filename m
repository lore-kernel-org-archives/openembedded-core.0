Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738BCC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:44 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.10888.1700620302380922975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ynfnV/hQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-359d27f6d46so20044125ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620301; x=1701225101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5XSZEbP6sq51zTRukUnqQ6lZH80aS88zMvQTTUE9JI=;
        b=ynfnV/hQemmp8Xa0VrlXwjSNI2LqyqdgReegLQnmL0jD57lMJdo4V9PJWpz5k4C8hX
         FLlPo1eVb7aod2xFD8yhPYRV0LKRz+aDGXjMxpfti6816A0hD+q/TaunCdm+P6eGA0tq
         gqPSUkjF7CEIRM2eq0wdgrqgUTBFKY1mRDUTsKMsqXzk+8npZPxb4Y7OAFmbKcIaUI7d
         oC54wmur3tt+AFyH27IJipee3BQhK09kYsPxlWzt2n2zRp5RJ6gW2mhVHYm3wnRgf087
         L4fabdvSkAs/jxoLQNEsj8egkISGSYJKPAzu4Yr4S/hXl/lLJ5rpBsMItwh4VLpqCgI2
         zYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620301; x=1701225101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5XSZEbP6sq51zTRukUnqQ6lZH80aS88zMvQTTUE9JI=;
        b=qgLouyAb90bAtj2G89xI9cSMIv7r6rXi2Wdm8ytKoB69UVuslSgc7wV9iArADcvoss
         lqRCgOFjwmcWkn0WwoMAjIgdJF106BLcpbGFfXMAM00aG6KZElx3J2RNfPC3PdaM5hbG
         GhbNwTMWzDceoo5h17zhweglgQET6FK8r8uT7LlSUFxzFXmJI4/1hupOGbof7NuWwFuP
         FmayQVAr39BMu4AitiNhcsPF7o9lhaclOQXTxHZmA9vpHbjdll7pqREL0EcEtg2XAV66
         ig4PqHpnGXiHtxppc/oWgzMpy/DNemx+NQvXFbkfmAh9TDo1RaP5ThlQXygFsIcE389x
         mhRw==
X-Gm-Message-State: AOJu0Yxcja/tSwqE0LghmR8uqk1wMyAKDfPSeoR4CEp+bgeE9EoTEkcL
	snt7umm/KiZjFrgs3kSiYDLiRvujWzU+5gOlIFFy9Q==
X-Google-Smtp-Source: AGHT+IE+lHpWabK8SKYNmm6FanFv/snQYoO9XJAnuwKkX+PXubQ2Y3WOZOXIj/WokdIbzbmWxEVtcg==
X-Received: by 2002:a05:6e02:1113:b0:35a:d052:da48 with SMTP id u19-20020a056e02111300b0035ad052da48mr874450ilk.29.1700620300572;
        Tue, 21 Nov 2023 18:31:40 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] sudo: upgrade 1.9.13p3 -> 1.9.15p2
Date: Tue, 21 Nov 2023 16:31:10 -1000
Message-Id: <55f1437e2e7f11724ace489677ae214611244faf.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191012

From: Soumya Sambu <soumya.sambu@windriver.com>

License-update: file removed upstream

Drop patch as issue fixed upstream.

Changelog:
===========
1.9.15p2
 * Fixed a bug on BSD systems where sudo would not restore the
   terminal settings on exit if the terminal had parity enabled.
   GitHub issue #326.

1.9.15p1
 * Fixed a bug introduced in sudo 1.9.15 that prevented LDAP-based
   sudoers from being able to read the ldap.conf file.
   GitHub issue #325.

1.9.15
 * Fixed an undefined symbol problem on older versions of macOS
   when "intercept" or "log_subcmds" are enabled in sudoers.
   GitHub issue #276.
 * Fixed "make check" failure related to getpwent(3) wrapping
   on NetBSD.
 * Fixed the warning message for "sudo -l command" when the command
   is not permitted.  There was a missing space between "list" and
   the actual command due to changes in sudo 1.9.14.
 * Fixed a bug where output could go to the wrong terminal if
   "use_pty" is enabled (the default) and the standard input, output
   or error is redirected to a different terminal.  Bug #1056.
 * The visudo utility will no longer create an empty file when the
   specified sudoers file does not exist and the user exits the
   editor without making any changes.  GitHub issue #294.
 * The AIX and Solaris sudo packages on www.sudo.ws now support
   "log_subcmds" and "intercept" with both 32-bit and 64-bit
   binaries.  Previously, they only worked when running binaries
   with the same word size as the sudo binary.  GitHub issue #289.
 * The sudoers source is now logged in the JSON event log.  This
   makes it possible to tell which rule resulted in a match.
 * Running "sudo -ll command" now produces verbose output that
   includes matching rule as well as the path to the sudoers file
   the matching rule came from.  For LDAP sudoers, the name of the
   matching sudoRole is printed instead.
 * The embedded copy of zlib has been updated to version 1.3.
 * The sudoers plugin has been modified to make it more resilient
   to ROWHAMMER attacks on authentication and policy matching.
   This addresses CVE-2023-42465.
 * The sudoers plugin now constructs the user time stamp file path
   name using the user-ID instead of the user name.  This avoids a
   potential problem with user names that contain a path separator
   ('/') being interpreted as part of the path name.  A similar
   issue in sudo-rs has been assigned CVE-2023-42456.
 * A path separator ('/') in a user, group or host name is now
   replaced with an underbar character ('_') when expanding escapes
   in @include and @includedir directives as well as the "iolog_file"
   and "iolog_dir" sudoers Default settings.
 * The "intercept_verify" sudoers option is now only applied when
   the "intercept" option is set in sudoers.  Previously, it was
   also applied when "log_subcmds" was enabled.  Sudo 1.9.14
   contained an incorrect fix for this.  Bug #1058.
 * Changes to terminal settings are now performed atomically, where
   possible.  If the command is being run in a pseudo-terminal and
   the user's terminal is already in raw mode, sudo will not change
   the user's terminal settings.  This prevents concurrent sudo
   processes from restoring the terminal settings to the wrong values.
   GitHub issue #312.
 * Reverted a change from sudo 1.9.4 that resulted in PAM session
   modules being called with the environment of the command to be
   run instead of the environment of the invoking user.
   GitHub issue #318.
 * New Indonesian translation from translationproject.org.
 * The sudo_logsrvd server will now raise its open file descriptor
   limit to the maximum allowed value when it starts up.  Each
   connection can require up to nine open file descriptors so the
   default soft limit may be too low.
 * Better log message when rejecting a command if the "intercept"
   option is enabled and the "intercept_allow_setid" option is
   disabled.  Previously, "command not allowed" would be logged and
   the user had no way of knowing what the actual problem was.
 * Sudo will now log the invoking user's environment as "submitenv"
   in the JSON logs.  The command's environment ("runenv") is no
   longer logged for commands rejected by the sudoers file or an
   approval plugin.

1.9.14p3
 * Fixed a crash with Python 3.12 when the sudo Python plugin is
   unloaded.  This only affects "make check" for the Python plugin.
 * Adapted the sudo Python plugin test output to match Python 3.12.

1.9.14p2
 * Fixed a crash on Linux systems introduced in version 1.9.14 when
   running a command with a NULL argv[0] if "log_subcmds" or
   "intercept" is enabled in sudoers.
 * Fixed a problem with "stair-stepped" output when piping or
   redirecting the output of a sudo command that takes user input.
 * Fixed a bug introduced in sudo 1.9.14 that affects matching
   sudoers rules containing a Runas_Spec with an empty Runas user.
   These rules should only match when sudo's -g option is used but
   were matching even without the -g option.  GitHub issue #290.

1.9.14p1
 * Fixed an invalid free bug in sudo_logsrvd that was introduced
   in version 1.9.14 which could cause sudo_logsrvd to crash.
 * The sudoers plugin no longer tries to send the terminal name
   to the log server when no terminal is present.  This bug was
   introduced in version 1.9.14.

1.9.14
 * Fixed a bug where if the "intercept" or "log_subcmds" sudoers
   option was enabled and a sub-command was run where the first
   entry of the argument vector didn't match the command being run.
   This resulted in commands like "sudo su -" being killed due to
   the mismatch.  Bug #1050.
 * The sudoers plugin now canonicalizes command path names before
   matching (where possible).  This fixes a bug where sudo could
   execute the wrong path if there are multiple symbolic links with
   the same target and the same base name in sudoers that a user is
   allowed to run.  GitHub issue #228.
 * Improved command matching when a chroot is specified in sudoers.
   The sudoers plugin will now change the root directory id needed
   before performing command matching.  Previously, the root directory
   was simply prepended to the path that was being processed.
 * When NETGROUP_BASE is set in the ldap.conf file, sudo will now
   perform its own netgroup lookups of the host name instead of
   using the system innetgr(3) function.  This guarantees that user
   and host netgroup lookups are performed using  the same LDAP
   server (or servers).
 * Fixed a bug introduced in sudo 1.9.13 that resulted in a missing
   " ; " separator between environment variables and the command
   in log entries.
 * The visudo utility now displays a warning when it ignores a file
   in an include dir such as /etc/sudoers.d.
 * When running a command in a pseudo-terminal, sudo will initialize
   the terminal settings even if it is the background process.
   Previously, sudo only initialized the pseudo-terminal when running
   in the foreground.  This fixes an issue where a program that
   checks the window size would read the wrong value when sudo was
   running in the background.
 * Fixed a bug where only the first two digits of the TSID field
   being was logged.  Bug #1046.
 * The "use_pty" sudoers option is now enabled by default.  To
   restore the historic behavior where a command is run in the
   user's terminal, add "Defaults !use_pty" to the sudoers file.
   GitHub issue #258.
 * Sudo's "-b" option now works when the command is run in a
   pseudo-terminal.
 * When disabling core dumps, sudo now only modifies the soft limit
   and leaves the hard limit as-is.  This avoids problems on Linux
   when sudo does not have CAP_SYS_RESOURCE, which may be the case
   when run inside a container.  GitHub issue #42.
 * Sudo configuration file paths have been converted to colon-separated
   lists of paths.  This makes it possible to have configuration
   files on a read-only file system while still allowing for local
   modifications in a different (writable) directory.  The new
   --enable-adminconf configure option can be used to specify a
   directory that is searched for configuration files in preference
   to the sysconfdir (which is usually /etc).
 * The NETGROUP_QUERY ldap.conf parameter can now be disabled for
   LDAP servers that do not support querying the nisNetgroup object
   by its nisNetgroupTriple attribute, while still allowing sudo to
   query the LDAP server directly to determine netgroup membership.
 * Fixed a long-standing bug where a sudoers rule without an explicit
   runas list allowed the user to run a command as root and any
   group instead of just one of the groups that root is a member
   of.  For example, a rule such as "myuser ALL = ALL" would permit
   "sudo -u root -g othergroup" even if root did not belong to
   "othergroup".
 * Fixed a bug where a sudoers rule with an explicit runas list
   allowed a user to run sudo commands as themselves.  For example,
   a rule such as "myuser ALL = (root) ALL", "myuser" should only
   allow commands to be run as root (optionally using one of root's
   groups).  However, the rule also allowed the user to run
   "sudo -u myuser -g myuser command".
 * Fixed a bug that prevented the user from specifying a group on
   the command line via "sudo -g" if the rule's Runas_Spec contained
   a Runas_Alias.
 * Sudo now requires a C compiler that conforms to ISO C99 or higher
   to build.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...me.c-correctly-include-header-for-ou.patch | 25 -------------------
 meta/recipes-extended/sudo/sudo.inc           |  5 ++--
 .../{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb}    |  3 +--
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb} (92%)

diff --git a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
deleted file mode 100644
index f63ed553be..0000000000
--- a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f993c5c88faacc43971899aae2168ffb3e34dc80 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 24 Sep 2021 13:36:24 +0200
-Subject: [PATCH] lib/util/mksigname.c: correctly include header for out of
- tree builds
-
-Upstream-Status: Submitted [https://github.com/sudo-project/sudo/pull/123]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/util/mksigname.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/util/mksigname.c b/lib/util/mksigname.c
-index de8b1ad..0a69e7e 100644
---- a/lib/util/mksigname.c
-+++ b/lib/util/mksigname.c
-@@ -36,7 +36,7 @@ main(int argc, char *argv[])
- {
-     unsigned int i;
- 
--#include "mksigname.h"
-+#include "lib/util/mksigname.h"
- 
-     printf("const char *const sudo_sys_signame[] = {\n");
-     for (i = 0; i < nitems(sudo_sys_signame); i++) {
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index f22b3eab99..d3b6bf1ad8 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
-                    file://lib/util/getcwd.c;beginline=2;endline=27;md5=50f8d9667750e18dea4e84a935c12009 \
                     file://lib/util/glob.c;beginline=2;endline=31;md5=2852f68687544e3eb8a0a61665506f0e \
                     file://lib/util/snprintf.c;beginline=3;endline=33;md5=b70df6179969e38fcf68da91b53b8029 \
                     file://include/sudo_queue.h;beginline=2;endline=27;md5=ad578e9664d17a010b63e4bc0576ee8d \
@@ -29,12 +28,12 @@ EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 EXTRA_OECONF:append:libc-musl = " --disable-hardening "
 
 do_compile:prepend () {
-       # Remove build host references from sudo_usage.h
+       # Remove build host references from config.h
        sed -i  \
            -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,--build=${BUILD_SYS},,g' \
            -e 's,--host=${HOST_SYS},,g' \
-           ${B}/src/sudo_usage.h
+	   ${B}/config.h
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
diff --git a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.9.13p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p2.bb
index 2e11739470..431dfba3c2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
@@ -3,12 +3,11 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
-           file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
+SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


