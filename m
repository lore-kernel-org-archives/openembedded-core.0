Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9AD60809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 15:07:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8GF73sr028552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 08:07:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 16 Sep 2014 08:07:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 23:06:22 +0800
Message-ID: <64a67dbfe6aba5a52b7740fa15b6baa6f117defa.1410879378.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410879378.git.kai.kang@windriver.com>
References: <cover.1410879378.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org, jslater@windriver.com
Subject: [PATCH 1/9] linux-yocto: depend on libgcc for aarch64
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
X-List-Received-Date: Tue, 16 Sep 2014 15:07:05 -0000
Content-Type: text/plain

Make aarch aarch64 kernel depend on libgcc. In arch/arm64/Makefile, it
adds LIBGCC to libs-y:

LIBGCC          := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
libs-y          += $(LIBGCC)

If build without libgcc, the value of LIBGCC is just libgcc.a without
parent directory. linux-yocto fails to build:

|   LD      vmlinux.o
| aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory

Add libgcc to aarch64 kernel dependency.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4ed3188..db693e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 INC_PR = "r4"
 
 DEPENDS += "xz-native bc-native"
+DEPENDS_aarch64 += "libgcc"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
-- 
1.9.1


