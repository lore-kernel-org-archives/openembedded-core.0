Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE5AE98FC9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:17:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126108.1775715413653265616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m0isji8c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394hWvm3576489
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lgugsC5P5SkeiSRtLCRnWKWkXhBbdzRF3Tw/4pC5Zto=; b=m0isji8cKlpt
	XdcZqvP/ybjycwbKTqhA0eXUZq1IS3EOE/HYGyGzvvJ7ztMwZGeBJk7Prm0nyRTx
	LNAz2UavKj8bF3lN1x91+ZBUWmg6Xk60yftNyLYHHwKHIoOIP/8sLyZJ/ovgWq0N
	PWCO/0TCf0lL1zjfln462y2L5qzpV7NfMTaS4GALm21VM+JGr1AOQUEbdVrJJ131
	+Fs9wlVg+wDV2SL52V4HRYbYTvv61c+3YEhOtD+mCfK9wNHu+2qQajs4vfO7tUWZ
	n24zes1oJt3Y52q7PySR/jioqvaE7UNHHqOTpOMy695voy0nOsF9WotF/iIyeFD0
	DLOygxEoiQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqkr6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:52 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:51 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:50 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 10/12] busybox: fix CVE-2026-26157 and CVE-2026-26158
Date: Thu, 9 Apr 2026 14:16:37 +0800
Message-ID: <20260409061639.1688205-11-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d74454 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=J0Tn2xNtAAAA:8 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8
 a=iox4zFpeAAAA:8 a=kO-hm49gTZGY1E53S44A:9 a=9ZcRxastL33iXWX1AWsW:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: puWYmh8PgGySyZuv0p-obkaOu5GRHCbS
X-Proofpoint-GUID: puWYmh8PgGySyZuv0p-obkaOu5GRHCbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfXw72UtolrvzUj
 sMUYf8JiDEK/k2XmOHy8cpGsNdTPfGExsDOFX6UgrTmR09t9y3/lcWJFno7DJGB0/EJ4+XKhGax
 1GJ2l8+R+Am2xbmyJttEHs3RspFP2StJO0BqfoH9z1ah4pE0ZkrzujLdCmQQSExHkYx1ccuY50n
 KNcjdVm64UVYEYoHiSvKFoZiUjEtRswFc2JgNsmk+0BlHdd6V7Kopr/i5kAWEtnExXBko18oCKZ
 IrN4rCFY4vFinMe792lu7/pQNnDbcmagrf/tLciAyQ6oDsgqsXYkmWdjkjfwmVdOjlQ4mNYQNlh
 fVvyuXxgr2haW2yrHJ0fw4MkyGhekbUfkYxEdr9vhEcmpBebZvd3soJG9rKRirSBAVVpW2pj9A9
 liuHm3jOYJ27uxPvNM20teNmDct/UOF9ORMDITUY/ttmsZcwiXcvNht5MdXcYflW5KoMpH0l2uL
 rQF9iaaqpF3CaV5fV5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234886

From: Chen Qi <Qi.Chen@windriver.com>

Backport patches to fix these two CVEs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 ...-hardlink-components-GNU-tar-does-th.patch | 201 ++++++++++++++++++
 ...nsafe-components-from-hardlinks-not-.patch |  39 ++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 3 files changed, 242 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch b/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
new file mode 100644
index 0000000000..2071703f35
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch
@@ -0,0 +1,201 @@
+From cc7952a6da0eab6ffc6a98db4e0c9892c5c5ca53 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 29 Jan 2026 11:48:02 +0100
+Subject: [PATCH 1/2] tar: strip unsafe hardlink components - GNU tar does the
+ same
+
+Defends against files like these (python reproducer):
+
+import tarfile
+ti = tarfile.TarInfo("leak_hosts")
+ti.type = tarfile.LNKTYPE
+ti.linkname = "/etc/hosts"  # or "../etc/hosts" or ".."
+ti.size = 0
+with tarfile.open("/tmp/hardlink.tar", "w") as t:
+	t.addfile(ti)
+
+function                                             old     new   delta
+skip_unsafe_prefix                                     -     127    +127
+get_header_tar                                      1752    1754      +2
+.rodata                                           106861  106856      -5
+unzip_main                                          2715    2706      -9
+strip_unsafe_prefix                                  102      18     -84
+------------------------------------------------------------------------------
+(add/remove: 1/0 grow/shrink: 1/3 up/down: 129/-98)            Total: 31 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157
+CVE: CVE-2026-26158
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/archival?id=3fb6b31c716669e12f75a2accd31bb7685b1a1cb]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ archival/libarchive/data_extract_all.c      |  7 +++--
+ archival/libarchive/get_header_tar.c        | 11 ++++++--
+ archival/libarchive/unsafe_prefix.c         | 30 +++++++++++++++++----
+ archival/libarchive/unsafe_symlink_target.c |  1 +
+ archival/tar.c                              |  2 +-
+ archival/unzip.c                            |  2 +-
+ include/bb_archive.h                        |  3 ++-
+ 7 files changed, 42 insertions(+), 14 deletions(-)
+
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 8a69711c1..b84b960c4 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -66,8 +66,8 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	}
+ #endif
+ #if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
+-	/* Strip leading "/" and up to last "/../" path component */
+-	dst_name = (char *)strip_unsafe_prefix(dst_name);
++	/* Skip leading "/" and past last ".." path component */
++	dst_name = (char *)skip_unsafe_prefix(dst_name);
+ #endif
+ // ^^^ This may be a problem if some applets do need to extract absolute names.
+ // (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
+@@ -185,8 +185,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 
+ 		/* To avoid a directory traversal attack via symlinks,
+ 		 * do not restore symlinks with ".." components
+-		 * or symlinks starting with "/", unless a magic
+-		 * envvar is set.
++		 * or symlinks starting with "/"
+ 		 *
+ 		 * For example, consider a .tar created via:
+ 		 *  $ tar cvf bug.tar anything.txt
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index cc6f3f0ad..1c40ecedb 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -454,8 +454,15 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ #endif
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+-	overlapping_strcpy(file_header->name, strip_unsafe_prefix(file_header->name));
+-//TODO: do the same for file_header->link_target?
++	strip_unsafe_prefix(file_header->name);
++	if (file_header->link_target) {
++		/* GNU tar 1.34 examples:
++		 * tar: Removing leading '/' from hard link targets
++		 * tar: Removing leading '../' from hard link targets
++		 * tar: Removing leading 'etc/../' from hard link targets
++		 */
++		strip_unsafe_prefix(file_header->link_target);
++	}
+ 
+ 	/* Strip trailing '/' in directories */
+ 	/* Must be done after mode is set as '/' is used to check if it's a directory */
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 667081195..89a371a7f 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -5,11 +5,11 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+ 
+-const char* FAST_FUNC strip_unsafe_prefix(const char *str)
++const char* FAST_FUNC skip_unsafe_prefix(const char *str)
+ {
+ 	const char *cp = str;
+ 	while (1) {
+-		char *cp2;
++		const char *cp2;
+ 		if (*cp == '/') {
+ 			cp++;
+ 			continue;
+@@ -22,10 +22,25 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp += 3;
+ 			continue;
+ 		}
+-		cp2 = strstr(cp, "/../");
++		cp2 = cp;
++ find_dotdot:
++		cp2 = strstr(cp2, "/..");
+ 		if (!cp2)
+-			break;
+-		cp = cp2 + 4;
++			break; /* No (more) malicious components */
++
++		/* We found "/..something" */
++		cp2 += 3;
++		if (*cp2 != '/') {
++			if (*cp2 == '\0') {
++				/* Trailing "/..": malicious, return "" */
++				/* (causes harmless errors trying to create or hardlink a file named "") */
++				return cp2;
++			}
++			/* "/..name" is not malicious, look for next "/.." */
++			goto find_dotdot;
++		}
++		/* Found "/../": malicious, advance past it */
++		cp = cp2 + 1;
+ 	}
+ 	if (cp != str) {
+ 		static smallint warned = 0;
+@@ -37,3 +52,8 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 	}
+ 	return cp;
+ }
++
++void FAST_FUNC strip_unsafe_prefix(char *str)
++{
++	overlapping_strcpy(str, skip_unsafe_prefix(str));
++}
+diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
+index f8dc8033d..d764c89ab 100644
+--- a/archival/libarchive/unsafe_symlink_target.c
++++ b/archival/libarchive/unsafe_symlink_target.c
+@@ -36,6 +36,7 @@ void FAST_FUNC create_links_from_list(llist_t *list)
+ 				*list->data ? "hard" : "sym",
+ 				list->data + 1, target
+ 			);
++			/* Note: GNU tar 1.34 errors out only _after_ all links are (attempted to be) created */
+ 		}
+ 		list = list->link;
+ 	}
+diff --git a/archival/tar.c b/archival/tar.c
+index 9de37592e..cf8c2d1f6 100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -475,7 +475,7 @@ static int FAST_FUNC writeFileToTarball(struct recursive_state *state,
+ 	DBG("writeFileToTarball('%s')", fileName);
+ 
+ 	/* Strip leading '/' and such (must be before memorizing hardlink's name) */
+-	header_name = strip_unsafe_prefix(fileName);
++	header_name = skip_unsafe_prefix(fileName);
+ 
+ 	if (header_name[0] == '\0')
+ 		return TRUE;
+diff --git a/archival/unzip.c b/archival/unzip.c
+index 691a2d81b..58442150b 100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -853,7 +853,7 @@ int unzip_main(int argc, char **argv)
+ 		unzip_skip(zip.fmt.extra_len);
+ 
+ 		/* Guard against "/abspath", "/../" and similar attacks */
+-		overlapping_strcpy(dst_fn, strip_unsafe_prefix(dst_fn));
++		strip_unsafe_prefix(dst_fn);
+ 
+ 		/* Filter zip entries */
+ 		if (find_list_entry(zreject, dst_fn)
+diff --git a/include/bb_archive.h b/include/bb_archive.h
+index e0ef8fc4e..1dc77f31d 100644
+--- a/include/bb_archive.h
++++ b/include/bb_archive.h
+@@ -202,7 +202,8 @@ char get_header_tar_xz(archive_handle_t *archive_handle) FAST_FUNC;
+ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
+ void seek_by_read(int fd, off_t amount) FAST_FUNC;
+ 
+-const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
++const char *skip_unsafe_prefix(const char *str) FAST_FUNC;
++void strip_unsafe_prefix(char *str) FAST_FUNC;
+ void create_or_remember_link(llist_t **link_placeholders,
+ 		const char *target,
+ 		const char *linkname,
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch b/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
new file mode 100644
index 0000000000..d79f2a259a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch
@@ -0,0 +1,39 @@
+From c70673fad2b317cfaed2d1da98c5dfe0fedd9be0 Mon Sep 17 00:00:00 2001
+From: Radoslav Kolev <radoslav.kolev@suse.com>
+Date: Mon, 16 Feb 2026 11:50:04 +0200
+Subject: [PATCH 2/2] tar: only strip unsafe components from hardlinks, not
+ symlinks
+
+commit 3fb6b31c7 introduced a check for unsafe components in
+tar archive hardlinks, but it was being applied to symlinks too
+which broke "Symlinks and hardlinks coexist" tar test.
+
+Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-26157
+CVE: CVE-2026-26158
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/archival?id=599f5dd8fac390c18b79cba4c14c334957605dae]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ archival/libarchive/get_header_tar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index 1c40ecedb..606d8067f 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -455,7 +455,7 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ 
+ 	/* Everything up to and including last ".." component is stripped */
+ 	strip_unsafe_prefix(file_header->name);
+-	if (file_header->link_target) {
++	if (file_header->link_target && !S_ISLNK(file_header->mode)) {
+ 		/* GNU tar 1.34 examples:
+ 		 * tar: Removing leading '/' from hard link targets
+ 		 * tar: Removing leading '../' from hard link targets
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index d870e2ee10..dc162882e9 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -62,6 +62,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-46394-01.patch \
            file://CVE-2025-46394-02.patch \
            file://CVE-2025-60876.patch \
+           file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch \
+           file://0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.34.1


