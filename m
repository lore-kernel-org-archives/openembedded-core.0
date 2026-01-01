Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CFBEED60F
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 15:23:16 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.533.1767280991128537373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 07:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QkdFvlK8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260101152307572550c6f20002076b-bea_n4@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260101152307572550c6f20002076b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 16:23:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8cLsYXbUuw8a5YknQEbo0KSLh2wYnCaUKaIOsDDqa7I=;
 b=QkdFvlK81PveTf08F3wcIMTMMsdKNMyf0hWRBGFZ7AuGUa3IAJUWK7WYq1FtqotmuitgWs
 b1nHVePdCdO2mxgOUMP+EQg7l+dsmyc9fzaDsJbzwdKvR6PjAiWJLqshrOICxlyNgmVWN6k+
 gVbEzHol0ajrvd59AYOCn8dugcCygqIvtZKLf5PrAsL/5citwWfDphY0x2a+9Av4bfLEoteN
 vgq+qUmkun/0qV5fn6yiUfMgCHsjD+bLYHDPId4nuSMWCF3Wf5eKupJCgZ+XJ8rrPbBu1M4O
 4cPKmXFy5SaxvK0tadCYI1yiu1NL12G4iWIzBRTnCn3HuQuEAqJME1iA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] xz: upgrade 5.8.1 -> 5.8.2
Date: Thu,  1 Jan 2026 16:23:04 +0100
Message-Id: <20260101152304.2512953-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 15:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228824

From: Peter Marko <peter.marko@siemens.com>

License-Update: Update GPLv2 and LGPLv2.1 copies from gnu.org
* https://github.com/tukaani-project/xz/commit/6d287a3ae90e1b990294f3d5264003d81e853c5e

Release Notes:
* https://github.com/tukaani-project/xz/releases/tag/v5.8.2
* liblzma:
    - Fix the build on ARM64 on glibc versions older than
      2.24 (2016). They don't have HWCAP_CRC32 in <sys/auxv.h>.
    - Disable CLMUL CRC code when building for 32-bit x86 with
      old MSVC versions. This avoids a compiler bug. The exact
      compiler version in which the issue was fixed is unknown,
      but VS 2022 17.13 (MSVC 19.43.34808) is known to work, so
      CLMUL CRC on 32-bit x86 is disabled with MSVC versions
      older than that.
* xz:
    - Add a workaround for Red Hat Enterprise Linux 9 kernel bug
      which made xz fail with "xz: Failed to enable the sandbox".
      It only occurs with xz 5.8.0 and 5.8.1 binaries built for
      other distros. For example, running Debian 13 in a container
      on RHEL/CentOS 9 would trigger the issue.
      The bug was introduced in RHEL 9 kernel 5.14.0-603.el9
      (2025-07-30) and fixed in 5.14.0-648.el9 (2025-12-05).
      However, as of writing, the fixed kernel isn't available
      to RHEL 9 users yet, so including the workaround in this
      xz release seems reasonable. The workaround will be removed
      when it's no longer needed.
      xzdec was also affected by this issue.
    - On AIX, don't use fsync() on directories because it fails.
    - Fix the build on Emscripten.
    - Fix the build on clang-cl on Windows.
    - Take resource limits (RLIMIT_DATA, RLIMIT_AS, and RLIMIT_VMEM)
      into account when determining the default memory usage limit
      for multithreaded mode. This should prevent xz from failing
      when a resource limit has been set to a value that is less
      than 1/4 of total RAM. Other memory limits can still trigger
      the same issue, for example, Linux cgroup v2 memory.max.
* Build systems:
    - When symbol versioning is enabled, pass --undefined-version
      to the linker if the option is supported. This fixes the
      build when using LLVM's lld and some liblzma features have
      been disabled at build time.
    - ARM64: Fix autodetection of fast unaligned memory access when
      using GCC and -mstrict-align is in effect. Previously the
      build systems would incorrectly guess that unaligned access
      is fast, which would result in much slower binaries than
      needed. The fix is a workaround for GCC bug 111555;
      autodetection already worked with Clang.
    - LoongArch: Autodetect if fast unaligned memory access is
      supported. This can improve compression speed by 15 % (but
      not decompression speed).
* Translations:
    - Update the Spanish translation.
    - Add Swedish man page translations.
    - Update Italian, Korean, Romanian, Serbian, and Ukrainian
      man page translations.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/xz/{xz_5.8.1.bb => xz_5.8.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.8.1.bb => xz_5.8.2.bb} (91%)

diff --git a/meta/recipes-extended/xz/xz_5.8.1.bb b/meta/recipes-extended/xz/xz_5.8.2.bb
similarity index 91%
rename from meta/recipes-extended/xz/xz_5.8.1.bb
rename to meta/recipes-extended/xz/xz_5.8.2.bb
index 406ecbbec4..451d4810bc 100644
--- a/meta/recipes-extended/xz/xz_5.8.1.bb
+++ b/meta/recipes-extended/xz/xz_5.8.2.bb
@@ -19,16 +19,16 @@ LICENSE:liblzma = "0BSD"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
                     file://COPYING.0BSD;md5=0672c210ce80c83444339b9aa31fee2f \
-                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv2;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.LGPLv2.1;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
                     file://lib/getopt.c;endline=23;md5=3f33e207287bf72834f3ae8c247dfb6a \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543"
+SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 

