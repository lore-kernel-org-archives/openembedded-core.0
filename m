Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C64CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:58:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.34324.1697187525016938751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="136128715"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="136128715"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:58:42 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 55CEAC68E6
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:58:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 99DC7CF7E0
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:58:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CC4776BA6E;
	Fri, 13 Oct 2023 17:58:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kmod: upgrade 30 -> 31
Date: Fri, 13 Oct 2023 16:58:12 +0800
Message-Id: <1697187492-4113-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--3.153600-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrAWQaZTMSP87JyYU2J054Pf6g
	ugv+2JWBA9H5R5f2ce3VeptTRKjYpXeeA+rySyNtqhcdnP91eXGSiza26cvwNIwnGKAoIKJLhUP
	RMlWCwoTPqV/opaVeqhaXhJtxdMk6K6km+od/UDwOeRRGICV9PevAANXt9jPsHOUhijZNQhtldA
	Lz1zN92JLUCMAwkZnN5lfHPFuJOU9knWEgvnjI2E2xVQmDwU6mN5dqZcIK7VgwcMedHxxRAiFLS
	h+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRuC7C2rJeUTodt23mAR6neylIOV
	A+gJRdKxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdjGVuWouVipcuIqS/CWPBSDGcOJSFvQ1vbGntV
	TqGWVZhcqM37k4wDB04K6zXvW4GhBKytK8jNGt5fkV2g9OjZBVb2JlYljF49e8XkztrTPKP6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Improvements

  - Allow passing a path to modprobe so the module is loaded from
    anywhere from the filesystem, but still handling the module
    dependencies recorded in the indexes.
  - Use in-kernel decompression if available.
  - Make modprobe fallback to syslog when stderr is not available, as was
    documented in the man page, but not implemented
  - Better explaing `modprobe -r` and how it differentiates from rmmod
  - depmod learned a `-o <dir>` option to allow using a separate output
    directory.
  - Add compat with glibc >= 2.32.9000 that dropped __xstat
  - Improve testsuite to stop skipping tests when sysconfdir is something
    other than /etc
  - Build system improvements and updates
  - Change a few return codes from -ENOENT to -ENODATA to avoid confusing output
    in depmod when the module itself lacks a particular ELF section due to e.g.
    CONFIG_MODVERSIONS=n in the kernel.

- Bug Fixes

  - Fix testsuite using uninitialized memory when testing module removal
    with --wait
  - Fix testsuite not correctly overriding the stat syscall on 32-bit
    platforms. For most architectures this was harmless, but for MIPS it
    was causing some tests to fail.
  - Fix handling unknown signature algorithm
  - Fix linking with a static liblzma, libzstd or zlib
  - Fix memory leak when removing module holders
  - Fix out-of-bounds access when using very long paths as argument to rmmod
  - Fix warnings reported by UBSan

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-kernel/kmod/{kmod_30.bb => kmod_31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kmod/{kmod_30.bb => kmod_31.bb} (98%)

diff --git a/meta/recipes-kernel/kmod/kmod_30.bb b/meta/recipes-kernel/kmod/kmod_31.bb
similarity index 98%
rename from meta/recipes-kernel/kmod/kmod_30.bb
rename to meta/recipes-kernel/kmod/kmod_31.bb
index 6fc9da9c82..934a678a06 100644
--- a/meta/recipes-kernel/kmod/kmod_30.bb
+++ b/meta/recipes-kernel/kmod/kmod_31.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "5d46434a63ae0160150a0efdde1914873697e273"
+SRCREV = "aff617ea871d0568cc491bd116c0be1e857463bb"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
-- 
2.34.1


