Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 844D7766C1
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 19:36:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t76JaOJR013797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 6 Aug 2015 12:36:26 -0700 (PDT)
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 6 Aug 2015 12:36:23 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 6 Aug 2015 14:35:53 -0500
Message-ID: <1438889753-11168-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] initscripts: Fix regression for requiring /bin/bash
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
X-List-Received-Date: Thu, 06 Aug 2015 19:36:28 -0000
Content-Type: text/plain

It is not possible to create a rootfs with only busybox + initscipts.
This is a result of a regression from commit
a4b53872a8a9a2743299acbff015f7f2750a69d6 (initscripts: add
/sbin/sushell for systemd service debug-shell).

The /sbin/sushell should just use /bin/sh else you end up with a
problem when creating the end image with a failed smart transaction
shown below:

ERROR: Unable to install packages. Command '/proj/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/smart --quiet --data-dir=/proj/bitbake_build/tmp/work/qemuarma9-wrs-linux-gnueabi/wrlinux-image-glibc-small/1.0-r1/rootfs/var/lib/smart install -y dropbear@armv7at2_vfp hac@armv7at2_vfp run-postinsts@all kernel-modules@qemuarma9 packagegroup-core-boot@qemuarma9' returned 1:
error: Can't install initscripts-1.0-r155.0@armv7at2_vfp: no package provides /bin/bash

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../initscripts/initscripts-1.0/sushell            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sushell b/meta/recipes-core/initscripts/initscripts-1.0/sushell
index 7d96941..c319d95 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sushell
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sushell
@@ -1,5 +1,5 @@
-#!/bin/bash
+#!/bin/sh
 
-[ -z "$SUSHELL" ] && SUSHELL=/bin/bash
+[ -z "$SUSHELL" ] && SUSHELL=/bin/sh
 
 exec $SUSHELL
-- 
1.7.9.5


