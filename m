Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 743CC6B8B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:20:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5G3KTuV008387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 20:20:29 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 20:20:29 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 11:20:27 +0800
Message-ID: <1402888827-4210-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] kexec-tools: fix warning about patch could not be found
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
X-List-Received-Date: Mon, 16 Jun 2014 03:20:31 -0000
Content-Type: text/plain

kexec-tools-klibc required kexec-tools.inc file. Put the patch of
kexec-tools into bb file in order to fixing QA warning about files path.
The patch only needed by kexec-tools.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools.inc      |    3 +--
 meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb |    2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 6a690c6..50b448c 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 DEPENDS = "zlib xz"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
-           file://kexec-tools-Refine-kdump-device_tree-sort.patch"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
 
 inherit autotools-brokensep
 
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
index 38a8947..5321dd4 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
@@ -2,6 +2,8 @@ require kexec-tools.inc
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
+SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch"
+
 SRC_URI[md5sum] = "c39ea40a7598e49b6dc961ee7de38f57"
 SRC_URI[sha256sum] = "a9c6cd9adc8c1c37b3272782f581cb8b4b4070d0e3e921a558a9083f68dcf29a"
 
-- 
1.7.9.5


