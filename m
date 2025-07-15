Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC4DC83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:50 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5361.1752611804247167907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=r2L9bFnN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23c8a5053c2so57550465ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611803; x=1753216603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2Js458Al6AFjtlW02Px0UzdGTKBEgh7oON2QqYZUN8=;
        b=r2L9bFnNToRxz7hGa1KMp7jEULl7RiSWHnSG6g+aJgVfLVLLBhdTRoRaFEiV5YxH/G
         sxo2TLnKUIGS/m6kWaeUFe0zB+/3S3ewmTrh06e3cKBC3bz+BuT4GLHKkBdBr43XMy0E
         abcFYQ+icaaNoCPS4++74NGWIEtZ7Nc6n2A6dI0Hvb61MYd4WvX1qbxIF8Fx6KCbTEzX
         nzVUF64U+lAYO/K9JQWJ14fig6KJyrwJkdRLJ4u1E2RTRT9KrIRtU2z7K4Fw2Z/gERq1
         l3CSpc3MDChphvarCqDqQSC0qIPt1t3dDB3J4PZSo/JBFv20Ed5nhv91Nvl6qIngpV/r
         lhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611803; x=1753216603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2Js458Al6AFjtlW02Px0UzdGTKBEgh7oON2QqYZUN8=;
        b=kvrvJh6w5uZINi+EtNpYcl97LqWDhpMKfnlQbYCAT/zs3Kq35efSVCfi6id67bUYas
         czLCXEF6xYYVbuIZgc8ep+pBuSRC4BsFxhsv0OxEcpZfl9+DltPROow+kCigmitKhCoo
         MgWGQRy8Fuj12GLZ5FoumD2cZmcUjtPKMQZO751MYzZfOt1GGCx4PXxJDmFyejqFnt9/
         mfTRfIlDRbdM2f6pQeJcSxIfLdC/bIHBsFhGYS6rHF4Rh3riOr91oezrLczjEwzKwUZx
         qdx1mSRx8KRWEVcbgOFGWWIlciRpD/pS7+o5GgGkKps189o7iHpMjfqhDUT3Zl8umy+r
         TbCA==
X-Gm-Message-State: AOJu0YxALpXeUCWBXvuZWyymedgBbt0EryO7B5VgvjMj8oEKvp8die4R
	dJWgm9ksouKUBK+9uzNlJEXT8PFcnpk15bnr+rMhXk443tfpK0wTST2n1miTfewRsiG41t/G9fI
	wr0dC
X-Gm-Gg: ASbGncsULPfpqMx7NQCMoBegXGpH+Ms2/hDtS/hfQQ5Nu09P6s81uDsRpmS1vBighu6
	+T50cajsJ+QdIlCzguLbC87hZQyN4QaTLJTOfxMmfL1Wre/SNkwqzNFX+b1gevT7vWa7sLDLhQR
	R1xvbRI7W0fP4eQ2nlXhxdUW4j+TcM0SOCXxTg+hGO/r+2NE37EtxrzvZK8lefbCV+5mf7igLyM
	mL/uTTJzfwjOKzKaA5y4Kb5dQXwNH6C/Go+I8ifQ6VuHtkzdV/1xcNBdMjKlaPnlpi+XhgAtWJh
	qL73U4wYJCJKk7CC+mV0SyjNNkZ0ZujLxP/j68YpFIdpn4GH9VSWA6ZNg6z25N9DuKuZdCz95bD
	Yau67qRSmUr9jQcGt4fpfkBZC
X-Google-Smtp-Source: AGHT+IFABucnSVYyff8NJchbsIHiRxc7dekht4qx9ijc3ihC2y/t8kAprmIj7HWMhGdfevWo7BMEbg==
X-Received: by 2002:a17:902:d484:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-23e24f492a2mr4401875ad.13.1752611803336;
        Tue, 15 Jul 2025 13:36:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] sudo: upgrade 1.9.15p5 -> 1.9.17p1
Date: Tue, 15 Jul 2025 13:36:14 -0700
Message-ID: <f8343726bca7f884213436cda3f51684c22ad3f1.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220422

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
index d3b6bf1ad8..a8323f8b6d 100644
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


