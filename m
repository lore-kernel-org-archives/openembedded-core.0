Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0B1C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:50 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10810.1710313784945866253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OJS+Saf5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313785; x=1741849785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MjUmdlEBW4/7xhPi4jPFp5PDPrUkDqj9/6wJNq74emA=;
  b=OJS+Saf5XNt9hOPBJS5eJ8QzCTfyuaO6/WjtZ68bzUoyRSZ5dcu5SoPG
   k4C2R+ubvopsCUOcmWBDnF1hAfUQHHoS1Tu+CRr+RsVTWQ1YjJQ9LQ9B1
   dfk/6e6lK9YAe7gyEz30ZfCq/g16JX2nyaETp3hXGAeKaA3fqd/JyjkrU
   aB8pw/oZFvoSGYzUrKv7Z/JaxuAFjSvXh0kdKTIOxTwZHWkqYgNnmU89z
   ZzJ2eLoEuA/yKkgdWwa5z6zRjtW0mXso0PR+ATqB3xiV2/SJN6WREFW+5
   C0KuneCcGG8owokU0oloKPgUtd8Tio83v1KgB1rDqQw/latSvyy9jDHAU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131486915"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131486915"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:43 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A9FDCDD931
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D5CF4D501C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6345620097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10AE61A006B;
	Wed, 13 Mar 2024 15:09:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1
Date: Wed, 13 Mar 2024 15:08:34 +0800
Message-Id: <1710313714-12541-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--8.794000-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yaoXHZz/dXlxP0xJTFWS4boKo7vFXsOIEnER
	bS7OZpEDRwQSKslXgjHQFmGmoq1lJHuDhljfG03rQgjHANpTmaus4IQYg+G3CNP7VmP7Drr6lV2
	qvnSyUeTU2tE8n28nwRZFGMJkolJkCwxtNmfvYmK9HTxRE6QQBzcDhb0XPzBLUGf/0pAtLtK+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+ArthpnZXZolDrix/QSCPuKh2p9
	rZAQSUagvYN/nRNgguzgQm5D5iIr1KRloeaw/JbOwpfLMeBwRv4qCLIu0mtIMay5jJvrxqMf8FS
	bzLvvf5TRs24pmpu6tIq66o1vYO6YwDOL7t3RyFvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6H
	MFK1qe4o3IqvccPJFIAcCikR3vq/6+2eV+qwLe73XW/g0DqRP7bBN2Y8YS0GzXooksjycb7gOiv
	nqWN+W
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197038

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
================
*COPYING:
 Add the license for the XZ logo.
 Change most public domain parts to 0BSD.
 Update COPYING about the man pages of the scripts.
*getopt.c
 MSVC: Don't #include <unistd.h>.
 lib/getopt*.c: Include <config.h> only HAVE_CONFIG_H is defined.
 lib: Update getopt.c from Gnulib with modifications.
 lib: Silence -Wsign-conversion in getopt.c.
 Add SPDX license identifiers to GPL, LGPL, and FSFULLR files.

Changelog:
=============
* liblzma: Fixed two bugs relating to GNU indirect function (IFUNC)
  with GCC.
* xz: Changed the messages for thread reduction due to memory
  constraints to only appear under the highest verbosity level.
* Build:
    - Fixed a build issue when the header file <linux/landlock.h>
      was present on the system but the Landlock system calls were
      not defined in <sys/syscall.h>.
    - The CMake build now warns and disables NLS if both gettext
      tools and pre-created .gmo files are missing. Previously,
      this caused the CMake build to fail.
* Minor improvements to man pages.
* Minor improvements to tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xz/{xz_5.4.6.bb => xz_5.6.1.bb}           | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.6.1.bb} (79%)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.6.1.bb
similarity index 79%
rename from meta/recipes-extended/xz/xz_5.4.6.bb
rename to meta/recipes-extended/xz/xz_5.6.1.bb
index da3b75a10b..dd6388e7dd 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.6.1.bb
@@ -8,26 +8,27 @@ SECTION = "base"
 # packages, and the LGPL bits are under lib/, which appears to be used for
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and PD.
-LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
-LICENSE:${PN} = "GPL-2.0-or-later"
-LICENSE:${PN}-dev = "GPL-2.0-or-later"
-LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "GPL-2.0-or-later"
-LICENSE:${PN}-dbg = "GPL-2.0-or-later"
-LICENSE:${PN}-locale = "GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD & 0BSD"
+LICENSE:${PN} = "GPL-2.0-or-later & 0BSD"
+LICENSE:${PN}-dev = "GPL-2.0-or-later & 0BSD"
+LICENSE:${PN}-staticdev = "GPL-2.0-or-later & 0BSD"
+LICENSE:${PN}-doc = "GPL-2.0-or-later & 0BSD"
+LICENSE:${PN}-dbg = "GPL-2.0-or-later & 0BSD"
+LICENSE:${PN}-locale = "GPL-2.0-or-later & 0BSD"
 LICENSE:liblzma = "PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=3ef4de063517b8d33e97bbb87a3339ee \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
+                    file://lib/getopt.c;endline=23;md5=3f33e207287bf72834f3ae8c247dfb6a \
+                    file://COPYING.0BSD;md5=0672c210ce80c83444339b9aa31fee2f \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c"
+SRC_URI[sha256sum] = "2398f4a8e53345325f44bdd9f0cc7401bd9025d736c6d43b372f4dea77bf75b8"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.34.1


