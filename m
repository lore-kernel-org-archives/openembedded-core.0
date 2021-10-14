Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB62C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 08:47:16 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.6969.1634201235253278403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 01:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19E8lDn7017410
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 01:47:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19E8l7CF006241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 01:47:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 01:47:06 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 01:47:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libcap: fix nativesdk-libcap relocate failure
Date: Thu, 14 Oct 2021 16:47:05 +0800
Message-ID: <20211014084705.357385-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 08:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156930

./lat-sdk-poky-intel-x86-64-1.0.sh -y -d sdk-3
...
Setting it up...ERROR: could not relocate
/buildarea/raid5/hjia/community/lat_github_090816/build-3/tmp/deploy/sdk/sdk-3/sysroots/x86_64-pokysdk-linux/usr/lib/libpsx.so.2.54, interp size = 93 and 134 is needed.
...

Since upstream libcap applied commit [ee3b25c Support simply executing
the built shared libraries.][1], it manually append interp section to shared
libraries.

Refer the implement of Yocto glibc[2], allocated a 4096 byte .interp section
for nativesdk

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=ee3b25c0a877fa74d1aec88f325ac45b09963c82
[2] meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-Raise-the-size-of-arrays-containing.patch | 36 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.54.bb    |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
new file mode 100644
index 0000000000..c7bf1a8b8c
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -0,0 +1,36 @@
+From 794cebc5732908636f22a1d9843fed3ae664899a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 14 Oct 2021 15:57:36 +0800
+Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
+ paths
+
+This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
+and lengths as well as ld.so.cache path in the dynamic loader to specific
+sections in memory. The sections that contain paths have been allocated a 4096
+byte section, which is the maximum path length in linux. This will allow the
+relocating script to parse the ELF binary, detect the section and easily replace
+the strings in a certain path.
+
+Upstream-Status: Inappropriate [SDK specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libcap/execable.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/execable.h b/libcap/execable.h
+index 0bcc5d4..6e2a080 100644
+--- a/libcap/execable.h
++++ b/libcap/execable.h
+@@ -23,7 +23,7 @@
+ #endif
+ #define __EXECABLE_H
+ 
+-const char __execable_dl_loader[] __attribute((section(".interp"))) =
++const char __execable_dl_loader[4096] __attribute((section(".interp"))) =
+     SHARED_LOADER ;
+ 
+ static void __execable_parse_args(int *argc_p, char ***argv_p)
+-- 
+2.27.0
+
diff --git a/meta/recipes-support/libcap/libcap_2.54.bb b/meta/recipes-support/libcap/libcap_2.54.bb
index 04362e7032..fe29f05483 100644
--- a/meta/recipes-support/libcap/libcap_2.54.bb
+++ b/meta/recipes-support/libcap/libcap_2.54.bb
@@ -13,6 +13,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            "
+SRC_URI:append:class-nativesdk = " \
+           file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
+           "
 SRC_URI[sha256sum] = "5091b24247999fd7a5e62bd9ac8bc761cda29f9baa0d1a2ca6a46f13891b4f0f"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
-- 
2.27.0


