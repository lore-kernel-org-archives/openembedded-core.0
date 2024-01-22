Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94E8C47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 09:57:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.70031.1705917474139264781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 01:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HhV9aYid;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705917474; x=1737453474;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ElP7E7HUkn7cOP8Wj8HPVUsXuqWPtVgJWnw/uw6Ui34=;
  b=HhV9aYidchNTrPYUpBCstToI8jvkDZ+kN53nbyrD2iXePuQdZLZJT7HI
   kVNL2cSRhO+Z7Z69gAA8yIeem68qfN94UiA3ltaFd1ztgJKUZhhjPCr3T
   IQ0JqB7AasqDq5Xk1zjLGCZMZMrt5MStMZLgEfuKEH3JfgTjJD6FiHDah
   9uB6szQn0Nie0RHJitFHKneQEGrY8sj5GNGvqHfDFoZh8hIsFMe1J9Nm6
   vxZcFnP9GtxAuKMcj2ZQDpLnGXW1MKFYKzv4atMkTYqA3sUm09DZAJeZ9
   u+EHDXVqV23v3OJVFqXzi70fKrPB7U+5XcTE4emoLST3hAk22IN4rmmmR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="400811324"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="400811324"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="819624883"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="819624883"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2024 01:57:52 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 1/2] sudo: upgrade 1.9.14p3 -> 1.9.15p2
Date: Mon, 22 Jan 2024 17:29:10 +0800
Message-Id: <20240122092911.2582934-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 09:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194131

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changelog:
===========
1.9.15p2:
- Fixed a bug on BSD systems where sudo would not restore the
terminal settings on exit if the terminal had parity enabled.

1.9.15p1:
- Fixed a bug introduced in sudo 1.9.15 that prevented LDAP-based
sudoers from being able to read the ldap.conf file.

1.9.15:
- Fixed an undefined symbol problem on older versions of macOS
when "intercept" or "log_subcmds" are enabled in sudoers.
- Fixed "make check" failure related to getpwent(3) wrapping
on NetBSD.
- Fixed the warning message for "sudo -l command" when the command
is not permitted.  There was a missing space between "list" and
the actual command due to changes in sudo 1.9.14.
- Fixed a bug where output could go to the wrong terminal if
"use_pty" is enabled (the default) and the standard input, output
or error is redirected to a different terminal.  Bug #1056.
- The visudo utility will no longer create an empty file when the
specified sudoers file does not exist and the user exits the
editor without making any changes.  GitHub issue #294.
- The AIX and Solaris sudo packages on www.sudo.ws now support
"log_subcmds" and "intercept" with both 32-bit and 64-bit
binaries.  Previously, they only worked when running binaries
with the same word size as the sudo binary.  GitHub issue #289.
- The sudoers source is now logged in the JSON event log.  This
makes it possible to tell which rule resulted in a match.
Running "sudo -ll command" now produces verbose output that
includes matching rule as well as the path to the sudoers file
the matching rule came from.  For LDAP sudoers, the name of the
matching sudoRole is printed instead.
- The embedded copy of zlib has been updated to version 1.3.
- The sudoers plugin has been modified to make it more resilient
to ROWHAMMER attacks on authentication and policy matching.
This addresses CVE-2023-42465.
- The sudoers plugin now constructs the user time stamp file path
name using the user-ID instead of the user name.  This avoids a
potential problem with user names that contain a path separator
('/') being interpreted as part of the path name.  A similar
issue in sudo-rs has been assigned CVE-2023-42456.
- A path separator ('/') in a user, group or host name is now
replaced with an underbar character ('_') when expanding escapes
in @include and @includedir directives as well as the "iolog_file"
and "iolog_dir" sudoers Default settings.
- The "intercept_verify" sudoers option is now only applied when
the "intercept" option is set in sudoers.  Previously, it was
also applied when "log_subcmds" was enabled.  Sudo 1.9.14
contained an incorrect fix for this.  Bug #1058.
- Changes to terminal settings are now performed atomically, where
possible.  If the command is being run in a pseudo-terminal and
the user's terminal is already in raw mode, sudo will not change
the user's terminal settings.  This prevents concurrent sudo
processes from restoring the terminal settings to the wrong values.
GitHub issue #312.
- Reverted a change from sudo 1.9.4 that resulted in PAM session
modules being called with the environment of the command to be
run instead of the environment of the invoking user.
GitHub issue #318.
- New Indonesian translation from translationproject.org.
- The sudo_logsrvd server will now raise its open file descriptor
limit to the maximum allowed value when it starts up.  Each
connection can require up to nine open file descriptors so the
default soft limit may be too low.
- Better log message when rejecting a command if the "intercept"
option is enabled and the "intercept_allow_setid" option is
disabled.  Previously, "command not allowed" would be logged and
the user had no way of knowing what the actual problem was.
- Sudo will now log the invoking user's environment as "submitenv"
in the JSON logs.  The command's environment ("runenv") is no
longer logged for commands rejected by the sudoers file or an
approval plugin.

(cherry picked from OE-Core rev 5ea298680a8f17d3b808a2c43b0182e9c391f663)

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../sudo/{sudo_1.9.14p3.bb => sudo_1.9.15p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.14p3.bb => sudo_1.9.15p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.14p3.bb b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.14p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p2.bb
index d5c5718ea5..431dfba3c2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.14p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "a08318b1c4bc8582c004d4cd9ae2903abc549e7e46ba815e41fe81d1c0782b62"
+SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.37.3


