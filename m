Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC6674F1E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 18:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1608; q=dns/txt; s=iport;
	t=1522952741; x=1524162341;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=0XkiMuSFI44IcA07WbWmGrCmlEg8oj/0P1YaUOAssiU=;
	b=RdpmI4buWdtA1vNMSr5I0egH56G9l2Di614y0GGRZ7m9rtvyzR9jioV3
	/BL2CB/wYquuYHCBx/gz5FyOy6ZN3Ha9cuSLkA3LL4BR7EVAidnAhsIGW
	Xu9C+GZrPvrGjgph8BkKFRiMF0GweEGfijUQYKq3SPdfrYyPkm0Qoff8N o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DHAABYacZa/5tdJa1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCgVAoi1+NCYMDklWBeguFAwKCPiE0GAECAQEBAQEBAmw?=
	=?us-ascii?q?ohSMGeRBRVxmFDa5ciEOCJYdqghODXIVvhGggAoxWimoIjjECjDuPXAIREwG?=
	=?us-ascii?q?BJRw4gVJNIxWCfZBuHzCNGwEB?=
X-IronPort-AV: E=Sophos;i="5.48,411,1517875200"; d="scan'208";a="370205795"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 18:25:41 +0000
Received: from kamensky-w541.cisco.com ([10.24.32.120]) (authenticated bits=0)
	by rcdn-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id w35IPUvi013347
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Thu, 5 Apr 2018 18:25:40 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 11:25:26 -0700
Message-Id: <1522952730-5967-2-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
References: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v3 1/5] image: add image-combined-dbg helper class
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
X-List-Received-Date: Thu, 05 Apr 2018 18:25:40 -0000

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
 1 file changed, 9 insertions(+)
 create mode 100644 meta/classes/image-combined-dbg.bbclass

diff --git a/meta/classes/image-combined-dbg.bbclass b/meta/classes/image-combined-dbg.bbclass
new file mode 100644
index 0000000..f4772f7
--- /dev/null
+++ b/meta/classes/image-combined-dbg.bbclass
@@ -0,0 +1,9 @@
+IMAGE_PREPROCESS_COMMAND_append = " combine_dbg_image; "
+
+combine_dbg_image () {
+        if [ "${IMAGE_GEN_DEBUGFS}" = "1" -a -e ${IMAGE_ROOTFS}-dbg ]; then
+                # copy target files into -dbg rootfs, so it can be used for
+                # debug purposes directly
+                tar -C ${IMAGE_ROOTFS} -cf - . | tar -C ${IMAGE_ROOTFS}-dbg -xf -
+        fi
+}
-- 
2.7.4


