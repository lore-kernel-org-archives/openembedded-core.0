Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B59C83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:31 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.40268.1752721162254868931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Pvpk6gUp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23c8a505177so3882035ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721161; x=1753325961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vewiFWydFc0l/pDGPw7gRpv2YkWoIl9H5nJXutMbvwc=;
        b=Pvpk6gUpCD7x9MXeCJ0KJ2lQ+v4AI8zilyrEg80gIhMvLKsij9xlK+lCswoUvXFi5v
         CjOwWsMbVa4u+1HjLVWXlWt+xUU8il/RVLwonZzYlvuM/s6GIfRpAj1zJcbUX4bhbjfL
         XrLzWA4rpM1FJ6uZKHyL1rTRLoAsZwEZXYzWP5vJKyL5Zr2aq1TN+wTRJBDaORrUBydq
         1/CWrs907uRVEbasSr60YCHGcovvOJ4Cqh+WgpUEzy2w4VdvJeRoAqtBvd5WOuMPEYPA
         u6U7dRAy+Eh/AQbgGjT83KLRafGuBJp6Hgm6MSq2y5AtShEHemfe1TAwJYhs6CBrA+QS
         zQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721161; x=1753325961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vewiFWydFc0l/pDGPw7gRpv2YkWoIl9H5nJXutMbvwc=;
        b=jUDhB6bbMCkgn9/UXdnpqK9DvSWalD9fDrA8QtiCBhHWyHXBJagfD+LuPnscq7bu3/
         ABjijMoWVqKZ9AjwfDMRJXK7ne5FPwPpK8ui/VMT//kX3LpmpnbBnTB6wZPFakh8WRRm
         nlW6t9XjKp4gqvNhcF+FAJ25JkpmPA/PPjo6Pj72iYREIRIHC2bHzdGzfHuqoq5Ssc0l
         ZgIvlqc8PPH3112/sOvajvU9Wr9SyvOW8HCugCu3EO/CsVRu+onYLh21GGkkFNXvQdP+
         1E1boga+n6maXhTdc5WSPf5pX3AbyP4K70li66g2dK92BNTmZkJvyDGbIK1gMdWTUwQx
         /UiQ==
X-Gm-Message-State: AOJu0Ywtk/lAMAernrh8Gvr7LPqvDkYh5qGrnFePkr2PXarQDU8mzryM
	SrS9gGsyyw2t0H1Skzw1JgmNyzkkRTlFJ5lI1AIfC3ZaVs2BkDeKDrY/K//JNy0X7BFzwpeB6ve
	p2lrq
X-Gm-Gg: ASbGncslvvZpcH7R1lzC8KZALVmB2roYJyhITopGoSj6TrkS/WhcOlrBIm8eHSuZtvu
	mgDWUT4BUyBZ8f9CfLyPCi1jd0SKMF5u9Nwp8EYRE4weOCh9UHOLOr2O01vCEbbaeRWrQ7MvkUS
	Nw5DY8n5XJy51JKvQeQ0U+LuGmWsvdYCk0dSk/y7ycV+9As0U4y6FogB5KE5kTMm4CDyRFyoIOt
	UEZDXKcoV5Osi1RLb/UxwJO4cMF5UfstHwf7+WxawL1psTkS2n2H7Hw+w2NjhpaKU2X2/uj6TgO
	vX104KQ+ceQ+zCjl6t9lBh7nEooBduvnYzCwW5wDjDSltoKQFhhYrSaXbhXxp3VFVM75OJxbWdp
	dlidzxWKsB0i6yfMz+wgsC151
X-Google-Smtp-Source: AGHT+IEhoI1FsVFBU0Y43zbgz1pWo/cKrBsjJMZDUNVzz9LC8qe459XCnN3b2fVOsG+S3vpN0pGYog==
X-Received: by 2002:a17:902:e54a:b0:234:8a4a:adad with SMTP id d9443c01a7336-23e24f44a17mr76901175ad.26.1752721161406;
        Wed, 16 Jul 2025 19:59:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/12] sudo: upgrade 1.9.15p5 -> 1.9.17p1
Date: Wed, 16 Jul 2025 19:58:56 -0700
Message-ID: <b04af6db102c97f3d4338dbcfdcab927b5194a69.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220508

From: Praveen Kumar <praveen.kumar@windriver.com>

Changelog:
===========
* Fixed CVE-2025-32462.  Sudo's -h (--host) option could be specified
   when running a command or editing a file.  This could enable a
   local privilege escalation attack if the sudoers file allows the
   user to run commands on a different host.

* Fixed CVE-2025-32463.  An attacker can leverage sudo's -R
  (--chroot) option to run arbitrary commands as root, even if
  they are not listed in the sudoers file.  The chroot support has
  been deprecated an will be removed entirely in a future release.

License-Update: Copyright updated to 2025

0001-sudo.conf.in-fix-conflict-with-multilib.patch refreshed for 1.9.17

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...o.conf.in-fix-conflict-with-multilib.patch |  7 ++-
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.15p5.bb => sudo_1.9.17p1.bb}    | 54 ++++++++++++++++++-
 3 files changed, 57 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p5.bb => sudo_1.9.17p1.bb} (52%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 041c717e00..1989c5abd7 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -15,13 +15,12 @@ Update the comments in sudo.conf.in to avoid the conflict.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
-
 ---
  examples/sudo.conf.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 2187457..0908d24 100644
+index bdd676c..094341c 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -53,7 +52,7 @@ index 2187457..0908d24 100644
  # Sudo plugin directory:
 @@ -74,7 +74,7 @@
  # The default directory to use when searching for plugins that are
- # specified without a fully qualified path name.
+ # specified without a fully-qualified path name.
  #
 -#Path plugin_dir @plugindir@
 +#Path plugin_dir $plugindir
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index feb1cf35a7..a23de1fcf7 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
similarity index 52%
rename from meta/recipes-extended/sudo/sudo_1.9.15p5.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index 8e542015ad..c5d57da9f0 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -1,3 +1,55 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.md
+# +++ LICENSE.md
+# @@ -1,6 +1,6 @@
+#  Sudo is distributed under the following license:
+#
+# -    Copyright (c) 1994-1996, 1998-2023
+# +    Copyright (c) 1994-1996, 1998-2025
+#          Todd C. Miller <Todd.Miller@sudo.ws>
+#
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -247,9 +247,9 @@
+#
+#  The file arc4random.c bears the following license:
+#
+# -    Copyright (c) 1996, David Mazieres <dm@uun.org>
+# -    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
+# -    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
+# +    Copyright (c) 1996, David Mazieres <dm@uun.org>
+# +    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
+# +    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
+#      Copyright (c) 2014, Theo de Raadt <deraadt@openbsd.org>
+#
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -282,7 +282,7 @@
+#
+#  The file getentropy.c bears the following license:
+#
+# -    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
+# +    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
+#      Copyright (c) 2014 Bob Beck <beck@obtuse.com>
+#
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -299,7 +299,7 @@
+#
+#  The embedded copy of zlib bears the following license:
+#
+# -    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
+# +    Copyright (C) 1995-2024 Jean-loup Gailly and Mark Adler
+#
+#      This software is provided 'as-is', without any express or implied
+#      warranty.  In no event will the authors be held liable for any damages
+#
+#
+
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
@@ -7,7 +59,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
+SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.43.0


