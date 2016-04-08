Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 132547680A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 07:15:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u387FOPZ025143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2016 00:15:24 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Apr 2016 00:15:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Apr 2016 00:15:20 -0700
Message-ID: <088e89118818dccb4f19c73795d7ae2a724e6473.1460099653.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460099653.git.liezhi.yang@windriver.com>
References: <cover.1460099653.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] image_types.bbclass: fix ubi ubifs and multiubi
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
X-List-Received-Date: Fri, 08 Apr 2016 07:15:29 -0000
Content-Type: text/plain

Fixed when do_image_ubi:
| DEBUG: Executing shell function do_image_ubifs
| Error: min. I/O unit was not specified (use -h for help)
| WARNING: exit code 255 from a shell command.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image_types.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 3f97ddd..caa4dbb 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -120,6 +120,9 @@ IMAGE_CMD_elf () {
 }
 IMAGE_TYPEDEP_elf = "cpio.gz"
 
+MKUBIFS_ARGS ?= "-m 1KiB -e 128KiB -c $ROOTFS_SIZE"
+UBINIZE_ARGS ?= "-m 1KiB -p 128KiB"
+
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
 multiubi_mkfs() {
-- 
2.7.4


