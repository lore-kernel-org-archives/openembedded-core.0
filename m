Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5863.1793342180774005247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 23:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kmDGcojF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261030063616ee64bb74fc0002074a-qob_vm@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261030063616ee64bb74fc0002074a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 30 Oct 2026 07:36:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vIqL8WNYQgVj7CCsJMFmcRE5nJItBAv3RANEfWzquZw=;
 b=kmDGcojFhti945dvDZ1dW7HpvQIG8h6hqdb9U56zxy3xjeWPuxn4OJCZBQJsZkh9ExsBql
 MpvpseVxwhE6uhLlWd6Nqg+bX4FSHizMLshCeIlBt/DA2Cgl6PHI1YDzww4JcM7rIeWZ7YTJ
 UKrcO+EzVCdgHHwyg5Q7A0DYHqh8zNeXPnctLxGsDw2ibpw9zkCvANf53zvWp4w1Luy9EJyX
 kCTkVcmCxEJCJKy1qBffT5SXw2Apcn++gNodAr7bGVLHeinLWtAac+nTMSO+tgI7MFI0WU1B
 +c9bMZTIyKsUD9+f6IYfdVrLQgj8wZvjsVYeQb4ARi7iRcpWziOxX0QA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] util-linux: patch CVE-2026-53615
Date: Thu, 29 Oct 2026 23:50:45 +0100
Message-ID: <20261029225045.893457-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248989
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] from 2.41 branch.
Resolve minor conflict with [2] (unrelated const variable).

[1] https://security-tracker.debian.org/tracker/CVE-2026-53615
[2] https://github.com/util-linux/util-linux/commit/7eba8f98bdc3ed9c0ef1c8527aa61e1a3656449c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-53615.patch           | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index fdc8c62f6e5..66616f06527 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -63,6 +63,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-78410-02.patch \
            file://CVE-2026-78410-03.patch \
            file://CVE-2026-76642.patch \
+           file://CVE-2026-53615.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch
new file mode 100644
index 00000000000..f06f175e9c9
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch
@@ -0,0 +1,109 @@
+From 05c2dbadf34cc74192287f377904afaaf4061623 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 25 Mar 2026 11:54:28 +0100
+Subject: [PATCH] libblkid: dos: validate EBR data and links within extended
+ partition
+
+The parse_dos_extended() function processes EBR (Extended Boot Record)
+chains, but does not properly validate that partitions and links stay
+within the master extended partition area [ex_start, ex_start+ex_size).
+
+For EBR data partitions at index 0 and 1, there are no bounds checks
+at all, unlike entries at index 2 and 3. This allows a crafted disk
+image to register partitions at arbitrary sectors via uint32_t overflow
+in the abs_start calculation (cur_start + start wraps to a small value).
+
+Fix by:
+ - using 64-bit arithmetic for the abs_start calculation to avoid
+   uint32_t wraparound
+ - applying the extended partition area bounds check to all EBR data
+   entries, not just index >= 2
+ - validating EBR link targets stay within the extended area and
+   advance forward (preventing backward links that could loop)
+
+Reported-by: Michele Piccinni <piccinni.michele@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit e9d544d013267ea86b70ee8ff78abd280e6641af)
+
+CVE: CVE-2026-53615
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/05c2dbadf34cc74192287f377904afaaf4061623]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libblkid/src/partitions/dos.c | 38 +++++++++++++++++++++++++++--------
+ 1 file changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/libblkid/src/partitions/dos.c b/libblkid/src/partitions/dos.c
+index d5a8aa3ae..5c78aac21 100644
+--- a/libblkid/src/partitions/dos.c
++++ b/libblkid/src/partitions/dos.c
+@@ -46,6 +46,7 @@ static int parse_dos_extended(blkid_probe pr, blkid_parttable tab,
+ {
+ 	blkid_partlist ls = blkid_probe_get_partlist(pr);
+ 	uint32_t cur_start = ex_start, cur_size = ex_size;
++	uint64_t ex_end = (uint64_t) ex_start + ex_size;
+ 	unsigned char *data;
+ 	int ct_nodata = 0;	/* count ext.partitions without data partitions */
+ 	int i;
+@@ -88,24 +89,31 @@ static int parse_dos_extended(blkid_probe pr, blkid_parttable tab,
+ 		/* Parse data partition */
+ 		for (p = p0, i = 0; i < 4; i++, p++) {
+ 			uint32_t abs_start;
++			uint64_t abs;
+ 			blkid_partition par;
+ 
+ 			/* the start is relative to the parental ext.partition */
+ 			start = dos_partition_get_start(p) * ssf;
+ 			size = dos_partition_get_size(p) * ssf;
+-			abs_start = cur_start + start;	/* absolute start */
+ 
+ 			if (!size || is_extended(p))
+ 				continue;
++
++			abs = (uint64_t) cur_start + start;
++
++			/* data partition must be within the extended area */
++			if (abs < ex_start || abs + size > ex_end) {
++				DBG(LOWPROBE, ul_debug("#%d: EBR data partition outside "
++					"extended -- ignore", i + 1));
++				continue;
++			}
++			abs_start = (uint32_t) abs;
++
+ 			if (i >= 2) {
+-				/* extra checks to detect real data on
++				/* extra check to detect real data on
+ 				 * 3rd and 4th entries */
+ 				if (start + size > cur_size)
+ 					continue;
+-				if (abs_start < ex_start)
+-					continue;
+-				if (abs_start + size > ex_start + ex_size)
+-					continue;
+ 			}
+ 
+ 			/* Avoid recursive non-empty links, see ct_nodata counter */
+@@ -142,8 +150,22 @@ static int parse_dos_extended(blkid_probe pr, blkid_parttable tab,
+ 		if (i == 4)
+ 			goto leave;
+ 
+-		cur_start = ex_start + start;
+-		cur_size = size;
++		{
++			uint64_t next = (uint64_t) ex_start + start;
++
++			if (next + size > ex_end) {
++				DBG(LOWPROBE, ul_debug("EBR link outside "
++					"extended area -- leave"));
++				goto leave;
++			}
++			if (next <= cur_start) {
++				DBG(LOWPROBE, ul_debug("EBR link does not "
++					"advance -- leave"));
++				goto leave;
++			}
++			cur_start = (uint32_t) next;
++			cur_size = size;
++		}
+ 	}
+ leave:
+ 	return BLKID_PROBE_OK;
