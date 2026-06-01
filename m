Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A62CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:43:10 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29027.1780321383854553217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 06:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jdwEHDRB;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6855; q=dns/txt;
  s=iport01; t=1780321383; x=1781530983;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IlcO7oMgVHWqqAHhJPizyZ5So+IoL1zk1f/tf4ZVSLQ=;
  b=jdwEHDRBy0T69twWELkQtFsMqJ8lh/Xestb0O4S8omUQd3w6FBHBYjJB
   qW5YONvnLa0Z55BjNg0xE1IYoQPCDLii1Y50p2gWJ9Bf+jeOZuBLWYszO
   IlIgMzALTZpfgC14E7jkd+CyuybgRUnvxSa3VH6QJaMgFyLqxlcaSkK3n
   Xl9PxNLe3bMKAZDs0jF6ay2uWp0EWmC4DQlRIHsyjr16cKYPFTNGWNYNe
   iE8+3uarIk7blhRQ3MF5Vtxg/xQj97D5+zw+Z6UdKq4c+UrChtGNFYrIv
   I8LgUJnxD5k/5uqo+iv9SRgX2B00hGXvNyc8d12uWmUGZrhAMUi4bRsN6
   A==;
X-CSE-ConnectionGUID: M6Kq78i1RVePr8B8RU4d/A==
X-CSE-MsgGUID: ZTe/QozYQmWi9NtaBmiM7A==
X-IPAS-Result: =?us-ascii?q?A0BFAgAHix1q/47/Ja1SCIJZgldyX0JJA5ZIgRadCIF+D?=
 =?us-ascii?q?wEBAQ9KBwQBAYUGjTQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECATUBRiwDAQJaIyGDAgGCcwIBEbNhgiyBAYNaBQkCQ1DbK?=
 =?us-ascii?q?AELFAEFgTOFP4gdWxgBhHsnGxuBcoEVgnJ2gQWBXAQYgR+GawSCIoEMgV0eZ?=
 =?us-ascii?q?4xSSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFgUqBVWqBAoUYI?=
 =?us-ascii?q?x8DOYEXgX+BK0gDCxgNSBEsNxQbBD5uB4sfFw+BQWALBgEBPDcaASsgZQw0C?=
 =?us-ascii?q?DEuETgFkkMdkkiBNZ9ZCiiDdIwhlToaM4QEgVeSP4shhzCZBo4JlTOBHIRog?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD444iH6BPcQGJDUCCQMvAQEHAgcOAwuBaJEdYAEB?=
IronPort-Data: A9a23:YowwbKCXwyumhxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD1z0jUPn
 WBKWjqCOfiPY2T0etl0aoS0oBwPvpTTzoc3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH9gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE5qtNFR5mPNQixOtPGzFkp
 cYldDxKR0XW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FAugeW9YIWPI7RmQ+1nokvfn
 2XUzl38PRBLEsCW4z+E1y2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:Uss2hqkZTNvCOKYsDITtCrfJzFzpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:+qbcymOJBSUMcO5DfXdE7RFEG5kfTHDl1if6c3WFVWouYejA
X-Talos-MUID: 9a23:hWBHUglzpOfCqQNl9ROadnpQCMov2qO8OXkIrpRXndWNHylxHmi02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="479588721"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jun 2026 13:43:02 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 98A4C18000203;
	Mon,  1 Jun 2026 13:43:02 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 4097FCAEF48; Mon,  1 Jun 2026 06:43:02 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
Date: Mon,  1 Jun 2026 06:42:57 -0700
Message-ID: <20260601134257.47867-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 13:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237833

From: Anil Dongare <adongare@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=286ace1259992bd0c5d9016715833f2e148ac596
[2] https://security-tracker.debian.org/tracker/CVE-2026-4878

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../libcap/files/CVE-2026-4878.patch          | 162 ++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2026-4878.patch b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
new file mode 100644
index 0000000000..827e41b8a0
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
@@ -0,0 +1,162 @@
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
+Signed-off-by: Anil Dongare <adongare@cisco.com>
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
diff --git a/meta/recipes-support/libcap/libcap_2.69.bb b/meta/recipes-support/libcap/libcap_2.69.bb
index 03975b44a0..43185f027e 100644
--- a/meta/recipes-support/libcap/libcap_2.69.bb
+++ b/meta/recipes-support/libcap/libcap_2.69.bb
@@ -16,6 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
            file://CVE-2025-1390.patch \
+           file://CVE-2026-4878.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
-- 
2.44.4


