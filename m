Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 82E0274A40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2170; q=dns/txt; s=iport;
	t=1522776233; x=1523985833;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=ovLWzsuKnlbTrNqV+IqKBRwlFLL2jPurgtIfzFLIzF0=;
	b=QGmJBnyYEEc17St+z8zfWAYM4Kd65OxzIt4alaHl1+NaXyhZgpN0rY06
	yeF+vz7XRHyOsQlyocnvDoIuKcS6ExkVCoL4/syiTWnXSllj2byC2mEnm
	Bm3tos6k23DJ8jKOgUtQXzr0xqlKsWG/s7TGCKWfJCBz0IeDD8xIqsrp0 M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AWAgBQuMNa/4cNJK1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCgVAomGODA5JVgXoLhQMChEIhNRcBAgEBAQEBAQJrKIU?=
	=?us-ascii?q?jBnkQUVcZhQ2vT4hEgiWHYYITg1yFb4RoIAKMU4poCI4vAow1j1YCERMBgSU?=
	=?us-ascii?q?eATWBUk0jFYJ9kG0fMI49AQE?=
X-IronPort-AV: E=Sophos;i="5.48,402,1517875200"; d="scan'208";a="365599748"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 17:23:52 +0000
Received: from kamensky-w541.cisco.com ([10.82.174.186]) (authenticated bits=0)
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w33HNck1010603
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 3 Apr 2018 17:23:51 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 10:23:33 -0700
Message-Id: <1522776217-23250-2-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
References: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v2 1/5] image: add image-combined-dbg helper class
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
X-List-Received-Date: Tue, 03 Apr 2018 17:23:51 -0000

There is IMAGE_GEN_DEBUGFS="1" variable that enables build of
additional rootfs-dbg and additional archive that contains
complimentary symbols files for a given image. But the issue
with this resulting directory and tarball that before use it
has to be combined with original image content. It is required
since all cross debugging tools like gdb, perf, and systemtap
need file system that contains both target executables/libraries
and their symbols. Those tools need to find executable/library
first and through it debuglink note find corresponding symbols
file.

image-combined-dbg when added to USER_CLASSES just copies
final resulting rootfs back into rootfs-dbg creating combined
target and debug symbols rootfs that can be used for debugging
directly.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/classes/image-combined-dbg.bbclass | 9 +++++++++
 meta/classes/image.bbclass              | 1 +
 2 files changed, 10 insertions(+)
 create mode 100644 meta/classes/image-combined-dbg.bbclass

diff --git a/meta/classes/image-combined-dbg.bbclass b/meta/classes/image-combined-dbg.bbclass
new file mode 100644
index 0000000..a709adf
--- /dev/null
+++ b/meta/classes/image-combined-dbg.bbclass
@@ -0,0 +1,9 @@
+IMAGE_PREPROCESS_COMMAND_append = " combine_dbg_image; "
+
+combine_dbg_image () {
+        if [ "$IMAGE_GEN_DEBUGFS" = "1" -a -e ${IMAGE_ROOTFS}-dbg ]; then
+                # copy target files into -dbg rootfs, so it can be used for
+                # debug purposes directly
+                tar -C ${IMAGE_ROOTFS} -cf - . | tar -C ${IMAGE_ROOTFS}-dbg -xf -
+        fi
+}
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1636eed..5ee9c55 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -268,6 +268,7 @@ fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
 
     d.setVarFlag('REPRODUCIBLE_TIMESTAMP_ROOTFS', 'export', '1')
+    d.setVarFlag('IMAGE_GEN_DEBUGFS', 'export', '1')
     pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND")
 
     execute_pre_post_process(d, pre_process_cmds)
-- 
2.7.4


