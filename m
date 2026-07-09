Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB4BC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 05:06:39 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2427.1783573597471553411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LXvCqMj4;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7265; q=dns/txt;
  s=iport01; t=1783573597; x=1784783197;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vpW6s8bxpcXfTdZH/CZvwYiVD3vNDfwRHVN87FE1kM8=;
  b=LXvCqMj4dVKKP07304bd45waLRrqOrDRFscQk2SdB3N3TlZeldPSoZo2
   oYmUWRxbZ4vd34Bv2+UftYrHVxCA132biX39eZpz9112xfAHHDQ3rL5W4
   biG+JzUvXe/AXn08VFQVcgUY8kqj2RSuz9+Nh9pknLkVzIG4gMoAfLh/c
   wm2KLsJYmX1JN3pxXFQzyLfTd22yMY/IZ8G0vjGQncvy/UTZhC4OMNZhw
   HH5DsaM9Rt2+AB4bQRO3vR/Vbdeju0qulKJdN4SD9AZcJ6Dcy/ecBQNFq
   aL9abIEUWrRHBJsXg4G9x7qPU7D1l4jWvk+nQOxDbk0cGn4pKmDGrKJkd
   g==;
X-CSE-ConnectionGUID: Vl3dylt4TuKxGbFVKFz7gg==
X-CSE-MsgGUID: 37sKDkRBQwOcJX1fxIP2Uw==
X-IPAS-Result: =?us-ascii?q?A0BDAgAQK09q/5D/Ja1SCB4BAQsSDIIFC4JXdF9CSZQpg?=
 =?us-ascii?q?TVsnh6Bfg8BAQEPSgcEAQGSVAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaATgBcgMBAlojGQiDAgGCcwMRt0iCLIEBg1oFCQJDU?=
 =?us-ascii?q?NsuAQsUAYE4hT+IH1sYAYR8JxsbgXKBFYNpgQWBXAQYgQ0ShmwEgiKBDIFaH?=
 =?us-ascii?q?lCPGEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgV+BAoR5I?=
 =?us-ascii?q?x8DOX+BL3VKeS2BARIeCoFSghY6AwsYDUgRLDcUGwQ+bgeNPBcPgUxgCwYBA?=
 =?us-ascii?q?TxRASsgZQw0CDEuETgFkkMdkkWBOJ9aCiiDdYwhlToaM4QEgVeSQIshhzCZC?=
 =?us-ascii?q?I4KlTSBHIRpgWg8gVlwFYMiCUoZD44uCguIc4E9x3I8NQIJMgEBBwIHDgMLg?=
 =?us-ascii?q?WiQAIEeYAEB?=
IronPort-Data: A9a23:ix6N/qrEbUGyYoiKJ6r4Md202/peBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnSaK2KZzGnKNpwa4i//BxVuJDdndRkSlBtqS08H34T9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8EM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0thzWm1f8
 eBEFC0ufj+JqdyV7qDkReY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVPrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHZoOwRjE9
 juuE2LRWU4BF/Cc8xC87VWnpN+WkzPaYNgvC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZN5ottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:dO0Onq8faBfjOyMO/VNuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AEJEzRGk8gcQUsZV9uYNy/xJ3CknXOUPZl3vBJ1P?=
 =?us-ascii?q?kNXtKWJKfZ2Gz1rE7nMU7zg=3D=3D?=
X-Talos-MUID: 9a23:7y4/VQgBrW0W1r9YdUD9AcMpb5hzwIitMmo0jrINmfndOzxRA22gk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507376481"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 05:06:36 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 02B551800021E
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2026 05:06:36 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 1E524CC037D; Thu,  9 Jul 2026 10:36:34 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] libcap: Fix CVE-2026-4878
Date: Thu,  9 Jul 2026 10:36:27 +0530
Message-Id: <20260709050627.1152464-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 05:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240515

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-4878.
Wrynose libcap 2.77 still has the path-based cap_set_file()
race fixed by upstream. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

The fix switches named file capability updates to an opened file
descriptor and adds quicktest coverage for symlinked paths.

[1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596
[2] https://www.cve.org/CVERecord?id=CVE-2026-4878

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../libcap/files/CVE-2026-4878.patch          | 163 ++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.77.bb    |   4 +-
 2 files changed, 166 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2026-4878.patch b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
new file mode 100644
index 0000000..955b540
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
@@ -0,0 +1,163 @@
+From 286ace1259992bd0c5d9016715833f2e148ac596 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Thu, 12 Mar 2026 07:38:05 -0700
+Subject: [PATCH] Address a potential TOCTOU race condition in cap_set_file().
+
+This issue was researched and reported by Ali Raza (@locus-x64). It
+has been assigned CVE-2026-4878.
+
+The finding is that while cap_set_file() checks if a file is a regular
+file before applying or removing a capability attribute, a small
+window existed after that check when the filepath could be overwritten
+either with new content or a symlink to some other file. To do this
+would imply that the caller of cap_set_file() was directing it to a
+directory over which a local attacker has write access, and performed
+the operation frequently enough that an attacker had a non-negligible
+chance of exploiting the race condition. The code now locks onto the
+intended file, eliminating the race condition.
+
+CVE: CVE-2026-4878
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=286ace1259992bd0c5d9016715833f2e148ac596]
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+(cherry picked from commit 286ace1259992bd0c5d9016715833f2e148ac596)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ libcap/cap_file.c  | 69 +++++++++++++++++++++++++++++++++++++++-------
+ progs/quicktest.sh | 14 +++++++++-
+ 2 files changed, 72 insertions(+), 11 deletions(-)
+
+diff --git a/libcap/cap_file.c b/libcap/cap_file.c
+index 0bc07f7..f02bf9f 100644
+--- a/libcap/cap_file.c
++++ b/libcap/cap_file.c
+@@ -8,8 +8,13 @@
+ #define _DEFAULT_SOURCE
+ #endif
+ 
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
++
+ #include <sys/types.h>
+ #include <byteswap.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+@@ -322,26 +327,70 @@ int cap_set_file(const char *filename, cap_t cap_d)
+     struct vfs_ns_cap_data rawvfscap;
+     int sizeofcaps;
+     struct stat buf;
++    char fdpath[64];
++    int fd, ret;
++
++    _cap_debug("setting filename capabilities");
++    fd = open(filename, O_RDONLY|O_NOFOLLOW);
++    if (fd >= 0) {
++	ret = cap_set_fd(fd, cap_d);
++	close(fd);
++	return ret;
++    }
+ 
+-    if (lstat(filename, &buf) != 0) {
+-	_cap_debug("unable to stat file [%s]", filename);
++    /*
++     * Attempting to set a file capability on a file the process can't
++     * read the content of. This is considered a non-standard use case
++     * and the following (slower) code is complicated because it is
++     * trying to avoid a TOCTOU race condition.
++     */
++
++    fd = open(filename, O_PATH|O_NOFOLLOW);
++    if (fd < 0) {
++	_cap_debug("cannot find file at path [%s]", filename);
++	return -1;
++    }
++    if (fstat(fd, &buf) != 0) {
++	_cap_debug("unable to stat file [%s] descriptor %d",
++		   filename, fd);
++	close(fd);
+ 	return -1;
+     }
+     if (S_ISLNK(buf.st_mode) || !S_ISREG(buf.st_mode)) {
+-	_cap_debug("file [%s] is not a regular file", filename);
++	_cap_debug("file [%s] descriptor %d for non-regular file",
++		   filename, fd);
++	close(fd);
+ 	errno = EINVAL;
+ 	return -1;
+     }
+ 
+-    if (cap_d == NULL) {
+-	_cap_debug("removing filename capabilities");
+-	return removexattr(filename, XATTR_NAME_CAPS);
++    /*
++     * While the fd remains open, this named file is locked to the
++     * origin regular file. The size of the fdpath variable is
++     * sufficient to support a 160+ bit number.
++     */
++    if (snprintf(fdpath, sizeof(fdpath), "/proc/self/fd/%d", fd)
++	>= sizeof(fdpath)) {
++	_cap_debug("file descriptor too large %d", fd);
++	errno = EINVAL;
++	ret = -1;
++
++    } else if (cap_d == NULL) {
++	_cap_debug("dropping file caps on [%s] via [%s]",
++		   filename, fdpath);
++	ret = removexattr(fdpath, XATTR_NAME_CAPS);
++
+     } else if (_fcaps_save(&rawvfscap, cap_d, &sizeofcaps) != 0) {
+-	return -1;
+-    }
++	_cap_debug("problem converting cap_d to vfscap format");
++	ret = -1;
+ 
+-    _cap_debug("setting filename capabilities");
+-    return setxattr(filename, XATTR_NAME_CAPS, &rawvfscap, sizeofcaps, 0);
++    } else {
++	_cap_debug("setting filename capabilities");
++	ret = setxattr(fdpath, XATTR_NAME_CAPS, &rawvfscap,
++		       sizeofcaps, 0);
++    }
++    close(fd);
++    return ret;
+ }
+ 
+ /*
+diff --git a/progs/quicktest.sh b/progs/quicktest.sh
+index e6c48e6..5dc72f9 100755
+--- a/progs/quicktest.sh
++++ b/progs/quicktest.sh
+@@ -148,7 +148,19 @@ pass_capsh --caps="cap_setpcap=p" --inh=cap_chown --current
+ pass_capsh --strict --caps="cap_chown=p" --inh=cap_chown --current
+ 
+ # change the way the capability is obtained (make it inheritable)
++chmod 0000 ./privileged
+ ./setcap cap_setuid,cap_setgid=ei ./privileged
++if [ $? -ne 0 ]; then
++    echo "FAILED to set file capability"
++    exit 1
++fi
++chmod 0755 ./privileged
++ln -s privileged unprivileged
++./setcap -r ./unprivileged
++if [ $? -eq 0 ]; then
++    echo "FAILED by removing a capability from a symlinked file"
++    exit 1
++fi
+ 
+ # Note, the bounding set (edited with --drop) only limits p
+ # capabilities, not i's.
+@@ -246,7 +258,7 @@ EOF
+     pass_capsh --iab='!%cap_chown,^cap_setpcap,cap_setuid'
+     fail_capsh --mode=PURE1E --iab='!%cap_chown,^cap_setuid'
+ fi
+-/bin/rm -f ./privileged
++/bin/rm -f ./privileged ./unprivileged
+ 
+ echo "testing namespaced file caps"
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/libcap/libcap_2.77.bb b/meta/recipes-support/libcap/libcap_2.77.bb
index 9968cd5..66ac0f1 100644
--- a/meta/recipes-support/libcap/libcap_2.77.bb
+++ b/meta/recipes-support/libcap/libcap_2.77.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
 
 DEPENDS = "hostperl-runtime-native gperf-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-4878.patch \
+           "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-- 
2.35.6


